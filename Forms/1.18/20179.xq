(: ------------------------------------------------------------------------------ :)
(: --------------------- 1.18 maket 1448 - 20179 	 ------------------------ :)
(: ------------------------------------------------------------------------------ :)

declare function util:pre20179($doc) { 

let $oldXML:=$doc 

let $data_01:=for $strCls in $oldXML//strfree[(number(@code)>=1 and number(@code)<=100)]
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
              
let $data_02:=for $strCls in $oldXML//strfree[(number(@code)>=101 and number(@code)<=200)]
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


              
(:-------------------------------------------------------------------------------------------------------------------:)
let $flattenContactData:=
              for $strCls in $oldXML//strfree[number(@code)=211] 
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
              for $strCls in $oldXML//strfree[number(@code)=221] 
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
let $flatten:= $data_02
let $flatten:= insert-before($flatten,0,$data_01)

let $flatten:= insert-before($flatten,0,$flattenContactData)
let $flatten:= insert-before($flatten,0,$flattenServiceData)

let $newXML:= $flatten
return <document version="1.0" created="create_xml_online"><flat>{$newXML}</flat></document>
};
