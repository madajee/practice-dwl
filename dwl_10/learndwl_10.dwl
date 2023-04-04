%dw 2.0
output application/json
var sign = "\u0024" // unicode dollar sign
type currency = String {format: "$sign###.00"} // interpolation from previous
var orderArray = payload.customers map (customer, index) -> {
          orders: customer.orders map (order, index) -> {
                orderId: order.orderId,
                orderType: order.orderType,
                orderTotal: order.orderTotal as Number,
                name: customer.name     
 }
}
fun getOrderTotal(value) = value reduce ((value, acc=0) -> acc + value.orderTotal) 
---
(flatten(orderArray.orders) groupBy $.name) mapObject(value, key)->{
    (key): {orderTotal: getOrderTotal(value)}
}