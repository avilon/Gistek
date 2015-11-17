(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.4.6 maket 1398 - 70157 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70157($doc) { 

let $oldXML:=$doc        

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

let $common := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "1" and string-length(entity) > 1]
return 
    element {xs:QName("common")} {
         attribute name     { $data//entity },
         attribute code     { number($data/@code) - 100000},
         attribute inn      { $data//column[1]  },
         attribute address  { $data//column[2]  },
         attribute phone    { $data//column[3]  },
         attribute email    { $data//column[4]  },
         attribute plan     { $data//column[5]  },
         attribute date_beg { $data//column[6]  },
         attribute doc_info { $data//column[7]  },
         attribute date_end { $data//column[8]  },
         attribute sert     { $data//column[9]  },
         attribute sert_org { $data//column[10] },
         attribute sys_info { $data//column[11] } 
    }

let $dzo := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "2" and string-length(entity) > 1]
return
    element {xs:QName("dzo")} {
        attribute name     { $data//entity },
        attribute code     { number($data/@code) - 200000 },
        attribute inn      { $data//column[1] },
        attribute doc_name { $data//column[2] },  
        attribute doc_date { $data//column[3] }
    }

let $dynamic := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "3" and string-length(entity) > 1]
return
    element {xs:QName("dynamic")} {
        attribute name              { $data//entity},
        attribute code              { number($data/@code) - 300000 },
        attribute inn               { $data//column[1]  },
        attribute pokaz_name        { $data//column[2]  },
        attribute measure           { $data//column[3]  },
        attribute val_year_downto_3 { $data//column[4]  },
        attribute val_year_downto_2 { $data//column[5]  },
        attribute val_year_downto_1 { $data//column[6]  },
        attribute val_year          { $data//column[7]  }   
    }
    
let $managers := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "4" and string-length(entity) > 1]
return
    element {xs:QName("managers")} {
         attribute name { $data//entity },
         attribute inn  { $data//column[1]  },
         attribute code { number($data/@code) - 400000 },
         element {xs:QName("mngr_energo")} {
             attribute fio   { $data//column[2] },
             attribute post  { $data//column[3] },
             attribute phone { $data//column[4] },
             attribute email { $data//column[5] }
         },
         element {xs:QName ("mngr_quality")} {
             attribute fio   { $data//column[6] },
             attribute post  { $data//column[7] },
             attribute phone { $data//column[8] },
             attribute email { $data//column[9] }
         },
         element {xs:QName ("mngr_ecology")} {
             attribute fio   { $data//column[10] },
             attribute post  { $data//column[11] },
             attribute phone { $data//column[12] },
             attribute email { $data//column[13] }
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
let $flatten := insert-before($flatten, 0, $managers)   
let $flatten := insert-before($flatten, 0, $dynamic)   
let $flatten := insert-before($flatten, 0, $dzo)   
let $flatten := insert-before($flatten, 0, $common)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

  