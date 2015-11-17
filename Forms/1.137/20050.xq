import module namespace fnx = "http://www.functx.com" at "functx.xq";
let $oldXML:=fn:doc("20050\\1110_20050.xml")/* 

let $flattenPart1:=for $strCls in $oldXML//strfree[((number(@code)>=1) and (number(@code)<=200) and (number(@code)!=111) and (number(@code)!=121))]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdataPart1") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $flattenPart2:=for $strCls in $oldXML//strfree[((number(@code)>=201) and (number(@code)<=300))]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdataPart2") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

let $flattenPart3:=for $strCls in $oldXML//strfree[((number(@code)>=301) and (number(@code)<=400))]
              let $columns:=$strCls/column
              return
              element {xs:QName("strdataPart3") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }

              
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=111 or number(@code)=112] 
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
              for $strCls in $oldXML//strfree[number(@code)>=121 and number(@code)<=132] 
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

let $flatten:= $flattenPart1
let $flatten:= insert-before($flatten,0,$flattenPart2)
let $flatten:= insert-before($flatten,0,$flattenPart3)

let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= $flatten
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>