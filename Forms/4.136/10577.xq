let $oldXML:=fn:doc("338517_10577.xml")/*  
  
                        
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
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>