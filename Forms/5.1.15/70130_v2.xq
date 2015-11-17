import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML := fn:doc("70130\\1347_70130_64.xml")/*  

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

let $fin := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "1" and string-length(entity) > 1]
    return 
        element { xs:QName("strdata")} {
            attribute name              { $data//entity     },
            attribute code              { number($data/@code) - 100000 },
            attribute measure           { $data//column[1]  },
            attribute vol_tot           { $data//column[2]  },
            attribute vol_year_downto_4 { $data//column[3]  },
            attribute vol_year_downto_3 { $data//column[4]  },
            attribute vol_year_downto_2 { $data//column[5]  },
            attribute vol_year_downto_1 { $data//column[6]  },
            attribute vol_year          { $data//column[7]  },
            attribute vol_year_to_1     { $data//column[8]  },
            attribute vol_year_to_2     { $data//column[9]  },
            attribute vol_year_to_3     { $data//column[10] },
            attribute vol_year_to_4     { $data//column[11] },
            
            for $cost in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "3" and entity = $data//entity]                                return (
                attribute cost_year_downto_4 { $cost//column[1] },
                attribute cost_year_downto_3 { $cost//column[2] },
                attribute cost_year_downto_2 { $cost//column[3] },
                attribute cost_year_downto_1 { $cost//column[4] },
                attribute cost_year          { $cost//column[5] },
                attribute cost_year_to_1     { $cost//column[6] },
                attribute cost_year_to_2     { $cost//column[7] },
                attribute cost_year_to_3     { $cost//column[8] },
                attribute cost_year_to_4     { $cost//column[9] },
                attribute pay_section        { $cost//column[10]}                            
            ),                     

            for $pay in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "5" and entity = $data//entity]                                 return (
                attribute payback_period { $pay//column[1] },
                attribute vnd            { $pay//column[2] },
                attribute cdd            { $pay//column[3] },
                attribute period         { $pay//column[4] }         
            ),
                      
            (: Экономия от реализации программ  :)            
            for $econ in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "2" and entity = $data//entity]                                return 
                element {xs:QName("econ")} {
                     attribute name                     { $econ//column[1]  },
                     attribute measure                  { $econ//column[2]  },
                     attribute econ_natur_tot           { $econ//column[3]  },
                     attribute econ_natur_plan_downto_4 { $econ//column[4]  },
                     attribute econ_tut_plan_downto_4   { $econ//column[5]  },
                     attribute econ_cost_plan_downto_4  { $econ//column[6]  },
                     
                     attribute econ_natur_plan_downto_3 { $econ//column[7]  },
                     attribute econ_tut_plan_downto_3   { $econ//column[8]  },
                     attribute econ_cost_plan_downto_3  { $econ//column[9]  },                     

                     attribute econ_natur_plan_downto_2 { $econ//column[10] },
                     attribute econ_tut_plan_downto_2   { $econ//column[11] },
                     attribute econ_cost_plan_downto_2  { $econ//column[12] },                     

                     attribute econ_natur_plan_downto_1 { $econ//column[13] },
                     attribute econ_tut_plan_downto_1   { $econ//column[14] },
                     attribute econ_cost_plan_downto_1  { $econ//column[15] },
                                          
                     attribute econ_natur_plan          { $econ//column[16] },
                     attribute econ_tut_plan            { $econ//column[17] },
                     attribute econ_cost_plan           { $econ//column[18] }, 

                     attribute econ_natur_plan_to_1     { $econ//column[19] },
                     attribute econ_tut_plan_to_1       { $econ//column[20] },
                     attribute econ_cost_plan_to_1      { $econ//column[21] }, 

                     attribute econ_natur_plan_to_2     { $econ//column[22] },
                     attribute econ_tut_plan_to_2       { $econ//column[23] },
                     attribute econ_cost_plan_to_2      { $econ//column[24] },
                      
                     attribute econ_natur_plan_to_3     { $econ//column[25] },
                     attribute econ_tut_plan_to_3       { $econ//column[26] },
                     attribute econ_cost_plan_to_3      { $econ//column[27] },

                     attribute econ_natur_plan_to_4     { $econ//column[28] },
                     attribute econ_tut_plan_to_4       { $econ//column[29] },
                     attribute econ_cost_plan_to_4      { $econ//column[30] }                                                           
            },
            for $source in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "4" and entity = $data//entity]                                return 
                element {xs:QName("source")} {
                    attribute name {$source//column[1]}
            }             
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

let $flattenServiceData := for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 133] 
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
let $flatten := insert-before($flatten, 0, $fin)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 

  