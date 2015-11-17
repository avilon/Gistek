module namespace util="http://lanit.ru/gistek/xsltutil";
import module namespace fnx = "http://www.functx.com" at "functx.xq";
import module namespace file = "http://expath.org/ns/file";
(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.103 maket 24 - 10006 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10006($doc) { 
let $oldXML := $doc

(:Раздел 1. Поступление (прием) электрической энергии в электрические сети филиалов организации по управлению единой национальной (общероссийской) электрической сетью:)
let $data_tb1 := for $strData in $oldXML//strdata[number(@code)=100 or number(@code)=101 or number(@code)=1021 or number(@code)=1022 ]
count $count
  return (
    element {(xs:QName("strData1"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
      count $count2
        return element {(xs:QName("strData1"))} {
          attribute name {  $strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
  )    
  
(:Раздел 2. Отпуск электрической энергии из электрических сетей филиалов организации по управлению единой национальной (общероссийской) электрической сетью:)
let $data_tb2 := for $strData in $oldXML//strdata[number(@code)>=200 and number(@code)<300 or number(@code)>=2000 and number(@code)<3000 ]
count $count
  return (
    element {(xs:QName("strData2"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
      count $count2
        return element {(xs:QName("strData2"))} {
          attribute name {$strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
  )  
  
(:Раздел 3. Технологический расход электрической энергии в электрических сетях:)
let $data_tb3 := for $strData in $oldXML//strdata[number(@code)=300 ]
count $count
  return (
    element {(xs:QName("strData3"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
      count $count2
        return element {(xs:QName("strData3"))} {
          attribute name { $strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
  )    
     
(:Раздел 5. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=111 or number(@code)=112]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>120 and number(@code)<132]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0, $data_tb2)
let $tables := insert-before($tables, 0, $data_tb3)
let $tables := insert-before($tables, 0, $contact)
let $tables := insert-before($tables, 0, $service)

let $newXML := $tables

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

declare function util:pre10169($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strfree[number(@code) < 311 or number(@code) > 329]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.95 maket 1421 - 10438 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10183($doc) {     

let $oldXML:=$doc         

let $data := for $strCls in $oldXML//strdata[(number(@code) > 200) and (number(@code) < 300)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>  
}; 


(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.51 maket 1496 - 10492 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10184($doc) { 

  let $oldXML:=$doc

let $data := for $strCls in $oldXML//strdata[(number(@code) < 211 or number(@code) > 200)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 321 and number(@code) <= 329] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
}; 

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.139 maket 10 - 90004 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.148 maket 85 - 10185 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10185($doc) {
let $oldXML := $doc
let $data_01 := for $strCls in $oldXML//strdata[(number(@code) > 1000)  and (number(@code) < 3001)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML//strdata[((number(@code) >= 4000)  and (number(@code) < 8001)) or (number(@code)) = 2]              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 136] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_01)
let $flatten:= insert-before($flatten, 0, $data_02)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
declare function util:pre10188($doc) {

let $oldXML:=$doc 
 

let $data := for $strCls in $oldXML//strdata[number(@code) >= 1 or number(@code) <= 100]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=310 or number(@code)=320] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 321 and number(@code) <= 329] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
}; 

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.35 maket 1142 - 20075 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)
(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.165 maket 103 - 10216 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10216($doc) { 
let $oldXML := $doc

(:Раздел 1. Водно-энергетические показатели работы гидроэлектростанции (далее - ГЭС):)
let $data_tb1 := for $strData in $oldXML//strdata[number(@code)<1111]
  return (
    element {(xs:QName("strData1"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }          
  )

(:Раздел 3. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=1111 or number(@code)=1112]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>1112]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0, $contact)
let $tables := insert-before($tables, 0, $service)

let $newXML := $tables

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};
declare function util:pre10421($doc) {let $oldXML := $doc
                        
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=1
                                                                       and number(@code)<=71)
                                                                  ]/@name))
              return 
              element {xs:QName("block1")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

 let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=80
                                                                       and number(@code)<=92)
                                                                  ]/@name))
              return 
              element {xs:QName("block2")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              
 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=121
                                                                       and number(@code)<=126)
                                                                  ]/@name))
              return 
              element {xs:QName("block3")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
             
             
let $flattenPart5 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=111
                                                                       and number(@code)<=112)
                                                                  ]/@name))
              return 
              element {xs:QName("block5")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
                           
                          
let $flatten:= insert-before($flattenPart5,0,$flattenPart3)
let $flatten:= insert-before($flatten,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)


let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};

declare function util:pre10424($doc) {let $oldXML := $doc
  
  
 let $flattenPart11 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=1)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=100001 
                                                                       and number(@code)<=100026)
                                                                
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {"10000"},
                      attribute name {"Количество принятой электрической энергии из электроэнергетических систем иностранных государств в границах субъекта РФ по линиям электропередачи, итого"},
                           attribute unit {"тыс. кВт∙ч"},
                                    
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                                               
                ),
              
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                            (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          ),
                          attribute unit {"тыс. кВт∙ч"}
                     }
                          
                )
              }  
  let $flattenPart12 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=2)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=200001 
                                                                       and number(@code)<=200026)
                                                                
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                       attribute id {"20000"},
                      attribute name {"Количество отданной электрической энергии в электроэнергетические системы иностранных государств в границах субъекта РФ по линиям электропередачи, итого"},
                           attribute unit {"тыс. кВт∙ч"},
                         (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                     
                )
                      
                    )
                ),
              
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                            (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          ),
                            attribute unit {"тыс. кВт∙ч"}
                     }
                )
              }               
  let $flattenPart13 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=3)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=300001 
                                                                       and number(@code)<=300026)
                                                                
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                   attribute id {"30000"},
                      attribute name {"Сальдо перетоков электрической энергии между Единой энергетической системой России и электроэнергетическими системами иностранных государств"},
                           attribute unit {"тыс. кВт∙ч"},
                   
                         (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                    
                ),
              
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                            (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          ),
                            attribute unit {"тыс. кВт∙ч"}
                     }
                )
              }               
                    
 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=111
                                                                       and number(@code)<=132)
                                                                  ]/@code))
              return 
              element {xs:QName("block3")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }                          
  



let $flatten:= insert-before($flattenPart3,0,$flattenPart13)
let $flatten:= insert-before($flatten,0,$flattenPart12)
let $flatten:= insert-before($flatten,0,$flattenPart11)

let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10437($doc) {
  
let $oldXML := $doc
  
  
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=1)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=100001 
                                                                       and number(@code)<=100466)
                                                                
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {"1"},
                      attribute name {"Прием электроэнергии в сеть от сетей ТСО, всего"}
                    )
                ),
              
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                            (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
              }  
  let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=2)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=200001 
                                                                       and number(@code)<=200466)
                                                                
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                       attribute id {"2"},
                      attribute name {"Отдача электроэнергии из сетей в сети ТСО, всего"}
                    )
                ),
              
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                            (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
              }               
  let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=3)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=300001 
                                                                       and number(@code)<=300466)
                                                                
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                   attribute id {"3"},
                      attribute name {"Сальдированный переток электроэнергии с сетями ТСО, всего"}
                    )
                ),
              
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                            (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
              }               
                    
 let $flattenPart6 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=111
                                                                       and number(@code)<=132)
                                                                  ]/@code))
              return 
              element {xs:QName("block6")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }                          
  



let $flatten:= insert-before($flattenPart6,0,$flattenPart3)
let $flatten:= insert-before($flatten,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)

let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10438($doc) { 
let $oldXML := $doc

(:Раздел 1. Сведения о поставках электрической энергии (мощности) на экспорт и импорт помесячно до конца текущего года:)
let $data_tb1 := for $strData in $oldXML//strfree[number(@code)<111]
  return (
    element {(xs:QName("strData1"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column[number(@order)=1 or number(@order)=4]
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }          
  )

(:Раздел 3. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=111 or number(@code)=112]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>120]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0, $contact)
let $tables := insert-before($tables, 0, $service)
(:let $tables := insert-before($tables, 0, $contact)
let $tables := insert-before($tables, 0, $service)
:)
let $newXML := $tables
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.16 maket 1519 - 10506 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10444($doc) {
  let $oldXML := $doc

let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=1 
                                                                       and number(@code)<=3
                                                                     )]/@code),
                                      distinct-values($oldXML//strdetail[(	(number(@code)>=100001 
                                                                        and number(@code)<=100900)
                                                                        or (number(@code)>=200001 
                                                                        and number(@code)<=200900)
                                                                        or (number(@code)>=300001 
                                                                        and number(@code)<=300900)
                                                                     )]/@code))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),           
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]/entity                  
                  return
                    (attribute name {$str})
                ) ,                              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ) ,                              
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
  

let $flattenPart21 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=111 or number(@code)=112)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart22 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=121 and number(@code)<=132)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flatten:= insert-before($flattenPart22,0,$flattenPart21)
let $flatten:= insert-before($flatten,0,$flattenPart1) 

let $newXML:= for $item in $flatten return $item              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>             };

declare function util:pre10445($doc) {let $oldXML := $doc
let $rer:=$oldXML//document
let $flattenPart0 := element {xs:QName("str")} {attribute year {$rer}}
             
let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=1 
                                                                       and number(@code)<=10
                                                                       or number(@code)=100
                                                                       or number(@code)=21
                                                                       or number(@code)=51
                                                                       or number(@code)=52
                                                                       or number(@code)=110
                                                                       or number(@code)=120
                                                                     )]/@name))
              return 
              element {xs:QName("strdata1")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
  
let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=101 
                                                                       or number(@code)=102
                                                                       or number(@code)=103
                                                                       or number(@code)=201
                                                                       or number(@code)=211
                                                                       or number(@code)=212
                                                                     )]/@name))
              return 
              element {xs:QName("strdata2")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
                          
let $flattenPart21 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=111 or number(@code)=112)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart22 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=121 and number(@code)<=132)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flatten:= insert-before($flattenPart22,0,$flattenPart21)
let $flatten:= insert-before($flatten,0,$flattenPart2) 
let $flatten:= insert-before($flatten,0,$flattenPart1) 
let $flatten:= insert-before($flatten,0,$flattenPart0)

let $newXML:= for $item in $flatten return $item              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>             };
declare function util:pre10471($doc) {
  
let $oldXML := $doc
let $oldXML1:=$oldXML[number(@code) = 10471]/document
let $oldXML2:=$oldXML[number(@code) = 10472]/document
let $oldXML3:=$oldXML[number(@code) = 10473]/document
let $oldXML4:=$oldXML[number(@code) = 10474]/document
let $oldXML5:=$oldXML[number(@code) = 10475]/document
let $oldXML6:=$oldXML[number(@code) = 10476]/document
let $oldXML7:=$oldXML[number(@code) = 10477]/document
let $oldXML8:=$oldXML[number(@code) = 10478]/document
let $oldXML9:=$oldXML[number(@code) = 10479]/document
let $oldXML0:=$oldXML[number(@code) = 10480]/document                    
                        
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML1//strdata[(	number(@code)>=1
                                                                       and number(@code)<=10)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata1")} {
                (
                  for $str in $oldXML1//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML1//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$strCls}
                    )
                ),
                (
                  for $str in $oldXML1//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              
let $flattenPart2 :=  for $strCls in (distinct-values($oldXML2//strfree[(	number(@code)>=1
                                                                       and number(@code)<=10)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata2")} {
                (
                  for $str in $oldXML2//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                      attribute name {$strCls},
                (
                  for $str in $oldXML2//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML3//strfree[(	number(@code)>=1
                                                                       and number(@code)<=10)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                      attribute name {$strCls},
                (
                  for $str in $oldXML3//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }              
              
let $flattenPart4 :=  for $strCls in (distinct-values($oldXML4//strdata[(	number(@code)>=1
                                                                       and number(@code)<=10)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata4")} {
                (
                  for $str in $oldXML4//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                      attribute name {$strCls},
                (
                  for $str in $oldXML4//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }              
              
let $flattenPart5 :=  for $strCls in (distinct-values($oldXML5//strdata[(	number(@code)>=1
                                                                       and number(@code)<=10)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata5")} {
                (
                  for $str in $oldXML5//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                      attribute name {$strCls},
                (
                  for $str in $oldXML5//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }                    
              
let $flattenPart6 :=  for $strCls in (distinct-values($oldXML6//strdata[(	number(@code)>=1
                                                                       and number(@code)<=10)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata6")} {
                (
                  for $str in $oldXML6//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                      attribute name {$strCls},
                (
                  for $str in $oldXML6//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }                    
              
let $flattenPart7 :=  for $strCls in (distinct-values($oldXML7//strdata[(	number(@code)>=1
                                                                       and number(@code)<=10)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata7")} {
                (
                  for $str in $oldXML7//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                      attribute name {$strCls},
                (
                  for $str in $oldXML7//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }              
              
let $flattenPart8 :=  for $strCls in (distinct-values($oldXML8//strdata[(	number(@code)>=1
                                                                       and number(@code)<=10)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata8")} {
                (
                  for $str in $oldXML8//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                      attribute name {$strCls},
                (
                  for $str in $oldXML8//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              
let $flattenPart9 :=  for $strCls in (distinct-values($oldXML9//strdata[(	number(@code)>=1
                                                                       and number(@code)<=10)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata9")} {
                (
                  for $str in $oldXML9//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                      attribute name {$strCls},
                (
                  for $str in $oldXML9//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }              
              
let $flattenPart10 :=  for $strCls in (distinct-values($oldXML0//strdata[(	number(@code)>=1
                                                                       and number(@code)<=10)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10")} {
                (
                  for $str in $oldXML0//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                      attribute name {$strCls},
                (
                  for $str in $oldXML0//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }              
                            
              
let $flattenPart21 :=  for $strCls in (distinct-values($oldXML1//strfree[(	number(@code)=111)
                                                                  ]/@code))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML1//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML1//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart22 :=  for $strCls in (distinct-values($oldXML1//strfree[(	number(@code)>=121)
                                                                  ]/@code))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML1//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML1//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }  
             
               
let $flatten:= insert-before($flattenPart22,0,$flattenPart21)
let $flatten:= insert-before($flatten,0,$flattenPart10)  
let $flatten:= insert-before($flatten,0,$flattenPart9)  
let $flatten:= insert-before($flatten,0,$flattenPart8)              
let $flatten:= insert-before($flatten,0,$flattenPart7) 
let $flatten:= insert-before($flatten,0,$flattenPart6)  
let $flatten:= insert-before($flatten,0,$flattenPart5)              
let $flatten:= insert-before($flatten,0,$flattenPart4) 
let $flatten:= insert-before($flatten,0,$flattenPart3)  
let $flatten:= insert-before($flatten,0,$flattenPart2)              
let $flatten:= insert-before($flatten,0,$flattenPart1)  
           
let $newXML:= for $item in $flatten
              return $item              
              
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};

declare function util:pre10481($doc) {let $oldXML := $doc
                        
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=1
                                                                       and number(@code)<=20)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                      attribute name {$strCls},
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)=111)
                                                                  ]/@code))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),             
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)=112)
                                                                  ]/@code))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),          
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }  
                           
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)              
let $flatten:= insert-before($flatten,0,$flattenPart1)
              
let $newXML:= for $item in $flatten
              return $item              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};

declare function util:pre10482($doc) {
  
let $oldXML1 := $doc
let $oldXML :=$oldXML1[number(@code) = 10482]/document
let $oldXML2:=$oldXML1[number(@code) = 10483]/document
                        
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdetail[(	number(@code)>=100001
                                                                       and number(@code)<=100101)
                                                                  ]/@code))
              return 
              element {xs:QName("block1")} 
             
       {
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                    
                ),
                  
                   
                        
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                   for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
                
                
              }
  let $flattenPart2 :=  for $strCls in (distinct-values($oldXML2//strdetail[(	number(@code)>=200001
                                                                       and number(@code)<=200101)
                                                                  ]/@code))
              return 
              element {xs:QName("block2")} {
                (
                  for $str in $oldXML2//strdetail[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                     
                (
                  for $str in $oldXML2//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                  for $str in $oldXML2//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
                
              }             

 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=111
                                                                       and number(@code)<=132)
                                                                  ]/@name))
              return 
              element {xs:QName("block3")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              


                           
                          
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)



let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.83 maket 1503 - 10484 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)


declare function util:pre10485($doc) { 
let $oldXML := $doc 

(:Раздел 1. Водно-энергетические показатели работы гидроэлектростанции (далее - ГЭС):)
let $data_tb1 := for $strData in $oldXML//strdata[number(@code)<111 or number(@code)>140]
  return (
    element {(xs:QName("strData1"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column[number(@order)>1]
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
        return element {(xs:QName("strData1"))} {
          attribute name { $strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
  )  

(:Раздел 3. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=111 or number(@code)=112]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>120 and number(@code)<140]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0, $contact)
let $tables := insert-before($tables, 0, $service)

let $newXML := $tables

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

declare function util:pre10486($doc) { 
let $oldXML := $doc

(:Раздел 1. Сведения об объемах выведенного в ремонт и отремонтированного генерирующего оборудования электростанций ЕЭС России. Код по ОКЕИ: мегаватт- 215:)
let $data_tb1 := for $strData in $oldXML//strdata[number(@code)<40]
  return (
    element {(xs:QName("strData1"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }          
  )
  
(:Раздел 2. Сведения о ежемесячной динамике изменения ремонтной мощности АЭС ОАО «Концерн Росэнергоатом» в ______ году. Код по ОКЕИ: мегаватт- 215, процент - 744:)
let $data_tb2 := for $strData in $oldXML//strdata[number(@code)>=40 and number(@code)<60]
  return (
    element {(xs:QName("strData2"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column[number(@order) mod 2 = 1]
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }          
  )

(:Раздел 3. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=161 or number(@code)=162]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>170]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0, $data_tb2)
let $tables := insert-before($tables, 0, $contact)
let $tables := insert-before($tables, 0, $service)
(:let $tables := insert-before($tables, 0, $contact)
let $tables := insert-before($tables, 0, $service)
:)
let $newXML := $tables
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.33 maket 1488 - 10487 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10487($doc) { 
let $oldXML := $doc

(:Раздел 1. Сведения об объемах выведенного в ремонт и отремонтированного генерирующего оборудования электростанций ЕЭС России. Код по ОКЕИ: мегаватт- 215:)
let $data_tb1 := for $strData in $oldXML//strdata[number(@code)<140]
  return (
    element {(xs:QName("strData1"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }          
  )
  

(:Раздел 3. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=161 or number(@code)=162]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>170]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0, $contact)
let $tables := insert-before($tables, 0, $service)
(:let $tables := insert-before($tables, 0, $contact)
let $tables := insert-before($tables, 0, $service)
:)
let $newXML := $tables
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.39 maket 33 - 51329 ---------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10488($doc) {
  
 let $oldXML := $doc
  
 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=111
                                                                       and number(@code)<=132)
                                                                  ]/@name))
              return 
              element {xs:QName("block3")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }


          
                        
let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=100001 
                                                                       and number(@code)<=300900)
                                                          
                                                                  ]/@code))
              return 
              element {xs:QName("block1")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }


                           
                          

let $flatten:= insert-before($flattenPart3,0,$flattenPart1)



let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.92 maket 1492 - 10490 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10490($doc) { 
let $oldXML := $doc

(:Раздел 1. Структура расхода топлива, используемого электростанциями:)
let $data_tb1 := for $strData in $oldXML//strdata[number(@code)<111]
count $count
  return (
    element {(xs:QName("strData1"))} {
      attribute num {concat($count, '.')},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
      count $count2
        return element {(xs:QName("strData1"))} {
          attribute num { concat($count, '.', $count2)},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
  )      
     
(:Раздел 3. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=111 or number(@code)=112]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>120]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0, $contact)
let $tables := insert-before($tables, 0, $service)

let $newXML := $tables

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};
(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.93 maket 1494 - 10491 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10491($doc) { 
let $oldXML := $doc

(:Раздел 1. Структура расхода топлива, используемого электростанциями:)
let $data_tb1 := for $strData in $oldXML//strdata[number(@code)<111]
count $count
  return (
    element {(xs:QName("strData1"))} {
      attribute num {concat($count, '.')},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
      count $count2
        return element {(xs:QName("strData1"))} {
          attribute num { concat($count, '.', $count2)},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
  )      
     
(:Раздел 3. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=111 or number(@code)=112]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>120]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0, $contact)
let $tables := insert-before($tables, 0, $service)

let $newXML := $tables

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

declare function util:pre10492($doc) {     

let $oldXML:=$doc         

let $data_01 := for $strCls in $oldXML//strfree[number(@code) > 100 and number(@code) < 200]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_01") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML//strfree[number(@code) > 200 and number(@code) < 300]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_02") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=311 or number(@code)=312] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 421 and number(@code) <= 432] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
}; 

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.87 maket 1499 - 10495 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10493($doc) {let $oldXML := $doc

 let $flattenPart6 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=111
                                                                       and number(@code)<=133)
                                                                  ]/@name))
              return 
              element {xs:QName("block6")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }


          
                        
let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=1000001 
                                                                       and number(@code)<=1000999)
                                                          
                                                                  ]/@code))
              return 
              element {xs:QName("block1")} {
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

let $oldXML2:=fn:doc("1497_10494.xml")/*  
  

          
                        
let $flattenPart2 :=  for $strCls in (distinct-values($oldXML2//strdetail[
                                                                        (	number(@code)>=100001 
                                                                       and number(@code)<=100999)
                                                          
                                                                  ]/@code))
              return 
              element {xs:QName("block2")} {
                (
                  for $str in $oldXML2//strdetail[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML2//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

                           
                          
let $flatten:= insert-before($flattenPart6,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)



let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10495($doc) {     

let $oldXML:=$doc         

let $data := for $strCls in $oldXML//strfree[number(@code) > 100 and number(@code) < 300]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=311 or number(@code)=312] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 421 and number(@code) <= 432] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
}; 

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.86 maket 1513 - 10496 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10182($doc) { 
let $oldXML := $doc 

(:Раздел 1. Водно-энергетические показатели работы гидроэлектростанции (далее - ГЭС):)
let $data_tb1 := for $strData in $oldXML//strdata[number(@code)<111]
  let $name := for $a in tokenize($strData/@name, ',\sтыс. Гкал')
return $a
  count $count
  return (
    element {(xs:QName("strData1"))} {
      attribute num {$count},
      attribute name {$name},
      attribute unit {'тыс. Гкал'},
      attribute code {$strData/@code},
      (
        for $column in $strData/column[number(@order)]
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }          
  )

(:Раздел 3. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=111 or number(@code)=112]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>120 and number(@code)<140]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0, $contact)
let $tables := insert-before($tables, 0, $service)

let $newXML := $tables

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

declare function util:pre10499($doc) {let $oldXML := $doc  
  let $oldXML:=fn:doc("864000_10499.xml")/*  
  let $oldXML2:=fn:doc("864000_10498.xml")/*  
  
 (:-------------------------------10499-----------------------------------------------------------------------------:)                  
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=10
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:)            
         let $flattenPart_1_1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=11
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1.1")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)     
    let $flattenPart_1_2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=12
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1.2")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)   
   let $flattenPart_1_3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=13
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1.3")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart_1_5_detail :=  for $strCls in (
                                                                  distinct-values($oldXML//strdetail[
                                                                 (	number(@code)>=2100001 
                                                                and number(@code)<=2100026)]//entity/text()))
              return 
              element {xs:QName("strdata_1.5_detail")} {
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart_1_5_data :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=21
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1.5_data")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:) 
  let $flattenPart_1_6:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=22
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1.6")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_1_7:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=23
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1.7")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_2_0:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=30
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.0")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_2_1:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=31
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.1")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_2_2:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=32
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.2")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_2_3:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=33
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.3")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
   let $flattenPart_2_5_detail :=  for $strCls in (
                                                                  distinct-values($oldXML//strdetail[
                                                                 (	number(@code)>=4100001 
                                                                and number(@code)<=4100026)]//entity/text()))
              return 
              element {xs:QName("strdata_2.5_detail")} {
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart_2_5_data :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=41
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.5_data")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart_2_6:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=42
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.6")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_4:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=4
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_4")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_5:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=5
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_5")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
 
   let $flattenPart_2_7:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=43
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.7")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
 
let $flattenPart6 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=111
                                                                       or number(@code)=112)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart7 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=171
                                                                      and number(@code)<=181)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }  

(:-------------------------------------end 10499----------------------------------------------------------------------------:)



 (:-------------------------------10498-----------------------------------------------------------------------------:)                  
 let $flattenPart10498_1 :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=10
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_1")} {
                (
                  for $str in $oldXML2//strdasta[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:)            
     (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_1_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=1100001 
                                                                and number(@code)<=1100026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_1.1_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_1_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=11
                                                                    )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_1.1_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
    (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_2_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=1200001 
                                                                and number(@code)<=1200001)]//entity/text()))
              return 
              element {xs:QName("strdata10498_1.2_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_2_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=12
                                                                    )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_1.2_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_3_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=2100001 
                                                                and number(@code)<=2100026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_1.3_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_3_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=21
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_1.3_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
  (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_4_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=2200001 
                                                                and number(@code)<=2200026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_1.4_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_4_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=22
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_1.4_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:) 
 
  let $flattenPart10498_2_0:=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=30
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_2")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
 
 
  (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_1_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=3100001 
                                                                and number(@code)<=3100026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_2.1_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_1_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=31
                                                                    )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_2.1_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:) 
 
  (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_2_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=3200001 
                                                                and number(@code)<=3200026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_2.2_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_2_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=32
                                                                    )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_2.2_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:) 
 
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_3_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=4100001 
                                                                and number(@code)<=4100026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_2.3_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_3_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=41
                                                                    )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_2.3_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
  (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_4_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=4200001 
                                                                and number(@code)<=4200026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_2.4_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_4_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=42
                                                                    )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_2.4_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
  
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart10498_4:=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=4
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_4")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart10498_5:=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=5
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_5")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    

(:-----------------------------------------------------------------------------------------------------------------:)

let $flatten:=$flattenPart10498_5
let $flatten:= insert-before($flatten,0,$flattenPart10498_4)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_4_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_4_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_3_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_3_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_2_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_2_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_1_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_1_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_0)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_4_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_4_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_3_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_3_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_2_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_2_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_1_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_1_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1)

let $flatten:= insert-before($flatten,0,$flattenPart7)
let $flatten:= insert-before($flatten,0,$flattenPart6)
let $flatten:= insert-before($flatten,0,$flattenPart_5)
let $flatten:= insert-before($flatten,0,$flattenPart_4)
let $flatten:= insert-before($flatten,0,$flattenPart_2_7)
let $flatten:= insert-before($flatten,0,$flattenPart_2_6)
let $flatten:= insert-before($flatten,0,$flattenPart_2_5_detail)
let $flatten:= insert-before($flatten,0,$flattenPart_2_5_data)
let $flatten:= insert-before($flatten,0,$flattenPart_2_3)
let $flatten:= insert-before($flatten,0,$flattenPart_2_2)
let $flatten:= insert-before($flatten,0,$flattenPart_2_1)
let $flatten:= insert-before($flatten,0,$flattenPart_2_0)
let $flatten:= insert-before($flatten,0,$flattenPart_1_7)
let $flatten:= insert-before($flatten,0,$flattenPart_1_6)
let $flatten:= insert-before($flatten,0,$flattenPart_1_5_detail)
let $flatten:= insert-before($flatten,0,$flattenPart_1_5_data)
let $flatten:= insert-before($flatten,0,$flattenPart_1_3)
let $flatten:= insert-before($flatten,0,$flattenPart_1_2)
let $flatten:= insert-before($flatten,0,$flattenPart_1_1)
let $flatten:= insert-before($flatten,0,$flattenPart1)

let $newXML:= for $item in $flatten   
          
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};declare function util:pre10501($doc) {let $oldXML := $doc  
  let $oldXML:=fn:doc("2100_10501.xml")/*  
  
                        
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=1001
                                                                       and number(@code)<=1020)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)=111)
                                                                  ]/@code))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)=121)
                                                                  ]/@code))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }  
                           
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)


let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};declare function util:pre10502($doc) {let $oldXML := $doc
  
                        
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=1001
                                                                       and number(@code)<=1020)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)=111)
                                                                  ]/@code))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)=121)
                                                                  ]/@code))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }  
                           
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)


let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10503($doc) {let $oldXML := $doc
  
                        
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)>=1001
                                                                       and number(@code)<=1020)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)=111)
                                                                  ]/@code))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)=121)
                                                                  ]/@code))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }  
                           
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)


let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10504($doc) {let $oldXML := $doc
  
                        
 let $flattenPart0 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=1
                                                                       and number(@code)<=6
                                                                        or number(@code)=51
                                                                        or number(@code)=52)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strclass[(	number(@code)>=5200001
                                                                       and number(@code)<=5200006)
                                                                       or (	number(@code)>=5100001
                                                                       and number(@code)<=5100006)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strclass[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strclass[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {concat("       ",string($str/@name))}
                    )
                ),
                              
               
                (
                  for $str in $oldXML//strclass[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=111
                                                                       or number(@code)=112)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=121
                                                                      and number(@code)<=132)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }  
                           
let $flatten1:= insert-before($flattenPart1,0,$flattenPart0)
let $newXML1:= for $item in $flatten1
              order by $item/@id 
              return $item
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)              
let $flatten:= insert-before($flatten,0, $newXML1)
              
let $newXML:= for $item in $flatten
              return $item              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10505($doc) {let $oldXML := $doc
  
                        
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=100
                                                                       and number(@code)<=115)
                                                                  ]/@name))
              return 
              element {xs:QName("block1")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=211
                                                                       and number(@code)<=232)
                                                                  ]/@name))
              return 
              element {xs:QName("block3")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              

                          
let $flatten:= insert-before($flattenPart3,0,$flattenPart1)



let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10506($doc) { 
let $oldXML := $doc

(:Раздел 1. Полезный отпуск и стоимость электрической энергии, отпущенной на розничных рынках электрической энергии потребителям по видам деятельности:)
let $data_tb1 := for $strData in $oldXML//strdata[number(@code)>=10100 and number(@code)<30100]
  return (
    element {(xs:QName("strData1"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column[number(@order)<9]
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }          
  )
  
(:Раздел 1(2). Полезный отпуск и стоимость электрической энергии, отпущенной на розничных рынках электрической энергии потребителям по видам деятельности (продолжение):)
let $data_tb2 := for $strData in $oldXML//strdata[number(@code)>=10100 and number(@code)<30100]
  return (
    element {(xs:QName("strData2"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column[number(@order)>8]
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }          
  )
  
(:Раздел 2. Объем покупки и стоимость электрической энергии и мощности потребителя – участника оптового рынка электрической энергии и мощности (потребителя) для нужд собственного потребления по видам деятельности:)
let $data_tb3 := for $strData in $oldXML//strdata[number(@code)>=30100 and number(@code)<50010]
  return (
    element {(xs:QName("strData3"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }          
  )

(:Раздел 3. Расчеты на оптовом рынке электроэнергии и мощности:)
let $data_tb4 := for $strData in $oldXML//strdata[number(@code)>=50010 and number(@code)<50300]
  return (
    element {(xs:QName("strData4"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }          
  )
  
(:Раздел 4. Расчеты с организациями коммерческой и технологической инфраструктуры оптового и розничного рынка электрической энергии и мощности:)
let $data_tb5 := for $strData in $oldXML//strdata[number(@code)>50300 and number(@code)<60100]
  return (
    element {(xs:QName("strData5"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }          
  )

(:Раздел 8. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=310 or number(@code)=320]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>320 and number(@code)<330]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0, $data_tb2)
let $tables := insert-before($tables, 0, $data_tb3)
let $tables := insert-before($tables, 0, $data_tb4)
let $tables := insert-before($tables, 0, $data_tb5)
let $tables := insert-before($tables, 0, $contact)
let $tables := insert-before($tables, 0, $service)

let $newXML := $tables

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.98 maket 1522 - 10510 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10508($doc) {let $oldXML := $doc  
  let $oldXML:=fn:doc("370000_10508.xml")/*    
                                                                       
  let $flattenPart0 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=1000
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("str1000")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

 (:----------------------------------------------------------------------------------------------------------:)
let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=110100001 
                                                                       and number(@code)<=110100026)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str1101")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)              

let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=120100001 
                                                                       and number(@code)<=120100026)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str1201")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)              


let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=130100001 
                                                                       and number(@code)<=130100026)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str1301")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)              

let $flattenPart4 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=140100001 
                                                                       and number(@code)<=140100026)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str1401")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)              

let $flattenPart5 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=150100001 
                                                                       and number(@code)<=150100026)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str1501")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)              
  let $flattenPart6 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=2000
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("str2000")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

 (:----------------------------------------------------------------------------------------------------------:)

let $flattenPart7 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=210100001 
                                                                       and number(@code)<=210100026)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str2101")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)             

let $flattenPart8 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=220100001 
                                                                       and number(@code)<=220100026)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str2201")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)     

let $flattenPart9 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=230100001 
                                                                       and number(@code)<=230100026)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str2301")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)     
 
let $flattenPart10 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=240100001 
                                                                       and number(@code)<=240100026)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str2401")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)     

let $flattenPart11 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=250100001 
                                                                       and number(@code)<=250100026)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str2501")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)     
  let $flattenPart12 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=3000
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("str3000")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

 (:----------------------------------------------------------------------------------------------------------:)
 let $flattenPart13 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=111
                                                                       and number(@code)<=112)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              
let $flattenPart14 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=121
                                                                       and number(@code)<=132)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }              

(:----------------------------------------------------------------------------------------------------------:)                          
                           
 
let $flatten:=$flattenPart14
let $flatten:= insert-before($flatten,0,$flattenPart13)
let $flatten:= insert-before($flatten,0,$flattenPart12)
let $flatten:= insert-before($flatten,0,$flattenPart11)
let $flatten:= insert-before($flatten,0,$flattenPart10)
let $flatten:= insert-before($flatten,0,$flattenPart9)
let $flatten:= insert-before($flatten,0,$flattenPart8)
let $flatten:= insert-before($flatten,0,$flattenPart7)
let $flatten:= insert-before($flatten,0,$flattenPart6)
let $flatten:= insert-before($flatten,0,$flattenPart5)
let $flatten:= insert-before($flatten,0,$flattenPart4)
let $flatten:= insert-before($flatten,0,$flattenPart3)
let $flatten:= insert-before($flatten,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)
let $flatten:= insert-before($flatten,0,$flattenPart0)


let $newXML:= for $item in $flatten            
              return $item
 
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};declare function util:pre10510($doc) { 
let $oldXML := $doc

(:Раздел 1. Сведения о поставках электрической энергии (мощности) на экспорт и импорт помесячно до конца текущего года:)
let $data_tb1 := for $strData in $oldXML//strdata[number(@code)=10]
  return (
    element {(xs:QName("strData1"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/strclass
          let $num := number($column/@id)*10
          return (
            for $column2 in $column/column[number(@order)=1 or number(@order)=2]
              let $num := number($column/@id)*2 + number($column2/@order) - 2
              return attribute {xs:QName(concat("col", string($num)))}{$column2/text()}
          )
      )
    }          
  )

(:Раздел 2. Сведения о поставках электрической энергии (мощности) на экспорт и импорт помесячно на предстоящий год:)
let $data_tb2 := for $strData in $oldXML//strdata[number(@code)=20]
  return (
    element {(xs:QName("strData2"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/strclass
          let $num := number($column/@id)*10
          return (
            for $column2 in $column/column[number(@order)=1 or number(@order)=2]
              let $num := number($column/@id)*2 + number($column2/@order) - 2
              return attribute {xs:QName(concat("col", string($num)))}{$column2/text()}
          )
      )
    }          
  )
  
(:Раздел 3. Сведения о поставках электрической энергии(мощности) на экспорт и импорт на предстоящие три года:)
let $data_tb3 := (
  element {xs:QName('strData3')} {
    attribute code {"30"},
    attribute name {""}, (
      for $strData in $oldXML//strdata[number(@code)=30]
        let $num := 0
        return 
          for $col in $strData/column[number(@order)=1 or number(@order)=2]
            return attribute {xs:QName(concat("col", string($num + number($col/@order))))} {$col/text()},
      for $strData in $oldXML//strdata[number(@code)=31]
        let $num := 2
        return 
          for $col in $strData/column[number(@order)=1 or number(@order)=2]
            return attribute {xs:QName(concat("col", string($num + number($col/@order))))} {$col/text()},
      for $strData in $oldXML//strdata[number(@code)=32]
        let $num := 4
        return 
          for $col in $strData/column[number(@order)=1 or number(@order)=2]
            return attribute {xs:QName(concat("col", string($num + number($col/@order))))} {$col/text()},
      for $strData in $oldXML//strdata[number(@code)=33]
        let $num := 6
        return 
          for $col in $strData/column[number(@order)=1 or number(@order)=2]
            return attribute {xs:QName(concat("col", string($num + number($col/@order))))} {$col/text()}
    )
  }
)

(:Раздел 5. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=111 or number(@code)=112]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>120]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0, $data_tb2)
let $tables := insert-before($tables, 0, $data_tb3)
let $tables := insert-before($tables, 0, $contact)
let $tables := insert-before($tables, 0, $service)
(:let $tables := insert-before($tables, 0, $contact)
let $tables := insert-before($tables, 0, $service)
:)
let $newXML := $tables
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.33 maket 1488 - 10486 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10511($doc) {let $oldXML := $doc  
  let $oldXML:=fn:doc("357117_10511.xml")/*    
                                                                       
  let $flattenPart0 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=10
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("str10")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

(:----------------------------------------------------------------------------------------------------------:)
let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=1000001 
                                                                       and number(@code)<=1000201)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str10Childs")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)              
  let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=210
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("str210")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

 (:----------------------------------------------------------------------------------------------------------:)
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=21000001 
                                                                       and number(@code)<=21000201)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str210Childs")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)              
  let $flattenPart4 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=503
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("str503")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

 (:----------------------------------------------------------------------------------------------------------:)
let $flattenPart5 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=50300001 
                                                                       and number(@code)<=50300201)                                                         
                                                                  ]/@code))
              return 
              element {xs:QName("str503Childs")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }

(:----------------------------------------------------------------------------------------------------------:)              
  let $flattenPart6 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=500
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("str500")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 
(:----------------------------------------------------------------------------------------------------------:) 
 let $flattenPart7 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=501
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("str501")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              } 
(:----------------------------------------------------------------------------------------------------------:) 
 let $flattenPart8 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=502
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("str502")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              } 
 (:----------------------------------------------------------------------------------------------------------:) 
 let $flattenPart9 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=504
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("str504")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
 (:----------------------------------------------------------------------------------------------------------:)
 let $flattenPart10 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=611
                                                                       and number(@code)<=612)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              
let $flattenPart11 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=621
                                                                       and number(@code)<=633)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }              

(:----------------------------------------------------------------------------------------------------------:)                          
                           
 
let $flatten:=$flattenPart11
let $flatten:= insert-before($flatten,0,$flattenPart11)
let $flatten:= insert-before($flatten,0,$flattenPart10)
let $flatten:= insert-before($flatten,0,$flattenPart9)
let $flatten:= insert-before($flatten,0,$flattenPart8)
let $flatten:= insert-before($flatten,0,$flattenPart7)
let $flatten:= insert-before($flatten,0,$flattenPart6)
let $flatten:= insert-before($flatten,0,$flattenPart5)
let $flatten:= insert-before($flatten,0,$flattenPart4)
let $flatten:= insert-before($flatten,0,$flattenPart3)
let $flatten:= insert-before($flatten,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)
let $flatten:= insert-before($flatten,0,$flattenPart0)


let $newXML:= for $item in $flatten            
              return $item
 
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};declare function util:pre10512($doc) {let $oldXML := $doc

  
  
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=10
                                                                       and number(@code)<=20)
                                                                  ]/@code))
              return 
              element {xs:QName("block1")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code},
                      attribute name {$str/@name},
                         
                                    
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                                               
                )
              }  
      
  let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=40
                                                                       and number(@code)<=90)
                                                                  ]/@code))
              return 
              element {xs:QName("block2")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code},
                      attribute name {$str/@name},
                         
                                    
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                                               
                )
              }  
       
   let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=340
                                                                       and number(@code)<=390)
                                                                  ]/@code))
              return 
              element {xs:QName("block3")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code},
                      attribute name {$str/@name},
                         
                                    
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                                               
                )
              }   
                    
  let $flattenPart4_1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=410
                                                                       and number(@code)<=440)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=44000001 
                                                                       and number(@code)<=44000114)
                                                                  ]/@code))
              return 
              element {xs:QName("block4")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code},
                      attribute name {$str/@name},
                         
                                    
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                                               
                ),
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                        (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                          
                     }
                )
              }     
              
   let $flattenPart4_2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=450
                                                                       and number(@code)<=490)
                                                                  ]/@code))
              return 
              element {xs:QName("block4")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code},
                      attribute name {$str/@name},
                         
                                    
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                                               
                )
              }                                        
                    
 let $flattenPart6 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=111
                                                                       and number(@code)<=133)
                                                                  ]/@code))
              return 
              element {xs:QName("block6")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }                          
  



let $flatten:= insert-before($flattenPart6,0,$flattenPart4_2)
let $flatten:= insert-before($flatten,0,$flattenPart4_1)
let $flatten:= insert-before($flatten,0,$flattenPart3)
let $flatten:= insert-before($flatten,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)



let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10514($doc) {let $oldXML := $doc  
  let $oldXML:=fn:doc("3000_10514.xml")/*  
  
                   
let $flattenPart0 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=100
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("strSrabotka")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

                         

 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=110)
                                                                  ]/@name),
                                                                  distinct-values($oldXML//strdetail[
                                                                 (	number(@code)>=11000001 
                                                                and number(@code)<=11000300)]//entity/text()))
              return 
              element {xs:QName("strArchive")} {
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                (for $c in $oldXML//strdetail[column[2]/text() = $strCls]
                   return
                     element {xs:QName("child") }{   
                         attribute nameInd {$c/entity/text()},
                         (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                 )
              }

let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=10
                                                                       or number(@code)=11)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=121
                                                                      and number(@code)<=133)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }  


let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)
let $flatten:= insert-before($flatten,0,$flattenPart0)


let $newXML:= for $item in $flatten             
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.25 maket 1533 - 10516 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)
declare function util:pre10516($doc) { 
let $oldXML := $doc

(:Раздел 1. Структура расхода топлива, используемого электростанциями:)
let $data_tb1 := for $strData in $oldXML//strdata[number(@code)<111 or number(@code)>140]

let $full_name := $strData/@name
let $num := 
  (for $str in tokenize($full_name, '.\s')
    return $str)[position()=1]
let $name := replace($full_name, concat('.\s', $num), '')

  return (
    element {(xs:QName("strData1"))} {
      attribute num {$num},
      attribute name {$name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
        return element {(xs:QName("strData1"))} {
          attribute num { ''},
          attribute name { $strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
    
  )    
     
(:Раздел 3. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=111 or number(@code)=112]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>120 and number(@code)<140]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0, $contact)
let $tables := insert-before($tables, 0, $service)

let $newXML := $tables

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};
declare function util:pre10517($doc) {let $oldXML := $doc  
  let $oldXML:=fn:doc("310603_10517.xml")/*  
  
                   
                         

 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=10)
                                                                  ]/@name),
                                                                  distinct-values($oldXML//strdetail[
                                                                 (	number(@code)>=1000001 
                                                                and number(@code)<=1000999)]//entity/text()))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                (for $c in $oldXML//strdetail[column[2]/text() = $strCls]
                   return
                     element {xs:QName("child") }{   
                         attribute nameInd {$c/entity/text()},
                         (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                 )
              }

let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=111
                                                                       or number(@code)=112)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=121
                                                                      and number(@code)<=132)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }  

let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)


let $newXML:= for $item in $flatten
              order by $item/@id
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};declare function util:pre10519($doc) {let $oldXML := $doc
  
 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=10
                                                                       and number(@code)<=132)
                                                                  ]/@name))
              return 
              element {xs:QName("block3")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

 let $flattenPart12 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=500
                                                                       and number(@code)<=504)
                                                                  ]/@name))
              return 
              element {xs:QName("block12")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

          
                        
let $flattenPart11 :=  for $strCls in (distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=50300001 
                                                                       and number(@code)<=50300200)
                                                          
                                                                  ]/@name))
              return 
              element {xs:QName("block11")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
               
              }


             

                           
                          

let $flatten:= insert-before($flattenPart3,0,$flattenPart12)
let $flatten:= insert-before($flatten,0,$flattenPart11)


let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10524($doc) {let $oldXML := $doc
  
 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=10
                                                                       and number(@code)<=133)
                                                                  ]/@name))
              return 
              element {xs:QName("block3")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }


          
                        
let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdetail[
                                                                        (	number(@code)>=100001 
                                                                       and number(@code)<=100100)
                                                          
                                                                  ]/@code))
              return 
              element {xs:QName("block1")} {
                (
                  for $str in $oldXML//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
               
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
               
              }


                           
                          
let $flatten:= insert-before($flattenPart3,0,$flattenPart1)




let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10526($doc) {let $oldXML := $doc  
  let $oldXML:=fn:doc("738516_10526.xml")/*  
  
                        
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)>=1
                                                                       and number(@code)<=500)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)=511)
                                                                  ]/@code))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)=521)
                                                                  ]/@code))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }  
                           
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)


let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};declare function util:pre10527($doc) {let $oldXML := $doc
                        
 

 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)>=1
                                                                       and number(@code)<=500)
                                                                  ]/@code))
              return 
              element {xs:QName("strfree")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }




 let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)=511
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

              
 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strfree[(	number(@code)=521
                                                                       )
                                                                  ]/@code))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }    
                           
                           
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)              
let $flatten:= insert-before($flatten,0,$flattenPart1)
              
let $newXML:= for $item in $flatten
              return $item              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10529($doc) {let $oldXML := $doc
  
  
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdetail[(	number(@code)>=100001
                                                                       and number(@code)<=100100)
                                                                  ]/@code))
              return 
              element {xs:QName("block1")} {
              
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code},
                                     
                                    
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
                    )
                                               
                )
              }  
      
 
       
   let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=10
                                                                       and number(@code)<=133)
                                                                  ]/@code))
              return 
              element {xs:QName("block3")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code},
                      attribute name {$str/@name},
                         
                                    
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                                               
                )
              }   
                    




let $flatten:= insert-before($flattenPart3,0,$flattenPart1)



let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10536($doc) {     

let $oldXML:=$doc         

  let $data := for $strData in $oldXML//strdata[(number(@code) > 1 or number(@code) < 100) ]
  
  let $colData := $strData/column             
  let $cls := $strData/strdetail
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                    }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat(" - ", string($elm/@code), " - ")},
                attribute code {number ( $elm/@code ) - 100000 },
                attribute id {number ( $elm/@id )},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=133] (:Служебная информация:)
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
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.44 maket 84 - 10183 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10537($doc) {let $oldXML := $doc
  
                        
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=1
                                                                       and number(@code)<=18)
                                                                  ]/@code))
              return 
              element {xs:QName("block1")} {
              
                for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                   ,              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             
             
              }
              
 let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=21
                                                                       and number(@code)<=46)
                                                                  ]/@name))
              return 
              element {xs:QName("block2")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }              


 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdetail[(	number(@code)>=5000001
                                                                       and number(@code)<=5000999)
                                                                  ]/@code))
              return 
              element {xs:QName("block3")} {
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                     
                (
                  for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                    for $str in $oldXML//strdetail[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
              }
              
 let $flattenPart5 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=121
                                                                       and number(@code)<=133)
                                                                  ]/@name))
              return 
              element {xs:QName("block5")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
             

                       
                       
let $flatten:= insert-before($flattenPart5,0,$flattenPart3)
let $flatten:= insert-before($flatten,0,$flattenPart2)   
let $flatten:= insert-before($flatten,0,$flattenPart1)  


let $newXML:= for $item in $flatten
              return $item
           
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10577($doc) {let $oldXML := $doc
  
                        
 let $flattenPart0 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=100
                                                                       and number(@code)<=160)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata1")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              
let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=200
                                                                       and number(@code)<=260)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata2")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              
let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=301
                                                                       or number(@code)=302)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=321
                                                                      and number(@code)<=333)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }  
                           
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)              
let $flatten:= insert-before($flatten,0,$flattenPart0)
              
let $newXML:= for $item in $flatten
              return $item              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10584($doc) {let $oldXML := $doc
                        
 

 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=10
                                                                       and number(@code)<=40)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }




let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=111
                                                                       and number(@code)<=112)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=121
                                                                       and number(@code)<=133)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }              
                           
                           
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)              
let $flatten:= insert-before($flatten,0,$flattenPart1)
              
let $newXML:= for $item in $flatten
              return $item              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre10587($doc) {let $oldXML := $doc
                        
 

 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=1
                                                                       and number(@code)<=16)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }




let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=111
                                                                       and number(@code)<=112)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=121
                                                                       and number(@code)<=133)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }              
                           
                           
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)              
let $flatten:= insert-before($flatten,0,$flattenPart1)
              
let $newXML:= for $item in $flatten
              return $item              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre20001($doc) {
  let $oldXML:=$doc

  let $flattenData:=for $strCls in $oldXML//strclass
                let $columns:=$strCls/column
                return
                element {xs:QName("strdata") }{
                  attribute name {$strCls/../@name},
                  attribute colVdet {$strCls/@name},
                  (for $c in $columns
                   return
                  attribute {xs:QName(concat("col",string($c/@order)))}{
                    $c/text()
                  })
               }
              


  let $flattenContactData:=
                for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
                for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
                let $columns:=$strCls/column
                return
                element {xs:QName("strServiceInf") }{
                  attribute name {$strCls/@name},
                  attribute code {$strCls/@code},
                  (for $c in $columns
                   return
                   attribute {xs:QName(concat("col",string($c/@order)))}{
                        $c/text()
                      }
                  )
                }

  let $columnNames:=distinct-values($oldXML//column/@order)

  let $flatten:= insert-before($flattenData, 0, $flattenContactData)
  let $flatten:= insert-before($flatten, 0, $flattenServiceData)

  let $newXML := for $item in $flatten
                order by $item/@colVdet, $item/@code
                return $item

  return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

declare function util:pre20002($doc) {
let $oldXML := $doc  

let $flattenData:=for $strCls in $oldXML//strdata[number(@code)=1]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }
              
let $flattenClass:=for $strCls in $oldXML//strclass
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }
              
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenContactData,0,$flattenServiceData)
let $flatten:= insert-before($flatten,0,$flattenClass )
let $flatten:= insert-before($flatten,0,$flattenData)

let $newXML:=$flatten               

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.150 maket 1005 - 20043 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20004($doc) {
let $oldXML := $doc  

let $flattenData:=for $strCls in $oldXML//strdata[number(@code)<111]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }
              
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenData,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)
let $newXML:=$flatten               

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.5 maket 1010 - 20005 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20005($doc) {
let $oldXML := $doc  

let $flattenData:=for $strCls in $oldXML//strdata[number(@code)<111]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }
              
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenData,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)
let $newXML:=$flatten               

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.5 maket 1010 - 20042 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20006($doc) {let $oldXML := $doc

let $flattenData1:=for $strCls in $oldXML//strfree[number(@code)<=125]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata1") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }
              
let $flattenData2:=for $strCls in $oldXML//strfree[number(@code)>=201 and number(@code)<=225]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata2") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenData3:= element {xs:QName("techInf") }{
                attribute year {$oldXML/@year},
                attribute month {$oldXML/@month},
                attribute day {$oldXML/@day},
                attribute subject_name {$oldXML/@subject_name},
                attribute subject_variant_name {$oldXML/@subject_variant_name}
              }
              
              
              
let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=311] (:Контактная информация:)
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
              for $strCls in $oldXML//strfree[number(@code)=321] (:Служебная информация:)
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenServiceData,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenData3)

let $flatten:= insert-before($flatten,0,$flattenData2)
let $flatten:= insert-before($flatten,0,$flattenData1)
let $newXML:=$flatten               

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };

declare function util:pre20008($doc) {
let $oldXML := $doc

let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20009($doc) {let $oldXML := $doc


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 1299980 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20010($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - 100000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.153 maket 1095 - 20024	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20012($doc) {
let $oldXML := $doc  

  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - 99990 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.64 maket 1115 - 20049	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20014($doc) {let $oldXML := $doc


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20015($doc) {
let $oldXML := $doc  

let $flattenData:=for $strCls in $oldXML//strdata[number(@code) <= 100]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return 
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
                            
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML//strdata[number(@code)=121]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
              
              

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenData,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= for $item in $flatten
              order by $item/@code
              return $item
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.137 maket 1110 - 20050 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20016($doc) {
let $oldXML := $doc  

let $flattenPart1:=for $strCls in $oldXML//strfree[number(@code)<=100]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdataPart1") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              


              
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= $flattenPart1
let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= $flatten
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.9 maket 1009 - 20004 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20017($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20018($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.115 maket 1098 - 20031	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20019($doc) {
let $oldXML := $doc  

let $flattenData:=for $strCls in $oldXML//strfree[number(@code) <= 100]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return 
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
                            
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML//strfree[number(@code)=121]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
              
              

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenData,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= for $item in $flatten
              order by $item/@code
              return $item
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.87 maket 1087 - 20016 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20020($doc) {let $oldXML := $doc


  let $data_1 := for $strData in $oldXML//strdata[number(@code) = 1]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_1") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_1")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
  let $data_2 := for $strData in $oldXML//strdata[number(@code) = 1]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_2") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_2")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data_2, 0, $data_1)
let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20024($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strfree[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.29 maket 1082 - 20012	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20025($doc) {
let $oldXML := $doc
let $flattenData1:=for $strCls in $oldXML//strfree[number(@code)<=100]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata1") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }
              
let $flattenData2:=for $strCls in $oldXML//strfree[number(@code)>=200 and number(@code)<=300]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata2") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenData3:= element {xs:QName("techInf") }{
                attribute year {$oldXML/@year},
                attribute month {$oldXML/@month},
                attribute day {$oldXML/@day},
                attribute subject_name {$oldXML/@subject_name},
                attribute subject_variant_name {$oldXML/@subject_variant_name}
              }
              
              
              
let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=1111] (:Контактная информация:)
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
              for $strCls in $oldXML//strfree[number(@code)=1121] (:Служебная информация:)
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenServiceData,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenData3)

let $flatten:= insert-before($flatten,0,$flattenData2)
let $flatten:= insert-before($flatten,0,$flattenData1)
let $newXML:=$flatten               

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };

declare function util:pre20027($doc) {
let $oldXML := $doc
let $oldXML_01:=$oldXML[number(@code) = 20027]/document
let $oldXML_02:=$oldXML[number(@code) = 20028]/document


  let $data_01 := for $strData in $oldXML_01//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_01") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_01")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - 100000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML_01//strdata[number(@code)=111 or number(@code)=112] (:Контактная информация:)
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
              for $strCls in $oldXML_01//strdata[number(@code)>=121 and number(@code)<=132] (:Служебная информация:)
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
  let $columnNames:=distinct-values($oldXML_01//column/@order)

  let $data_02 := for $strData in $oldXML_02//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_02") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_02")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - 10000000) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      

let $flatten:= insert-before($data_01, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20029($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strdata[number(@code) < 211 or number(@code) > 329]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=211 or number(@code)=212] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 321 and number(@code) <= 329] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.124 maket 1114 - 20055	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20030($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code/100000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.15 maket 1080 - 20010	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20031($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.123 maket 1096 - 20029	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20032($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };

declare function util:pre20034($doc) {let $oldXML := $doc
let $oldXML_01 := fn:doc("20034\\1100_20033.xml")/* 
let $oldXML_02 := fn:doc("20034\\1100_20034.xml")/* 

  let $data_01 := for $strData in $oldXML_01//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_01") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_01")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
  let $data_02 := for $strData in $oldXML_02//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_02") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_02")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
         
let $flattenContactData:=
              for $strCls in $oldXML_01//strdata[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML_01//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML_01//column/@order)

let $flatten:= insert-before($data_02, 0, $data_01)
let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};declare function util:pre20035($doc) {
let $oldXML := $doc  

let $flattenData:=for $strCls in $oldXML//strdata[number(@code)=1]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }
              
let $flattenClass:=for $strCls in $oldXML//strclass
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }
              
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenContactData,0,$flattenServiceData)
let $flatten:= insert-before($flatten,0,$flattenClass )
let $flatten:= insert-before($flatten,0,$flattenData)

let $newXML:=$flatten               

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 2.7 maket 1105 - 40006	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20037($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strfree[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20040($doc) {
let $oldXML := $doc  

let $flattenData:=for $strCls in $oldXML//strfree[number(@code) <= 100 and string-length(column[1]/text()) > 0]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return 
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
                            
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML//strfree[number(@code)=121]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
              
              

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenData,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= for $item in $flatten
              order by $item/@code
              return $item
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.75 maket 1089 - 20019 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20042($doc) {
let $oldXML := $doc  

let $flattenData:=for $strCls in $oldXML//strdata[number(@code)<111]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }
              
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenData,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)
let $newXML:=$flatten               

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.150 maket 1005 - 20002 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20043($doc) {
let $oldXML := $doc  

let $flattenData:=for $strCls in $oldXML//strdata[number(@code)=1]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }
              
let $flattenClass:=for $strCls in $oldXML//strclass
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }
              
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenContactData,0,$flattenServiceData)
let $flatten:= insert-before($flatten,0,$flattenClass )
let $flatten:= insert-before($flatten,0,$flattenData)

let $newXML:=$flatten               

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.97 maket 1101 - 20035 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20047($doc) {let $oldXML := $doc


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20048($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - 100000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.6 maket 1029 - 30011 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20049($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.65 maket 1109 - 20048	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20050($doc) {
let $oldXML := $doc  

let $flattenPart1:=for $strCls in $oldXML//strfree[number(@code)<=100]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdataPart1") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                  if ($c/text()!="")
                then attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                 else "" 
                )
              }
              
let $flattenPart2:=for $strCls in $oldXML//strfree[number(@code)>200 and number(@code)<=300]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdataPart2") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                  if ($c/text()!="")
                then attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                 else "" 
                )
              }
              
let $flattenPart3:=for $strCls in $oldXML//strfree[number(@code)>300 and number(@code)<=400]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdataPart3") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                  if ($c/text()!="")
                then attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                 else "" 
                )
              }

              
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] (:Контактная информация:)
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
              for $strCls in $oldXML//strfree[number(@code)>=121 and number(@code)<=132] (:Служебная информация:)
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)
let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= $flatten
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.145 maket 1005 - 20040 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20054($doc) {let $oldXML := $doc


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - 100000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20055($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.129 maket 1097 - 20030	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20060($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };
declare function util:pre20071($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strfree[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20075($doc) {

let $oldXML:=$doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) >= 1 and number(@code) < 111) or (number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 129] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
}; 

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.37 maket 1302 - 20131 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20077($doc) {let $oldXML := $doc


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20078($doc) {let $oldXML := $doc


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20080($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20081($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20082($doc) {let $oldXML := $doc


let $data_1 := for $strCls in $oldXML//strfree[number(@code) < 111]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree_1") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_2 := for $strCls in $oldXML//strfree[number(@code) > 200]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree_2") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_1)
let $flatten:= insert-before($flatten, 0, $data_2)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20083($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strfree[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20084($doc) {let $oldXML := $doc


let $data_1 := for $strCls in $oldXML//strfree[number(@code) < 111]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree_1") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_2 := for $strCls in $oldXML//strfree[number(@code) > 200]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree_2") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_1)
let $flatten:= insert-before($flatten, 0, $data_2)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20095($doc) {let $oldXML := $doc


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20096($doc) {let $oldXML := $doc
let $oldXML_1:=fn:doc("20096\\1159_20095.xml")/* 
let $oldXML_2:=fn:doc("20096\\1159_20096.xml")/* 


let $data_1 := for $strCls in $oldXML_1//strfree[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree_1") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_2 := for $strCls in $oldXML_2//strfree[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree_2") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML_1//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML_1//strfree[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML_1//column/@order)

let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_1)
let $flatten:= insert-before($flatten, 0, $data_2)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20102($doc) {let $oldXML := $doc


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20108($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strfree[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20109($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20110($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20114($doc) {let $oldXML := $doc


  let $data_1 := for $strData in $oldXML//strdata[number(@code) = 1]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_1") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_1")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
  let $data_2 := for $strData in $oldXML//strdata[number(@code) = 1]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_2") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_2")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data_2, 0, $data_1)
let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20117($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20120($doc) {let $oldXML := $doc


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20131($doc) { 
let $oldXML:=$doc
let $data_01:=for $strCls in $oldXML//strfree[(number(@code)>=1 and number(@code)<=50)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_01") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $data_02:=for $strCls in $oldXML//strfree[(number(@code)>=51 and number(@code)<=200)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_02") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }


let $data_03:=for $strCls in $oldXML//strfree[(number(@code)>=201 and number(@code)<=250)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_03") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

              
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=311] 
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
              for $strCls in $oldXML//strfree[number(@code)=321] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= $data_03
let $flatten:= insert-before($flatten,0,$data_02)
let $flatten:= insert-before($flatten,0,$data_01)

let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= $flatten
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
}; 

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.18 maket 1448 - 20179 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20132($doc) {let $oldXML := $doc

let $data_01:=for $strCls in $oldXML//strfree[(number(@code)>=1 and number(@code)<=100)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_01") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $data_02:=for $strCls in $oldXML//strfree[(number(@code)>=101 and number(@code)<=200)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_02") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }


              
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=211] 
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
              for $strCls in $oldXML//strfree[number(@code)=221] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= $data_02
let $flatten:= insert-before($flatten,0,$data_01)

let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= $flatten
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre20135($doc) {
  
let $oldXML := $doc
let $oldXML1 :=$oldXML[number(@code) = 20135]/document
let $oldXML2 :=$oldXML[number(@code) = 20136]/document
let $oldXML3 :=$oldXML[number(@code) = 20137]/document

  
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML1//strfree[(	number(@code)>=1
                                                                       and number(@code)<=50)
                                                                  ]/@code))
              return 
              element {xs:QName("block1")} {
              
                (
                              
                  for $str in $oldXML1//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {if (string-length($str/@code)=1) then (concat("00",$str/@code)) else (concat("0",$str/@code))}, 
                  
                     
                    
                                    
                (
                  for $str in $oldXML1//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                  for $str in $oldXML1//strfree[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
                    )
                                                
                )
              }  
      
 
  let $flattenPart2 :=  for $strCls in (distinct-values($oldXML1//strfree[(	number(@code)>=101
                                                                       and number(@code)<=150)
                                                                  ]/@code))
              return 
              element {xs:QName("block2")} {
              
                (
                  for $str in $oldXML1//strfree[string(@code) = $strCls]                  
                  return
                    (
                       attribute id {concat("00",(($str/@code)-100))}, 
                                     
                                    
                (
                  for $str in $oldXML1//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                  for $str in $oldXML1//strfree[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
                    )
                                               
                )
              }  
            
  
  let $flattenPart3 :=  for $strCls in (distinct-values($oldXML1//strfree[(	number(@code)>=201
                                                                       and number(@code)<=250)
                                                                  ]/@code))
              return 
              element {xs:QName("block3")} {
              
                (
                  for $str in $oldXML1//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {concat("00",(($str/@code)-200))}, 
                                     
                                    
                (
                  for $str in $oldXML1//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                  for $str in $oldXML1//strfree[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
                    )
                                               
                )
              }  
              
 let $flattenPart21 :=  for $strCls in (distinct-values($oldXML2//strfree[(	number(@code)>=301
                                                                       and number(@code)<=350)
                                                                  ]/@code))
              return 
              element {xs:QName("block4")} {
              
                (
                  for $str in $oldXML2//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {concat("00",(($str/@code)-300))}, 
                                     
                                    
                (
                  for $str in $oldXML2//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                  for $str in $oldXML2//strfree[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
                    )
                                               
                )
              }  
      
 
  let $flattenPart22 :=  for $strCls in (distinct-values($oldXML2//strfree[(	number(@code)>=401
                                                                       and number(@code)<=450)
                                                                  ]/@code))
              return 
              element {xs:QName("block5")} {
              
                (
                  for $str in $oldXML2//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {concat("00",(($str/@code)-400))}, 
                                     
                                    
                (
                  for $str in $oldXML2//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                  for $str in $oldXML2//strfree[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
                    )
                                               
                )
              }  
            
  
  let $flattenPart23 :=  for $strCls in (distinct-values($oldXML2//strfree[(	number(@code)>=501
                                                                       and number(@code)<=550)
                                                                  ]/@code))
              return 
              element {xs:QName("block6")} {
              
                (
                  for $str in $oldXML2//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {concat("00",(($str/@code)-500))}, 
                                     
                                    
                (
                  for $str in $oldXML2//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                  for $str in $oldXML2//strfree[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
                    )
                                               
                )
              }  
              
              
    let $flattenPart31 :=  for $strCls in (distinct-values($oldXML3//strfree[(	number(@code)>=601
                                                                       and number(@code)<=650)
                                                                  ]/@code))
              return 
              element {xs:QName("block7")} {
              
                (
                  for $str in $oldXML3//strfree[string(@code) = $strCls]                  
                  return
                    (
                       attribute id {concat("00",(($str/@code)-600))}, 
                                     
                                    
                (
                  for $str in $oldXML3//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                  for $str in $oldXML3//strfree[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
                    )
                                               
                )
              }    
              
    let $flattenPart32 :=  for $strCls in (distinct-values($oldXML3//strfree[(	number(@code)>=701
                                                                       and number(@code)<=750)
                                                                  ]/@code))
              return 
              element {xs:QName("block7_2")} {
              
                (
                  for $str in $oldXML3//strfree[string(@code) = $strCls]                  
                  return
                    (
                       attribute id {concat("00",(($str/@code)-700))}, 
                                     
                                    
                (
                  for $str in $oldXML3//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                  for $str in $oldXML3//strfree[string(@code) = $strCls]
                  let $columns:=$str/entity
                  return
                    (for $c in $columns
                      return
                  
                       attribute {xs:QName("entity")}{
                            $c/text()
                          }
                     )
                    )
                                               
                )
              }                    
              
  let $flattenPart8 :=  for $strCls in (distinct-values($oldXML1//strfree[(	number(@code)>=1111
                                                                       and number(@code)<=1121)
                                                                  ]/@code))
              return 
              element {xs:QName("block8")} {
              
                (
                  for $str in $oldXML1//strfree[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code},
                                     
                                    
                (
                  for $str in $oldXML1//strfree[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                  
                    )
                                               
                )
              }                           
                          
            
 

let $flatten:= insert-before($flattenPart8,0,$flattenPart32)
let $flatten:= insert-before($flatten,0,$flattenPart31)
let $flatten:= insert-before($flatten,0,$flattenPart23)
let $flatten:= insert-before($flatten,0,$flattenPart22)
let $flatten:= insert-before($flatten,0,$flattenPart21)
let $flatten:= insert-before($flatten,0,$flattenPart3)
let $flatten:= insert-before($flatten,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)

let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre20140($doc) {let $oldXML := $doc


  let $data_01 := for $strData in $oldXML//strdata[number(@code) = 1]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_01") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_01")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
  let $data_02 := for $strData in $oldXML//strdata[number(@code) = 2]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_02") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_02")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data_02, 0, $data_01)
let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre20141($doc) {let $oldXML := $doc


  let $data_01 := for $strData in $oldXML//strdata[number(@code) = 1]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_01") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_01")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
  let $data_02 := for $strData in $oldXML//strdata[number(@code) = 2]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_02") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_02")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data_02, 0, $data_01)
let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };

declare function util:pre20171($doc) {
 
let $oldXML := $doc  

let $parm := for $prm in $oldXML
  return (
       element { xs:QName("param") } {
       attribute name {"params"},  
       attribute version {$prm/@version},
       attribute year {$prm/@year},
       attribute month {$prm/@month},
       attribute day {$prm/@day},       
       attribute subject {$prm/@subject_variant_name}
     }
  ) 

  let $data_01 := for $strData in $oldXML//strdata[number(@code) =1]
  
  let $colData := $strData/column             
  let $cls := $strData/strdetail
  
  return (
        element { xs:QName("strdata_01") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                    }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_01")} {
                attribute name {concat("- ", string($elm/@code))},
                attribute code {number ( $elm/@code ) - 100000 },
                attribute id {number ( $elm/@id )},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
  let $data_02 := for $strData in $oldXML//strdata[number(@code) =2]
  let $colData := $strData/column             
  let $cls := $strData/strdetail
  
  return (
        element { xs:QName("strdata_02") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                    }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_02")} {
                attribute name {concat(" - ", string($elm/@code))},
                attribute code {number ( $elm/@code ) - 200000 },
                attribute id {number ( $elm/@id )},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      

  let $data_03 := for $strData in $oldXML//strdata[number(@code) =3]
  let $colData := $strData/column             
  let $cls := $strData/strdetail
  
  return (
        element { xs:QName("strdata_03") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                    }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_03")} {
                attribute name {concat(" - ", string($elm/@code))},
                attribute code {number ( $elm/@code ) - 300000 },
                attribute id {number ( $elm/@id )},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      

  let $data_04 := for $strData in $oldXML//strdata[number(@code) =4]
  let $colData := $strData/column             
  let $cls := $strData/strdetail
  
  return (
        element { xs:QName("strdata_04") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                    }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_04")} {
                attribute name {concat(" - ", string($elm/@code))},
                attribute code {number ( $elm/@code ) - 400000 },
                attribute id {number ( $elm/@id )},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      

  let $data_05 := for $strData in $oldXML//strdata[number(@code) = 5]
  let $colData := $strData/column             
  let $cls := $strData/strdetail
  
  return (
        element { xs:QName("strdata_05") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                    }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_05")} {
                attribute name {concat(" - ", string($elm/@code))},
                attribute code {number ( $elm/@code ) - 500000 },
                attribute id {number ( $elm/@id )},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
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
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data_01, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_04)
let $flatten:= insert-before($flatten, 0, $data_05)
let $flatten:= insert-before($flatten, 0, $parm)
let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

declare function util:pre20175($doc) { 

let $oldXML := $doc
let $oldXML_01:=$oldXML[number(@code) = 20175]/document
let $oldXML_02:=$oldXML[number(@code) = 20176]/document


let $data_01 := for $strCls in $oldXML_01//strdata[(number(@code) <= 30)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML_02//strfree[number(@code) >= 1 and number(@code) <= 10]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_02") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 

let $data_03 := for $strCls in $oldXML_02//strfree[number(@code) >= 11 and number(@code) <= 20]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_03") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 

let $data_04 := for $strCls in $oldXML_02//strfree[number(@code) >= 21 and number(@code) <= 50]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_04") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_05 := for $strCls in $oldXML_02//strfree[number(@code) >= 51 and number(@code) <= 150]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_05") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_06 := for $strCls in $oldXML_02//strfree[number(@code) >= 151 and number(@code) <= 160]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_06") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_07 := for $strCls in $oldXML_02//strfree[number(@code) = 170 ]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_07") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_08 := for $strCls in $oldXML_02//strfree[number(@code) >= 200 and number(@code) <= 300]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_08") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_09 := for $strCls in $oldXML_02//strfree[number(@code) >= 301 and number(@code) <= 400]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_09") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               
              
let $flattenContactData:=
              for $strCls in $oldXML_01//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML_01//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML_01//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_09)
let $flatten:= insert-before($flatten, 0, $data_08)
let $flatten:= insert-before($flatten, 0, $data_07)
let $flatten:= insert-before($flatten, 0, $data_06)
let $flatten:= insert-before($flatten, 0, $data_05)
let $flatten:= insert-before($flatten, 0, $data_04)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML := for $item in $flatten
              return $item
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.1 maket 1453 - 20176 ---------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20176($doc) { 
let $oldXML := $doc
let $oldXML_01 := $doc
let $oldXML_02 := $doc

let $data_01 := for $strCls in $oldXML_01//strdata[(number(@code) <= 30)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML_02//strfree[number(@code) >= 1 and number(@code) <= 10]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_02") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 

let $data_03 := for $strCls in $oldXML_02//strfree[number(@code) >= 11 and number(@code) <= 20]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_03") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 

let $data_04 := for $strCls in $oldXML_02//strfree[number(@code) >= 21 and number(@code) <= 50]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_04") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_05 := for $strCls in $oldXML_02//strfree[number(@code) >= 51 and number(@code) <= 150]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_05") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_06 := for $strCls in $oldXML_02//strfree[number(@code) >= 151 and number(@code) <= 160]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_06") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_07 := for $strCls in $oldXML_02//strfree[number(@code) = 170 ]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_07") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_08 := for $strCls in $oldXML_02//strfree[number(@code) >= 200 and number(@code) <= 300]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_08") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_09 := for $strCls in $oldXML_02//strfree[number(@code) >= 301 and number(@code) <= 400]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_09") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               
              
let $flattenContactData:=
              for $strCls in $oldXML_01//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML_01//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML_01//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_09)
let $flatten:= insert-before($flatten, 0, $data_08)
let $flatten:= insert-before($flatten, 0, $data_07)
let $flatten:= insert-before($flatten, 0, $data_06)
let $flatten:= insert-before($flatten, 0, $data_05)
let $flatten:= insert-before($flatten, 0, $data_04)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML := for $item in $flatten
              return $item
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
}; 

(: ------------------------------------------------------------------------------ :)
(: --------------------- 2.43 maket 1325 - 40021 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20179($doc) { 

let $oldXML:=$doc 

let $data_01:=for $strCls in $oldXML//strfree[(number(@code)>=1 and number(@code)<=100)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_01") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $data_02:=for $strCls in $oldXML//strfree[(number(@code)>=101 and number(@code)<=200)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_02") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }


              
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=211] 
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
              for $strCls in $oldXML//strfree[number(@code)=221] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= $data_02
let $flatten:= insert-before($flatten,0,$data_01)

let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= $flatten
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
}; 

(: =================================== 26.20.2015 Bykov A ======================================= :)

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.26 maket 1545 - 10536 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30001($doc) {
	let $oldXML:=$doc
let $strCls := $oldXML//strdata[1]
let $columns:=$strCls/column
let $flattenData:= element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              } 

let $columnNames:=distinct-values($oldXML//column/@order)
               
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:= for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=129]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
              
              

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenData,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= for $item in $flatten
              order by $item/@code
              return $item
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};


declare function util:pre30003($doc) { 

  let $oldXML := $doc  
  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.14 maket 1035 - 30016 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30004($doc) { 

  let $oldXML := $doc  


let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName(concat("strdata", string($strCls/@code))) } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.18 maket 1071 - 30048 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30006($doc) {
  let $oldXML:=$doc

let $data := for $strCls in $oldXML//strdata[number(@code)<111]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute ord {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }
              

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)


let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};


declare function util:pre30007($doc) { 

  let $oldXML := $doc  


let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName(concat("strdata", string($strCls/@code))) } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.24 maket 1038 - 30020 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30009($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.20 maket 1032 - 30017 -------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30010($doc) {

  let $oldXML := $doc  
 

  let $data := for $strData in $oldXML//strdata[number(@code) < 40]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
   
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( 10 + number($strData/@code)*10 + $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
        
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
  return $item
        
                                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.58 maket 1070 - 30052 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30011($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.101 maket 1084 - 20015 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30012($doc) {
let $oldXML := $doc

let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};declare function util:pre30013($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre30014($doc) {
let $oldXML := $doc  


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {$elm/@code},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.4 maket 1028 - 30009 -------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30015($doc) {
let $oldXML := $doc  


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {$elm/@code},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.17 maket 1036 - 30019	 -------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30016($doc) {

  let $oldXML := $doc  


  let $data := for $strData in $oldXML//strdata[number(@code) < 4]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
   
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( 10 + number($strData/@code)*10 + $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
        
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
  return $item
        
                                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.15 maket 1012 - 30004 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30017($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strdata[(number(@code) < 111)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.13 maket 1034 - 30015 -------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30018($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.31 maket 1040 - 30025	 -------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30019($doc) {
let $oldXML := $doc  

let $data1 := for $strCls in $oldXML//strdata[(number(@code) >= 30) and (number(@code) <= 35)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data2 := for $strCls in $oldXML//strdata[(number(@code) >= 37) and (number(@code) <= 50)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }
              
let $data3 := for $strCls in $oldXML//strdata[(number(@code) >= 51) and (number(@code) <= 63)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data3)
let $flatten:= insert-before($flatten, 0, $data2)
let $flatten:= insert-before($flatten, 0, $data1)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.21 maket 1037 - 30018	 -------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30020($doc) {

  let $oldXML := $doc  


let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.39 maket 1048 - 30029 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30021($doc) {let $oldXML := $doc


let $data_1 := for $strCls in $oldXML//strdata[number(@code) < 3]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_1") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_2 := for $strCls in $oldXML//strdata[(number(@code) > 2) and (number(@code) < 111)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_2") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_1)
let $flatten:= insert-before($flatten, 0, $data_2)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre30022($doc) {
let $oldXML := $doc  
let $hdr := for $strCls in $oldXML//strdata[(number(@code) < 3)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data := for $strCls in $oldXML//strdata[number(@code) >= 3 and number(@code) <= 110]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)
let $flatten:= insert-before($flatten, 0, $hdr)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.36 maket 1045 - 30027	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30023($doc) {
let $oldXML := $doc  
let $hdr := for $strCls in $oldXML//strdata[(number(@code) < 3)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data := for $strCls in $oldXML//strdata[number(@code) >= 3 and number(@code) <= 110]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)
let $flatten:= insert-before($flatten, 0, $hdr)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>  
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.44 maket 1068 - 30050	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30024($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strdata[(number(@code) < 111)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.33 maket 1042 - 30026	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30025($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {$elm/@code},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] (:Contact info:)
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] (:Service info:)
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.28 maket 1041 - 30024	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30026($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strdata[number(@code) <= 110]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.26 maket 1044 - 30022	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30027($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.38 maket 1046 - 30028	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30028($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.52 maket 1050 - 30032	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30029($doc) {

  let $oldXML := $doc  


let $data := for $strCls in $oldXML//strdata[number(@code) < 40]
              let $columns13:=$strCls/column[number(@order) = 1 or number(@order) = 3]     
              let $columns57:=$strCls/column[number(@order) = 5 or number(@order) = 7]             
              let $columns24:=$strCls/column[number(@order) = 2 or number(@order) = 4]     
              let $columns68:=$strCls/column[number(@order) = 6 or number(@order) = 8]             
                      
              return(
              (
              element {xs:QName("strdata") } {
                attribute name {concat("Отгрузка товарной (угольной) продукции по договорам ", $strCls/@name, " тыс.тонн")},
                attribute code {$strCls/@code},
                
                (for $c in $columns13
                 return
                  
                attribute {xs:QName(concat("column", string(xs:int($c/@order div 2)+1)))}{
                  $c/text()
                })
              }
            ),
            (
              element {xs:QName("strdata") } {
                attribute name {".    в том числе по долгосрочным договорам, тыс.тонн"},
                attribute code {number($strCls/@code) + 1},
                
                (for $c in $columns57
                 return
                attribute {xs:QName(concat("column", string(xs:int($c/@order div 7)+1)))}{
                  $c/text()
                })
              }              
            ),
            (
              element {xs:QName("strdata") } {
                attribute name {concat("Отгрузка товарной (угольной) продукции по договорам ", $strCls/@name, " тыс.руб")},
                attribute code {number($strCls/@code) + 2},
                
                (for $c in $columns24
                 return
                attribute {xs:QName(concat("column", string(xs:int($c/@order div 4)+1)))}{
                  $c/text()
                })
              }              
            ),            
            (
              element {xs:QName("strdata") } {
                attribute name {".    в том числе по долгосрочным договорам, тыс.руб"},
                attribute code {number($strCls/@code) + 3},
                
                (for $c in $columns68
                 return
                attribute {xs:QName(concat("column", string(xs:int($c/@order div 8)+1)))}{
                  $c/text()
                })
              }              
            )            
          )

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.40 maket 1058 - 30041 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30030($doc) {let $oldXML := $doc

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre30031($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 99999 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.53 maket 1052 - 30033	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30032($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.47 maket 1051 - 30031	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30033($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.55 maket 1053 - 30034	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30034($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.34 maket 1055 - 30037	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30035($doc) {let $oldXML := $doc

let $div_010 := for $strCls in $oldXML//strdata[(number(@code) < 26)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_010") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

  let $div_011 := for $strData in $oldXML//strdata[number(@code) = 26]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_011") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_011")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - 2600000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      

  let $div_012 := for $strData in $oldXML//strdata[(number(@code) = 27)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_012") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_012")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - 2700000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      

let $div_013 := for $strCls in $oldXML//strdata[(number(@code) > 27) and (number(@code) <= 36)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_013") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

  let $div_020 := for $strData in $oldXML//strdata[(number(@code) >= 37) and (number(@code) <= 52)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_020") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_020")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - number($strData/@code)*100000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      

(: Divizion III :)

  let $div_030 := for $strData in $oldXML//strdata[(number(@code) >= 53) and (number(@code) <= 55)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_030") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_030")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - number($strData/@code)*100000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      


(: Divizion IV :)

  let $div_040 := for $strData in $oldXML//strdata[(number(@code) >= 56) and (number(@code) <= 71)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_040") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_040")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - number($strData/@code)*100000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      

(: Divizion V :)

  let $div_050 := for $strData in $oldXML//strdata[(number(@code) >= 72) and (number(@code) <= 76)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_050") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_050")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - number($strData/@code)*100000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      

(: Divizion VI :)

let $div_060 := for $strCls in $oldXML//strdata[(number(@code) >= 77) and (number(@code) <= 79)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_060") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

(: Divizion VII :)

let $div_070 := for $strCls in $oldXML//strdata[(number(@code) >= 80) and (number(@code) <= 82)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_070") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


(: Divizion VIII :)

  let $div_080 := for $strData in $oldXML//strdata[(number(@code) >= 83) and (number(@code) <= 147)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_080") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_080")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - number($strData/@code)*100000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      

(: Divizion IX :)

let $div_090 := for $strCls in $oldXML//strdata[(number(@code) >= 148) and (number(@code) <= 159)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_090") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

(: Divizion X :)

let $div_100 := for $strCls in $oldXML//strdata[(number(@code) >= 160) and (number(@code) <= 179)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_100") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }
    
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)

let $flatten:= insert-before($flatten, 0, $div_100)
let $flatten:= insert-before($flatten, 0, $div_090)
let $flatten:= insert-before($flatten, 0, $div_080)
let $flatten:= insert-before($flatten, 0, $div_070)
let $flatten:= insert-before($flatten, 0, $div_060)
let $flatten:= insert-before($flatten, 0, $div_050)
let $flatten:= insert-before($flatten, 0, $div_040)
let $flatten:= insert-before($flatten, 0, $div_030)
let $flatten:= insert-before($flatten, 0, $div_020)
let $flatten:= insert-before($flatten, 0, $div_013)
let $flatten:= insert-before($flatten, 0, $div_012)
let $flatten:= insert-before($flatten, 0, $div_011)
let $flatten:= insert-before($flatten, 0, $div_010)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre30037($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number($elm/@code)-100000},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.32 maket 1056 - 30038	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30038($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number($elm/@code)-100000},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.42 maket 1059 - 30040	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30039($doc) {let $oldXML := $doc


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre30040($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strfree[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.49 maket 1062 - 30044	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30041($doc) {

  let $oldXML := $doc  


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.45 maket 1061 - 30043 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30042($doc) {let $oldXML := $doc


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre30043($doc) {

  let $oldXML := $doc  


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.5 maket 1025 - 30010    	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30044($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 99999 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.51 maket 1063 - 30046	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30045($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 99999 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.27 maket 1067 - 30023	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30046($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 99999 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.48 maket 1064 - 30045	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30047($doc) {let $oldXML := $doc


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                    }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code)*100000 },
                attribute id {number ( $elm/@id )},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre30048($doc) { 

  let $oldXML := $doc  



let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.2 maket 1024 - 30007 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30050($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strfree[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.46 maket 1069 - 30051	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30051($doc) {
let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 99999 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.54 maket 1074 - 30054	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30052($doc) {

  let $oldXML := $doc  


  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                    }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 100000 },
                attribute id {number ( $elm/@id )},
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};



(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.60 maket 1085 - 30058 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30054($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.29, 3.30 maket 1076 - 30055	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30055($doc) {
let $oldXML := $doc  
let $data := for $strCls in $oldXML//strdata[((number(@code) = 1) or (number(@code) = 3)) or ((number(@code) >=31) and (number(@code) <=34))]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.109 maket 1088 - 20018	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30058($doc) {

  let $oldXML := $doc  

let $flattenPart1:=for $strCls in $oldXML//strfree[number(@code)<=100]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdataPart1") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              


              
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] (:Контактная информация:)
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
              for $strCls in $oldXML//strfree[number(@code)>=121 and number(@code)<=132] (:Служебная информация:)
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= $flattenPart1
let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= $flatten
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.61 maket 1198 - 30061 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30060($doc) {

   let $oldXML := $doc  

 
  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.12 maket 1006 - 30003 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30061($doc) {

  let $oldXML := $doc  
  let $data := for $strData in $oldXML//strdata[number(@code) < 4]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
   
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( 10 + number($strData/@code)*10 + $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
        
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
  return $item
        
                                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: ---------------------- 3.7 maket 1196 - 30062 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30062($doc) {

  let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName(concat("strdata", string($strCls/@code))) } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};



(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.1 maket 1307 - 30063 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre30063($doc) { 

  let $oldXML:=$doc

  let $data := for $strData in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - number($strData/@code) * 100000 },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: ----------------------- 4.40 maket 14 - 51321 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre40001($doc) {
  let $oldXML:=$doc

let $data := for $strCls in $oldXML//strclass
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute frName {$strCls/@name},
                attribute name {$strCls/../@name},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                  $c/text()
                })
              }
              

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)


let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

declare function util:pre40002($doc) {
let $oldXML := $doc  

let $flattenData:=for $strData in $oldXML//strdata[number(@code)>150]
                  let $columnsData:=$strData/column
                  let $classesData:=$strData/strclass              
                  return
                    element {xs:QName("strdata")}
                    {
                        attribute name {$strData/@name},
                        attribute code {$strData/@code},
                        ( 
                           for $c in $columnsData
                           return
                             attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                        )
                   
                    }
                    
let $flattenClass:=for $strCls in $oldXML//strclass
              let $par := $oldXML//strdata[strclass/number(@code) = $strCls/number(@code) ]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute namePar {$par/@name},
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 if ($c/text()!="")
                then attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                else ""
                )
              }
              
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

              
let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenClass,0,$flattenData)
let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)



let $newXML:= for $item in $flatten
              order by $item/@code
              return $item

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(:  =========================== Efficienty of energo ============================ :)

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.5 maket 1185 - 71014 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre71014/71014/action=xml&aid=1185&mid=5&period_year=2015&period_month=12&period_day=0&subject=6006&subject_variant=&type=1&user=8
:)

declare function util:pre40003($doc) {
	let $oldXML:=$doc
let $flattenData:=for $strCls in $oldXML//strdata[number(@code)<111]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                 (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenClass:=for $strCls in $oldXML//strclass
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata") }{
                attribute name {concat('   ',$strCls/@name)},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 if ($c/text()!="")
                then attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                else ""
                )
              }
              
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] (:?????????? ??????????:)
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] (:????????? ??????????:)
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
              
              

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenData,0,$flattenClass)
let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= for $item in $flatten
              order by $item/@code
              return $item
	return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};




declare function util:pre40006($doc) {
let $oldXML := $doc  

let $flattenData1:=for $strCls in $oldXML//strdata[number(@code)<=2]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata1") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                 (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenClass1:=for $strCls in $oldXML//strclass[number(@code) >= 200000 and number(@code)<=200016]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata1") }{
                attribute name {concat('   ',$strCls/@name)},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenData2:=for $strCls in $oldXML//strdata[number(@code)=3]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata1") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                 (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenClass2:=for $strCls in $oldXML//strclass[number(@code) >= 300000 and number(@code)<=300014]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata1") }{
                attribute name {concat('   ',$strCls/@name)},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenData3:=for $strCls in $oldXML//strdata[number(@code)=4 or number(@code)=5]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata2") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                 (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenClass3:=for $strCls in $oldXML//strclass[number(@code) >= 500000 and number(@code)<=500016]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata2") }{
                attribute name {concat('   ',$strCls/@name)},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenData4:=for $strCls in $oldXML//strdata[number(@code)=6]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata2") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                 (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenClass4:=for $strCls in $oldXML//strclass[number(@code) >= 600000 and number(@code)<=600014]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata2") }{
                attribute name {concat('   ',$strCls/@name)},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenData5:=for $strCls in $oldXML//strdata[number(@code)=7 or number(@code)=8]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata3") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                 (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenClass5:=for $strCls in $oldXML//strclass[number(@code) >= 800000 and number(@code)<=800016]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata3") }{
                attribute name {concat('   ',$strCls/@name)},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenData6:=for $strCls in $oldXML//strdata[number(@code)=9]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata3") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                 (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenClass6:=for $strCls in $oldXML//strclass[number(@code) >= 900000 and number(@code)<=900014]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata3") }{
                attribute name {concat('   ',$strCls/@name)},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= insert-before($flattenClass6,0,$flattenData6)
let $flatten:= insert-before($flatten,0,$flattenClass5)
let $flatten:= insert-before($flatten,0,$flattenData5)
let $flatten:= insert-before($flatten,0,$flattenClass4)
let $flatten:= insert-before($flatten,0,$flattenData4)
let $flatten:= insert-before($flatten,0,$flattenClass3)
let $flatten:= insert-before($flatten,0,$flattenData3)
let $flatten:= insert-before($flatten,0,$flattenClass2)
let $flatten:= insert-before($flatten,0,$flattenData2)
let $flatten:= insert-before($flatten,0,$flattenClass1)
let $flatten:= insert-before($flatten,0,$flattenData1)
let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= $flatten
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 2.45 maket 1001 - 40002 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre40011($doc) {let $oldXML := $doc


let $data := for $strCls in $oldXML//strdata[number(@code) < 111 or number(@code) > 132]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };

declare function util:pre40015($doc) {let $oldXML := $doc


let $data_01 := for $strCls in $oldXML//strdata[number(@code) >= 1 and number(@code) <= 100]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML//strdata[number(@code) >= 101 and number(@code) <= 102]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_03 := for $strCls in $oldXML//strdata[number(@code) >= 10201 and number(@code) <= 10210]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_04 := for $strCls in $oldXML//strdata[number(@code) >= 103 and number(@code) <= 109]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


let $data_05 := for $strCls in $oldXML//strdata[number(@code) >= 10901 and number(@code) <= 10925]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_06 := for $strCls in $oldXML//strdata[number(@code) = 111]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_07 := for $strCls in $oldXML//strdata[number(@code) >= 11101 and number(@code) <= 11225]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_08 := for $strCls in $oldXML//strdata[number(@code) >= 113 and number(@code) <= 115]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_09 := for $strCls in $oldXML//strdata[number(@code) >= 11501 and number(@code) <= 11525]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_10 := for $strCls in $oldXML//strdata[number(@code) = 116]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_11 := for $strCls in $oldXML//strdata[number(@code) >= 11601 and number(@code) <= 11625]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_12 := for $strCls in $oldXML//strdata[number(@code) = 117]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_13 := for $strCls in $oldXML//strdata[number(@code) >= 118 and number(@code) <= 121]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


let $data_20 := for $strCls in $oldXML//strdata[number(@code) >= 201 and number(@code) <= 203]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_21 := for $strCls in $oldXML//strdata[number(@code) >= 20301 and number(@code) <= 20310]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_22 := for $strCls in $oldXML//strdata[number(@code) = 205]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_23 := for $strCls in $oldXML//strdata[number(@code) >= 20501 and number(@code) <= 20510]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


let $data_24 := for $strCls in $oldXML//strdata[number(@code) = 207]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


let $data_25 := for $strCls in $oldXML//strdata[number(@code) >= 20701 and number(@code) <= 20710]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


let $data_26 := for $strCls in $oldXML//strdata[number(@code) = 209]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_27 := for $strCls in $oldXML//strdata[number(@code) >= 212 and number(@code) <= 216]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_30 := for $strCls in $oldXML//strdata[number(@code) = 301]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_31 := for $strCls in $oldXML//strdata[number(@code) >= 30101 and number(@code) <= 30110]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_32 := for $strCls in $oldXML//strdata[(number(@code) = 303) or (number(@code) >= 30301 and number(@code) <= 30310)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_33 := for $strCls in $oldXML//strdata[(number(@code) = 305) or (number(@code) >= 30501 and number(@code) <= 30510)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


let $data_34 := for $strCls in $oldXML//strdata[(number(@code) = 309) or (number(@code) >= 30901 and number(@code) <= 30910)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


let $data_35 := for $strCls in $oldXML//strdata[(number(@code) = 311) or (number(@code) >= 31101 and number(@code) <= 31110)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_36 := for $strCls in $oldXML//strdata[number(@code) >= 313 and number(@code) <= 316]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


let $data_37 := for $strCls in $oldXML//strdata[number(@code) >= 31601 and number(@code) <= 31610]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_38 := for $strCls in $oldXML//strdata[(number(@code) = 317) or (number(@code) >= 31701 and number(@code) <= 31710)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_40 := for $strCls in $oldXML//strdata[(number(@code) = 401) or (number(@code) = 402) or (number(@code) >= 40201 and number(@code) <= 40225)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_05") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_41 := for $strCls in $oldXML//strdata[(number(@code) = 409) or (number(@code) >= 40901 and number(@code) <= 40910)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_05") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_42 := for $strCls in $oldXML//strdata[(number(@code) = 411) or (number(@code) = 412) or (number(@code) >= 41201 and number(@code) <= 41225)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_05") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_43 := for $strCls in $oldXML//strdata[number(@code) = 419]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_05") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=611 or number(@code)=612] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 721 and number(@code) <= 732] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_43)
let $flatten:= insert-before($flatten, 0, $data_42)
let $flatten:= insert-before($flatten, 0, $data_41)
let $flatten:= insert-before($flatten, 0, $data_40)
let $flatten:= insert-before($flatten, 0, $data_38)
let $flatten:= insert-before($flatten, 0, $data_37)
let $flatten:= insert-before($flatten, 0, $data_36)
let $flatten:= insert-before($flatten, 0, $data_35)
let $flatten:= insert-before($flatten, 0, $data_34)
let $flatten:= insert-before($flatten, 0, $data_33)
let $flatten:= insert-before($flatten, 0, $data_32)
let $flatten:= insert-before($flatten, 0, $data_31)
let $flatten:= insert-before($flatten, 0, $data_30)
let $flatten:= insert-before($flatten, 0, $data_27)
let $flatten:= insert-before($flatten, 0, $data_26)
let $flatten:= insert-before($flatten, 0, $data_25)
let $flatten:= insert-before($flatten, 0, $data_24)
let $flatten:= insert-before($flatten, 0, $data_23)
let $flatten:= insert-before($flatten, 0, $data_22)
let $flatten:= insert-before($flatten, 0, $data_21)
let $flatten:= insert-before($flatten, 0, $data_20)
let $flatten:= insert-before($flatten, 0, $data_13)
let $flatten:= insert-before($flatten, 0, $data_12)
let $flatten:= insert-before($flatten, 0, $data_11)
let $flatten:= insert-before($flatten, 0, $data_10)
let $flatten:= insert-before($flatten, 0, $data_09)
let $flatten:= insert-before($flatten, 0, $data_08)
let $flatten:= insert-before($flatten, 0, $data_07)
let $flatten:= insert-before($flatten, 0, $data_06)
let $flatten:= insert-before($flatten, 0, $data_05)
let $flatten:= insert-before($flatten, 0, $data_04)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };

declare function util:pre40019($doc) {let $oldXML := $doc

let $data := for $strCls in $oldXML//strfree[number(@code) >= 1 and number(@code) <= 100]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {concat("-", $strCls/@code, "-")},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strContactInf") }{
                attribute name {$strCls/@name}
              }

let $flattenServiceData:=
              for $strCls in $oldXML//strfree[number(@code) >= 121] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };

declare function util:pre40021($doc) {
 
let $oldXML := $doc   

let $parm := for $prm in $oldXML
  return (
       element { xs:QName("param") } {
       attribute name {"params"},  
       attribute version {$prm/@version},
       attribute year {$prm/@year},
       attribute month {$prm/@month},
       attribute day {$prm/@day},       
       attribute predpr {$prm/@subject_name},
       attribute subject {$prm/@subject_variant_name}
     }
  )  

let $data_01 := for $strCls in $oldXML//strfree[number(@code) >= 1 and number(@code) <= 100]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") }{
                attribute name {concat("-", $strCls/@code, "-")},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML//strfree[number(@code) > 100 and number(@code) <= 200]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_03 := for $strCls in $oldXML//strfree[number(@code) >= 201 and number(@code) <= 300]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=1111] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 1121] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $parm) 
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};


declare function util:pre40025($doc) {
let $oldXML := $doc
let $oldXML1:=$oldXML[number(@code) = 40026]/document
let $oldXML2:=$oldXML[number(@code) = 40025]/document

let $data_01:=for $strCls in $oldXML1//strdata[(number(@code) < 111 or number(@code) > 132) and (number(@code) != 10)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_01") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $data_11:=for $strCls in $oldXML1//strdata[(number(@code) = 10)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_11") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $data_02 := for $strCls in $oldXML2//strfree[number(@code) >= 1 and number(@code) <= 15]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_02") }{
                attribute name {concat("-", $strCls/@code, "-")},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_03 := for $strCls in $oldXML2//strfree[number(@code) >= 16 and number(@code) <= 30]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_03") }{
                attribute name {concat("-", $strCls/@code, "-")},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

let $data_04 := for $strCls in $oldXML2//strfree[number(@code) >= 31 and number(@code) <= 35]
              let $columns:=$strCls/column             
              return
              element {xs:QName("data_04") }{
                attribute name {concat("-", $strCls/@code, "-")},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }               

              
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML1//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML1//strdata[number(@code) >= 121 and number(@code) <= 132]
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML1//column/@order)
let $flatten:= $data_04
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)
let $flatten:= insert-before($flatten, 0, $data_11)

let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= $flatten
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};

declare function util:pre40068($doc) {let $oldXML := $doc



let $data_01 := for $strCls in $oldXML//strfree[number(@code) >= 1 and number(@code) <= 30]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") }{
                attribute name {concat("-", $strCls/@code, "-")},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML//strfree[number(@code) >= 31 and number(@code) <= 100]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") }{
                attribute name {concat("-", $strCls/@code, "-")},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strContactInf") }{
                attribute name {$strCls/@name}
              }

let $flattenServiceData:=
              for $strCls in $oldXML//strfree[number(@code) >= 121] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> };declare function util:pre51320($doc) {let $oldXML := $doc let $oldXML:=fn:doc("338911_51320.xml")/*  
                           
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=1 
                                                                       and number(@code)<=20
                                                                       or (number(@code)>=131
                                                                       and number(@code)<=133)
                                                                       or number(@code)=71
                                                                       or number(@code)=81
                                                                       or number(@code)=101
                                                                       or number(@code)=401
                                                                       or number(@code)=1220
                                                                       or (number(@code)>=121
                                                                       and number(@code)<=123)
                                                                       or number(@code)=53
                                                                       )]/@name))
              return 
              element {xs:QName("strdata1")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }

 let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=21 
                                                                       and number(@code)<=52
                                                                       or (number(@code)>=124
                                                                       and number(@code)<=129)
                                                                       or (number(@code)>=54
                                                                       and number(@code)<=56)
                                                                       or (number(@code)>=231
                                                                       and number(@code)<=240)
                                                                       or number(@code)=311
                                                                       or number(@code)=137
                                                                       )]/@name))
              return 
              element {xs:QName("strdata2")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }


             
let $flattenPart4 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=60
                                                                       )]/@name),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=6000001 
                                                                       and number(@code)<=6000005)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }             
             
let $flattenPart5 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=70
                                                                       )]/@name),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=7000001 
                                                                       and number(@code)<=7000003)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
                        
let $flattenPart6 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=80
                                                                       )]/@name),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=8000001 
                                                                       and number(@code)<=8000111)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
                      
let $flattenPart7:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=85
                                                                       or number(@code)=90
                                                                       or number(@code)=100
                                                                       or number(@code)=110
                                                                       or number(@code)=120
                                                                       )]/@name))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }                        
                      
let $flattenPart8:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=130
                                                                       )]/@name))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }                            
                          
 let $flattenPart10 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=111
                                                                         or number(@code)=112)
                                                                        ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }
              
 let $flattenPart11 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=321
                                                                       and number(@code)<=329)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                )
                ,
               attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }              

let $flatten:= insert-before($flattenPart11,0,$flattenPart10)
let $flatten:= insert-before($flatten,0,$flattenPart8)
let $flatten:= insert-before($flatten,0,$flattenPart7)
let $flatten:= insert-before($flatten,0,$flattenPart6)
let $flatten:= insert-before($flatten,0,$flattenPart5)
let $flatten:= insert-before($flatten,0,$flattenPart4)
let $flatten:= insert-before($flatten,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)

let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};declare function util:pre51321($doc) { 

  let $oldXML:=$doc

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 321 or number(@code) > 329)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 321 and number(@code) <= 329] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
}; 

(: ------------------------------------------------------------------------------ :)
(: ----------------------- 4.56 maket 84 - 10184 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre51328($doc) {let $oldXML := $doc
  
  
 let $flattenPart11 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=90)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {"10"},
                      attribute name {"Поступление электроэнергии из сетей ФСК, МСК, РСК и др. собств."},
                           attribute unit {"тыс. кВт∙ч"},
                                    
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                                               
                )
              }  
      
   
  let $flattenPart12 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=91)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=9100001 
                                                                       and number(@code)<=9100008)
                                                                
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                   attribute id {"11"},
                      attribute name {"Поступление электроэнергии из сетей ФСК"},
                           attribute unit {"тыс. кВт∙ч"},
                   
                         (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                    
                ),
              
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                        (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          ),
                            attribute unit {"тыс. кВт∙ч"}
                     }
                )
              }       
                       
 
                          
  let $flattenPart13 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=92)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=9200001 
                                                                       and number(@code)<=9200056)
                                                                
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                   attribute id {"12"},
                      attribute name {"Поступление электроэнергии из сетей МСК "},
                           attribute unit {"тыс. кВт∙ч"},
                   
                         (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                    
                ),
              
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                        (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          ),
                            attribute unit {"тыс. кВт∙ч"}
                     }
                )
              }    
              
              
 let $flattenPart14 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=93)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=9300001 
                                                                       and number(@code)<=9300094)
                                                                
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                   attribute id {"13"},
                      attribute name {"Поступление электроэнергии из сетей РСК"},
                           attribute unit {"тыс. кВт∙ч"},
                   
                         (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                    
                ),
              
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                        (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          ),
                            attribute unit {"тыс. кВт∙ч"}
                     }
                )
              }          
              
 let $flattenPart15 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=94)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                   attribute id {"14"},
                      attribute name {"Поступление электроэнергии из сетей других собственников"},
                           attribute unit {"тыс. кВт∙ч"},
                   
                         (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                    
                )
              }   
              
 let $flattenPart16 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=280)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                   attribute id {"20"},
                      attribute name {"Отпуск в сети ФСК, МСК, РСК и др. собств."},
                           attribute unit {"тыс. кВт∙ч"},
                   
                         (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                    
                )
              
              
              }      
              
 let $flattenPart17 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=281)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=28100001 
                                                                       and number(@code)<=28100008)
                                                                
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                   attribute id {"21"},
                      attribute name {"Отпуск электроэнергии в сети ФСК "},
                           attribute unit {"тыс. кВт∙ч"},
                   
                         (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                    
                ),
              
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                      (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          ),
                            attribute unit {"тыс. кВт∙ч"}
                     }
                )
              }  
              
 let $flattenPart18 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=282)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=28200001 
                                                                       and number(@code)<=28200056)
                                                                
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                   attribute id {"22"},
                      attribute name {"Отпуск электроэнергии в сети МСК "},
                           attribute unit {"тыс. кВт∙ч"},
                   
                         (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                    
                ),
              
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                      (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          ),
                            attribute unit {"тыс. кВт∙ч"}
                     }
                )
              }            
              
 let $flattenPart19 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=283)
                                                                  ]/@code),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=28300001 
                                                                       and number(@code)<=28300094)
                                                                
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                   attribute id {"23"},
                      attribute name {"Отпуск электроэнергии в сети РСК и АО-энерго"},
                           attribute unit {"тыс. кВт∙ч"},
                   
                         (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                    
                ),
              
                (for $c in $oldXML//strclass[string(@code) = $strCls] 
                   return
                     element {xs:QName("strclass") }{   
                         attribute id {$c/@code},
                         attribute name {$c/@name},
                                                     (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          ),
                            attribute unit {"тыс. кВт∙ч"}
                     }
                )
              }    
 let $flattenPart110 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=284)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                   attribute id {"24"},
                      attribute name {"Отпуск электроэнергии в сети других собственников и прочим потребителям"},
                           attribute unit {"тыс. кВт∙ч"},
                   
                         (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                    
                )
              }                                                                                                                     
 let $flattenPart111 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=288)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata")} {
              
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                   attribute id {"30"},
                      attribute name {"Сальдо перетоков по станции"},
                           attribute unit {"тыс. кВт∙ч"},
                   
                         (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                    )
                    
                )
              }              
                    
 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=111
                                                                       and number(@code)<=129)
                                                                  ]/@code))
              return 
              element {xs:QName("block3")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
              }                          
  



let $flatten:= insert-before($flattenPart3,0,$flattenPart111)
let $flatten:= insert-before($flatten,0,$flattenPart110)
let $flatten:= insert-before($flatten,0,$flattenPart19)
let $flatten:= insert-before($flatten,0,$flattenPart18)
let $flatten:= insert-before($flatten,0,$flattenPart17)
let $flatten:= insert-before($flatten,0,$flattenPart16)
let $flatten:= insert-before($flatten,0,$flattenPart15)
let $flatten:= insert-before($flatten,0,$flattenPart14)
let $flatten:= insert-before($flatten,0,$flattenPart13)
let $flatten:= insert-before($flatten,0,$flattenPart12)
let $flatten:= insert-before($flatten,0,$flattenPart11)


let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>};declare function util:pre51329($doc) { 
let $oldXML := $doc

let $flattenDataPart1:=for $strCls in $oldXML//strdata[(number(@code)<121 
                                                   or (number(@code)>132 and number(@code)<=268))
                                                  and number(@code)!=111
                                                  and number(@code)!=112]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata1") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return 
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                        $c/text()}
                )
              }
              
let $flattenDataPart2:=for $strCls in $oldXML//strdata[number(@code)>=610 and number(@code)<=696]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata2") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return 
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                        $c/text()} 
                )
              }

let $flattenDataPart3:=for $strCls in $oldXML//strdata[number(@code)>=510 and number(@code)<=580]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdata3") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return 
                   attribute {xs:QName(concat("col",string($c/@order)))}{
                        $c/text()}
                
                )
              }
(:-------------------------------------------------------------------------------------------------------------------:)
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
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)
let $flatten:= $flattenContactData
let $flatten:= insert-before($flatten,0,$flattenServiceData)
let $flatten:= insert-before($flatten,0,$flattenDataPart3)
let $flatten:= insert-before($flatten,0,$flattenDataPart2)
let $flatten:= insert-before($flatten,0,$flattenDataPart1)

let $newXML:= $flatten
              
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.1 maket 1453 - 20175 ---------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre52075($doc) {let $oldXML := $doc


let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=10 
                                                                       and number(@code)<=74
                                                                     )]/@name))
              return 
              element {xs:QName("strdata1")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
  
let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=80 
                                                                       and number(@code)<=110
                                                                     )]/@code))
              return 
              element {xs:QName("strdata2")} {
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),                
                (
                  for $str in $oldXML//strdata[string(@code) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
                          
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=111 or number(@code)=112)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
             }
             
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1) 

let $newXML:= for $item in $flatten return $item              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>             
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.34 maket 1189 - 72024 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre72024/72024/action=xml&aid=1189&mid=718&period_year=2014&period_day=0&subject=6001
:)

declare function util:pre70011($doc) {
let $oldXML := $doc  

let $data_1 := for $strCls in $oldXML//strdata[(number(@code) > 1000) and (number(@code) < 4000)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_2 := for $strCls in $oldXML//strdata[(number(@code) > 4000) and (number(@code) < 10000)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},

                (for $s in (1,5)
                 return
                attribute {xs:QName(concat("column", string($s) ))}{
                  $s
                }),
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order+5)))}{
                  $c/text()
                })
              }


let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_2)
let $flatten:= insert-before($flatten, 0, $data_1)


let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: ---------------- 5.37 / 5.38 / 5.39 maket 1126 - 70012  ---------------------- :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre70012/70012/action=xml&aid=1126&mid=1&period_day=0&subject=6012&subject_variant=603
:)

declare function util:pre70012($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.131 maket 1116 - 70005 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre70005/70005/action=xml&aid=1186&mid=2&period_year=2014&period_day=0&subject=643
:)

declare function util:pre70005($doc) {

let $oldXML:=$doc          

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
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.4.2 maket 1339 - 70114 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70114($doc) {     
let $oldXML:=$doc           

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
let $flatten := insert-before($flatten, 0, $total) 
let $flatten := insert-before($flatten, 0, $fin) 


let $newXML := for $item in $flatten
              return $item order by $flatten//strdata/@code
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.4.3 maket 1340 - 70115 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70115($doc) {     

let $oldXML:=$doc           

let $data := for $strCls in $oldXML//strdata[(number(@code) < 101 and number(@code) > 1)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 133] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
 
(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.4.4 maket 1342 - 70116 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70116($doc) {

let $oldXML:=$doc          

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
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=133] 
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
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.4.5 maket 1345 - 70117 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70117($doc) {     

let $oldXML:=$doc           

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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=133] (:Служебная информация:)
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

    
let $flatten := $fin
let $flatten := insert-before($flatten, 0, $flattenContactData)
let $flatten := insert-before($flatten, 0, $flattenServiceData)


let $newXML := for $item in $flatten
              return $item 
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.4.6 maket 1398 - 70157 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70157($doc) {

let $oldXML:=$doc          

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
                      
          for $str in $oldXML//strdetail[string(column[2]) = string($xmlData)]
            return 
              element {xs:QName("strdata")} {
                attribute name {$str//entity},
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=133] (:Служебная информация:)
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

   
(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.1.6 maket 1352 - 70123 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70123($doc) { 

 let $oldXML:=$doc   
 let $flattenPart0 :=  element {xs:QName("strdata") }{   
                         attribute id {"0"},
                         attribute name {"Целевые показатели, установленные из перечня целевых показателей в области энергосбережения и повышения энергетической эффективности согласно постановлению Правительства Российской Федерации от 31 декабря 2009 г. N 1225"}}
                         
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(number(@code)=1 
                                                                                   or number(@code)=2
                                                                                   or number(@code)=3
                                                                                   or number(@code)=4
                                                                                   or number(@code)=5)
                                                                  ]/@name),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=100001 
                                                                       and number(@code)<=100006)
                                                                    or  (	number(@code)>=200001 
                                                                       and number(@code)<=200007)
                                                                    or  (	number(@code)>=300001 
                                                                       and number(@code)<=300007)
                                                                    or  (	number(@code)>=400001 
                                                                       and number(@code)<=400008)
                                                                    or  (	number(@code)>=500001 
                                                                       and number(@code)<=500005)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                (for $c in $oldXML//strdetail[column[2]/text() = $strCls]
                   return
                     element {xs:QName("child") }{   
                         attribute nameInd {$c/entity/text()},
                         (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
              }

 let $flattenPart2 :=  element {xs:QName("strdata") }{   
                         attribute id {"6"},
                         attribute name {"Иные целевые показатели в области энергосбережения и повышения энергетической эффективности, определенные органом местного самоуправления при разработке муниципальной программы в области энергосбережения и повышения энергетической эффективности"}}
                         

 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(number(@code)=20)
                                                                  ]/@name),
                                                                  distinct-values($oldXML//strdetail[
                                                                 (number(@code)>=2000001 
                                                                and number(@code)<=2000500)]/entity/text()))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat("7",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat("7",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                (for $c in $oldXML//strdetail[column[2]/text() = $strCls]
                   return
                     element {xs:QName("child") }{   
                         attribute nameInd {$c/entity/text()},
                         (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=133] 
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
              
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)
let $flatten:= insert-before($flatten,0,$flattenPart0)

let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)

let $newXML:= for $item in $flatten[number(@id) != 720]
              order by $item/@id
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.2.2 maket 1353 - 70120 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70120($doc) {
  
 let $oldXML:=$doc     
 let $flattenPart0 :=  element {xs:QName("strdata") }{   
                         attribute id {"0"},
                         attribute name {"Целевые показатели, установленные из перечня целевых показателей в области энергосбережения и повышения энергетической эффективности согласно постановлению Правительства Российской Федерации от 31 декабря 2009 г. N 1225"}}
                         
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(number(@code)=1 
                                                                                   or number(@code)=2
                                                                                   or number(@code)=3
                                                                                   or number(@code)=4
                                                                                   or number(@code)=5)
                                                                  ]/@name),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=100001 
                                                                       and number(@code)<=100006)
                                                                    or  (	number(@code)>=200001 
                                                                       and number(@code)<=200007)
                                                                    or  (	number(@code)>=300001 
                                                                       and number(@code)<=300007)
                                                                    or  (	number(@code)>=400001 
                                                                       and number(@code)<=400008)
                                                                    or  (	number(@code)>=500001 
                                                                       and number(@code)<=500005)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                (for $c in $oldXML//strdetail[column[2]/text() = $strCls]
                   return
                     element {xs:QName("child") }{   
                         attribute nameInd {$c/entity/text()},
                         (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
              }

 let $flattenPart2 :=  element {xs:QName("strdata") }{   
                         attribute id {"6"},
                         attribute name {"Иные целевые показатели в области энергосбережения и повышения энергетической эффективности, определенные органом местного самоуправления при разработке муниципальной программы в области энергосбережения и повышения энергетической эффективности"}}
                         

 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(number(@code)=20)
                                                                  ]/@name),
                                                                  distinct-values($oldXML//strdetail[
                                                                 (number(@code)>=2000001 
                                                                and number(@code)<=2000500)]/entity/text()))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat("7",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat("7",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                (for $c in $oldXML//strdetail[column[2]/text() = $strCls]
                   return
                     element {xs:QName("child") }{   
                         attribute nameInd {$c/entity/text()},
                         (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=133] 
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
              
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)
let $flatten:= insert-before($flatten,0,$flattenPart0)

let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)

let $newXML:= for $item in $flatten[number(@id) != 720]
              order by $item/@id
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.2.3 maket 1353 - 70121 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70121($doc) {
  
let $oldXML:=$doc          

  let $parm := for $prm in $oldXML
  return (
       element { xs:QName("param") } {
       attribute version {$prm/@version},
       attribute year {$prm/@year},
       attribute month {$prm/@month},
       attribute day {$prm/@day}       
     }
  ) 
  
let $flattenPart0 :=  element {xs:QName("strdata") }{   
                         attribute id {"0"},
                         attribute name {"Целевые показатели, установленные из перечня целевых показателей в области энергосбережения и повышения энергетической эффективности согласно постановлению Правительства Российской Федерации от 31 декабря 2009 г. N 1225"}}
                         
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(number(@code)=1 
                                                                                   or number(@code)=2
                                                                                   or number(@code)=3
                                                                                   or number(@code)=4
                                                                                   or number(@code)=5)
                                                                  ]/@name),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=100001 
                                                                       and number(@code)<=100006)
                                                                    or  (	number(@code)>=200001 
                                                                       and number(@code)<=200007)
                                                                    or  (	number(@code)>=300001 
                                                                       and number(@code)<=300007)
                                                                    or  (	number(@code)>=400001 
                                                                       and number(@code)<=400008)
                                                                    or  (	number(@code)>=500001 
                                                                       and number(@code)<=500005)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                (for $c in $oldXML//strdetail[column[2]/text() = $strCls]
                   return
                     element {xs:QName("child") }{   
                         attribute nameInd {$c/entity/text()},
                         (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
              }

 let $flattenPart2 :=  element {xs:QName("strdata") }{   
                         attribute id {"6"},
                         attribute name {"Иные целевые показатели в области энергосбережения и повышения энергетической эффективности, определенные органом местного самоуправления при разработке муниципальной программы в области энергосбережения и повышения энергетической эффективности"}}
                         

 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(number(@code)=20)
                                                                  ]/@name),
                                                                  distinct-values($oldXML//strdetail[
                                                                 (number(@code)>=2000001 
                                                                and number(@code)<=2000500)]/entity/text()))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat("7",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat("7",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                (for $c in $oldXML//strdetail[column[2]/text() = $strCls]
                   return
                     element {xs:QName("child") }{   
                         attribute nameInd {$c/entity/text()},
                         (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=133] (:Служебная информация:)
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
              
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)
let $flatten:= insert-before($flatten,0,$flattenPart0)

let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)

let $flatten:= insert-before($flatten, 0, $parm) 

let $newXML:= for $item in $flatten[number(@id) != 720]
              order by $item/@id
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.2.5 maket 1403 - 70158 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70122($doc) {
  
 let $oldXML:=$doc         
 let $flattenPart0 :=  element {xs:QName("strdata") }{   
                         attribute id {"0"},
                         attribute name {"Целевые показатели, установленные из перечня целевых показателей в области энергосбережения и повышения энергетической эффективности согласно постановлению Правительства Российской Федерации от 31 декабря 2009 г. N 1225"}}
                         
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(number(@code)=1 
                                                                                   or number(@code)=2
                                                                                   or number(@code)=3
                                                                                   or number(@code)=4
                                                                                   or number(@code)=5)
                                                                  ]/@name),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=100001 
                                                                       and number(@code)<=100006)
                                                                    or  (	number(@code)>=200001 
                                                                       and number(@code)<=200007)
                                                                    or  (	number(@code)>=300001 
                                                                       and number(@code)<=300007)
                                                                    or  (	number(@code)>=400001 
                                                                       and number(@code)<=400008)
                                                                    or  (	number(@code)>=500001 
                                                                       and number(@code)<=500005)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                (for $c in $oldXML//strdetail[column[2]/text() = $strCls]
                   return
                     element {xs:QName("child") }{   
                         attribute nameInd {$c/entity/text()},
                         (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
              }

 let $flattenPart2 :=  element {xs:QName("strdata") }{   
                         attribute id {"6"},
                         attribute name {"Иные целевые показатели в области энергосбережения и повышения энергетической эффективности, определенные органом местного самоуправления при разработке муниципальной программы в области энергосбережения и повышения энергетической эффективности"}}
                         

 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(number(@code)=20)
                                                                  ]/@name),
                                                                  distinct-values($oldXML//strdetail[
                                                                 (number(@code)>=2000001 
                                                                and number(@code)<=2000500)]/entity/text()))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat("7",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat("7",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                (for $c in $oldXML//strdetail[column[2]/text() = $strCls]
                   return
                     element {xs:QName("child") }{   
                         attribute nameInd {$c/entity/text()},
                         (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=133] 
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
              
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)
let $flatten:= insert-before($flatten,0,$flattenPart0)

let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)

let $newXML:= for $item in $flatten
              order by $item/@id
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.4.1 maket 1338 - 70113 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70113($doc) {

let $oldXML:=$doc

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
};
 
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
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=133] 
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

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.1.7 maket 1349 - 70124 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70124($doc) {

let $oldXML:=$doc        

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 133)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 136] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
 

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.1.8 maket 1351 - 70125 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70125($doc) {     

let $oldXML:=$doc         

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

let $flattenPart0 :=  element {xs:QName("strdata") }{   
                         attribute name {"Целевые показатели"},
                         attribute code {"1"}
                       }
                         
 let $data_01 := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "1" and string-length(entity) > 1]
 return 
     element {xs:QName("strdata")} {
         attribute name {$data//entity},
         attribute code {number($data/@code) - 99999},
         attribute measure{$data//column[1]},
         attribute avg_val{$data//column[2]},
         attribute best_val{$data//column[3]},
         attribute bas_val{$data//column[4]},
         attribute plan_downto_4 {$data//column[5]},
         attribute plan_downto_3 {$data//column[6]},
         attribute plan_downto_2 {$data//column[7]},
         attribute plan_downto_1 {$data//column[8]},
         attribute plan {$data//column[9]},
         attribute plat_to_1 {$data//column[10]},
         attribute plan_to_2 {$data//column[11]},
         attribute plan_to_3 {$data//column[12]},
         attribute plan_to_4 {$data//column[13]},
         attribute fact_downto_4 {$data//column[14]},
         attribute fact_downto_3 {$data//column[15]},
         attribute fact_downto_2 {$data//column[16]},
         attribute fact_downto_1 {$data//column[17]},
         attribute fact {$data//column[18]},
         attribute fact_to_1 {$data//column[19]},
         attribute fact_to_2 {$data//column[20]},
         attribute fact_to_3 {$data//column[21]},
         attribute fact_to_4 {$data//column[22]},
         attribute div_downto_4a {$data//column[23]},
         attribute div_downto_3a {$data//column[24]},
         attribute div_downto_2a {$data//column[25]},
         attribute div_downto_1a {$data//column[26]},
         attribute diva {$data//column[27]},
         attribute div_to_1a {$data//column[28]},
         attribute div_to_2a {$data//column[29]},
         attribute div_to_3a {$data//column[30]},
         attribute div_to_4a {$data//column[31]},
         attribute div_downto_4 {$data//column[32]},
         attribute div_downto_3 {$data//column[33]},
         attribute div_downto_2 {$data//column[34]},
         attribute div_downto_1 {$data//column[35]},
         attribute div {$data//column[36]},
         attribute div_to_1 {$data//column[37]},
         attribute div_to_2 {$data//column[38]},
         attribute div_to_3 {$data//column[39]},
         attribute div_to_4 {$data//column[40]}                           
     }                           
     
 let $flattenPart1 :=  element {xs:QName("strdata") }{   
                         attribute name {"Прочие показатели"},
                         attribute code {"100"}
                       }
                       
 let $data_02 := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "2" and string-length(entity) > 1]
 return 
     element {xs:QName("strdata")} {
         attribute name {$data//entity},
         attribute code {number($data/@code) - 199900},
         attribute measure{$data//column[1]},
         attribute avg_val{$data//column[2]},
         attribute best_val{$data//column[3]},
         attribute bas_val{$data//column[4]},
         attribute plan_downto_4 {$data//column[5]},
         attribute plan_downto_3 {$data//column[6]},
         attribute plan_downto_2 {$data//column[7]},
         attribute plan_downto_1 {$data//column[8]},
         attribute plan {$data//column[9]},
         attribute plat_to_1 {$data//column[10]},
         attribute plan_to_2 {$data//column[11]},
         attribute plan_to_3 {$data//column[12]},
         attribute plan_to_4 {$data//column[13]},
         attribute fact_downto_4 {$data//column[14]},
         attribute fact_downto_3 {$data//column[15]},
         attribute fact_downto_2 {$data//column[16]},
         attribute fact_downto_1 {$data//column[17]},
         attribute fact {$data//column[18]},
         attribute fact_to_1 {$data//column[19]},
         attribute fact_to_2 {$data//column[20]},
         attribute fact_to_3 {$data//column[21]},
         attribute fact_to_4 {$data//column[22]},
         attribute div_downto_4a {$data//column[23]},
         attribute div_downto_3a {$data//column[24]},
         attribute div_downto_2a {$data//column[25]},
         attribute div_downto_1a {$data//column[26]},
         attribute diva {$data//column[27]},
         attribute div_to_1a {$data//column[28]},
         attribute div_to_2a {$data//column[29]},
         attribute div_to_3a {$data//column[30]},
         attribute div_to_4a {$data//column[31]},
         attribute div_downto_4 {$data//column[32]},
         attribute div_downto_3 {$data//column[33]},
         attribute div_downto_2 {$data//column[34]},
         attribute div_downto_1 {$data//column[35]},
         attribute div {$data//column[36]},
         attribute div_to_1 {$data//column[37]},
         attribute div_to_2 {$data//column[38]},
         attribute div_to_3 {$data//column[39]},
         attribute div_to_4 {$data//column[40]}                           
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
    
let $flatten := insert-before($flattenServiceData, 0, $parm) 
let $flatten := insert-before($flatten, 0, $flattenContactData)         
let $flatten := insert-before($flatten, 0, $data_02)
let $flatten := insert-before($flatten, 0, $flattenPart1)
let $flatten := insert-before($flatten, 0, $data_01)
let $flatten := insert-before($flatten, 0, $flattenPart0)
 
let $newXML01 := for $item in $flatten
              return $item
                            
return <document version="1.0" created="create_xml_online"><flat>{$newXML01}</flat></document> 
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.1.9 maket 1350 - 70126 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70126($doc) { 

let $oldXML:=$doc        

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

let $fin := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "1" and string-length(entity) > 1]
    return 
        element { xs:QName("strdata")} {
            attribute name          { $data//entity },
            attribute code          { number($data/@code) - 100000 },
            attribute measure       { $data//column[1] },
            attribute vol_paln_all  { $data//column[2] },
            attribute vol_plan_year { $data//column[3] },
            attribute vol_fact_all  { $data//column[4] },
            attribute vol_fact_year { $data//column[5] },
            
            for $cost in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "3" and entity = $data//entity]                                
            return (
                attribute cost_all_plan  { $cost//column[1] },
                attribute cost_year_plan { $cost//column[2] },
                attribute cost_all_fact  { $cost//column[3] },
                attribute cost_year_fact { $cost//column[4] }
            ),
            
            (: Экономия от реализации программ  :)            
            for $econ in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "2" and entity = $data//entity]                                
            return                          
                element {xs:QName("econ")} {
                     attribute name                     { $econ//column[1]  },
                     attribute measure                  { $econ//column[2]  },
                     attribute all_plan_natur           { $econ//column[3]  },
                     attribute all_plan_tut             { $econ//column[4]  },
                     attribute all_plan_cost            { $econ//columl[5]  },
                     attribute year_plan_natur          { $econ//column[6]  },
                     attribute year_plan_tut            { $econ//column[7]  },
                     attribute year_plan_cost           { $econ//column[8]  },
                     
                     attribute all_fact_natur           { $econ//column[9]  },
                     attribute all_fact_tut             { $econ//column[10]  },
                     attribute all_fact_cost            { $econ//columl[11]  },
                     attribute year_fact_natur          { $econ//column[12]  },
                     attribute year_fact_tut            { $econ//column[13]  },
                     attribute year_fact_cost           { $econ//column[14]  }                             
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
let $flatten := insert-before($flatten, 0, $fin)
let $flatten := insert-before($flatten, 0, $parm)


let $newXML := for $item in $flatten[string-length(@name) > 1]
return $item

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.1.12 maket 1343 - 70127 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70127($doc) {

let $oldXML:=$doc          

  let $parm := for $prm in $oldXML
  return (
       element { xs:QName("param") } {
       attribute version {$prm/@version},
       attribute year {$prm/@year},
       attribute month {$prm/@month},
       attribute day {$prm/@day}       
     }
  )

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 133)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 136] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)
let $flatten:= insert-before($flatten, 0, $parm)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>  
};
 

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.1.13 maket 1344 - 70128 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70128($doc) {   

let $oldXML:=$doc         

let $data := for $strCls in $oldXML//strfree[number(@code) = 1]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strfree") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 133] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
 

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.1.14 maket 1346 - 70129 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70129($doc) {

let $oldXML:=$doc          


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
};
   
(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.1.15 maket 1347 - 70130 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70130($doc) {     

let $oldXML:=$doc         
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

let $fin := for $data in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "1" and string-length(entity) > 1]
    return 
        element { xs:QName("strdata")} {
            attribute name              { $data//entity     },
            attribute code              { number($data/@code) - 100000 },
            attribute measure           { $data//column[1]  },
            attribute vol_tot           { $data//column[2]  },
            attribute vol_year_downto_4 { $data//column[3]  },
            attribute vol_year_downto_3 { $data//column[4]  },
            attribute vol_year_downto_2 { $data//column[5]  },
            attribute vol_year_downto_1 { $data//column[6]  },
            attribute vol_year          { $data//column[7]  },
            attribute vol_year_to_1     { $data//column[8]  },
            attribute vol_year_to_2     { $data//column[9]  },
            attribute vol_year_to_3     { $data//column[10] },
            attribute vol_year_to_4     { $data//column[11] },
            
            for $cost in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "3" and entity = $data//entity]                                
            return (
                attribute cost_year_downto_4 { $cost//column[1] },
                attribute cost_year_downto_3 { $cost//column[2] },
                attribute cost_year_downto_2 { $cost//column[3] },
                attribute cost_year_downto_1 { $cost//column[4] },
                attribute cost_year          { $cost//column[5] },
                attribute cost_year_to_1     { $cost//column[6] },
                attribute cost_year_to_2     { $cost//column[7] },
                attribute cost_year_to_3     { $cost//column[8] },
                attribute cost_year_to_4     { $cost//column[9] },
                attribute pay_section        { $cost//column[10]}                            
            ),                     

            for $pay in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "5" and entity = $data//entity]                                 
            return (
                attribute payback_period { $pay//column[1] },
                attribute vnd            { $pay//column[2] },
                attribute cdd            { $pay//column[3] },
                attribute period         { $pay//column[4] }         
            ),
                      
            (: Экономия от реализации программ  :)            
            for $econ in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "2" and entity = $data//entity]                                
            return 
                element {xs:QName("econ")} {
                     attribute name                     { $econ//column[1]  },
                     attribute measure                  { $econ//column[2]  },
                     attribute econ_natur_tot           { $econ//column[3]  },
                     attribute econ_natur_plan_downto_4 { $econ//column[4]  },
                     attribute econ_tut_plan_downto_4   { $econ//column[5]  },
                     attribute econ_cost_plan_downto_4  { $econ//column[6]  },
                     
                     attribute econ_natur_plan_downto_3 { $econ//column[7]  },
                     attribute econ_tut_plan_downto_3   { $econ//column[8]  },
                     attribute econ_cost_plan_downto_3  { $econ//column[9]  },                     

                     attribute econ_natur_plan_downto_2 { $econ//column[10] },
                     attribute econ_tut_plan_downto_2   { $econ//column[11] },
                     attribute econ_cost_plan_downto_2  { $econ//column[12] },                     

                     attribute econ_natur_plan_downto_1 { $econ//column[13] },
                     attribute econ_tut_plan_downto_1   { $econ//column[14] },
                     attribute econ_cost_plan_downto_1  { $econ//column[15] },
                                          
                     attribute econ_natur_plan          { $econ//column[16] },
                     attribute econ_tut_plan            { $econ//column[17] },
                     attribute econ_cost_plan           { $econ//column[18] }, 

                     attribute econ_natur_plan_to_1     { $econ//column[19] },
                     attribute econ_tut_plan_to_1       { $econ//column[20] },
                     attribute econ_cost_plan_to_1      { $econ//column[21] }, 

                     attribute econ_natur_plan_to_2     { $econ//column[22] },
                     attribute econ_tut_plan_to_2       { $econ//column[23] },
                     attribute econ_cost_plan_to_2      { $econ//column[24] },
                      
                     attribute econ_natur_plan_to_3     { $econ//column[25] },
                     attribute econ_tut_plan_to_3       { $econ//column[26] },
                     attribute econ_cost_plan_to_3      { $econ//column[27] },

                     attribute econ_natur_plan_to_4     { $econ//column[28] },
                     attribute econ_tut_plan_to_4       { $econ//column[29] },
                     attribute econ_cost_plan_to_4      { $econ//column[30] }                                                           
            },
            for $source in $oldXML//strdata//strdetail[substring(@code, 1, 1) = "4" and entity = $data//entity]                                
            return 
                element {xs:QName("source")} {
                    attribute name {$source//column[1]}
            }                     }
  
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
    
            
let $flatten := insert-before($flattenServiceData, 0, $parm) 
let $flatten := insert-before($flatten, 0, $flattenContactData)         
let $flatten := insert-before($flatten, 0, $fin)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.2.1 maket 1348 - 70119 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70119($doc) {     

let $oldXML:=$doc           

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



(:  ============================================== :)
(:  =====   Плановые октябрь 2015/Быков ========== :)
(:  ============================================== :)

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.27 maket 88 - 10188 	 -------------------------------- :)
(: ------------------------------------------------------------------------------ :)
declare function util:pre70158($doc) {

let $oldXML:=$doc          
let $data_01 := for $strCls in $oldXML//strdata[number(@code) >= 1 and number(@code) < 27]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML//strfree[number(@code) >= 27 and number(@code) <= 47]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls//entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_03 := for $strCls in $oldXML//strdata[number(@code) > 47 and number(@code) < 64]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_04 := for $xmlData in (distinct-values($oldXML//strdata[number(@code) >= 64 and number(@code) < 100]//column[2]))
return
        element {xs:QName("strdata02")} {
            attribute name{$xmlData},
            attribute code{""},
            attribute id{substring($xmlData, 8, 1)},
            attribute measure {""},
            attribute formula {""},
            attribute val{""},
            
            for $str in $oldXML//strdata[string(column[2]) = string($xmlData)]
                let $cnt := 0
                return (
                   
                    element {xs:QName("strdata02")} {
                      attribute name{$str/@name},    
                      attribute code{$str/@code - 63},                  
                      attribute id{concat(substring(string($xmlData), 8, 2), string(number($str/@code)-63))},
                      attribute measure{$str//column[1]},
                      attribute formula{$str//column[3]},
                      attribute val{$str//column[4]}
                  }  
             )                     
                                 
        }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 133] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }


let $Preflatten := $data_04
let $newXML := for $item in $Preflatten
return <document version="1.0" created="create_xml_online"><flat>{$item}</flat></document>

let $outData_02 := for $items in $newXML//flat//strdata02
    return
              element {xs:QName    ("strdata_02") } {
                  attribute id {$items/@id},
                  attribute name {$items/@name},
                  attribute measure {$items/@measure},
                  attribute formula {$items/@formula},
                  attribute code {$items/@code},
                  attribute val{$items/@val} 
              }

let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $outData_02)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML01 := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML01}</flat></document> 
}; 
 
(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.2.4 maket 1355 - 70122 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre71001($doc) {
let $oldXML := $doc  

(: Параметры запуска :)

let $parm := for $prm in $oldXML
  return (
       element { xs:QName("param") } {
       attribute id { "0" },
       attribute name {"params"},  
       attribute version {$prm/@version},
       attribute year {$prm/@year},
       attribute month {$prm/@month},
       attribute day {$prm/@day}       
     }
) 
  
let $flattenPart0 :=  element {xs:QName("strdata") }{   
                         attribute id {"0"},
                         attribute name {"Целевые показатели, установленные из перечня целевых показателей в области энергосбережения и повышения энергетической эффективности согласно постановлению Правительства Российской Федерации от 31 декабря 2009 г. N 1225"}}
                         
let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(number(@code)=1 
                                                                                   or number(@code)=2
                                                                                   or number(@code)=3
                                                                                   or number(@code)=4
                                                                                   or number(@code)=5)
                                                                  ]/@name),distinct-values($oldXML//strclass[
                                                                        (	number(@code)>=100001 
                                                                       and number(@code)<=100006)
                                                                    or  (	number(@code)>=200001 
                                                                       and number(@code)<=200007)
                                                                    or  (	number(@code)>=300001 
                                                                       and number(@code)<=300007)
                                                                    or  (	number(@code)>=400001 
                                                                       and number(@code)<=400008)
                                                                    or  (	number(@code)>=500001 
                                                                       and number(@code)<=500005)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                (for $c in $oldXML//strdetail[column[2]/text() = $strCls]
                   return
                     element {xs:QName("child") }{   
                         attribute nameInd {$c/entity/text()},
                         (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
              }

 let $flattenPart2 :=  element {xs:QName("strdata") }{   
                         attribute id {"6"},
                         attribute name {"Иные целевые показатели в области энергосбережения и повышения энергетической эффективности, определенные органом местного самоуправления при разработке муниципальной программы в области энергосбережения и повышения энергетической эффективности"}}
                         

 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(number(@code)=20)
                                                                  ]/@name),
                                                                  distinct-values($oldXML//strdetail[
                                                                 (number(@code)>=2000001 
                                                                and number(@code)<=2000500)]/entity/text()))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat("7",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat("7",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdetail[entity = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                ),
                (for $c in $oldXML//strdetail[column[2]/text() = $strCls]
                   return
                     element {xs:QName("child") }{   
                         attribute nameInd {$c/entity/text()},
                         (for $column in $c/column
                           return
                           attribute {xs:QName(concat("col",string($column/@order)))}{
                                $column/text()
                              }
                          )
                     }
                )
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] (:Контактная информация:)
              let $columns:=$strCls/column
              return
              element {xs:QName("strContactInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                attribute id { "0" },                
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $flattenServiceData:=
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=133] (:Служебная информация:)
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                attribute id { "0" },                
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order))) }{
                      $c/text()
                    }                    
                )
              }
              
let $flatten:= insert-before($flattenPart3,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart1)
let $flatten:= insert-before($flatten,0,$flattenPart0)

let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
let $flatten:= insert-before($flatten, 0, $parm)

let $newXML:= for $item in $flatten[@id != 720]
              order by $item/@id
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};



(: ------------------------------------------------------------------------------ :)
(: --------------------- 3.11 maket 1197 - 30060 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre71005($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 119 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code) = 119 or number(@code)=120] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 126] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.131 maket 1186 - 71001 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre71001/71001/action=xml&aid=1184&mid=2&period_year=2014&period_month=12&period_day=0&subject=45
:)

declare function util:pre71014($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 136)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 136] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.6 maket 1185 - 71015 	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre71015/71015/action=xml&aid=1185&mid=5&period_year=2015&period_month=12&period_day=0&subject=6006&subject_variant=&type=1&user=8
:)

declare function util:pre71015($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 136)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 136] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.7 maket 1185 - 71016 	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre71016/71016/action=xml&aid=1185&mid=4639&period_year=2015&period_day=0&subject=6001
:)

declare function util:pre71016($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 136)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 136] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.8 maket 1185 - 71017 	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre71017/71017/action=xml&aid=1185&mid=6962&period_year=2015&period_day=0&subject=6012
:)

declare function util:pre71017($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 136)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 136] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.9 maket 1185 - 71018 	 ------------------------------- :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre71017/71017/action=xml&aid=1185&mid=6962&period_year=2015&period_day=0&subject=6012
:)

declare function util:pre71018($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 136)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 136] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};


(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.22 maket 1185 - 71020 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre71020/71020/action=xml&aid=1185&mid=360&period_year=2014&period_day=0&subject=6000
:)

declare function util:pre71020($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 

};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.23 maket 1185 - 71021 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)


(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre71021/71021/action=xml&aid=1185&mid=2677&period_year=2014&period_day=0&subject=6012
:)

declare function util:pre71021($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 

};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.24 maket 1185 - 71022 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)


(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre71022/71022/action=xml&aid=1185&mid=4994&period_year=2014&period_day=0&subject=6004
:)

declare function util:pre71022($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 

};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.25 maket 1185 - 71023 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)


(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre71023/71023/action=xml&aid=1185&mid=7317&period_year=2014&period_day=0&subject=6001
:)

declare function util:pre71023($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 

};



(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.34 maket 1123 - 70011 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre70011/70011/action=xml&aid=1123&mid=1&period_day=0&subject=6012&subject_variant=604
:)

declare function util:pre72024($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.35 maket 1189 - 72025 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre72025/72025/action=xml&aid=1189&mid=972&period_year=2014&period_day=0&subject=6002
:)

declare function util:pre72025($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.36 maket 1189 - 72026 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre72026/72026/action=xml&aid=1189&mid=1226&period_year=2014&period_day=0&subject=6141
:)

declare function util:pre72026($doc) {
let $oldXML := $doc  

let $data := for $strCls in $oldXML//strdata[(number(@code) < 111 or number(@code) > 112) and (number(@code) < 121 or number(@code) > 132)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};

(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.131 maket 1186 - 71005 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

(:   test link
http://saiku0.gistek.rosenergo.gov.ru/BaseX/xslt/pre71005/71005/action=xml&aid=1186&mid=2&period_year=2014&period_day=0&subject=77000000
:)

declare function util:pre90002($doc) {let $oldXML := $doc  
  let $oldXML:=fn:doc("864018_90002.xml")/*  
  
                         
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[
                                                                        (	number(@code)>=10 
                                                                       and number(@code)<=51)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata")} {
               (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                
              }



             
 let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[
                                                                        (	number(@code)=111
                                                                       or number(@code)=112)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                
              }
              
 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[
                                                                        (	number(@code)>=121
                                                                       and number(@code)<=133)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                )
                ,
               attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                
              }              

let $flatten:= insert-before($flattenPart2,0,$flattenPart1)
let $flatten:= insert-before($flattenPart3,0,$flatten)

let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};declare function util:pre90003($doc) {let $oldXML := $doc  
  let $oldXML:=fn:doc("338707_90003.xml")/*  
  
                         
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[
                                                                        (	number(@code)>=10 
                                                                       and number(@code)<=83)
                                                                  ]/@name))
              return 
              element {xs:QName("strdata")} {
                (
                  for $str in $oldXML//strclass[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                
              }



             
 let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[
                                                                        (	number(@code)=111
                                                                       or number(@code)=112)
                                                                  ]/@name))
              return 
              element {xs:QName("strcontact")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code + 100}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                
              }
              
 let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[
                                                                        (	number(@code)>=121
                                                                       and number(@code)<=133)
                                                                  ]/@name))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                )
                ,
               attribute name {$strCls},                
                (
                  for $str in $oldXML//strdata[string(@name) = $strCls]
                  let $columns:=$str/column
                  return
                    (for $c in $columns
                       return
                       attribute {xs:QName(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )
                
              }              

let $flatten:= insert-before($flattenPart2,0,$flattenPart1)
let $flatten:= insert-before($flattenPart3,0,$flatten)

let $newXML:= for $item in $flatten
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

};declare function util:pre90004($doc) {let $oldXML := $doc

let $data_01 := for $strCls in $oldXML//strdata[(number(@code) >= 1 and number(@code) <= 17)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_02 := for $strCls in $oldXML//strdata[(number(@code) >= 20 and number(@code) <= 40)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_03 := for $strCls in $oldXML//strdata[(number(@code) >= 50 and number(@code) <= 59)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_04 := for $strCls in $oldXML//strdata[(number(@code) >= 60 and number(@code) <= 65)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_05 := for $strCls in $oldXML//strdata[(number(@code) >= 70 and number(@code) <= 75)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_05") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_06 := for $strCls in $oldXML//strdata[(number(@code) >= 80 and number(@code) <= 87)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_06") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_07 := for $strCls in $oldXML//strdata[(number(@code) >= 90 and number(@code) <= 92)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_07") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_08 := for $strCls in $oldXML//strdata[(number(@code) >= 100 and number(@code) <= 105)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_08") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_09 := for $strCls in $oldXML//strdata[(number(@code) >= 111 and number(@code) <= 114)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_09") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $data_10 := for $strCls in $oldXML//strdata[(number(@code) >= 120 and number(@code) <= 124)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_10") } {
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=211 or number(@code)=212] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 221 and number(@code) <= 233] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_01)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_04)
let $flatten:= insert-before($flatten, 0, $data_05)
let $flatten:= insert-before($flatten, 0, $data_06)
let $flatten:= insert-before($flatten, 0, $data_07)
let $flatten:= insert-before($flatten, 0, $data_08)
let $flatten:= insert-before($flatten, 0, $data_09)
let $flatten:= insert-before($flatten, 0, $data_10)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>  };(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.31 maket 1606 - 91831 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)
declare function util:pre91831($doc1, $doc2) { 

let $oldXML := $doc2
let $oldXML_2 := $doc1

let $data_tb1 := for $strData in$oldXML_2//strdata[number(@code)<20]
  return (
    element {(xs:QName("strData1"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
        return element {(xs:QName("strData1"))} {
          attribute name { $strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
  )  
  
let $data_tb2 := for $strData in $oldXML_2//strdata[number(@code)>=20 and number(@code)<30]
  return (
    element {(xs:QName("strData2"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
        return element {(xs:QName("strData2"))} {
          attribute name { $strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
    
  ) 

let $data_tb3 := for $strData in $oldXML_2//strdata[number(@code)>=30 and number(@code)<40]
  return (
    element {(xs:QName("strData3"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
        return element {(xs:QName("strData3"))} {
          attribute name { $strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
    
  )
  
let $data_tb4 := for $strData in $oldXML_2//strdata[number(@code)>=40 and number(@code)<50]
  return (
    element {(xs:QName("strData4"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
        return element {(xs:QName("strData4"))} {
          attribute name { $strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
    
  )
  
let $data_tb5 := for $strData in $oldXML_2//strdata[number(@code)>=50 and number(@code)<60]
  return (
    element {(xs:QName("strData5"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
        return element {(xs:QName("strData5"))} {
          attribute name { $strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
    
  )
  
let $data_tb6 := for $strData in $oldXML_2//strdata[number(@code)>=60 and number(@code)<100]
  return (
    element {(xs:QName("strData6"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
        return element {(xs:QName("strData6"))} {
          attribute name { $strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
    
  )
  
let $data_tb7 := for $strData in $oldXML//strdata[number(@code)<100]
  return (
    element {(xs:QName("strData7"))} {
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
        return element {(xs:QName("strData7"))} {
          attribute name { $strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
    
  )
(:
let $data_tb1 := for $strData in $oldXML//strdata[number(@code)<111 or number(@code)>140]

let $full_name := $strData/@name
let $num := 
  (for $str in tokenize($full_name, '.\s')
    return $str)[position()=1]
let $name := replace($full_name, concat('.\s', $num), '')

  return (
    element {(xs:QName("strData1"))} {
      attribute num {$num},
      attribute name {$name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    },(
      for $strClass in $strData/strdetail
        return element {(xs:QName("strData1"))} {
          attribute num { ''},
          attribute name { $strClass/@name},
          attribute code { $strClass/@code},
          (
            for $column in $strClass/column
              return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
          )
        }
    )
    
  )    
:)
     
(:Раздел 3. Контактная информация:)
let $contact := for $strData in $oldXML//strdata[number(@code)=111 or number(@code)=112]
  return (
    element {xs:QName('strContact')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )
  
(:Служебные поля:)
let $service := for $strData in $oldXML//strdata[number(@code)>120 and number(@code)<140]
  return (
    element {xs:QName('strService')}{
      attribute name {$strData/@name},
      attribute code {$strData/@code},
      (
        for $column in $strData/column
          return attribute {xs:QName(concat("col", string($column/@order)))}{$column/text()}
      )
    }
  )

let $tables := insert-before($data_tb1, 0,$data_tb2)
let $tables := insert-before($tables, 0,$data_tb3)
let $tables := insert-before($tables, 0,$data_tb4)
let $tables := insert-before($tables, 0,$data_tb5)
let $tables := insert-before($tables, 0,$data_tb6)
let $tables := insert-before($tables, 0,$data_tb7)
let $tables := insert-before($tables, 0, $contact)
let $tables := insert-before($tables, 0, $service)

let $newXML := $tables

return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};

declare function util:pre20146($doc) {
 
let $oldXML := $doc  
  let $parm := for $prm in $oldXML
  return (
       element { xs:QName("param") } {
       attribute version {$prm/@version},
       attribute year {$prm/@year},
       attribute month {$prm/@month},
       attribute day {$prm/@day}       
     }
  )
  
let $data_01 := for $strCls in $oldXML//strfree[number(@code) >= 1 and number(@code) <= 50]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 

let $data_02 := for $strCls in $oldXML//strfree[number(@code) >= 100 and number(@code) <= 150]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 

let $data_03 := for $strCls in $oldXML//strfree[number(@code) >= 200 and number(@code) <= 250]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 

let $data_04 := for $strCls in $oldXML//strfree[number(@code) >= 300 and number(@code) <= 350]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 



let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $parm)
let $flatten:= insert-before($flatten, 0, $data_04)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
                
};
(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.10 maket 91 - 10194 ---------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10194($doc) { 
let $oldXML := $doc
 

  let $data := for $strData in $oldXML//strdata[(number(@code) >= 1 and number(@code) <= 1000) and (number(@code) != 211) and (number(@code)!=212) 
  and (number(@code)!=221)
  and (number(@code)!=222)
  and (number(@code)!=223)
  and (number(@code)!=224)
  and (number(@code)!=225)
  and (number(@code)!=226)
  and (number(@code)!=227)
  and (number(@code)!=228)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_01") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_01")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - 100000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=211 or number(@code)=212] 
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
              for $strCls in $oldXML//strdata[number(@code)>=221 and number(@code)<=232] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
  let $columnNames:=distinct-values($oldXML//column/@order)

  
let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
}; 

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.29 maket 1019 - 10402 ---------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10402($doc) {
 
let $oldXML := $doc  
              
let $data_01 := for $strCls in $oldXML//strdata[(number(@code) >= 1) and (number(@code) <= 16)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_01") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 


let $data_02 := for $strCls in $oldXML//strdata[(number(@code) >= 20) and (number(@code) <= 23)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_02") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 


let $data_03 := for $strCls in $oldXML//strdata[(number(@code) = 30)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_03") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 

let $data_04 := for $strCls in $oldXML//strdata[(number(@code) >= 40) and (number(@code) <= 42)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_04") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              } 
              
              
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code) = 111 or number(@code) = 112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_04)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_01)

let $newXML := for $item in $flatten
              return $item
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
}; 

(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.29 maket 1019 - 10408 -------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10408($doc) {
 
let $oldXML := $doc  
              
let $data_05 := for $strCls in $oldXML//strfree[number(@code) >= 1 and number(@code) <= 100]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_05") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }                
              
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code) = 111 or number(@code) = 112] 
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $data_05)

let $newXML := for $item in $flatten
              return $item
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>  
}; 