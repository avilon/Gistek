let $oldXML1:=fn:doc("3088_10471.xml")/*  
let $oldXML2:=fn:doc("3088_10472.xml")/*    
let $oldXML3:=fn:doc("3088_10473.xml")/*  
let $oldXML4:=fn:doc("3088_10474.xml")/*  
let $oldXML5:=fn:doc("3088_10475.xml")/*  
let $oldXML6:=fn:doc("3088_10476.xml")/*  
let $oldXML7:=fn:doc("3088_10477.xml")/*  
let $oldXML8:=fn:doc("3088_10478.xml")/*  
let $oldXML9:=fn:doc("3088_10479.xml")/*                          
let $oldXML0:=fn:doc("3088_10480.xml")/*                          
                        
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
              
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>