(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.1.8 maket 1351 - 70125 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70125($doc) {     

let $oldXML:=$doc         

(: Параметры запуска :)

let $parm := for $prm in $oldXML
  return (
       element { xs:QName("param") } {
       attribute name {"params"},  
       attribute version {$prm/@version},
       attribute year {$prm/@year},
       attribute month {$prm/@month},
       attribute day {$prm/@day}       
     }
) 

let $flattenPart0 :=  element {xs:QName("strdata") }{   
                         attribute name {"Целевые показатели"},
                         attribute code {"1"}
                       }
                         
 let $data_01 := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "1" and string-length(entity) > 1]
 return 
     element {xs:QName("strdata")} {
         attribute name {$data//entity},
         attribute code {number($data/@code) - 99999},
         attribute measure{$data//column[1]},
         attribute avg_val{$data//column[2]},
         attribute best_val{$data//column[3]},
         attribute bas_val{$data//column[4]},
         attribute plan_downto_4 {$data//column[5]},
         attribute plan_downto_3 {$data//column[6]},
         attribute plan_downto_2 {$data//column[7]},
         attribute plan_downto_1 {$data//column[8]},
         attribute plan {$data//column[9]},
         attribute plat_to_1 {$data//column[10]},
         attribute plan_to_2 {$data//column[11]},
         attribute plan_to_3 {$data//column[12]},
         attribute plan_to_4 {$data//column[13]},
         attribute fact_downto_4 {$data//column[14]},
         attribute fact_downto_3 {$data//column[15]},
         attribute fact_downto_2 {$data//column[16]},
         attribute fact_downto_1 {$data//column[17]},
         attribute fact {$data//column[18]},
         attribute fact_to_1 {$data//column[19]},
         attribute fact_to_2 {$data//column[20]},
         attribute fact_to_3 {$data//column[21]},
         attribute fact_to_4 {$data//column[22]},
         attribute div_downto_4a {$data//column[23]},
         attribute div_downto_3a {$data//column[24]},
         attribute div_downto_2a {$data//column[25]},
         attribute div_downto_1a {$data//column[26]},
         attribute diva {$data//column[27]},
         attribute div_to_1a {$data//column[28]},
         attribute div_to_2a {$data//column[29]},
         attribute div_to_3a {$data//column[30]},
         attribute div_to_4a {$data//column[31]},
         attribute div_downto_4 {$data//column[32]},
         attribute div_downto_3 {$data//column[33]},
         attribute div_downto_2 {$data//column[34]},
         attribute div_downto_1 {$data//column[35]},
         attribute div {$data//column[36]},
         attribute div_to_1 {$data//column[37]},
         attribute div_to_2 {$data//column[38]},
         attribute div_to_3 {$data//column[39]},
         attribute div_to_4 {$data//column[40]}                           
     }                           
     
 let $flattenPart1 :=  element {xs:QName("strdata") }{   
                         attribute name {"Прочие показатели"},
                         attribute code {"100"}
                       }
                       
 let $data_02 := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "2" and string-length(entity) > 1]
 return 
     element {xs:QName("strdata")} {
         attribute name {$data//entity},
         attribute code {number($data/@code) - 199900},
         attribute measure{$data//column[1]},
         attribute avg_val{$data//column[2]},
         attribute best_val{$data//column[3]},
         attribute bas_val{$data//column[4]},
         attribute plan_downto_4 {$data//column[5]},
         attribute plan_downto_3 {$data//column[6]},
         attribute plan_downto_2 {$data//column[7]},
         attribute plan_downto_1 {$data//column[8]},
         attribute plan {$data//column[9]},
         attribute plat_to_1 {$data//column[10]},
         attribute plan_to_2 {$data//column[11]},
         attribute plan_to_3 {$data//column[12]},
         attribute plan_to_4 {$data//column[13]},
         attribute fact_downto_4 {$data//column[14]},
         attribute fact_downto_3 {$data//column[15]},
         attribute fact_downto_2 {$data//column[16]},
         attribute fact_downto_1 {$data//column[17]},
         attribute fact {$data//column[18]},
         attribute fact_to_1 {$data//column[19]},
         attribute fact_to_2 {$data//column[20]},
         attribute fact_to_3 {$data//column[21]},
         attribute fact_to_4 {$data//column[22]},
         attribute div_downto_4a {$data//column[23]},
         attribute div_downto_3a {$data//column[24]},
         attribute div_downto_2a {$data//column[25]},
         attribute div_downto_1a {$data//column[26]},
         attribute diva {$data//column[27]},
         attribute div_to_1a {$data//column[28]},
         attribute div_to_2a {$data//column[29]},
         attribute div_to_3a {$data//column[30]},
         attribute div_to_4a {$data//column[31]},
         attribute div_downto_4 {$data//column[32]},
         attribute div_downto_3 {$data//column[33]},
         attribute div_downto_2 {$data//column[34]},
         attribute div_downto_1 {$data//column[35]},
         attribute div {$data//column[36]},
         attribute div_to_1 {$data//column[37]},
         attribute div_to_2 {$data//column[38]},
         attribute div_to_3 {$data//column[39]},
         attribute div_to_4 {$data//column[40]}                           
     }                           
     
let $flattenContactData := for $strCls in $oldXML//strdata[number(@code) = 111 or number(@code) = 112] 
              
let $columns := $strCls/column
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

let $flattenServiceData := for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
let $columns:=$strCls/column
return
    element {xs:QName("strServiceInf") }{
        attribute name {$strCls/@name},
        attribute code {$strCls/@code},
        (for $c in $columns
           return
              attribute {xs:QName(concat("col",string($c/@order))) }{
                      $c/text()
              }                    
        )
    }
    
let $flatten := insert-before($flattenServiceData, 0, $parm) 
let $flatten := insert-before($flatten, 0, $flattenContactData)         
let $flatten := insert-before($flatten, 0, $data_02)
let $flatten := insert-before($flatten, 0, $flattenPart1)
let $flatten := insert-before($flatten, 0, $data_01)
let $flatten := insert-before($flatten, 0, $flattenPart0)
 
let $newXML01 := for $item in $flatten
              return $item
                            
return <document version="1.0" created="create_xml_online"><flat>{$newXML01}</flat></document> 
};

      