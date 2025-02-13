# Hospital Backend API & SQL Testing Automation

This project is designed for testing the Hospital API using RESTful methods (CRUD). It utilizes modern testing libraries and frameworks to ensure API endpoints are robust, secure, and functionally correct. The project is implemented in Java with Maven for dependency management and follows the principles of integration testing.

---

## Project Overview

### Features:
- **CRUD Operations**: Test Create, Read, Update, and Delete operations for hospital APIs.
- **Integration Testing**: Validate the interaction between different parts of the backend system.
- **Dynamic Parameterization**: Use dynamic IDs and data-driven testing with Cucumber and JUnit.
- **Allure Reporting**: Generate detailed test reports with Allure.
- **Excel Handling**: Utilize Apache POI for reading/writing Excel files for test data.
- **Logging**: Built-in logging using Log4j and SLF4J.

### Technologies and Tools:
- **Java 18**
- **Maven** for dependency management.
- **JUnit 5** for unit and integration testing.
- **Cucumber** for BDD (Behavior-Driven Development).
- **Rest-Assured** for API testing.
- **MySQL Connector** for database interactions.
- **Apache POI** for handling Excel files.
- **Allure** for test reporting.
- **Log4j/SLF4J** for logging.

---

## Setup and Installation

### Prerequisites:
1. **Java JDK 18** installed on your machine.
2. **Maven** installed and configured in your environment.
3. Access to the API under test.

### Clone the Repository:
```bash
git clone https://github.com/seflekL/hospital_BackEnd_Project.git
```

### Install Dependencies:
1. Navigate to the project directory:
   ```bash
   cd hospital_BackEnd_Project
   ```
2. Install project dependencies using Maven:
   ```bash
   mvn clean install
   ```

### Running the Tests:
1. Use the following command to run tests:
   ```bash
   mvn test
   ```
2. Generate Allure reports:
   ```bash
   mvn allure:serve
   ```

---

## Project Structure

### API Testing:
- **Visitor Management** (visitors, visitorsBook, visitorPurpose): Tests for visitor records and their purposes.
- **Blood Group Operations** (bloodGroup): Tests for blood group data.
- **Notice Management** (notice): Create, update, and delete notices.
- **Expense Categories** (expenseHead): Manage expense categories.
- **Findings and Categories** (finding, findingCategory): Tests for medical findings and their categories.

### Database Testing:
- Validate the correctness of data stored in MySQL.
- Test CRUD operations for tables related to patients, doctors, and staff.
- Ensure proper indexing and query performance.

---

## Reporting and Logging
- **Allure Reports**: Generate comprehensive test reports to visualize test outcomes.
- **Logging**: Track test execution using Log4j/SLF4J for debugging and auditing purposes.

---

## Contribution Guidelines

### Steps to Contribute:
1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b <your_branch_name>
   ```
3. Commit your changes with descriptive messages:
   ```bash
   git commit -m "<Your message>"
   ```
4. Push to your branch:
   ```bash
   git push origin <your_branch_name>
   ```
5. Create a Pull Request (PR) and provide detailed descriptions of your changes.

---

## Team and Acknowledgments

- **Levent Seflek** (Lead QA Engineer)  
  *The sole contributor ensuring the quality and reliability of this project.*

---

## License
This project is open-source and distributed under the MIT License.

