# =========================
# Products Page Locators
# =========================

SECTION_HEADER_LOCATOR = "class:section-header"      # Header of the products section
PRODUCTS_LIST_LOCATOR = "class:shop-items"           # Container for all shop items
PRODUCT_LOCATOR = "class:shop-item"                 # Single product item container
CHECKOUT_BUTTON_LOCATOR = "class:btn-purchase"      # Button to open checkout

# Indexed  locators for product details
ADD_TO_CART_BUTTON_LOCATOR_BY_INDEX = "xpath=//div[@class='shop-items']/div[@class='shop-item'][{index}]/div[@class='shop-item-details']/button[contains(@class, 'shop-item-button')]"  # Add to cart button by index

# Title-based locators for product details
PRODUCT_TITLE_LOCATOR_BY_TITLE = "xpath=//span[@class='shop-item-title' and text()='{title}']"  # Product title element
PRODUCT_PRICE_LOCATOR_BY_TITLE = "xpath=//div[@class='shop-item'][.//span[@class='shop-item-title' and text()='{title}']]//span[@class='shop-item-price']"  # Product price corresponding to a title
ADD_TO_CART_BUTTON_LOCATOR_BY_TITLE_ = "xpath=//div[@class='shop-item'][.//span[@class='shop-item-title' and text()='{title}']]//div[@class='shop-item-details']/button[contains(@class, 'shop-item-button')]"  # Add to cart button by title


