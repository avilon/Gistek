import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML:=fn:doc("72024\\1189_72024_603.xml")/* 

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

let $h1 := for $data in (1)
return 
  element{xs:QName("strdata")} {
     attribute name{"Организационные мероприятия"},
     attribute division {"10"}
  }

let $h2 := for $data in (1)
return 
  element{xs:QName("strdata")} {
     attribute name{"Технические мероприятия"},
     attribute division {"20"}     
  }

let $h3 := for $data in (1)
return 
  element{xs:QName("strdata")} {
     attribute name{"Инвестиционная программа"},
     attribute division {"30"}     
  }
  
let $h4 := for $data in (1)
return 
  element{xs:QName("strdata")} {
     attribute name{"Итого по видам ТЭР"},
     attribute division {"40"}     
  }

let $h5 := for $data in (1)
return 
  element{xs:QName("strdata")} {
     attribute name{"Всего ТЭР"},
     attribute division {"50"}     
  }

let $events := for $data in distinct-values($oldXML//strdata[number(@code) >= 1000 and number(@code) < 2000]//column[1])
return
  if (string-length($data) > 0) then
    element{xs:QName("strdata")} {
        attribute name{$data},
        attribute division{"1"},
        
        for $list in $oldXML//strdata[column[1] = $data]
        return 
          if (substring($list/@code, 4, 1) = "0") then (
              attribute enter_month {$list//column[2]},
              attribute enter_year  {$list//column[3]},
              attribute payback     {$list//column[4]} 
          ) else (
            element{xs:QName("child")} {
               attribute id {substring($list/@code, 4, 1)},
               attribute code{(number(substring($list/@code, 3, 1))-1)*5 + number(substring($list/@code, 4, 1))},
               attribute cost                 {$list//column[5]},
               
               if (substring($list/@code, 4, 1) = "1") then (
                  attribute ter{substring-before($list//column[6], "[")},
                  attribute measure {substring-before(substring-after($list//column[6], "["), "]")}
               ) else (),               
               
               attribute ter_econ_natur_plan  {$list//column[7]},
               attribute ter_econ_tut_plan    {$list//column[8]},
               attribute ter_econ_cost_plan   {$list//column[9]},
               attribute econ_effect_plan     {$list//column[10]},
               attribute ter_econ_natur_fact  {$list//column[11]},
               attribute ter_econ_tut_fact    {$list//column[12]},
               attribute ter_econ_effect_fact {$list//column[13]},
               attribute econ_effect_fact     {$list//column[14]}
            } 
          )
    }
  else()

let $tech := for $data in distinct-values($oldXML//strdata[number(@code) >= 2000 and number(@code) < 3000]//column[1])
return
  if (string-length($data) > 0) then
    element{xs:QName("strdata")} {
        attribute name{$data},
        attribute division{"2"},
        
        for $list in $oldXML//strdata[column[1] = $data]
        return 
          if (substring($list/@code, 4, 1) = "0") then (
              attribute enter_month {$list//column[2]},
              attribute enter_year  {$list//column[3]},
              attribute payback     {$list//column[4]} 
          ) else (
            element{xs:QName("child")} {
               attribute id {substring($list/@code, 4, 1)},
               attribute code{(number(substring($list/@code, 3, 1))-1)*5 + number(substring($list/@code, 4, 1))},
               attribute cost                 {$list//column[5]},
               
               if (substring($list/@code, 4, 1) = "1") then (
                  attribute ter{substring-before($list//column[6], "[")},
                  attribute measure {substring-before(substring-after($list//column[6], "["), "]")}
               ) else (),               
               
               attribute ter_econ_natur_plan  {$list//column[7]},
               attribute ter_econ_tut_plan    {$list//column[8]},
               attribute ter_econ_cost_plan   {$list//column[9]},
               attribute econ_effect_plan     {$list//column[10]},
               attribute ter_econ_natur_fact  {$list//column[11]},
               attribute ter_econ_tut_fact    {$list//column[12]},
               attribute ter_econ_effect_fact {$list//column[13]},
               attribute econ_effect_fact     {$list//column[14]}
            } 
          )
    }
  else()

let $invest := for $data in distinct-values($oldXML//strdata[number(@code) >= 3000 and number(@code) < 4000]//column[1])
return
  if (string-length($data) > 0) then
    element{xs:QName("strdata")} {
        attribute name{$data},
        attribute division{"3"},
        
        for $list in $oldXML//strdata[column[1] = $data]
        return 
          if (substring($list/@code, 4, 1) = "0") then (
              attribute enter_month {$list//column[2]},
              attribute enter_year  {$list//column[3]},
              attribute payback     {$list//column[4]} 
          ) else (
            element{xs:QName("child")} {
               attribute id {substring($list/@code, 4, 1)},
               attribute code{(number(substring($list/@code, 3, 1))-1)*5 + number(substring($list/@code, 4, 1))},
               attribute cost                 {$list//column[5]},
               
               if (substring($list/@code, 4, 1) = "1") then (
                  attribute ter{substring-before($list//column[6], "[")},
                  attribute measure {substring-before(substring-after($list//column[6], "["), "]")}
               ) else (),               
               
               attribute ter_econ_natur_plan  {$list//column[7]},
               attribute ter_econ_tut_plan    {$list//column[8]},
               attribute ter_econ_cost_plan   {$list//column[9]},
               attribute econ_effect_plan     {$list//column[10]},
               attribute ter_econ_natur_fact  {$list//column[11]},
               attribute ter_econ_tut_fact    {$list//column[12]},
               attribute ter_econ_effect_fact {$list//column[13]},
               attribute econ_effect_fact     {$list//column[14]}
            } 
          )
    }
  else()

let $ter := for $data in distinct-values($oldXML//strdata[number(@code) >= 4000 and number(@code) < 4070]/substring-before(@name, "["))
return 
  element {xs:QName("strdata")} {
       attribute name {$data},
       attribute division{"4"},
     for $list in $oldXML//strdata[substring-before(@name, "[") = $data]
     return 
       element{xs:QName("terChild")} {
          attribute id {number(substring($list/@code, 4, 1)) + 1},
          attribute cost {$list//column[1]},
          if (number(substring($list/@code, 4, 1)) = 1) then (
             attribute measure{substring-after($list/@name, ",")}
          ) else (),
          
          attribute ter_econ_natur_plan {$list//column[2]},
          attribute ter_econ_tut_plan   {$list//column[3]},
          attribute ter_econ_cost_plan  {$list//column[4]},
          attribute econ_effect_plan    {$list//column[5]},
          attribute ter_econ_natur_fact {$list//column[6]},
          attribute ter_econ_tut_fact   {$list//column[7]},
          attribute ter_econ_cost_fact  {$list//column[8]},
          attribute econ_effect_pfact   {$list//column[9]}          
       }
  }

let $terItog := for $data in distinct-values($oldXML//strdata[number(@code) = 4070]/substring-before(@name, "["))
return 
  element {xs:QName("strdata")} {
       attribute name {$data},
       attribute division{"5"},
     for $list in $oldXML//strdata[substring-before(@name, "[") = $data]
     return 
       element{xs:QName("terChild")} {
          attribute id {number(substring($list/@code, 4, 1)) + 1},
          attribute cost {$list//column[1]},
          if (number(substring($list/@code, 4, 1)) = 1) then (
             attribute measure{substring-after($list/@name, ",")}
          ) else (),
          
          attribute ter_econ_natur_plan {$list//column[2]},
          attribute ter_econ_tut_plan   {$list//column[3]},
          attribute ter_econ_cost_plan  {$list//column[4]},
          attribute econ_effect_plan    {$list//column[5]},
          attribute ter_econ_natur_fact {$list//column[6]},
          attribute ter_econ_tut_fact   {$list//column[7]},
          attribute ter_econ_cost_fact  {$list//column[8]},
          attribute econ_effect_pfact   {$list//column[9]}          
       }
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
  

let $flatten := $parm
let $flatten := insert-before($flatten, 0, $flattenContactData) 
let $flatten := insert-before($flatten, 0, $terItog) 
let $flatten := insert-before($flatten, 0, $h5) 
let $flatten := insert-before($flatten, 0, $ter) 
let $flatten := insert-before($flatten, 0, $h4) 
let $flatten := insert-before($flatten, 0, $invest) 
let $flatten := insert-before($flatten, 0, $h3) 
let $flatten := insert-before($flatten, 0, $tech) 
let $flatten := insert-before($flatten, 0, $h2) 
let $flatten := insert-before($flatten, 0, $events) 
let $flatten := insert-before($flatten, 0, $h1) 


let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
