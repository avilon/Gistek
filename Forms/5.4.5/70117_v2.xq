import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML := fn:doc("70117\\1345_70117.xml")/*  

let $fin := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "1" and string-length(entity) > 1]
return 
    element {xs:QName("strdata")} {
        attribute name {$data//entity},
        attribute code {5 * (number($data/@code) - 100001) + 1},
        element {xs:QName("src_01")} {
            attribute name {"федеральный бюджет"},
            attribute code { 5 * (number($data/@code) - 100001) + 1 },
            attribute vol_year_downto_3 { $data//column[1]  },
            attribute vol_year_downto_2 { $data//column[6]  },
            attribute vol_year_downto_1 { $data//column[11] },
            attribute vol_year          { $data//column[16] },
            attribute vol_year_to_1     { $data//column[21] },
            attribute vol_year_to_2     { $data//column[26] },
            attribute vol_year_to_3     { $data//column[31] } 
        },
        element {xs:QName("src_02")} {
            attribute name {"бюджет субъектов Российской Федерации"},
            attribute code { 5 * (number($data/@code) - 100001) + 2 },            
            attribute vol_year_downto_3 { $data//column[2]  },
            attribute vol_year_downto_2 { $data//column[7]  },
            attribute vol_year_downto_1 { $data//column[12] },
            attribute vol_year          { $data//column[17] },
            attribute vol_year_to_1     { $data//column[22] },
            attribute vol_year_to_2     { $data//column[27] },
            attribute vol_year_to_3     { $data//column[32] }           
        },
        element {xs:QName("src_03")} {
            attribute name {"местные бюджеты"},
            attribute code { 5 * (number($data/@code) - 100001) + 3 },            
            attribute vol_year_downto_3 { $data//column[3]  },
            attribute vol_year_downto_2 { $data//column[8]  },
            attribute vol_year_downto_1 { $data//column[13] },
            attribute vol_year          { $data//column[18] },
            attribute vol_year_to_1     { $data//column[23] },
            attribute vol_year_to_2     { $data//column[28] },
            attribute vol_year_to_3     { $data//column[33] }                     
        },
        element {xs:QName("src_04")} {
            attribute name {"внебюджетные средства"},
            attribute code { 5 * (number($data/@code) - 100001) + 4 },            
            attribute vol_year_downto_3 { $data//column[4]  },
            attribute vol_year_downto_2 { $data//column[9]  },
            attribute vol_year_downto_1 { $data//column[14] },
            attribute vol_year          { $data//column[19] },
            attribute vol_year_to_1     { $data//column[24] },
            attribute vol_year_to_2     { $data//column[29] },
            attribute vol_year_to_3     { $data//column[34] }                     
        },
        element{xs:QName("total")} {
            attribute name {"Итого  по мероприятию"},
            attribute code {5 * (number($data/@code) - 100001) + 5},
            attribute vol_year_downto_3 { $data//column[5]},
            attribute vol_year_downto_2 { $data//column[10]},
            attribute vol_year_downto_1 { $data//column[15]},
            attribute vol_year          { $data//column[20]},
            attribute vol_year_to_1     { $data//column[25]},
            attribute vol_year_to_2     { $data//column[30]},
            attribute vol_year_to_3     { $data//column[35]}
        }        
    }
    
let $flatten := $fin

let $newXML := for $item in $flatten
              return $item 
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
