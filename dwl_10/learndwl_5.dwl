%dw 2.0
output application/json
var customerorderTotal = payload.customers map(customer, index) ->{
    name: customer.name,
    region: customer.region,
    orderTotal: customer.orders reduce ((order, acc=0) -> acc + order.orderTotal)
}
var customers = customerorderTotal map (item, index) -> {
      customer: item mapObject (value, key) -> {
      (upper(key)): value
      }
}
---
customers