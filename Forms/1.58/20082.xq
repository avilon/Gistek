import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML:=fn:doc("20082\\1153_20082.xml")/* 


let $data_1 := for $strCls in $oldXML//strfree[number(@code) < 111]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree_1") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_2 := for $strCls in $oldXML//strfree[number(@code) > 200]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree_2") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
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
let $flatten:= insert-before($flatten, 0, $data_1)
let $flatten:= insert-before($flatten, 0, $data_2)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 