%dw 2.0
output application/json
---
payload.customers map (item, index) -> {
      customer: item mapObject (value, key) -> {
      (upper(key)): value
      }
}