(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.5 maket 1185 - 71014 -------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre71014($doc) {
 
let $oldXML := $doc    

let $parm := for $prm in $oldXML
  return (
       element { xs:QName("param") } {
       attribute name {"params"},  
       attribute version {$prm/@version},
       attribute year {$prm/@year},
       attribute month {$prm/@month},
       attribute day {$prm/@day},
       attribute subject{$prm/@subject_name},
       attribute vid{$prm/@subject_variant_name}              
     }
) 

let $data_00 := for $strCls in $oldXML//strdata[number(@code) = 10]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {""},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_01 := for $strCls in $oldXML//strdata[(number(@code) >= 1000 and number(@code) <= 1100)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute measure {substring-before(substring-after($strCls/@name, "["), "]")},
                attribute code {number($strCls/@code)-999},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_20 := for $strCls in $oldXML//strdata[number(@code) = 20]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {""},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML//strdata[(number(@code) >= 2000 and number(@code) <= 2100)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {number($strCls/@code)-1999},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 136] 
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
let $flatten:= insert-before($flatten, 0, $data_20)
let $flatten:= insert-before($flatten, 0, $data_01)
let $flatten:= insert-before($flatten, 0, $data_00)
let $flatten:= insert-before($flatten, 0, $parm)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
