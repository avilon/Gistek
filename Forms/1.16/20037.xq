(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.16 maket 1102 - 20037 ---------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20037($doc) {
 
let $oldXML := $doc  

let $parm := for $prm in $oldXML
  return (
       element { xs:QName("param") } {
       attribute name {"params"},  
       attribute version {$prm/@version},
       attribute year {$prm/@year},
       attribute month {$prm/@month},
       attribute day {$prm/@day},       
       attribute predpr {$prm/@subject_name},
       attribute subject {$prm/@subject_variant_name}
     }
  )   
  
let $data_01 := for $strCls in $oldXML//strfree[number(@code) >= 1 and number(@code) <= 25]
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

let $data_02 := for $strCls in $oldXML//strfree[number(@code) >= 26 and number(@code) <= 50]
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
                
let $data_03 := for $strCls in $oldXML//strfree[number(@code) >= 51 and number(@code) <= 75]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }                 

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
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
let $flatten:= insert-before($flatten, 0, $parm)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
                
