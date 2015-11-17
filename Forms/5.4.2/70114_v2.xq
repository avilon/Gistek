import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML := fn:doc("70114\\500260_70114.xml")/*  

let $fin := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "1" and string-length(entity) > 1]
return 
    element {xs:QName("strdata")} {
        attribute name {$data//entity},
        attribute code {6 * (number($data/@code) - 1000001) + 1},
        element {xs:QName("src_01")} {
            attribute name {"федеральный бюджет"},
            attribute code {6 * (number($data/@code) - 1000001) + 2},
            attribute plan {$data//column[1]},
            attribute fact {$data//column[2]},
            attribute dx   {$data//column[3]}
        },
        element {xs:QName("src_02")} {
            attribute name {"бюджет субъекта Российской Федерации"},
            attribute code {6 * (number($data/@code) - 1000001) + 3},
            attribute plan {$data//column[4]},
            attribute fact {$data//column[5]},
            attribute dx   {$data//column[6]}          
        },
        element {xs:QName("src_03")} {
            attribute name {"местные бюджеты"},
            attribute code {6 * (number($data/@code) - 1000001) + 4},
            attribute plan {$data//column[7]},
            attribute fact {$data//column[8]},
            attribute dx   {$data//column[9]}          
        },
        element {xs:QName("src_04")} {
            attribute name {"внебюджетные средства"},
            attribute code {6 * (number($data/@code) - 1000001) + 5},
            attribute plan {$data//column[10]},
            attribute fact {$data//column[11]},
            attribute dx   {$data//column[12]}          
        },
        for $econ in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "2" and entity = $data//entity]
        return element{xs:QName("econ")} {
            attribute code            {6 * (number($data/@code) - 1000001) + 1},
            attribute vid_topl        { $econ//column[1] },
            attribute measure         { $econ//column[2] },
            attribute econ_plan_natur { $econ//column[3]},
            attribute econ_fact_natur { $econ//column[4]},
            attribute econ_dx_natur   { $econ//column[5]},
            attribute econ_plan_cost  { $econ//column[6]},
            attribute econ_fact_cost  { $econ//column[7]},
            attribute econ_dx_cost    { $econ//column[8]}            
        },
        element {xs:QName("total")} {
            attribute name {"Итого по мероприятию"},
            attribute code {6 * (number($data/@code) - 1000001) + 6},
            attribute plan {$data//column[13]},
            attribute fact {$data//column[14]},
            attribute dx   {$data//column[15]}          
        }                                                                                                                                                                                                
    } 

let $total := for $data in $oldXML//strdata[number(@code) = 30]
return
    element {xs:QName("strdata")} {
        attribute name {"Всего с начала года реализации программы"},
        attribute code {"30"},
        attribute plan {$data//column[1]},
        attribute fact {$data//column[2]},
        attribute dx   {$data//column[3]},
        attribute econ_plan_cost {$data//column[4]},
        attribute econ_fact_cost {$data//column[5]},
        attribute econ_dx_cost   {$data//column[6]}
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

let $flatten := insert-before($flattenServiceData, 0, $flattenContactData) 
let $flatten := insert-before($flatten, 0, $total) 
let $flatten := insert-before($flatten, 0, $fin) 


let $newXML := for $item in $flatten
              return $item order by $flatten//strdata/@code
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
