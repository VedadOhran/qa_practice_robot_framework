# =========================
# Cart Locators
# =========================
CART_ITEM_LOCATOR = "class:cart-item"       # Single cart item
CART_ITEMS_LOCATOR = "class:cart-items"     # Container for all cart items
CART_COLUMN_LOCATOR = "class:cart-column"   # Column in cart table
CART_TOTAL_PRICE_LOCATOR = "class:cart-total-price"  # Total price element in cart


# Indexed locators for items inside cart

ITEM_IN_CART_TITLE_LOCATOR_BY_INDEX= "xpath=(//div[contains(@class, 'cart-items')]/div[contains(@class, 'cart-row')])[{index}]/div[contains(@class, 'cart-item-title')]"    # Title of the cart item at the specified index
ITEM_IN_CART_PRICE_LOCATOR_BY_INDEX= "xpath=(//div[contains(@class, 'cart-items')]/div[contains(@class, 'cart-row')])[{index}]/span[contains(@class, 'cart-price')]"    # Price of the cart item at the specified index
ITEM_IN_CART_BUTTON_LOCATOR_BY_INDEX = "xpath=(//div[contains(@class, 'cart-items')]/div[contains(@class, 'cart-row')])[{index}]/div[contains(@class, 'cart-quantity')]/button[contains(@class, 'btn-danger')]" # Remove button for the cart item at the specified index
