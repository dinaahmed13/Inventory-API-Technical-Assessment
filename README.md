# 📦 Inventory API - Technical Assessment

## 📋 Project Overview

This project demonstrates an API testing and automation approach for an inventory product creation scenario using **Postman**.

The original assessment provided an inventory API endpoint for creating a new item. Since the provided API endpoint was not accessible for execution, **DummyJSON** was selected as a public test API to demonstrate the required API testing and Postman automation approach in a realistic API environment.

The implementation covers authentication, dynamic token handling, positive and negative test scenarios, automated assertions.

---

## 🛠️ Tools & Technologies

* **Postman** – API testing and automation
* **JavaScript** – Postman test scripts and assertions
* **DummyJSON** – Public test API
* **Git & GitHub** – Version control and project hosting
* **Microsoft Excel** – Test scenario documentation

---

## 🎯 Assessment API Requirement

The original assessment required testing an inventory item creation API:

**Endpoint:**

```text
POST /api/v1/inventory/items
```

**Authorization:**

```text
Bearer <token>
```

**Request Body:**

```json
{
    "item_name": "Wireless Mouse",
    "sku": "MS-001",
    "quantity": 50,
    "price": 25.00,
    "category_id": 3
}
```

**Expected Success Status:**

```text
201 Created
```

---

## 💡 Assumptions

* The provided assessment API endpoint was not accessible for execution.
* The main objective was assumed to be demonstrating the required API testing and Postman automation approach.
* **DummyJSON** was used as a public test API to simulate the inventory product creation scenario.
* The original inventory fields were mapped to the available DummyJSON fields:

| Original API  | DummyJSON  |
| ------------- | ---------- |
| `item_name`   | `title`    |
| `quantity`    | `stock`    |
| `price`       | `price`    |
| `category_id` | `category` |

* DummyJSON uses a different API contract, so its response fields and validation behavior may differ from the original assessment API.
* Expected results for the original assessment were based on the provided requirements, while actual execution results reflect the behavior of DummyJSON.

---

## 🔌 API Implementation

The testing scenarios were implemented using the following DummyJSON endpoint:

**Endpoint:**

```text
POST {{baseUrl}}/products/add
```

**Base URL:**

```text
https://dummyjson.com
```

**Request Body:**

```json
{
    "title": "Wireless Mouse",
    "price": 25,
    "stock": 50,
    "category": "electronics"
}
```

---

## 🧪 Test Scenarios

The following positive and negative scenarios were implemented in Postman:

### ✅ Positive Scenarios

* **Add Product Item - Valid Data**
* **Add Product Item - Minimum Valid Stock**

### ❌ Negative Scenarios

* **Add Product - Missing Title**
* **Add Product - Invalid Price**
* **Add Product - Negative Stock**
* **Add Product Item - Unauthorized**

The detailed test cases, expected results, actual results, and execution status are documented in the Excel file.

---

## 🤖 Postman Automation

### 🔐 1. Dynamic Authentication

A login request is used to generate the access token dynamically before executing protected API requests.

**Login Endpoint:**

```text
POST {{baseUrl}}/auth/login
```

**Login Credentials:**

```json
{
    "username": "emilys",
    "password": "emilyspass"
}
```

After a successful login, the `accessToken` is extracted from the response and stored as an environment variable named `token`.

```javascript
const response = pm.response.json();

pm.environment.set("token", response.accessToken);

pm.test("Login successful", function () {
    pm.response.to.have.status(200);
});

pm.test("Access token is returned", function () {
    pm.expect(response.accessToken).to.exist;
});
```

The generated token is then used as a **Bearer Token** for protected requests:

```text
{{token}}
```

---

### ✅ 2. Successful Product Creation Assertions

The product creation request validates the successful response using assertions in the **Tests** tab.

```javascript
const response = pm.response.json();

pm.test("Status code is 201 Created", function () {
    pm.response.to.have.status(201);
});

pm.test("Product is created successfully", function () {
    pm.expect(response.id).to.exist;
});

pm.test("Product title is correct", function () {
    pm.expect(response.title).to.eql("Wireless Mouse");
});

pm.test("Product price is correct", function () {
    pm.expect(response.price).to.eql(25);
});

pm.test("Product stock is correct", function () {
    pm.expect(response.stock).to.eql(50);
});
```

---

## 📁 Project Structure

```text
Inventory-API-Technical-Assessment/
│
├── Postman/
│   └── Inventory API - Technical Assessment.postman_collection.json
│
├── Test-Scenarios/
│   └── API Test Scenarios.xlsx
│
└── README.md
```

---

## 🚀 How to Run

### 📌 Prerequisites

* Install **Postman**
* Internet connection
* Git (optional, if cloning the repository)

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/dinaahmed13/Inventory-API-Technical-Assessment.git
```

Or download the repository as a ZIP file from GitHub.

### 2️⃣ Import the Postman Collection

Open Postman:

**Import → Files**

Select:

```text
Postman/Inventory API - Technical Assessment.postman_collection.json
```

### 3️⃣ Configure the Environment

Create or select a Postman environment containing:

| Variable  | Initial Value           |
| --------- | ----------------------- |
| `baseUrl` | `https://dummyjson.com` |
| `token`   | Leave empty             |

The `token` is generated automatically by the Login request.

### 4️⃣ Run the Collection

Open the collection in Postman and run the requests using **Collection Runner**.

The authentication request should be executed before protected requests so that the access token is available.

### 5️⃣ Review Test Results

Postman automatically executes the assertions in the **Tests** tab and displays the results for each request.

The detailed test scenarios and execution results are also available in:

```text
Test-Scenarios/API Test Scenarios.xlsx
```

---

## 📦 Project Contents

### 📮 Postman Collection

Contains:

* Authentication
* Dynamic token generation
* Product retrieval
* Product creation
* Positive test scenarios
* Negative test scenarios
* Unauthorized request
* API chaining
* Automated assertions

### 📊 Excel Test Scenarios

Contains:

* Test Case ID
* Test Case
* Test Type
* Test Data
* Expected Status
* Expected Result
* Actual Status
* Execution Status

---

## 🔍 Key Testing Areas

The project demonstrates testing of:

* Positive scenarios
* Negative scenarios
* Boundary values
* Required field validation
* Invalid data types
* Invalid values
* Authentication
* Authorization
* Status code validation
* Response body validation
* Dynamic variables
* Automated assertions

---

## 🔗 Repository

**GitHub Repository:**

https://github.com/dinaahmed13/Inventory-API-Technical-Assessment
