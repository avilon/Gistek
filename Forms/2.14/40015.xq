import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML:=fn:doc("40015\\1181_40015.xml")/* 


let $data_01 := for $strCls in $oldXML//strdata[number(@code) >= 1 and number(@code) <= 100]
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

let $data_02 := for $strCls in $oldXML//strdata[number(@code) >= 101 and number(@code) <= 102]
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

let $data_03 := for $strCls in $oldXML//strdata[number(@code) >= 10201 and number(@code) <= 10210]
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

let $data_04 := for $strCls in $oldXML//strdata[number(@code) >= 103 and number(@code) <= 109]
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


let $data_05 := for $strCls in $oldXML//strdata[number(@code) >= 10901 and number(@code) <= 10925]
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

let $data_06 := for $strCls in $oldXML//strdata[number(@code) = 111]
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

let $data_07 := for $strCls in $oldXML//strdata[number(@code) >= 11101 and number(@code) <= 11225]
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

let $data_08 := for $strCls in $oldXML//strdata[number(@code) >= 113 and number(@code) <= 115]
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

let $data_09 := for $strCls in $oldXML//strdata[number(@code) >= 11501 and number(@code) <= 11525]
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

let $data_10 := for $strCls in $oldXML//strdata[number(@code) = 116]
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

let $data_11 := for $strCls in $oldXML//strdata[number(@code) >= 11601 and number(@code) <= 11625]
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

let $data_12 := for $strCls in $oldXML//strdata[number(@code) = 117]
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

let $data_13 := for $strCls in $oldXML//strdata[number(@code) >= 118 and number(@code) <= 121]
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


let $data_20 := for $strCls in $oldXML//strdata[number(@code) >= 201 and number(@code) <= 203]
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

let $data_21 := for $strCls in $oldXML//strdata[number(@code) >= 20301 and number(@code) <= 20310]
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

let $data_22 := for $strCls in $oldXML//strdata[number(@code) = 205]
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

let $data_23 := for $strCls in $oldXML//strdata[number(@code) >= 20501 and number(@code) <= 20510]
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


let $data_24 := for $strCls in $oldXML//strdata[number(@code) = 207]
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


let $data_25 := for $strCls in $oldXML//strdata[number(@code) >= 20701 and number(@code) <= 20710]
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


let $data_26 := for $strCls in $oldXML//strdata[number(@code) = 209]
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

let $data_27 := for $strCls in $oldXML//strdata[number(@code) >= 212 and number(@code) <= 216]
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

let $data_30 := for $strCls in $oldXML//strdata[number(@code) = 301]
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

let $data_31 := for $strCls in $oldXML//strdata[number(@code) >= 30101 and number(@code) <= 30110]
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

let $data_32 := for $strCls in $oldXML//strdata[(number(@code) = 303) or (number(@code) >= 30301 and number(@code) <= 30310)]
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

let $data_33 := for $strCls in $oldXML//strdata[(number(@code) = 305) or (number(@code) >= 30501 and number(@code) <= 30510)]
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


let $data_34 := for $strCls in $oldXML//strdata[(number(@code) = 309) or (number(@code) >= 30901 and number(@code) <= 30910)]
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


let $data_35 := for $strCls in $oldXML//strdata[(number(@code) = 311) or (number(@code) >= 31101 and number(@code) <= 31110)]
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

let $data_36 := for $strCls in $oldXML//strdata[number(@code) >= 313 and number(@code) <= 316]
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


let $data_37 := for $strCls in $oldXML//strdata[number(@code) >= 31601 and number(@code) <= 31610]
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

let $data_38 := for $strCls in $oldXML//strdata[(number(@code) = 317) or (number(@code) >= 31701 and number(@code) <= 31710)]
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

let $data_40 := for $strCls in $oldXML//strdata[(number(@code) = 401) or (number(@code) = 402) or (number(@code) >= 40201 and number(@code) <= 40225)]
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

let $data_41 := for $strCls in $oldXML//strdata[(number(@code) = 409) or (number(@code) >= 40901 and number(@code) <= 40910)]
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

let $data_42 := for $strCls in $oldXML//strdata[(number(@code) = 411) or (number(@code) = 412) or (number(@code) >= 41201 and number(@code) <= 41225)]
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

let $data_43 := for $strCls in $oldXML//strdata[number(@code) = 419]
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


let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=611 or number(@code)=612] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 721 and number(@code) <= 732] 
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
let $flatten:= insert-before($flatten, 0, $data_43)
let $flatten:= insert-before($flatten, 0, $data_42)
let $flatten:= insert-before($flatten, 0, $data_41)
let $flatten:= insert-before($flatten, 0, $data_40)
let $flatten:= insert-before($flatten, 0, $data_38)
let $flatten:= insert-before($flatten, 0, $data_37)
let $flatten:= insert-before($flatten, 0, $data_36)
let $flatten:= insert-before($flatten, 0, $data_35)
let $flatten:= insert-before($flatten, 0, $data_34)
let $flatten:= insert-before($flatten, 0, $data_33)
let $flatten:= insert-before($flatten, 0, $data_32)
let $flatten:= insert-before($flatten, 0, $data_31)
let $flatten:= insert-before($flatten, 0, $data_30)
let $flatten:= insert-before($flatten, 0, $data_27)
let $flatten:= insert-before($flatten, 0, $data_26)
let $flatten:= insert-before($flatten, 0, $data_25)
let $flatten:= insert-before($flatten, 0, $data_24)
let $flatten:= insert-before($flatten, 0, $data_23)
let $flatten:= insert-before($flatten, 0, $data_22)
let $flatten:= insert-before($flatten, 0, $data_21)
let $flatten:= insert-before($flatten, 0, $data_20)
let $flatten:= insert-before($flatten, 0, $data_13)
let $flatten:= insert-before($flatten, 0, $data_12)
let $flatten:= insert-before($flatten, 0, $data_11)
let $flatten:= insert-before($flatten, 0, $data_10)
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