(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.29 maket 1019 - 10402 ---------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10402($doc) {
 
let $oldXML := $doc  
              
let $data_01 := for $strCls in $oldXML//strdata[(number(@code) >= 1) and (number(@code) <= 16)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 


let $data_02 := for $strCls in $oldXML//strdata[(number(@code) >= 20) and (number(@code) <= 23)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 


let $data_03 := for $strCls in $oldXML//strdata[(number(@code) = 30)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 

let $data_04 := for $strCls in $oldXML//strdata[(number(@code) >= 40) and (number(@code) <= 42)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 
              
              
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code) = 111 or number(@code) = 112] 
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
let $flatten:= insert-before($flatten, 0, $data_04)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML := for $item in $flatten
              return $item
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
