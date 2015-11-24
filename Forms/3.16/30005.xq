(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.16 maket 1014 - 30005 -------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20037($doc) {
 
let $oldXML := $doc   

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

let $list_01 := for $data in $oldXML//strdata[(number(@code) >= 1 and (number(@code) <= 33))]
  return 
    element {xs:QName("list_01")} {
       attribute name {$data/@name},
       attribute code {number($data/@code) - 20},
       attribute quart_tot {$data/column[1]},
       attribute year_tot {$data/column[2]},
       for $subdata in $oldXML//strdata//strclass[substring(@code, 1, 2) = $data/@code]
         return (
           if ($subdata/@id = 1) then
             attribute quart_own {$subdata/column[1]}
           else (),
           if ($subdata/@id = 1) then
             attribute year_own {$subdata/column[2]}
           else (),           
           if ($subdata/@id = 2) then
             attribute quart_imp {$subdata/column[1]}
           else (),
           if ($subdata/@id = 2) then
             attribute year_imp {$subdata/column[2]}
           else ()           
       )  
    }

let $list_02 := for $data in $oldXML//strdata[(number(@code) >= 34 and (number(@code) <= 35))]
  return 
    element {xs:QName("list_02")} {
       attribute name {$data/@name},
       attribute code {number($data/@code) - 20},
       attribute quart_tot {$data/column[1]},
       attribute year_tot {$data/column[2]},
       for $subdata in $oldXML//strdata//strclass[substring(@code, 1, 2) = $data/@code]
         return (
           if ($subdata/@id = 1) then
             attribute quart_own {$subdata/column[1]}
           else (),
           if ($subdata/@id = 1) then
             attribute year_own {$subdata/column[2]}
           else (),           
           if ($subdata/@id = 2) then
             attribute quart_imp {$subdata/column[1]}
           else (),
           if ($subdata/@id = 2) then
             attribute year_imp {$subdata/column[2]}
           else ()           
       )  
    }

let $list_03 := for $data in $oldXML//strdata[(number(@code) >= 36 and (number(@code) <= 37))]
  return 
    element {xs:QName("list_03")} {
       attribute name {$data/@name},
       attribute code {number($data/@code) - 20},
       attribute quart_tot {$data/column[1]},
       attribute year_tot {$data/column[2]},
       for $subdata in $oldXML//strdata//strclass[substring(@code, 1, 2) = $data/@code]
         return (
           if ($subdata/@id = 1) then
             attribute quart_own {$subdata/column[1]}
           else (),
           if ($subdata/@id = 1) then
             attribute year_own {$subdata/column[2]}
           else (),           
           if ($subdata/@id = 2) then
             attribute quart_imp {$subdata/column[1]}
           else (),
           if ($subdata/@id = 2) then
             attribute year_imp {$subdata/column[2]}
           else ()           
       )  
    }

let $list_04 := for $data in $oldXML//strdata[(number(@code) >= 38 and (number(@code) <= 39))]
  return 
    element {xs:QName("list_04")} {
       attribute name {$data/@name},
       attribute code {number($data/@code) - 20},
       attribute quart_tot {$data/column[1]},
       attribute year_tot {$data/column[2]},
       for $subdata in $oldXML//strdata//strclass[substring(@code, 1, 2) = $data/@code]
         return (
           if ($subdata/@id = 1) then
             attribute quart_own {$subdata/column[1]}
           else (),
           if ($subdata/@id = 1) then
             attribute year_own {$subdata/column[2]}
           else (),           
           if ($subdata/@id = 2) then
             attribute quart_imp {$subdata/column[1]}
           else (),
           if ($subdata/@id = 2) then
             attribute year_imp {$subdata/column[2]}
           else ()           
       )  
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
let $flatten := insert-before($flatten, 0, $list_04)
let $flatten := insert-before($flatten, 0, $list_03)
let $flatten := insert-before($flatten, 0, $list_02)
let $flatten := insert-before($flatten, 0, $list_01)
        
let $newXML := for $item in $flatten
              return $item 
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
