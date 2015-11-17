import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML:=fn:doc("70158\\1403_70158.xml")/* 


let $data_01 := for $strCls in $oldXML//strdata[number(@code) >= 1 and number(@code) < 27]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML//strfree[number(@code) >= 27 and number(@code) <= 47]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls//entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_03 := for $strCls in $oldXML//strdata[number(@code) > 47 and number(@code) < 64]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_04 := for $xmlData in (distinct-values($oldXML//strdata[number(@code) >= 64 and number(@code) < 100]//column[2]))
return
        element {xs:QName("strdata02")} {
            attribute name{$xmlData},
            attribute code{""},
            attribute id{substring($xmlData, 8, 1)},
            attribute measure {""},
            attribute formula {""},
            attribute val{""},
            
            for $str in $oldXML//strdata[string(column[2]) = string($xmlData)]
                let $cnt := 0
                return (
                   
                    element {xs:QName("strdata02")} {
                      attribute name{$str/@name},    
                      attribute code{$str/@code - 63},                  
                      attribute id{concat(substring(string($xmlData), 8, 2), string(number($str/@code)-63))},
                      attribute measure{$str//column[1]},
                      attribute formula{$str//column[3]},
                      attribute val{$str//column[4]}
                  }  
             )                     
                                 
        }

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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 133] 
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


let $Preflatten := $data_04
let $newXML := for $item in $Preflatten
return <document version="1.0" created="create_xml_online"><flat>{$item}</flat></document>

let $outData_02 := for $items in $newXML//flat//strdata02
    return
              element {xs:QName    ("strdata_02") } {
                  attribute id {$items/@id},
                  attribute name {$items/@name},
                  attribute measure {$items/@measure},
                  attribute formula {$items/@formula},
                  attribute code {$items/@code},
                  attribute val{$items/@val} 
              }

let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $outData_02)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML01 := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML01}</flat></document> 


