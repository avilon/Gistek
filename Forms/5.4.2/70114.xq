(: ------------------------------------------------------------------------------ :)
(: --------------------- 5.4.2 maket 1339 - 70114 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre70114($doc) {     
  let $data_01 := for $strData in $oldXML//strdata[number(@code) = 10]
  
  let $colData := $strData/column             
  let $cls := $strData/strdetail
  
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
                attribute name {concat("- ", string($elm/@code))},
                attribute code {number ( $elm/@code ) - 1000000 },
                attribute id {number ( $elm/@id )},
                
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
        
  let $data_02 := for $strData in $oldXML//strdata[number(@code) = 20]
  let $colData := $strData/column             
  let $cls := $strData/strdetail
  
  return (
        element { xs:QName("strdata_02") } {
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
            element {xs:QName("strdata_02")} {
                attribute name {concat(" - ", string($elm/@code))},
                attribute code {number ( $elm/@code ) - 2000000 },
                attribute id {number ( $elm/@id )},
                
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

  let $data_03 := for $strData in $oldXML//strdata[number(@code) = 30]
  let $colData := $strData/column             
  let $cls := $strData/strdetail
  
  return (
        element { xs:QName("strdata_03") } {
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
            element {xs:QName("strdata_03")} {
                attribute name {concat(" - ", string($elm/@code))},
                attribute code {number ( $elm/@code ) - 3000000 },
                attribute id {number ( $elm/@id )},
                
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
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] (:Контактная информация:)
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] (:Служебная информация:)
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order))) }{
                      $c/text()
                    }                    
                )
              }
              
let $columnNames:=distinct-values($oldXML//column/@order)

let $flatten:= insert-before($data_01, 0, $data_02)
let $flatten:= insert-before($flatten, 0, $data_03)
let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
}
