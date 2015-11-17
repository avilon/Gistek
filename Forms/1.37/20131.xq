(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.37 maket 1302 - 20131 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20131($doc) { 
let $oldXML:=$doc
let $data_01:=for $strCls in $oldXML//strfree[(number(@code)>=1 and number(@code)<=50)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_01") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }
              
let $data_02:=for $strCls in $oldXML//strfree[(number(@code)>=51 and number(@code)<=200)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_02") }{
                attribute name {$strCls/entity},
                attribute code {$strCls/@code},
                (for $c in $columns
                 return
                 attribute {xs:QName(concat("col",string($c/@order)))}{
                      $c/text()
                    }
                )
              }


let $data_03:=for $strCls in $oldXML//strfree[(number(@code)>=201 and number(@code)<=250)]
              let $columns:=$strCls/column
              return
              element {xs:QName("data_03") }{
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
              for $strCls in $oldXML//strfree[number(@code)=311] 
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
              for $strCls in $oldXML//strfree[number(@code)=321] 
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
let $flatten:= $data_03
let $flatten:= insert-before($flatten,0,$data_02)
let $flatten:= insert-before($flatten,0,$data_01)

let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= $flatten
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};
