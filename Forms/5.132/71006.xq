(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.132 maket 1186 - 71006 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre71006($doc) { 

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
       attribute oktmo{$prm/@subject_variant_name}              
     }
) 


let $data_01 := for $strCls in $oldXML//strdata[(number(@code) >=1 and number(@code) <= 499) and 
                                                (number(@code)) != 16 and
                                                (number(@code)) != 17 and 
                                                (number(@code)) != 121 and
                                                (number(@code)) != 122 and
                                                (number(@code)) != 123 and
                                                (number(@code)) != 124 and
                                                (number(@code)) != 125 and
                                                (number(@code)) != 126 and
                                                (number(@code)) != 127 and
                                                (number(@code)) != 128 and
                                                (number(@code)) != 129 and
                                                (number(@code)) != 130 and
                                                (number(@code)) != 131 and
                                                (number(@code)) != 132]
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

let $data_02 := for $strCls in $oldXML//strdata[(number(@code) >= 500)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code) = 16 or number(@code)=17] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 126] 
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

let $flatten := insert-before($flattenServiceData, 0, $parm) 
let $flatten := insert-before($flatten, 0, $flattenContactData)         
let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)
let $flatten:= insert-before($flatten, 0, $parm)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
