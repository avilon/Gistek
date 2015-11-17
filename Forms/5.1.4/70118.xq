(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.1.4 maket 1341 - 70118 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70118($doc) {
 
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

let $data := for $xmlData in (distinct-values($oldXML//strdetail//column[2][string-length(text()) > 1]))
      return 
        element {xs:QName("strdata")} {
          attribute name {$xmlData},
          attribute measure{""},
          attribute code{""},
          
          attribute column1{""},
          attribute column2{""},
          attribute column3{""},
          attribute column4{""},
          attribute column5{""},
          attribute column6{""},
          attribute column7{""},
          attribute column8{""},
          attribute column9{""},
          attribute column10{""},
          attribute column11{""},
          attribute column12{""},
          attribute column13{""},
          attribute column14{""},
          attribute column15{""},
          attribute column16{""},
          attribute column17{""},
          attribute column18{""},
          attribute column19{""},
                 
          for $subData in (distinct-values($oldXML//strdetail//column[3]))       
                      
          for $str in $oldXML//strdetail[string(column[2]) = string($xmlData) and string(column[3]) = string($subData)]
            return 
              element {xs:QName("strdata")} {
                attribute name {$str//entity},
                attribute subname{$str//column[3]},
                attribute measure {$str//column[1]},
                attribute code {""},
                
                attribute column1 {$str//column[4]},
                attribute column2 {$str//column[5]},
                attribute column3 {$str//column[6]},          
                attribute column4 {$str//column[7]},           
                attribute column5 {$str//column[8]},           
                attribute column6 {$str//column[9]},           
                attribute column7 {$str//column[10]},           
                attribute column8 {$str//column[11]},           
                attribute column9 {$str//column[12]},           
                attribute column10{$str//column[13]},           
                attribute column11{$str//column[14]},           
                attribute column12{$str//column[15]},           
                attribute column13{$str//column[16]},           
                attribute column14{$str//column[17]},           
                attribute column15{$str//column[18]},           
                attribute column16{$str//column[19]},           
                attribute column17{$str//column[20]},           
                attribute column18{$str//column[21]},           
                attribute column19{$str//column[22]}                                
              }
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

  
  
let $Preflatten := $data

let $newXML := for $item in $Preflatten
return <document version="1.0" created="create_xml_online"><flat>{$item}</flat></document>

let $outData := for $items in $newXML//flat//strdata
              return
              element {xs:QName    ("strdata") } {
                attribute name     {$items/@name},
                attribute subname  {$items/@subname},
                attribute measure  {$items/@measure},
                attribute code     {$items/@code},
                attribute column1  {$items/@column1},
                attribute column2  {$items/@column2},
                attribute column3  {$items/@column3},
                attribute column4  {$items/@column4},
                attribute column5  {$items/@column5},
                attribute column6  {$items/@column6},
                attribute column7  {$items/@column7},
                attribute column8  {$items/@column8},
                attribute column9  {$items/@column9},
                attribute column10 {$items/@column10},
                attribute column11 {$items/@column11},
                attribute column12 {$items/@column12},
                attribute column13 {$items/@column13},
                attribute column14 {$items/@column14},
                attribute column15 {$items/@column15},
                attribute column16 {$items/@column16},
                attribute column17 {$items/@column17},
                attribute column18 {$items/@column18},
                attribute column19 {$items/@column18}                
              } 
 
let $flatten := $parm
let $flatten := insert-before($flatten, 0, $flattenContactData)
let $flatten := insert-before($flatten, 0, $flattenServiceData)
let $flatten := insert-before($flatten, 0, $outData)


return <document version="1.0" created="create_xml_online"><flat>{$flatten}</flat></document>  
};
