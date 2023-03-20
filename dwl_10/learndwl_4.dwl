%dw 2.0
output application/json
fun renameOrderDate(order) = (order mapObject (value, key) -> {
        (deliveryDate: value) if(key as String == 'orderDate'),
        ((key):value) if(key as String !='orderDate')
        })
---
(payload.customers map (customer, index) -> {

          name: customer.name,
          region: customer.region,
          orders: customer.orders  filter ($.orderType != null) map (order, index) ->  if (order.orderType == "web") renameOrderDate(order)
           else (order mapObject (value, key) -> {
            ((key):value)
        })
}) filter (!isEmpty($.orders))