  
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

