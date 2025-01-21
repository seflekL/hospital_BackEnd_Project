Feature: Database Verification Scenarios

  Background: Establish database connection
    Given Database connection established

  Scenario:Retrieve and list account_title data from the staff table where qualification is "MS" and specialization is "Neurology," sorted alphabetically.
    * the user executes the "US27" query
    * Database closed

  Scenario:Verify that the oldest vehicle in the vehicles table has driver_name=bayram erguven and driver_licence =b.
    * the user executes the "US28" query
    * Verifies that datas : "driver_name, driver_licence" values : "bayram erguven, b"
    * Database closed


  Scenario:Verify that a vehicle appears in the same index when the vehicles table is sorted by manufacture_year (oldest to newest) and created_at (oldest to newest).
    * the user executes the "US29" query
    * verifies that the table is not empty.
    * Database closed


  Scenario:  Check if morning appointments are fewer than afternoon appointments
    * Creates query with "SELECT IF (ogleden_once_sayisi < ogleden_sonra_sayisi, 'true', 'false') AS sonuc FROM ( SELECT (SELECT COUNT(*) FROM appointment WHERE TIME(date) < '12:00:00') AS ogleden_once_sayisi, (SELECT COUNT(*) FROM appointment WHERE TIME(date) >= '12:00:00') AS ogleden_sonra_sayisi) AS counts;"
    * Verify that the appointments made for the morning are less than the appointments for the afternoon
    * Database closed


  Scenario:In the appointment_payment table through the database, verify that the patient IDs selected as "offline" as the payment type are: (1,2,3,16,17,18,20,21,24,25,31).
    * Creates query with "SELECT appointment_id FROM appointment_payment WHERE payment_type = 'offline';"
    * Verify that the patient IDs below selected as offline as the payment type
      | 1  |
      | 2  |
      | 3  |
      | 16 |
      | 24 |
      | 31 |
    * Database closed

  Scenario: Verify created_at for opd_details_id between 11 and 31
    *  I execute query the database for "DB_US18"
    * the created_at field for each record should be valid
    * Database closed


  @E2E
  Scenario: Calculate working hours for staff_id 2 on Tuesday
    * I execute query the database for "DB_US19"
    * the result should contain working hours for staff_id 2 on Tuesday
    * Database closed


  @E2E
  Scenario: Delete an inserted event
    * I execute query the database for "DB_US20_insert" with data
      | event_title     | event_description     | start_date          | end_date            | event_type | event_color | event_for | role_id | is_active |
      | QA Levent Event | This is a test event. | 2024-12-10 10:00:00 | 2024-12-10 12:00:00 | Test       | #FF5733     | Public    | 1       | Yes       |
    * I delete query the database for "DB_US20_delete"
    * I confirm no records found for "DB_US20_confirm_deletion"
    * Database closed


  Scenario:List and verify the names of babies who are siblings in the birth_report table.

    * I execute query the database for "DB_US10"
    * The user verifies children who are siblings
    * Database closed

  Scenario:Verify that the blood donor with id = 7 has donor_name = Maria, date_of_birth = '2001-03-02', gender = Female, father_name = Jhonson, address = England in the blood_donor table.

    * I execute query the database for "DB_US11"
    * The user validates donor data
    * Database closed

  Scenario:List the id numbers of blood_donor_cycle entries where the institution is known, and verify that id = 17 is in the list.

    *  I execute query the database for "DB_US12"
    *  The user finds id 17 in the listed blood_donor_cycle table information
    * Database closed

  Scenario:Verify that the bed with created_at =  '2023-05-04 06:41:17' is active in the bed table.
    * User creates Query for "DB_US07"
    * User query the bed with created_at '2023-05-04 06:41:17'
    * The bed record should be active
    * Database closed


  Scenario:Verify the patient's name with bed_group_id = 4 and is_active = "no" in the bed table
    * User creates Query for "DB_US08"
    * Verify the name is null
    * Database closed


  Scenario:Verify the number of babies with a weight of 2.5 kg or higher in the birth_report table.
    * User verifies that count babies with weight greater than or equal to 2.5 kg
    * the count of babies should be 3
    * Database closed


  Scenario: Verifying gender and email information for patients with 'Jain' in their names
    * Query prepared into the patients table
    * Verify result is returned
    * Database closed


  Scenario: Nurse can insert multiple notes into the nurse_note table
    * the "nurse_note" table exists and is accessible
    * get the number of records in the nurse_note table and store it as the startingcount
    * the following data is inserted into the table:

      | date                | ipd_id | staff_id | note             | comment        | updated_at          |
      | 2024-12-11 16:34:13 | 35     | 961      | Tansiyon ölçüldü | Sabah kontrolü | 2024-12-11 16:34:13 |

    * there should be more than one records in the "nurse_note" table
    * the inserted records should match the following data exactly:

      | date                | ipd_id | staff_id | note             | comment        | updated_at          |
      | 2024-12-11 16:34:13 | 35     | 961      | Tansiyon ölçüldü | Sabah kontrolü | 2024-12-11 16:34:13 |

    * Database closed


  Scenario: List the names (or names of relatives) and dates of death of people who have died in the last week according to the date of death in the death_report table.

    * Database connection established
    * the user executes the "US34" query
    * the death_report table contains names and dates of death
    * the user queries deaths from the last 7 days
    * return names (or relatives) and dates of death
    * Database closed


  Scenario: Combining consultant_register with ipd_details and staff tables, list the IPD records and doctor names of the instructions.(consultant_register)

    * Database connection established
    * the user executes the "US33" query
    * consultant_register, ipd_details, and staff tables
    * the user queries combined data
    * return IPD records with doctor names
    * Database closed

  Scenario: Add 1 data to the email_config table whose passcode is protected with sha2 method.

    * Database connection established
    * the user executes the "US35" query
    * the email_config table exists
    * the user adds a new entry with a passcode encrypted using the SHA2 method
    * the table should store the passcode securely
    * Database closed


