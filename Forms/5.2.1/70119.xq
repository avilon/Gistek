(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.2.1 maket 1348 - 70119 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70119($doc) { 

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
