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
pip install robotframework-jsonlibrary
pip install robotframework-requests

To execute the full UI test suite, run the following command from the project root:

robot -d results Tests/UI/Forms/login.robot Tests/UI/Ecommerce/products.robot Tests/UI/Ecommerce/cart.robot Tests/UI/Ecommerce/checkout.robot

API Testing

You can run the project application on your laptop/PC by having Docker and execute the following CLI command
docker run -d --rm --name qa-practice-api -p8887:8081 rvancea/qa-practice-api:latest

After successfully running the above command, you can open the application in browser by accessing the following URL
http://localhost:8887/swagger-ui.html

The above REST API application includes an OpenAPI (Swagger) Documentation with the following endpoints 
Employee Management

GET /api/v1/employees
Returns all employees.

POST /api/v1/employees
Create a new employee.

GET /api/v1/employees/{id}
Return employee by ID.

PUT /api/v1/employees/{id}
Update employee by ID.

DELETE /api/v1/employees/{id}
Delete employee by ID.

Simulation Endpoints

GET /api/v1/simulate/get/employees
Simulate getting all employees. Requires Authorization header (Bearer token).

GET /api/v1/simulate/server/error
Simulate an internal server error.

POST /api/v1/simulate/token
Simulate an endpoint that returns a JWT token. Use admin for both username and password.

To execute the full UI test suite, run the following command from the project root:
robot -d results Tests/API/employee_api.robot