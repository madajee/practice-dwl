%dw 2.0
output application/xml
var customermap = payload.customers map (item, index) -> {
      customer: item mapObject (value, key) -> {
      (upper(key)): value
      }
}
---
customers : {(customermap)}