import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML:=fn:doc("40068\\1511_40068.xml")/* 



let $data_01 := for $strCls in $oldXML//strfree[number(@code) >= 1 and number(@code) <= 30]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") }{
                attribute name {concat("-", $strCls/@code, "-")},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML//strfree[number(@code) >= 31 and number(@code) <= 100]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") }{
                attribute name {concat("-", $strCls/@code, "-")},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strContactInf") }{
                attribute name {$strCls/@name}
              }

let $flattenServiceData:=
              for $strCls in $oldXML//strfree[number(@code) >= 121] 
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
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 