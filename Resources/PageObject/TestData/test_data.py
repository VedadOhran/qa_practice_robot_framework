# =========================
# Browser & Site Configuration
# =========================
BROWSER = "chrome"
SITE_URL = "https://qa-practice.netlify.app/auth_ecommerce"

# =========================
# Login Test Data
# =========================
VALID_EMAIL = "admin@admin.com"
VALID_PASSWORD = "admin123"
INVALID_EMAIL = "adm123@admin.com"
INVALID_PASSWORD = "988abc"

# =========================
# Shopping Form Data
# =========================
VALID_PHONE_NUMBER = "0121 772 7780"   # Use international format if needed
VALID_STREET_NAME = "13 Downing St"
VALID_CITY_NAME = "Farnham"
VALID_COUNTRY_NAME = "Australia"

# =========================
# Products Test Data
# =========================
PRODUCT_TITLE = "Apple iPhone 12, 128GB, Black"
PRODUCT_LIST_ITEM_1 = "Huawei Mate 20 Lite, 64GB, Black"
PRODUCT_LIST_ITEM_2 = "Apple iPhone 13, 128GB, Blue"
PRODUCT_LIST_ITEM_3 = "Nokia 105, Black"

# ==============================
# Number of products in database
# ==============================
FAKE_DB_PRODUCTS_COUNT = 5   # Placeholder: in a real scenario, get this from get_products_count() function
