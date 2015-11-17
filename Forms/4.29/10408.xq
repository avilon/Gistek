(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.29 maket 1019 - 10408 ---------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10408($doc) {
 
let $oldXML := $doc  
              
let $data_05 := for $strCls in $oldXML_02//strfree[number(@code) >= 1 and number(@code) <= 100]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_05") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }                
              
let $flattenContactData:=
              for $strCls in $oldXML_02//strdata[number(@code) = 111 or number(@code) = 112] 
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
              for $strCls in $oldXML_02//strdata[number(@code) >= 121 and number(@code) <= 132] 
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

let $columnNames:=distinct-values($oldXML_02//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_05)

let $newXML := for $item in $flatten
              return $item
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>  
};
