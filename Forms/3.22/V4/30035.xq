import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML:=fn:doc("30035\\1054_30035.xml")/* 

let $div_010 := for $strCls in $oldXML//strdata[(number(@code) < 26)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_010") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

  let $div_011 := for $strData in $oldXML//strdata[number(@code) = 26]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_011") } {
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
            element {xs:QName("strdata_011")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - 2600000 ) },
                
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

  let $div_012 := for $strData in $oldXML//strdata[(number(@code) = 27)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_012") } {
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
            element {xs:QName("strdata_012")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - 2700000 ) },
                
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

let $div_013 := for $strCls in $oldXML//strdata[(number(@code) > 27) and (number(@code) <= 36)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_013") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

  let $div_020 := for $strData in $oldXML//strdata[(number(@code) >= 37) and (number(@code) <= 52)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_020") } {
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
            element {xs:QName("strdata_020")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - number($strData/@code)*100000 ) },
                
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

(: Divizion III :)

  let $div_030 := for $strData in $oldXML//strdata[(number(@code) >= 53) and (number(@code) <= 55)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_030") } {
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
            element {xs:QName("strdata_030")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - number($strData/@code)*100000 ) },
                
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


(: Divizion IV :)

  let $div_040 := for $strData in $oldXML//strdata[(number(@code) >= 56) and (number(@code) <= 71)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_040") } {
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
            element {xs:QName("strdata_040")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - number($strData/@code)*100000 ) },
                
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

(: Divizion V :)

  let $div_050 := for $strData in $oldXML//strdata[(number(@code) >= 72) and (number(@code) <= 76)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_050") } {
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
            element {xs:QName("strdata_050")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - number($strData/@code)*100000 ) },
                
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

(: Divizion VI :)

let $div_060 := for $strCls in $oldXML//strdata[(number(@code) >= 77) and (number(@code) <= 79)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_060") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

(: Divizion VII :)

let $div_070 := for $strCls in $oldXML//strdata[(number(@code) >= 80) and (number(@code) <= 82)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_070") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }


(: Divizion VIII :)

  let $div_080 := for $strData in $oldXML//strdata[(number(@code) >= 83) and (number(@code) <= 147)]
  
  let $colData := $strData/column             
  let $cls := $strData/strclass
  
  return (
        element { xs:QName("strdata_080") } {
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
            element {xs:QName("strdata_080")} {
                attribute name {concat("-", $elm/@name)},
                attribute code {number ( $elm/@code - number($strData/@code)*100000 ) },
                
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

(: Divizion IX :)

let $div_090 := for $strCls in $oldXML//strdata[(number(@code) >= 148) and (number(@code) <= 159)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_090") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }

(: Divizion X :)

let $div_100 := for $strCls in $oldXML//strdata[(number(@code) >= 160) and (number(@code) <= 179)]
              let $columns:=$strCls/column             
              return
              element {xs:QName("strdata_100") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                attribute {xs:QName(concat("column", string($c/@order)))}{
                  $c/text()
                })
              }
    
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
              for $strCls in $oldXML//strdata[number(@code) >= 121 and number(@code) <= 132] 
              let $columns:=$strCls/column
              return
              element {xs:QName("strServiceInf") }{
                attribute name {$strCls/@name},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col", string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $columnNames:=distinct-values($oldXML//column/@order)


let $flatten:= insert-before($flattenServiceData, 0, $flattenContactData)

let $flatten:= insert-before($flatten, 0, $div_100)
let $flatten:= insert-before($flatten, 0, $div_090)
let $flatten:= insert-before($flatten, 0, $div_080)
let $flatten:= insert-before($flatten, 0, $div_070)
let $flatten:= insert-before($flatten, 0, $div_060)
let $flatten:= insert-before($flatten, 0, $div_050)
let $flatten:= insert-before($flatten, 0, $div_040)
let $flatten:= insert-before($flatten, 0, $div_030)
let $flatten:= insert-before($flatten, 0, $div_020)
let $flatten:= insert-before($flatten, 0, $div_013)
let $flatten:= insert-before($flatten, 0, $div_012)
let $flatten:= insert-before($flatten, 0, $div_011)
let $flatten:= insert-before($flatten, 0, $div_010)

let $newXML := for $item in $flatten
              return $item
              
          
               
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document> 