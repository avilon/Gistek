(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.39 maket 1185 - 71029 -------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre71029($doc) {

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


let $hdr := for $data in (1)
return
  element{xs:QName("strdata")} {
     attribute name{"Удельный расход тепловой энергии на отопление зданий"},
     attribute code{"1"}
  }

let $sub := for $data in (1)
return
  element{xs:QName("strdata")} {
     attribute name{"в зависимости от этажности здания"},
     attribute code{""}
  }

let $ee := for $data in $oldXML//strdata[number(@code) >= 2 and number(@code) <=10]
return
  element{xs:QName("strdata")} {
     attribute name{$data/@name},
     attribute code{$data/@code},
     attribute measure {$data//column[1]},
     attribute year_plan_downto_1 {$data//column[2]},
     attribute year_fact_downto_1 {$data//column[3]},
     attribute year_plan          {$data//column[4]},
     attribute year_fact          {$data//column[5]},
     attribute year_plan_to_1     {$data//column[6]},
     attribute year_fact_to_1     {$data//column[7]}
  }
  
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code) >= 111 and number(@code) <= 112] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strContactInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
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
                attribute value{$strCls//column[1]}
              } 
                
let $flatten := $parm
let $flatten := insert-before($flatten, 0, $flattenContactData) 
let $flatten := insert-before($flatten, 0, $flattenServiceData) 
let $flatten := insert-before($flatten, 0, $ee) 
let $flatten := insert-before($flatten, 0, $sub) 
let $flatten := insert-before($flatten, 0, $hdr) 



let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
