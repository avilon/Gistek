let $oldXML:=fn:doc("900000_52075.xml")/* 


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