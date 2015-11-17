import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML := fn:doc("70113\\1338_70113.xml")/*  


let $data := for $strData in $oldXML//strdata//strdetail[string-length(entity) > 1]
return 
    element {xs:QName("strdata")} {
        attribute name {$strData//entity},
        attribute code {number($strData/@code) - 100000},
        attribute measure {$strData//column[1]},
        attribute plan_val {$strData//column[2]},
        attribute plan_fact {$strData//column[3]},
        attribute div_val {$strData//column[4]}
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
              

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 