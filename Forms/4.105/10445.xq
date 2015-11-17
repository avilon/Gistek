let $oldXML:=fn:doc("900000_10445.xml")/* 
let $rer:=$oldXML//document
let $flattenPart0 := element {xs:QName("str")} {attribute year {$rer}}
             
let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=1 
                                                                       and number(@code)<=10
                                                                       or number(@code)=100
                                                                       or number(@code)=21
                                                                       or number(@code)=51
                                                                       or number(@code)=52
                                                                       or number(@code)=110
                                                                       or number(@code)=120
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
  
let $flattenPart2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=101 
                                                                       or number(@code)=102
                                                                       or number(@code)=103
                                                                       or number(@code)=201
                                                                       or number(@code)=211
                                                                       or number(@code)=212
                                                                     )]/@name))
              return 
              element {xs:QName("strdata2")} {
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
             
let $flattenPart22 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=121 and number(@code)<=132)
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
let $flatten:= insert-before($flatten,0,$flattenPart2) 
let $flatten:= insert-before($flatten,0,$flattenPart1) 
let $flatten:= insert-before($flatten,0,$flattenPart0)

let $newXML:= for $item in $flatten return $item              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>             