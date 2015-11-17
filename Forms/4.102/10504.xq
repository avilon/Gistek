let $oldXML:=fn:doc("338512_10504.xml")/*  
  
                        
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
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>