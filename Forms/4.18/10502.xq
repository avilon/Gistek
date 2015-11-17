let $oldXML:=fn:doc("338514_10502.xml")/*  
  
                        
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