%dw 2.0
output application/json
var customers = payload.customers map (item, index) -> {
      customer: item mapObject (value, key) -> {
      (upper(key)): value
      }
 }
---
 customers.customer groupBy $.REGION mapObject ((customerGroup, region) -> {
     customergroup: {
         region: region,
         customers: customerGroup map () -> {
             customer:{
                name: $.NAME
             }
         }
     }
 })