import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML_01 := fn:doc("20034\\1100_20033.xml")/* 
let $oldXML_02 := fn:doc("20034\\1100_20034.xml")/* 

  let $data_01 := for $strData in $oldXML_01//strdata[number(@code) < 111 or number(@code) > 132]
  
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
                attribute code {number ( $elm/@code ) - 100000 },
                
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
        
  let $data_02 := for $strData in $oldXML_02//strdata[number(@code) < 111 or number(@code) > 132]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
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
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code ) - 100000 },
                
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
              for $strCls in $oldXML_01//strdata[number(@code)=111 or number(@code)=112]
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
              for $strCls in $oldXML_01//strdata[number(@code)>=121 and number(@code)<=132] 
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
              
let $columnNames:=distinct-values($oldXML_01//column/@order)

let $flatten:= insert-before($data_02, 0, $data_01)
let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 
