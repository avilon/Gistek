import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML1:=fn:doc("40025\\1366_40026.xml")/* 
let $oldXML2:=fn:doc("40025\\1366_40025.xml")/* 

let $data_01:=for $strCls in $oldXML1//strdata[(number(@code) < 111 or number(@code) > 132) and (number(@code) != 10)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_01") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $data_11:=for $strCls in $oldXML1//strdata[(number(@code) = 10)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_11") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $data_02 := for $strCls in $oldXML2//strfree[number(@code) >= 1 and number(@code) <= 15]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_02") }{
                attribute name {concat("-", $strCls/@code, "-")},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_03 := for $strCls in $oldXML2//strfree[number(@code) >= 16 and number(@code) <= 30]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_03") }{
                attribute name {concat("-", $strCls/@code, "-")},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_04 := for $strCls in $oldXML2//strfree[number(@code) >= 31 and number(@code) <= 35]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_04") }{
                attribute name {concat("-", $strCls/@code, "-")},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

              
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML1//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML1//strdata[number(@code) >= 121 and number(@code) <= 132]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML1//column/@order)
let $flatten:= $data_04
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)
let $flatten:= insert-before($flatten, 0, $data_11)

let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= $flatten
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>