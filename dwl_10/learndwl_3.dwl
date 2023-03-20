%dw 2.0
output application/json
var sign = "\u0024" // unicode dollar sign
type currency = String {format: "$sign###.00"} // interpolation from previous
---
customers: payload.customers map (customer, index) -> {

          name: customer.name,
          region: customer.region,
          orders: customer.orders map (order, index) -> {
              orderId: order.orderId,
              orderType: order.OrderType,
              orderTotal: order.orderTotal as Number as currency,
              orderDate: order.orderDate as Date { format: "MM-dd-uuuu" } as String { format: "dd-MMM-uuuu" }
          }
}