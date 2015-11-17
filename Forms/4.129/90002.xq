  
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

