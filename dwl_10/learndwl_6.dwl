%dw 2.0
output application/json
var customers = payload.customers map (item, index) -> {
      customer: item mapObject (value, key) -> {
      (upper(key)): value
      }
}
---
customers.customer map (customer, index) -> {
    customer: {
        customerdesc: ((customer-"ORDERS") pluck($)) joinBy " located in  ",
        orders: customer.ORDERS
        }
    
}