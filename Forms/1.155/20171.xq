import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML := fn:doc("20171\\1438_20171.xml")/*  

  let $data_01 := for $strData in $oldXML//strdata[number(@code) =1]
  
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
                attribute code {number ( $elm/@code ) - 10000 },
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
        
  let $data_02 := for $strData in $oldXML//strdata[number(@code) =2]
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
                attribute code {number ( $elm/@code ) - 200000 },
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

  let $data_03 := for $strData in $oldXML//strdata[number(@code) =3]
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
                attribute code {number ( $elm/@code ) - 300000 },
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

  let $data_04 := for $strData in $oldXML//strdata[number(@code) =4]
  let $colData := $strData/column             
  let $cls := $strData/strdetail
  
  return (
        element { xs:QName("strdata_04") } {
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
            element {xs:QName("strdata_04")} {
                attribute name {concat(" - ", string($elm/@code))},
                attribute code {number ( $elm/@code ) - 400000 },
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

  let $data_05 := for $strData in $oldXML//strdata[number(@code) = 5]
  let $colData := $strData/column             
  let $cls := $strData/strdetail
  
  return (
        element { xs:QName("strdata_05") } {
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
            element {xs:QName("strdata_05")} {
                attribute name {concat(" - ", string($elm/@code))},
                attribute code {number ( $elm/@code ) - 500000 },
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
              for $strCls in $oldXML//strdata[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strdata[number(@code)>=121 and number(@code)<=132] 
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
let $flatten:= insert-before($flatten, 0, $data_04)
let $flatten:= insert-before($flatten, 0, $data_05)
let $flatten:= insert-before($flatten, 0, $flattenContactData)
let $flatten:= insert-before($flatten, 0, $flattenServiceData)
              
let $newXML := for $item in $flatten
              return $item
                       
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 