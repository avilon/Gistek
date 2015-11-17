import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML := fn:doc("70116\\1342_70116.xml")/*  

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

let $data := for $strData in $oldXML//strdata//strdetail[string-length(entity) > 1]
return 
    element {xs:QName("strdata")} {
        attribute name {$strData//entity},
        attribute code {number($strData/@code) - 100000},
        attribute measure {$strData//column[1]},
        attribute plan_downto_3 {$strData//column[2]},
        attribute plan_downto_2 {$strData//column[3]},
        attribute plan_downto_1 {$strData//column[4]},
        attribute plan          {$strData//column[5]},
        attribute plan_to_1     {$strData//column[6]},
        attribute plan_to_2     {$strData//column[7]},
        attribute plan_to_3     {$strData//column[8]}
    }        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] (:Контактная информация:)
              let $columns:=$strCls/column
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

let $flattenServiceData:=
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] (:Служебная информация:)
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
              

let $flatten := insert-before($data, 0, $flattenContactData)
let $flatten := insert-before($flatten, 0, $flattenServiceData)
let $flatten := insert-before($flatten, 0, $parm)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 