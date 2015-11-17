(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.1.9 maket 1350 - 70126 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70126($doc) { 

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

let $fin := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "1" and string-length(entity) > 1]
    return 
        element { xs:QName("strdata")} {
            attribute name          { $data//entity },
            attribute code          { number($data/@code) - 100000 },
            attribute measure       { $data//column[1] },
            attribute vol_paln_all  { $data//column[2] },
            attribute vol_plan_year { $data//column[3] },
            attribute vol_fact_all  { $data//column[4] },
            attribute vol_fact_year { $data//column[5] },
            
            for $cost in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "3" and entity = $data//entity]                                
            return (
                attribute cost_all_plan  { $cost//column[1] },
                attribute cost_year_plan { $cost//column[2] },
                attribute cost_all_fact  { $cost//column[3] },
                attribute cost_year_fact { $cost//column[4] }
            ),
            
            (: Экономия от реализации программ  :)            
            for $econ in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "2" and entity = $data//entity]                                
            return                          
                element {xs:QName("econ")} {
                     attribute name                     { $econ//column[1]  },
                     attribute measure                  { $econ//column[2]  },
                     attribute all_plan_natur           { $econ//column[3]  },
                     attribute all_plan_tut             { $econ//column[4]  },
                     attribute all_plan_cost            { $econ//columl[5]  },
                     attribute year_plan_natur          { $econ//column[6]  },
                     attribute year_plan_tut            { $econ//column[7]  },
                     attribute year_plan_cost           { $econ//column[8]  },
                     
                     attribute all_fact_natur           { $econ//column[9]  },
                     attribute all_fact_tut             { $econ//column[10]  },
                     attribute all_fact_cost            { $econ//columl[11]  },
                     attribute year_fact_natur          { $econ//column[12]  },
                     attribute year_fact_tut            { $econ//column[13]  },
                     attribute year_fact_cost           { $econ//column[14]  }                             
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

let $flatten := insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten := insert-before($flatten, 0, $fin)
let $flatten := insert-before($flatten, 0, $parm)


let $newXML := for $item in $flatten[string-length(@name) > 1]
return $item

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

