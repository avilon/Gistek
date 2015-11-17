import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML:=fn:doc("90004\\10_90004.xml")/* 


let $data_01 := for $strCls in $oldXML//strdata[(number(@code) >= 1 and number(@code) <= 17)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML//strdata[(number(@code) >= 20 and number(@code) <= 40)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_03 := for $strCls in $oldXML//strdata[(number(@code) >= 50 and number(@code) <= 59)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_04 := for $strCls in $oldXML//strdata[(number(@code) >= 60 and number(@code) <= 65)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_05 := for $strCls in $oldXML//strdata[(number(@code) >= 70 and number(@code) <= 75)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_05") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_06 := for $strCls in $oldXML//strdata[(number(@code) >= 80 and number(@code) <= 87)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_06") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_07 := for $strCls in $oldXML//strdata[(number(@code) >= 90 and number(@code) <= 92)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_07") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_08 := for $strCls in $oldXML//strdata[(number(@code) >= 100 and number(@code) <= 105)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_08") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_09 := for $strCls in $oldXML//strdata[(number(@code) >= 111 and number(@code) <= 114)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_09") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_10 := for $strCls in $oldXML//strdata[(number(@code) >= 120 and number(@code) <= 124)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_10") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=211 or number(@code)=212] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 221 and number(@code) <= 233] 
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
let $flatten:= insert-before($flatten, 0, $data_01)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_04)
let $flatten:= insert-before($flatten, 0, $data_05)
let $flatten:= insert-before($flatten, 0, $data_06)
let $flatten:= insert-before($flatten, 0, $data_07)
let $flatten:= insert-before($flatten, 0, $data_08)
let $flatten:= insert-before($flatten, 0, $data_09)
let $flatten:= insert-before($flatten, 0, $data_10)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>  