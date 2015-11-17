let $oldXML1:=fn:doc("338514_10531.xml")/*  
let $oldXML2:=fn:doc("338517_10533_65.xml")/*  
let $oldXML3:=fn:doc("338517_10535_65.xml")/*  

let $flattenPart1 :=  for $strCls in (distinct-values($oldXML1//strdata[(	number(@code)=10)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata1")} {
                (
                  for $str in $oldXML1//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                (
                  for $str in $oldXML1//strdata[string(@code) = $strCls]
                  let $columns:=$str/column[(	number(@id)=94)]
                  return
                    (for $c in $columns
                       return
                       attribute ed {replace($c/@name,"Факт нарастающим итогом с начала месяца, ","")}
                     )
                ),
                (
                  for $str in $oldXML1//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
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

let $flattenPart2 :=  for $strCls in (distinct-values($oldXML1//strdetail[(	number(@code)>=1000001
                                                                         and number(@code)<=1000050)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata1")} {
                (
                  for $str in $oldXML1//strdetail[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                (
                  for $str in $oldXML1//strdetail[string(@code) = $strCls]                  
                  return
                   (for $c in $str//column[(	number(@id)=94)]/@name
                       return
                       attribute ed {replace($c,"Факт нарастающим итогом с начала месяца, ","")}
                     )
                ),                
                (
                  for $str in $oldXML1//strdetail[string(@code) = $strCls]/entity                 
                  return
                    ( attribute name {$str})),
                (
                  for $str in $oldXML1//strdetail[string(@code) = $strCls]
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

let $flattenPart3 :=  for $strCls in (distinct-values($oldXML1//strdata[(	number(@code)=110
                                                                        or number(@code)=120
                                                                        or number(@code)=220
                                                                        or number(@code)=230
                                                                        or number(@code)=240
                                                                        or number(@code)=250)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata1")} {
                (
                  for $str in $oldXML1//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                (
                  for $str in $oldXML1//strdata[string(@code) = $strCls]                  
                  return
                   (for $c in $str//column[(	number(@id)=94)]/@name
                       return
                       attribute ed {replace($c,"Факт нарастающим итогом с начала месяца, ","")}
                     )
                ),
                (
                  for $str in $oldXML1//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
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
let $flattenPart4 :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=10)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata2")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                attribute np{"1"},
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return

                       attribute ed {replace($str/@name,"1. Потребление электрической энергии, всего, ","")}
             
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
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
let $flattenPart5 :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=20)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata2")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                       attribute np{"2"},
                       attribute ed {""},                       
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
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

let $flattenPart6 :=  for $strCls in (distinct-values($oldXML2//strclass[(	number(@code)>=2000001
                                                                        or number(@code)<=2000099)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata2")} {
                (
                  for $str in $oldXML2//strclass[string(@code) = $strCls]                  
                  return
                    attribute id {$str/@code}
                ),
                    attribute np{""},                
                    attribute ed {""},
                (
                  for $str in $oldXML2//strclass[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
                (
                  for $str in $oldXML2//strclass[string(@code) = $strCls]
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
                        
let $flattenPart7 :=  for $strCls in (distinct-values($oldXML3//strdata[(	number(@code)=1)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                      attribute np {"1"},
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                   let $columns:=$str/column
                  return

                   (for $c in $str//column[(	number(@id)=11051)]/@name
                       return
                       attribute ed {replace($c,"Факт за месяц, ","")}
                     )
                ),                 
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]
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
              
let $flattenPart8 :=  for $strCls in (distinct-values($oldXML3//strdata[(	number(@code)=2)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                      attribute np {"1.1"},
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                   let $columns:=$str/column
                  return

                   (for $c in $str//column[(	number(@id)=11051)]/@name
                       return
                       attribute ed {replace($c,"Факт за месяц, ","")}
                     )
                ),  
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]
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
                            
let $flattenPart9 :=  for $strCls in (distinct-values($oldXML3//strdata[(	number(@code)>=201
                                                                       and number(@code)<=220)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute np {concat("1.1.",(string($str/@code -200)))}
                ),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                   let $columns:=$str/column
                  return

                   (for $c in $str//column[(	number(@id)=11051)]/@name
                       return
                       attribute ed {replace($c,"Факт за месяц, ","")}
                     )
                ),  
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {concat("    ",$str/@name)})),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]
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

let $flattenPart10 :=  for $strCls in (distinct-values($oldXML3//strdata[(	number(@code)=3)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                      attribute np {"2"},
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                   let $columns:=$str/column
                  return

                   (for $c in $str//column[(	number(@id)=11051)]/@name
                       return
                       attribute ed {replace($c,"Факт за месяц, ","")}
                     )
                ),  
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]
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
              
let $flattenPart11 :=  for $strCls in (distinct-values($oldXML3//strdata[(	number(@code)>=301
                                                                       and number(@code)<=320)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute np {concat("2.",string($str/@code -300))}
                ),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                   let $columns:=$str/column
                  return

                   (for $c in $str//column[(	number(@id)=11051)]/@name
                       return
                       attribute ed {replace($c,"Факт за месяц, ","")}
                     )
                ),  
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {concat("    ",$str/@name)})),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]
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
              
let $flattenPart12 :=  for $strCls in (distinct-values($oldXML3//strdata[(	number(@code)=4)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                      attribute np {"3"},
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                   let $columns:=$str/column
                  return

                   (for $c in $str//column[(	number(@id)=11051)]/@name
                       return
                       attribute ed {replace($c,"Факт за месяц, ","")}
                     )
                ),  
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]
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
let $flattenPart13 :=  for $strCls in (distinct-values($oldXML3//strdata[(	number(@code)=5)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                      attribute np {"3.1"},
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                   let $columns:=$str/column
                  return

                   (for $c in $str//column[(	number(@id)=11051)]/@name
                       return
                       attribute ed {replace($c,"Факт за месяц, ","")}
                     )
                ),  
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]
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
let $flattenPart14 :=  for $strCls in (distinct-values($oldXML3//strdata[(	number(@code)>=501
                                                                       and number(@code)<=520)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute np {concat("3.1.",string($str/@code -500))}
                ),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                   let $columns:=$str/column
                  return

                   (for $c in $str//column[(	number(@id)=11051)]/@name
                       return
                       attribute ed {replace($c,"Факт за месяц, ","")}
                     )
                ),  
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {concat("    ",$str/@name)})),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]
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
              
let $flattenPart15 :=  for $strCls in (distinct-values($oldXML3//strdata[(	number(@code)=6)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                      attribute np {"4"},
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                   let $columns:=$str/column
                  return

                   (for $c in $str//column[(	number(@id)=11051)]/@name
                       return
                       attribute ed {replace($c,"Факт за месяц, ","")}
                     )
                ),  
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]
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

let $flattenPart16 :=  for $strCls in (distinct-values($oldXML3//strdata[(	number(@code)=7)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                      attribute np {"4.1"},
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                   let $columns:=$str/column
                  return

                   (for $c in $str//column[(	number(@id)=11051)]/@name
                       return
                       attribute ed {replace($c,"Факт за месяц, ","")}
                     )
                ),  
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]
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
let $flattenPart17 :=  for $strCls in (distinct-values($oldXML3//strdata[(	number(@code)=8)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                      attribute np {"4.2"},
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                   let $columns:=$str/column
                  return

                   (for $c in $str//column[(	number(@id)=11051)]/@name
                       return
                       attribute ed {replace($c,"Факт за месяц, ","")}
                     )
                ),  
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]
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
let $flattenPart18 :=  for $strCls in (distinct-values($oldXML3//strdata[(	number(@code)=9)
                                                                  ]/@code))
              return 
              element {xs:QName("strdata3")} {
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                      attribute id {$str/@code}
                ),
                      attribute np {"4.3"},
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                   let $columns:=$str/column
                  return

                   (for $c in $str//column[(	number(@id)=11051)]/@name
                       return
                       attribute ed {replace($c,"Факт за месяц, ","")}
                     )
                ),  
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]
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
              
              
let $flattenPart21 :=  for $strCls in (distinct-values($oldXML1//strdata[(	number(@code)=111
                                                                         or number(@code)=112)
                                                                  ]/@code))
              return 
              element {xs:QName("strcontact")} {
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
                      attribute name {$str/@name}
                    )
                ),                
                (
                  for $str in $oldXML1//strdata[string(@code) = $strCls]
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
             
let $flattenPart22 :=  for $strCls in (distinct-values($oldXML1//strdata[(	number(@code)>=121
                                                                        and number(@code)<=132)
                                                                  ]/@code))
              return 
              element {xs:QName("strsubject")} {
                (
                  for $str in $oldXML1//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML3//strdata[string(@code) = $strCls]                  
                  return
                    ( attribute name {$str/@name})),                
                (
                  for $str in $oldXML1//strdata[string(@code) = $strCls]
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
let $flatten:= insert-before($flatten,0,$flattenPart18)
let $flatten:= insert-before($flatten,0,$flattenPart17)
let $flatten:= insert-before($flatten,0,$flattenPart16)
let $flatten:= insert-before($flatten,0,$flattenPart15)
let $flatten:= insert-before($flatten,0,$flattenPart14) 
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
let $newXML:= for $item in $flatten
              return $item              
              
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>