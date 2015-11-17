import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML:=fn:doc("30029\\1048_30029.xml")/* 


let $data := for $strCls in $oldXML//strdata[number(@code) < 40]
              let $columns13:=$strCls/column[number(@order) = 1 or number(@order) = 3]     
              let $columns57:=$strCls/column[number(@order) = 5 or number(@order) = 7]             
              let $columns24:=$strCls/column[number(@order) = 2 or number(@order) = 4]     
              let $columns68:=$strCls/column[number(@order) = 6 or number(@order) = 8]             
                      
              return(
              (
              element {xs:QName("strdata") } {
                attribute name {concat("Отгрузка товарной (угольной) продукции по договорам ", $strCls/@name, " тыс.тонн")},
                attribute code {$strCls/@code},
                
                (for $c in $columns13
                 return
                  
                attribute {xs:QName(concat("column", string(xs:int($c/@order div 2)+1)))}{
                  $c/text()
                })
              }
            ),
            (
              element {xs:QName("strdata") } {
                attribute name {".    в том числе по долгосрочным договорам, тыс.тонн"},
                attribute code {number($strCls/@code) + 1},
                
                (for $c in $columns57
                 return
                attribute {xs:QName(concat("column", string(xs:int($c/@order div 7)+1)))}{
                  $c/text()
                })
              }              
            ),
            (
              element {xs:QName("strdata") } {
                attribute name {concat("Отгрузка товарной (угольной) продукции по договорам ", $strCls/@name, " тыс.руб")},
                attribute code {number($strCls/@code) + 2},
                
                (for $c in $columns24
                 return
                attribute {xs:QName(concat("column", string(xs:int($c/@order div 4)+1)))}{
                  $c/text()
                })
              }              
            ),            
            (
              element {xs:QName("strdata") } {
                attribute name {".    в том числе по долгосрочным договорам, тыс.руб"},
                attribute code {number($strCls/@code) + 3},
                
                (for $c in $columns68
                 return
                attribute {xs:QName(concat("column", string(xs:int($c/@order div 8)+1)))}{
                  $c/text()
                })
              }              
            )            
          )

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strContactInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $flattenServiceData:=
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
