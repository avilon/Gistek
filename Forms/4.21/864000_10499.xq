  
  let $oldXML:=fn:doc("864000_10499.xml")/*  
  let $oldXML2:=fn:doc("864000_10498.xml")/*  
  
 (:-------------------------------10499-----------------------------------------------------------------------------:)                  
 let $flattenPart1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=10
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1")} {
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
 (:----------------------------------------------------------------------------------------------------------:)            
         let $flattenPart_1_1 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=11
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1.1")} {
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
 (:----------------------------------------------------------------------------------------------------------:)     
    let $flattenPart_1_2 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=12
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1.2")} {
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
 (:----------------------------------------------------------------------------------------------------------:)   
   let $flattenPart_1_3 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=13
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1.3")} {
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
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart_1_5_detail :=  for $strCls in (
                                                                  distinct-values($oldXML//strdetail[
                                                                 (	number(@code)>=2100001 
                                                                and number(@code)<=2100026)]//entity/text()))
              return 
              element {xs:QName("strdata_1.5_detail")} {
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
                )
              }
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart_1_5_data :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=21
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1.5_data")} {
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
 (:----------------------------------------------------------------------------------------------------------:) 
  let $flattenPart_1_6:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=22
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1.6")} {
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
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_1_7:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=23
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_1.7")} {
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
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_2_0:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=30
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.0")} {
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
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_2_1:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=31
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.1")} {
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
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_2_2:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=32
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.2")} {
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
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_2_3:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=33
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.3")} {
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
 (:----------------------------------------------------------------------------------------------------------:)
   let $flattenPart_2_5_detail :=  for $strCls in (
                                                                  distinct-values($oldXML//strdetail[
                                                                 (	number(@code)>=4100001 
                                                                and number(@code)<=4100026)]//entity/text()))
              return 
              element {xs:QName("strdata_2.5_detail")} {
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
                )
              }
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart_2_5_data :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=41
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.5_data")} {
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
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart_2_6:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=42
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.6")} {
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
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_4:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=4
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_4")} {
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
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart_5:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=5
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_5")} {
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
 (:----------------------------------------------------------------------------------------------------------:)
 
   let $flattenPart_2_7:=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=43
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata_2.7")} {
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
 (:----------------------------------------------------------------------------------------------------------:)
 
let $flattenPart6 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)=111
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
             
let $flattenPart7 :=  for $strCls in (distinct-values($oldXML//strdata[(	number(@code)>=171
                                                                      and number(@code)<=181)
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

(:-------------------------------------end 10499----------------------------------------------------------------------------:)



 (:-------------------------------10498-----------------------------------------------------------------------------:)                  
 let $flattenPart10498_1 :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=10
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_1")} {
                (
                  for $str in $oldXML2//strdasta[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
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
 (:----------------------------------------------------------------------------------------------------------:)            
     (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_1_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=1100001 
                                                                and number(@code)<=1100026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_1.1_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
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
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_1_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=11
                                                                    )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_1.1_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
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
 (:----------------------------------------------------------------------------------------------------------:)
    (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_2_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=1200001 
                                                                and number(@code)<=1200001)]//entity/text()))
              return 
              element {xs:QName("strdata10498_1.2_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
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
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_2_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=12
                                                                    )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_1.2_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
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
 (:----------------------------------------------------------------------------------------------------------:)
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_3_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=2100001 
                                                                and number(@code)<=2100026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_1.3_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
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
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_3_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=21
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_1.3_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
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
  (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_4_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=2200001 
                                                                and number(@code)<=2200026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_1.4_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
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
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_1_4_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=22
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_1.4_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
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
 (:----------------------------------------------------------------------------------------------------------:) 
 
  let $flattenPart10498_2_0:=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=30
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_2")} {
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
 (:----------------------------------------------------------------------------------------------------------:)
 
 
  (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_1_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=3100001 
                                                                and number(@code)<=3100026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_2.1_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
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
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_1_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=31
                                                                    )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_2.1_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
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
 (:----------------------------------------------------------------------------------------------------------:) 
 
  (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_2_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=3200001 
                                                                and number(@code)<=3200026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_2.2_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
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
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_2_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=32
                                                                    )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_2.2_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
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
 (:----------------------------------------------------------------------------------------------------------:) 
 
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_3_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=4100001 
                                                                and number(@code)<=4100026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_2.3_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
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
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_3_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=41
                                                                    )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_2.3_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
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
 (:----------------------------------------------------------------------------------------------------------:)
  (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_4_detail :=  for $strCls in (
                                                                  distinct-values($oldXML2//strdetail[
                                                                 (	number(@code)>=4200001 
                                                                and number(@code)<=4200026)]//entity/text()))
              return 
              element {xs:QName("strdata10498_2.4_detail")} {
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                (
                  for $str in $oldXML2//strdetail[string(@name) = $strCls]                  
                  return
                    (
                      attribute id {concat(" ",$str/@code)}
                    )
                ),
                attribute name {$strCls},                
                (
                  for $str in $oldXML2//strdetail[entity = $strCls]
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
 (:----------------------------------------------------------------------------------------------------------:) 
   let $flattenPart10498_2_4_data :=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=42
                                                                    )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_2.4_data")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
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
  
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart10498_4:=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=4
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_4")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
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
 (:----------------------------------------------------------------------------------------------------------:)
  let $flattenPart10498_5:=  for $strCls in (distinct-values($oldXML2//strdata[(	number(@code)=5
                                                                     )
                                                                  ]/@code))
              return 
              element {xs:QName("strdata10498_5")} {
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute id {$str/@code}
                    )
                ),
                (
                  for $str in $oldXML2//strdata[string(@code) = $strCls]                  
                  return
                    (
                      attribute name {$str/@name}
                    )
                ),
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

(:-----------------------------------------------------------------------------------------------------------------:)

let $flatten:=$flattenPart10498_5
let $flatten:= insert-before($flatten,0,$flattenPart10498_4)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_4_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_4_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_3_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_3_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_2_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_2_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_1_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_1_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_2_0)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_4_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_4_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_3_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_3_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_2_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_2_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_1_data)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1_1_detail)
let $flatten:= insert-before($flatten,0,$flattenPart10498_1)

let $flatten:= insert-before($flatten,0,$flattenPart7)
let $flatten:= insert-before($flatten,0,$flattenPart6)
let $flatten:= insert-before($flatten,0,$flattenPart_5)
let $flatten:= insert-before($flatten,0,$flattenPart_4)
let $flatten:= insert-before($flatten,0,$flattenPart_2_7)
let $flatten:= insert-before($flatten,0,$flattenPart_2_6)
let $flatten:= insert-before($flatten,0,$flattenPart_2_5_detail)
let $flatten:= insert-before($flatten,0,$flattenPart_2_5_data)
let $flatten:= insert-before($flatten,0,$flattenPart_2_3)
let $flatten:= insert-before($flatten,0,$flattenPart_2_2)
let $flatten:= insert-before($flatten,0,$flattenPart_2_1)
let $flatten:= insert-before($flatten,0,$flattenPart_2_0)
let $flatten:= insert-before($flatten,0,$flattenPart_1_7)
let $flatten:= insert-before($flatten,0,$flattenPart_1_6)
let $flatten:= insert-before($flatten,0,$flattenPart_1_5_detail)
let $flatten:= insert-before($flatten,0,$flattenPart_1_5_data)
let $flatten:= insert-before($flatten,0,$flattenPart_1_3)
let $flatten:= insert-before($flatten,0,$flattenPart_1_2)
let $flatten:= insert-before($flatten,0,$flattenPart_1_1)
let $flatten:= insert-before($flatten,0,$flattenPart1)

let $newXML:= for $item in $flatten   
          
              return $item
              
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>

