import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML := fn:doc("EE\\5_1_14.xml")/*

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


(: Целевые показатели :)

let $goalHeader := element { xs:QName("goal") } {   
                         attribute name {"Целевые показатели"},
                         attribute id {" "}}

let $otherHeader := element { xs:QName("goal") } {   
                         attribute name {"Прочие показатели"},
                         attribute id {" "}}
                            
let $goal := for $goalData in $oldXML//strdetail[number(@code) >= 100001 and number(@code) < 200000]

return (
  element { xs:QName("goal") } {
        attribute name  {$goalData//entity},
        attribute id    {number( $goalData/@code) - 100000},
        attribute measure      { $goalData//column[1]},
        attribute avg          { $goalData//column[2]},
        attribute max          { $goalData//column[3]},
        attribute basic_year   { $goalData//column[4]},
        attribute year_dowto_4 { $goalData//column[5]},
        attribute year_dowto_3 { $goalData//column[6]},
        attribute year_dowto_2 { $goalData//column[7]},
        attribute year_dowto_1 { $goalData//column[8]},
        attribute year_curr    { $goalData//column[9]},
        attribute year_to_1    { $goalData//column[10]},
        attribute year_to_2    { $goalData//column[11]},
        attribute year_to_3    { $goalData//column[12]},
        attribute year_to_4    { $goalData//column[13]}             
  }
)

let $other := for $otherData in $oldXML//strdetail[number(@code) >= 200001 and number(@code) < 300000]

return (
  element { xs:QName("goal") } {
        attribute name  {$otherData//entity},
        attribute id    {number( $otherData/@code) - 200000},
        attribute measure      { $otherData//column[1]},
        attribute avg          { $otherData//column[2]},
        attribute max          { $otherData//column[3]},
        attribute basic_year   { $otherData//column[4]},
        attribute year_dowto_4 { $otherData//column[5]},
        attribute year_dowto_3 { $otherData//column[6]},
        attribute year_dowto_2 { $otherData//column[7]},
        attribute year_dowto_1 { $otherData//column[8]},
        attribute year_curr    { $otherData//column[9]},
        attribute year_to_1    { $otherData//column[10]},
        attribute year_to_2    { $otherData//column[11]},
        attribute year_to_3    { $otherData//column[12]},
        attribute year_to_4    { $otherData//column[13]}             
  }
)

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
let $flatten := insert-before($flatten, 0, $other)
let $flatten := insert-before($flatten, 0, $otherHeader)
let $flatten := insert-before($flatten, 0, $goal)
let $flatten := insert-before($flatten, 0, $goalHeader)
let $flatten := insert-before($flatten, 0, $parm)

let $newXML := for $item in $flatten[string-length(@name) > 1]
return $item

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
   