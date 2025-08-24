QA Automation - Practice Site

This repository contains automated tests for the QA Practice site: https://qa-practice.netlify.app/auth_ecommerce

Project Structure

The project is organized according to the features and functionalities available in the site's navbar, making it easier to maintain and scale the tests.

Tests/ – contains Robot Framework test suites grouped by functionality available on the website.

Resources/ – reusable keywords and helper functions.

Locators/ – element locators for different pages.

TestData/ – test data used in the suites.

Prerequisites

Install dependencies:

pip install robotframework
pip install robotframework-seleniumlibrary

To execute the full test suite, run the following command from the project root:

robot -d results Tests/Forms/login.robot Tests/Ecommerce/products.robot Tests/Ecommerce/cart.robot Tests/Ecommerce/checkout.robot