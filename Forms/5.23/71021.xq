(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.23 maket 1185 - 71021 -------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre71021($doc) {
 
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

let $volume := for $data in $oldXML//strdata[number(@code) = 10]
return
  element {xs:QName("strdata")} {
      attribute name{$data/@name},
      attribute code {"10"},
      attribute division {"10"}
  }

let $volVal := for $data in $oldXML//strdata[number(@code) >= 1000 and number(@code) <=1100]
return 
  element {xs:QName("strdata")} {
     attribute name{$data/@name},
     attribute code{number($data/@code) - 1000},
     attribute division{"1"},
     attribute measure {$data//column[1]},
     attribute plan_downto_2 {$data//column[2]},
     attribute fact_downto_2 {$data//column[3]},
         
     attribute plan_downto_1      {$data//column[4]},
     attribute plan_proc_downto_1 {$data//column[5]},
     attribute fact_downto_1      {$data//column[6]},
     attribute fact_proc_downt_1  {$data//column[7]},
         
     attribute plan               {$data//column[8]},
     attribute plan_proc          {$data//column[9]},
     attribute fact               {$data//column[10]},
     attribute fact_proc          {$data//column[11]},
         
     attribute plan_to_1          {$data//column[12]},
     attribute plan_proc_to_1     {$data//column[13]},
     attribute fact_to_1          {$data//column[14]},
     attribute fact_proc_to_1     {$data//column[15]},
         
     attribute plan_to_2          {$data//column[16]},
     attribute plan_proc_to_2     {$data//column[17]},
     attribute fact_to_2          {$data//column[18]},
     attribute fact_proc_to_2     {$data//column[19]}     
  }

let $costs := for $data in $oldXML//strdata[number(@code) = 20]
return
  element {xs:QName("strdata")} {
      attribute name{$data/@name},
      attribute code {"20"},
      attribute division {"20"}
  }

let $service := for $data in (distinct-values($oldXML//strdata[@code >= 2000 and @code <= 2100 ]/@name))
return 
  element{xs:QName("strdata")} {
    attribute name{$data},
     attribute division{"2"},
    
    for $vid in $oldXML//strdata[@name = $data]
    return
      element {xs:QName("child")} {
         attribute id { if (((number($vid/@code)-2000) mod 3) = 0) then 3 else (number($vid/@code)-2000) mod 3 },
         attribute measure {$vid//column[1]},
         
         attribute code {number($vid/@code)-2000},
         attribute plan_downto_2 {$vid//column[2]},
         attribute fact_downto_2 {$vid//column[3]},
         
         attribute plan_downto_1 {$vid//column[4]},
         attribute plan_proc_downto_1 {$vid//column[5]},
         attribute fact_downto_1 { $vid//column[6]},
         attribute fact_proc_downt_1 {$vid//column[7]},
         
         attribute plan              {$vid//column[8]},
         attribute plan_proc         {$vid//column[9]},
         attribute fact              {$vid//column[10]},
         attribute fact_proc         {$vid//column[11]},
         
         attribute plan_to_1         {$vid//column[12]},
         attribute plan_proc_to_1    {$vid//column[13]},
         attribute fact_to_1         {$vid//column[14]},
         attribute fact_proc_to_1    {$vid//column[15]},
         
         attribute plan_to_2         {$vid//column[16]},
         attribute plan_proc_to_2    {$vid//column[17]},
         attribute fact_to_2         {$vid//column[18]},
         attribute fact_proc_to_2    {$vid//column[19]}
      }
  }

let $ee := for $data in $oldXML//strdata[number(@code) = 30]
return
  element {xs:QName("strdata")} {
      attribute name{$data/@name},
      attribute code {"30"},
      attribute division{"30"}
  }

let $eeVal := for $data in $oldXML//strdata[number(@code) >= 3000 and number(@code) <=3100]
return 
  element {xs:QName("strdata")} {
     attribute name{$data/@name},
     attribute code{number($data/@code) - 3000},
     attribute division{"3"},
     
     attribute measure {$data//column[1]},
     attribute plan_downto_2 {$data//column[2]},
     attribute fact_downto_2 {$data//column[3]},
         
     attribute plan_downto_1      {$data//column[4]},
     attribute plan_proc_downto_1 {$data//column[5]},
     attribute fact_downto_1      {$data//column[6]},
     attribute fact_proc_downt_1  {$data//column[7]},
         
     attribute plan               {$data//column[8]},
     attribute plan_proc          {$data//column[9]},
     attribute fact               {$data//column[10]},
     attribute fact_proc          {$data//column[11]},
         
     attribute plan_to_1          {$data//column[12]},
     attribute plan_proc_to_1     {$data//column[13]},
     attribute fact_to_1          {$data//column[14]},
     attribute fact_proc_to_1     {$data//column[15]},
         
     attribute plan_to_2          {$data//column[16]},
     attribute plan_proc_to_2     {$data//column[17]},
     attribute fact_to_2          {$data//column[18]},
     attribute fact_proc_to_2     {$data//column[19]}     
  }

let $eff := for $data in $oldXML//strdata[number(@code) = 40]
return
  element {xs:QName("strdata")} {
      attribute name{$data/@name},
      attribute code {"40"},
      attribute division {"40"}
  }

let $effVal := for $data in $oldXML//strdata[number(@code) >= 4000 and number(@code) <=4100]
return 
  element {xs:QName("strdata")} {
     attribute name{$data/@name},
     attribute code{number($data/@code) - 4000},
     attribute division{"4"},
          
     attribute measure {$data//column[1]},
     attribute plan_downto_2 {$data//column[2]},
     attribute fact_downto_2 {$data//column[3]},
         
     attribute plan_downto_1      {$data//column[4]},
     attribute plan_proc_downto_1 {$data//column[5]},
     attribute fact_downto_1      {$data//column[6]},
     attribute fact_proc_downt_1  {$data//column[7]},
         
     attribute plan               {$data//column[8]},
     attribute plan_proc          {$data//column[9]},
     attribute fact               {$data//column[10]},
     attribute fact_proc          {$data//column[11]},
         
     attribute plan_to_1          {$data//column[12]},
     attribute plan_proc_to_1     {$data//column[13]},
     attribute fact_to_1          {$data//column[14]},
     attribute fact_proc_to_1     {$data//column[15]},
         
     attribute plan_to_2          {$data//column[16]},
     attribute plan_proc_to_2     {$data//column[17]},
     attribute fact_to_2          {$data//column[18]},
     attribute fact_proc_to_2     {$data//column[19]}     
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
let $flatten := insert-before($flatten, 0, $effVal) 
let $flatten := insert-before($flatten, 0, $eff) 
let $flatten := insert-before($flatten, 0, $eeVal) 
let $flatten := insert-before($flatten, 0, $ee) 
let $flatten := insert-before($flatten, 0, $service) 
let $flatten := insert-before($flatten, 0, $costs) 
let $flatten := insert-before($flatten, 0, $volVal) 
let $flatten := insert-before($flatten, 0, $volume) 


let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
