(: ------------------------------------------------------------------------------ :)
(: --------------------- 4.10 maket 91 - 10194 ---------------------------------- :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre10194($doc) { 
let $oldXML := $doc
 

  let $data := for $strData in $oldXML//strdata[(number(@code) >= 1 and number(@code) <= 1000) and (number(@code) != 211) and (number(@code)!=212) 
  and (number(@code)!=221)
  and (number(@code)!=222)
  and (number(@code)!=223)
  and (number(@code)!=224)
  and (number(@code)!=225)
  and (number(@code)!=226)
  and (number(@code)!=227)
  and (number(@code)!=228)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_01") } {
              attribute name {$strData/@name},
              attribute code {$strData/@code},
              
              (for $c in $colData
                 return
                    attribute {xs:QName(concat("column", string($c/@order)))} {
                      $c/text()
                }
              )              
        },
        (
          for $elm in $cls
            let $colClass := $elm/column

            return
            element {xs:QName("strdata_01")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - 100000 ) },
                
                (
			        for $c in $colClass
                        return
                            attribute {xs:QName(concat("column", string($c/@order)))} {
                                $c/text()
                            }
                )              
                
            }
        )
    )      
        
         
let $flattenContactData:=
              for $strCls in $oldXML//strdata[number(@code)=211 or number(@code)=212] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strContactInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $flattenServiceData:=
              for $strCls in $oldXML//strdata[number(@code)>=221 and number(@code)<=232] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
  let $columnNames:=distinct-values($oldXML//column/@order)

  
let $flatten:= insert-before($data, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
};
