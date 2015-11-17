import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML_1:=fn:doc("20096\\1159_20095.xml")/* 
let $oldXML_2:=fn:doc("20096\\1159_20096.xml")/* 


let $data_1 := for $strCls in $oldXML_1//strfree[number(@code) < 111 or number(@code) > 132]
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

let $data_2 := for $strCls in $oldXML_2//strfree[number(@code) < 111 or number(@code) > 132]
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
              for $strCls in $oldXML_1//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML_1//strfree[number(@code) >= 121 and number(@code) <= 132] 
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

let $columnNames:=distinct-values($oldXML_1//column/@order)

let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_1)
let $flatten:= insert-before($flatten, 0, $data_2)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 