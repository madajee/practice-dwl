%dw 2.0
output application/json
var sign = "\u0024" // unicode dollar sign
type currency = String {format: "$sign###.00"} // interpolation from previous
var orderArray = payload.customers map (customer, index) -> {
          orders: customer.orders map (order, index) -> {
                orderId: order.orderId,
                orderType: order.orderType,
                orderTotal: order.orderTotal as Number as currency,
                name: customer.name     
 }
}
---
flatten(orderArray.orders)