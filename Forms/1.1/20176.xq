(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.1 maket 1453 - 20175 ---------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20175($doc) { 
let $oldXML := $doc


let $data_01 := for $strCls in $oldXML_01//strdata[(number(@code) <= 30)]
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

let $data_02 := for $strCls in $oldXML_02//strfree[number(@code) >= 1 and number(@code) <= 10]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_02") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 

let $data_03 := for $strCls in $oldXML_02//strfree[number(@code) >= 11 and number(@code) <= 20]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_03") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 

let $data_04 := for $strCls in $oldXML_02//strfree[number(@code) >= 21 and number(@code) <= 50]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_04") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_05 := for $strCls in $oldXML_02//strfree[number(@code) >= 51 and number(@code) <= 150]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_05") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_06 := for $strCls in $oldXML_02//strfree[number(@code) >= 151 and number(@code) <= 160]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_06") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_07 := for $strCls in $oldXML_02//strfree[number(@code) = 170 ]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_07") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_08 := for $strCls in $oldXML_02//strfree[number(@code) >= 200 and number(@code) <= 300]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_08") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_09 := for $strCls in $oldXML_02//strfree[number(@code) >= 301 and number(@code) <= 400]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_09") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               
              
let $flattenContactData:=
              for $strCls in $oldXML_01//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML_01//strdata[number(@code) >= 121 and number(@code) <= 132] 
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

let $columnNames:=distinct-values($oldXML_01//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_09)
let $flatten:= insert-before($flatten, 0, $data_08)
let $flatten:= insert-before($flatten, 0, $data_07)
let $flatten:= insert-before($flatten, 0, $data_06)
let $flatten:= insert-before($flatten, 0, $data_05)
let $flatten:= insert-before($flatten, 0, $data_04)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML := for $item in $flatten
              return $item
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
