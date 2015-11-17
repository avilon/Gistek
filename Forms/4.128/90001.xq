let $oldXML:=fn:doc("339700_90001.xml")/* 

let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=1)]/@code))
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
                       attribute {(concat("col",string($c/@order)))}{
                            $c/text()
                          }
                     )
                )                           
             }
  
let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=2)]/@code),
                                      distinct-values($oldXML//strdetail[(	number(@code)>=200001
                                                                        and number(@code)<=200031)]/@code))
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
  
let $flattenPart3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=3)]/@code),
                                      distinct-values($oldXML//strdetail[(	number(@code)>=300001
                                                                        and number(@code)<=300201)]/@code))
              return 
              element {xs:QName("strdata3")} {
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
  
let $flattenPart4 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=4)]/@code),
                                      distinct-values($oldXML//strdetail[(	number(@code)>=400001
                                                                        and number(@code)<=400021)]/@code))
              return 
              element {xs:QName("strdata4")} {
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
  
  let $flattenPart5 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=5)]/@code),
                                      distinct-values($oldXML//strdetail[(	number(@code)>=500001
                                                                        and number(@code)<=500051)]/@code))
              return 
              element {xs:QName("strdata5")} {
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
             
let $flattenPart22 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=121 and number(@code)<=133)
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
let $flatten:= insert-before($flatten,0,$flattenPart5) 
let $flatten:= insert-before($flatten,0,$flattenPart4) 
let $flatten:= insert-before($flatten,0,$flattenPart3) 
let $flatten:= insert-before($flatten,0,$flattenPart2) 
let $flatten:= insert-before($flatten,0,$flattenPart1) 

let $newXML:= for $item in $flatten return $item              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>             