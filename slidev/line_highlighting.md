# Explaining Code Step-by-Step

Click through to see different parts of the function highlighted.

```js{1-3|5|7-9|*}
function calculatePrice(basePrice, taxRate, discount) {
  // First, calculate the tax
  const tax = basePrice * taxRate;

  // Next, apply the discount
  const discountedPrice = basePrice - (basePrice * discount);

  // Finally, return the total price
  return discountedPrice + tax;
}
```
