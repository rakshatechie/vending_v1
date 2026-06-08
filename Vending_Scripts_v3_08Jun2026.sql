


-- This is in continuation of Vending_Scripts_v2.sql file -- 


-- Prompt 1 -- 
Assume I give you my Database design. I give you - 
1. All my CREATE TABLE scripts. 
2. All Foreign Keys, Primary Keys, Constraints 
3. All Column Level and Table Level Comments 

Will you be able to write Java code for APIs etc? 
Meaning, If I tell you my algorithms on how to use those tables, will you be able to code my app?


-- Response from ChatGPT -- 
	Step 1: You share CREATE TABLE scripts
	Step 2: I understand tables and relationships
	Step 3: You explain what each screen/user action should do
	Step 4: I define APIs
	Step 5: I generate Spring Boot code
	Step 6: You run it locally
	Step 7: You send errors/logs
	Step 8: I help fix them

For best results, give me:
	1. Database type: PostgreSQL / MySQL / Oracle / SQL Server
	2. CREATE TABLE scripts
	3. Sample data, if available
	4. Business rules
	5. User actions required
	6. Whether you want Java Spring Boot
	7. Whether you want Angular UI also

So yes: with your database design + your algorithms, I can help you convert it into a working backend API application.







-- Prompt 2 -- 
My script is attached. 
Are you able to under what I am trying to create? Which kind of app, and what that app will do? 
Do you have any question for me?


-- Reply from ChatGPT --
Yes — I can understand it.
	You are trying to build a smart beverage vending machine application.

The app will likely do this:
	- Users can select beverages like tea, coffee, juice, shake, etc.
	- Users can customize ingredients like sugar, milk, ginger, elaichi, honey, etc.
	- The machine prepares the drink using a recipe.
	- The system tracks machine stock and warehouse stock.
	- The system records every beverage served.
	- The system tracks ingredient consumption, wastage, expiry, refilling, and stock movement.

In simple terms:
	- It is like a tea/coffee vending machine system, with user preferences, recipes, inventory, machines, warehouses, and transactions.

Your main modules appear to be:
	1. User management
	2. Beverage master
	3. Ingredient master
	4. Beverage recipe setup
	5. User favorite/custom beverage combinations
	6. Vending machine location
	7. Machine inventory
	8. Warehouse inventory
	9. Stock movement history
	10. Beverage serving transaction history

So yes, from this database, I can help you design:
	- Backend APIs
	- Java Spring Boot code
	- Entity classes
	- Repository classes
	- Service classes
	- Controller classes
	- DTOs
	- API request/response formats
	- Admin screens
	- User app screens
	- Machine stock logic
	- Serving/consumption logic

My main questions for you are:
	- Is this app for a real vending machine hardware, or only a software simulation/demo?
	- Who will use the app?
		Customer?
		Admin?
		Warehouse staff?
		Machine maintenance staff?
		Business owner?
	- Will users place orders from:
		Mobile app?
		Website?
		Touch screen on vending machine?
		Admin panel only?
	- When a user selects a beverage, should the system actually reduce stock from map_machine_ingredient_stock?

	- Do you want payment also?
		UPI
		card
		wallet
		cash
		free office vending machine

	- Do you want me to first create the API list from your database?
		Example:
			POST /api/beverages
			GET /api/beverages
			POST /api/users/{id}/favorite-beverage
			POST /api/machines/{id}/serve-beverage
			GET /api/machines/{id}/stock
			POST /api/stock/move

Best next step: I should convert your database into a plain-English app blueprint first — screens, users, features, and APIs.






-- Prompt 3 --
Answers, pointwise - 
1. I am planning to use this app for a real vending machine hardware. But I am not sure if such machine exists or not. If possible, I will try to sell my app to vending machine companies, or to corporates using vending machines.
2. I was thinking that customers will be using the app first. Havent thought of leveraging it to Admin, or Business owners etc. Or maybe some modules, like inventory etc, can be restricted to be visible only to inventory people. Maybe we can have role based access to the same app. 
3. I was thinking of mobile app.
4. Yes, system should actually reduce stock. And should notify the inventory users when stock is about to reach zero.
5. Payment is a future aspect. It would be good if some placeholder is there, for future scalability and integrity of payment options. 
6. Yes please create the API list. No hurries. Please take time.

Please let me know for more questions.

-- Reply from ChatGPT -- 
What the app will do - 
	A customer opens mobile app:
		Select machine
		↓
		Select beverage
		↓
		Customize ingredients
		↓
		Place order
		↓
		Machine prepares drink
		↓
		System reduces ingredient stock
		↓
		System stores serving history
		↓
		Inventory user gets low-stock alert

API list — first version
1. User APIs
	POST   /api/users/register
	POST   /api/users/login
	GET    /api/users/me
	PUT    /api/users/me
	GET    /api/users/{userId}
	PUT    /api/users/{userId}/status

Used for customer, admin, inventory user, operator, service engineer.

2. Role / Access APIs
	You should add role support.
		GET    /api/roles
		POST   /api/users/{userId}/roles
		GET    /api/users/{userId}/permissions

	Suggested roles:
		CUSTOMER
		ADMIN
		INVENTORY_USER
		MACHINE_OPERATOR
		SERVICE_ENGINEER
		BUSINESS_OWNER
3. Beverage APIs
		GET    /api/beverages
		GET    /api/beverages/{beverageId}
		POST   /api/beverages
		PUT    /api/beverages/{beverageId}
		PUT    /api/beverages/{beverageId}/status

	Used to manage tea, coffee, juice, smoothie, etc.

4. Ingredient APIs
		GET    /api/ingredients
		GET    /api/ingredients/{ingredientId}
		POST   /api/ingredients
		PUT    /api/ingredients/{ingredientId}
		PUT    /api/ingredients/{ingredientId}/status
	Examples:
		Milk
		Water
		Sugar
		Tea powder
		Coffee powder
		Ginger
		Elaichi
		Honey
5. Ingredient Subtype APIs
		GET    /api/ingredient-subtypes
		POST   /api/ingredient-subtypes
		PUT    /api/ingredient-subtypes/{subtypeId}

	Examples:
		White sugar
		Brown sugar
		Sugar free
		Powdered ginger
		Fresh ginger
6. Beverage Recipe APIs
	This is very important.
		GET    /api/beverages/{beverageId}/recipe
		POST   /api/beverages/{beverageId}/recipe/ingredients
		PUT    /api/beverages/{beverageId}/recipe/ingredients/{recipeIngredientId}
		DELETE /api/beverages/{beverageId}/recipe/ingredients/{recipeIngredientId}

	Example:
		Tea recipe:
		Water 100 ml
		Milk 50 ml
		Tea powder 5 gm
		Sugar 8 gm

7. Customer Beverage Customization APIs
		GET    /api/users/me/beverage-combinations
		POST   /api/users/me/beverage-combinations
		GET    /api/users/me/beverage-combinations/{comboId}
		PUT    /api/users/me/beverage-combinations/{comboId}
		DELETE /api/users/me/beverage-combinations/{comboId}

	Example:
		My Strong Tea
		Less Sugar Coffee
		Ginger Tea Without Sugar

8. Machine Location APIs
		GET    /api/locations
		GET    /api/locations/nearby
		POST   /api/locations
		PUT    /api/locations/{locationId}

	Used to show machines near office, floor, pantry, cafeteria, etc.

9. Vending Machine APIs
		GET    /api/machines
		GET    /api/machines/{machineId}
		GET    /api/machines/{machineId}/status
		PUT    /api/machines/{machineId}/status
		GET    /api/machines/{machineId}/beverages

	Important for customer app:
		GET /api/machines/nearby
		GET /api/machines/{machineId}/available-beverages

10. Machine Stock APIs
		GET    /api/machines/{machineId}/stock
		GET    /api/machines/{machineId}/stock/low
		POST   /api/machines/{machineId}/stock
		PUT    /api/machines/{machineId}/stock/{stockId}

	This checks what ingredients are inside the machine.

11. Warehouse APIs
		GET    /api/warehouses
		POST   /api/warehouses
		PUT    /api/warehouses/{warehouseId}
		GET    /api/warehouses/{warehouseId}/stock

12. Stock Movement APIs
		POST   /api/stock-movements/purchase-in
		POST   /api/stock-movements/warehouse-to-machine
		POST   /api/stock-movements/wastage
		POST   /api/stock-movements/expiry
		POST   /api/stock-movements/manual-adjustment
		GET    /api/stock-movements
		GET    /api/stock-movements/{movementId}

	This is needed for inventory history.

13. Beverage Serving APIs
	This is the heart of the app.
		POST   /api/servings/request
		POST   /api/servings/{servingId}/start
		POST   /api/servings/{servingId}/complete
		POST   /api/servings/{servingId}/fail
		GET    /api/servings/{servingId}
		GET    /api/users/me/servings
		GET    /api/machines/{machineId}/servings

	Simple flow:
		Request beverage
		↓
		Check machine stock
		↓
		Create serving transaction
		↓
		Send command to machine
		↓
		Machine prepares drink
		↓
		Deduct stock
		↓
		Save consumed ingredients
		↓
		Mark completed

14. Stock Alert APIs
	You do not currently have a separate alert table. I recommend adding one later.
		GET    /api/alerts
		GET    /api/alerts/low-stock
		GET    /api/alerts/expiry
		PUT    /api/alerts/{alertId}/acknowledge

	For now, alerts can be calculated from:
		map_machine_ingredient_stock.current_quantity
		map_machine_ingredient_stock.minimum_threshold_quantity
		map_warehouse_ingredient_stock.current_quantity
		map_warehouse_ingredient_stock.minimum_threshold_quantity

15. Future Payment Placeholder APIs
	Even if payment comes later, keep placeholder design.
		POST   /api/payments/initiate
		POST   /api/payments/confirm
		POST   /api/payments/fail
		GET    /api/payments/{paymentId}
		GET    /api/users/me/payments

	Suggested future tables:
		txn_payment
		txn_payment_gateway_response
		map_serving_payment

	Very important question
		For real machine hardware, the biggest missing piece is:
		How will your backend send command to the vending machine?
		Example:
			Prepare beverage ID 10
			Use recipe quantities
			Start dispensing
			Report success/failure
			Report current machine stock

	So you may need one more module:


16. Machine Communication APIs
		POST   /api/machines/{machineId}/commands/prepare-beverage
		POST   /api/machines/{machineId}/commands/cancel
		POST   /api/machines/{machineId}/heartbeat
		POST   /api/machines/{machineId}/telemetry
		POST   /api/machines/{machineId}/serving-status

	This depends on the actual vending machine hardware.


My questions for you - 
	1. Will the customer scan a QR code on the vending machine before ordering?
	2. Should the app show only beverages available in that selected machine?
	3. Should customization be allowed only within min/max limits?
	4. Should inventory deduction happen when serving starts or only after machine confirms success?
	5. Should guest ordering be allowed?

Your database design is a good start. Next, I would add role tables, alert tables, payment placeholder tables, and machine command tables before writing Java APIs.



-- Prompt 4 -- 
Pointwise answers - 
	1. It would be better if a customer can download the app and order from app only. QR code on vending machine can directly open/download the app on the phone, where user can login to select their beverage.
	2. There should be an option on the app to show all/only available beverages. A reason can be displayed against the beverage to show if it is available, or out of stock, or not on this vending machine etc.
	3. Yes. I guess there should be a limit. And there should be few mandatory ingredients and quantity. For example, 
		- user can not select milk tea and set milk quantity to zero. 
		- User can not select sugarless tea and select sugar quantity as 20 grams. 
		- User can not select Elaichi Tea, and give Elaichi = 100 grams and rest zero.
		So a manadorily minimum and maximum should be there.   
	4. Only when machine confirms success. There should be audit of each transaction where each transaction creates a new row in transaction table,, and marks the status as Failed/Success/Stuck etc.
	5. No. Atleast one identifier is needed. Like Phone number, email, fingerprint (if possible), aadhaar, PAN, or some identifier. All these to be used to create/update new row in master_user table. 


-- Reply from ChatGPT -- 
Yes, your answers make the app much clearer now.

You are building:
	“Mobile App + Smart Vending Machine Backend”

	Main flow:
		Customer installs app
		↓
		Logs in using phone/email
		↓
		Selects nearby vending machine
		↓
		Sees beverages: available / unavailable / out of stock
		↓
		Customizes beverage within allowed limits
		↓
		Places order
		↓
		Machine prepares beverage
		↓
		Machine sends success/failure/stuck status
		↓
		System records transaction
		↓
		Stock is reduced only after success
		↓
		Inventory users get low-stock alerts

	Updated API modules needed
		1. Authentication APIs
			POST /api/auth/register
			POST /api/auth/login
			POST /api/auth/send-otp
			POST /api/auth/verify-otp
			POST /api/auth/logout

		Use phone/email first. Avoid Aadhaar/PAN unless legally required.

		2. User APIs
			GET  /api/users/me
			PUT  /api/users/me
			GET  /api/users/me/preferences
			PUT  /api/users/me/preferences
		3. Role APIs
			GET  /api/roles
			POST /api/users/{userId}/roles
			GET  /api/users/{userId}/roles

			Roles:
				CUSTOMER
				ADMIN
				INVENTORY_USER
				MACHINE_OPERATOR
				BUSINESS_OWNER
				SERVICE_ENGINEER

		4. Machine APIs
			GET /api/machines
			GET /api/machines/nearby
			GET /api/machines/{machineId}
			GET /api/machines/{machineId}/status
			GET /api/machines/{machineId}/beverages

		5. Beverage Availability APIs
			Very important for your requirement.
				GET /api/machines/{machineId}/beverages/availability

			Response example:
				[
				  {
					"beverageId": 1,
					"name": "Milk Tea",
					"available": true,
					"reason": "Available"
				  },
				  {
					"beverageId": 2,
					"name": "Elaichi Tea",
					"available": false,
					"reason": "Elaichi out of stock"
				  },
				  {
					"beverageId": 3,
					"name": "Cold Coffee",
					"available": false,
					"reason": "Not supported by this machine"
				  }
				]

	6. Beverage Recipe APIs
		GET  /api/beverages
		GET  /api/beverages/{beverageId}
		GET  /api/beverages/{beverageId}/recipe
		POST /api/beverages/{beverageId}/recipe
		PUT  /api/beverages/{beverageId}/recipe

	7. Ingredient Limit APIs
		You need this table/logic.
			GET /api/beverages/{beverageId}/ingredient-rules

		Example rule:
			{
			  "beverage": "Milk Tea",
			  "ingredient": "Milk",
			  "mandatory": true,
			  "defaultQuantity": 50,
			  "minQuantity": 30,
			  "maxQuantity": 80,
			  "unit": "ml"
			}

		This solves:
			Milk tea cannot have milk = 0
			Sugarless tea cannot have sugar = 20g
			Elaichi tea cannot have elaichi = 100g

		I recommend adding columns to recipe table:
			min_quantity
			max_quantity
			is_mandatory
			is_customizable

	8. User Custom Beverage APIs
		GET    /api/users/me/beverage-combinations
		POST   /api/users/me/beverage-combinations
		PUT    /api/users/me/beverage-combinations/{comboId}
		DELETE /api/users/me/beverage-combinations/{comboId}

		Example:
			My Strong Ginger Tea
			My Less Sugar Coffee
			My Office Tea

	9. Order / Serving APIs
		This is the most important module.
			POST /api/servings/request
			GET  /api/servings/{servingId}
			GET  /api/users/me/servings
			POST /api/servings/{servingId}/cancel

		Request example:
			{
			  "machineId": 10,
			  "beverageId": 5,
			  "customIngredients": [
				{
				  "ingredientId": 1,
				  "quantity": 50,
				  "unit": "ml"
				}
			  ]
			}

	10. Machine Callback APIs
		Machine will call these APIs.
			POST /api/machine-callbacks/serving-started
			POST /api/machine-callbacks/serving-success
			POST /api/machine-callbacks/serving-failed
			POST /api/machine-callbacks/serving-stuck
			POST /api/machine-callbacks/heartbeat

		Stock should reduce only here:
			/api/machine-callbacks/serving-success

		Not when customer places order.

11. Transaction Audit APIs
		GET /api/serving-transactions
		GET /api/serving-transactions/{transactionId}
		GET /api/machines/{machineId}/serving-transactions

		Statuses:
			REQUESTED
			SENT_TO_MACHINE
			PREPARING
			SUCCESS
			FAILED
			STUCK
			CANCELLED
			REFUNDED


12. Stock APIs
		GET  /api/machines/{machineId}/stock
		GET  /api/machines/{machineId}/stock/low
		POST /api/machines/{machineId}/stock/refill
		POST /api/machines/{machineId}/stock/adjust

13. Alert APIs
		GET  /api/alerts
		GET  /api/alerts/low-stock
		PUT  /api/alerts/{alertId}/acknowledge

	Alert example:
		Machine 12: Milk below minimum level
		Machine 8: Sugar almost empty
		Machine 5: Coffee powder expired

14. Future Payment APIs
	Keep placeholder now.
		POST /api/payments/initiate
		POST /api/payments/success
		POST /api/payments/failure
		GET  /api/payments/{paymentId}

	For now, serving can work without payment.



My suggestion
	Before Java coding, your DB needs 4 improvements:
		1. Role/access tables
		2. Beverage ingredient min/max rule columns
		3. Machine command/callback transaction tables
		4. Payment placeholder tables


After that, we can start Spring Boot API code module by module.





-- Prompt 5 -- 
Thanks.
Is it possible for you to give updated scripts of the tables. I will update them in my script as well.
Give comments wherever possible.
Also, please give scripts of the new tables, which were absent in my scripts, but you suggested.


-- Response from ChatGPT -- 
Yes — I prepared the updated SQL patch.
	Download here: vending_db_patch_v4.sql
It contains:
	1. ALTER TABLE scripts for your existing tables
	2. New role/access tables
	3. Login identifier + OTP tables
	4. Machine-beverage availability table
	5. Machine command/callback audit tables
	6. Alert table
	7. Future payment placeholder tables
	8. Comments on tables and columns


-- Script is below -- 

/*
NOTE FOR MERGE:
  This script is intentionally written as ALTER TABLE + CREATE TABLE.
  It avoids rewriting your full existing database script and makes it safer
  to merge into Vending_Scripts_v2.sql.

  Run on a test database first. Some ALTER statements may fail if you have
  already added these columns/indexes manually.
*/


/*
===============================================================================
VENDING APP DATABASE PATCH - v4
Purpose:
  1. Adds missing tables needed for mobile app, role-based access, vending
     machine communication, transaction audit, alerts, and future payments.
  2. Updates existing recipe/serving tables with columns required for
     ingredient min/max validation and real machine success/failure lifecycle.

Assumption:
  Existing tables from Vending_Scripts_v2.sql already exist. This file is a merge-friendly patch:
    master_user, master_beverage, master_ingredient, master_ingredient_subtype,
    master_vending_machine, map_default_beverage_ingredient,
    master_user_beverage_combination, txn_beverage_serving,
    map_machine_ingredient_stock, map_warehouse_ingredient_stock, etc.

Database:
  MySQL 8.x recommended.
===============================================================================
*/

USE beverage_vending_machine;

-- =============================================================================
-- A. UPDATES TO EXISTING TABLES
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. Update map_default_beverage_ingredient
-- Purpose:
--   This table becomes the master recipe rule table.
--   It defines default, minimum, and maximum allowed ingredient quantity
--   for each beverage.
-- -----------------------------------------------------------------------------

ALTER TABLE map_default_beverage_ingredient
    ADD COLUMN minimum_quantity DECIMAL(10,3) NOT NULL DEFAULT 0.000
        COMMENT 'Minimum allowed quantity of this ingredient for one serving. Used to prevent invalid customization like milk tea with zero milk'
        AFTER default_quantity,
    ADD COLUMN maximum_quantity DECIMAL(10,3) NULL
        COMMENT 'Maximum allowed quantity of this ingredient for one serving. Used to prevent excessive customization like elaichi 100 grams'
        AFTER minimum_quantity,
    ADD COLUMN quantity_step DECIMAL(10,3) NULL
        COMMENT 'Allowed step size for customization, for example sugar can increase/decrease by 1 gram or milk by 5 ml'
        AFTER maximum_quantity,
    ADD COLUMN validation_message VARCHAR(500) NULL
        COMMENT 'User friendly message shown when selected quantity violates rule, for example Milk Tea must contain at least 30 ml milk'
        AFTER quantity_step;

-- Helpful index for recipe validation lookups.
CREATE INDEX idx_default_bev_ing_validation
    ON map_default_beverage_ingredient (beverage_id, ingredient_id, is_mandatory, allow_user_customization, is_active);


-- -----------------------------------------------------------------------------
-- 2. Update master_user
-- Purpose:
--   Adds login/security-related fields while still keeping master_user as the
--   primary person/customer table.
-- -----------------------------------------------------------------------------

ALTER TABLE master_user
    ADD COLUMN login_identifier VARCHAR(255) NULL
        COMMENT 'Primary login identifier chosen by application, usually email or phone number'
        AFTER phone_number,
    ADD COLUMN password_hash VARCHAR(255) NULL
        COMMENT 'Hashed password only. Never store plain password'
        AFTER login_identifier,
    ADD COLUMN email_verified_flag TINYINT NOT NULL DEFAULT 0
        COMMENT 'Indicates whether user email has been verified'
        AFTER password_hash,
    ADD COLUMN phone_verified_flag TINYINT NOT NULL DEFAULT 0
        COMMENT 'Indicates whether user phone number has been verified'
        AFTER email_verified_flag,
    ADD COLUMN last_login_on DATETIME NULL
        COMMENT 'Date and time when user last logged in'
        AFTER phone_verified_flag;

CREATE INDEX idx_master_user_login_identifier
    ON master_user (login_identifier);


-- -----------------------------------------------------------------------------
-- 3. Update txn_beverage_serving
-- Purpose:
--   Improves audit trail for real machine workflow.
--   Stock will be reduced only after machine confirms SUCCESS.
-- -----------------------------------------------------------------------------

ALTER TABLE txn_beverage_serving
    ADD COLUMN order_source VARCHAR(50) NOT NULL DEFAULT 'MOBILE_APP'
        COMMENT 'Source of order such as MOBILE_APP, MACHINE_TOUCHSCREEN, ADMIN_TEST, API'
        AFTER serving_reference_no,
    ADD COLUMN client_request_id VARCHAR(100) NULL
        COMMENT 'Unique request id sent by mobile app to avoid duplicate orders on retry'
        AFTER order_source,
    ADD COLUMN requested_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        COMMENT 'Date and time when customer requested the beverage'
        AFTER combo_id,
    ADD COLUMN sent_to_machine_on DATETIME NULL
        COMMENT 'Date and time when backend sent command to vending machine'
        AFTER requested_on,
    ADD COLUMN machine_acknowledged_on DATETIME NULL
        COMMENT 'Date and time when vending machine acknowledged the prepare command'
        AFTER sent_to_machine_on,
    ADD COLUMN preparation_started_on DATETIME NULL
        COMMENT 'Date and time when vending machine reported preparation started'
        AFTER machine_acknowledged_on,
    ADD COLUMN preparation_completed_on DATETIME NULL
        COMMENT 'Date and time when vending machine reported successful completion'
        AFTER preparation_started_on,
    ADD COLUMN machine_error_code VARCHAR(100) NULL
        COMMENT 'Machine error code if serving failed or got stuck'
        AFTER failure_reason,
    ADD COLUMN stock_deducted_flag TINYINT NOT NULL DEFAULT 0
        COMMENT 'Indicates whether ingredient stock has already been deducted for this serving. Should become 1 only after machine success'
        AFTER machine_error_code,
    ADD COLUMN stock_deducted_on DATETIME NULL
        COMMENT 'Date and time when machine ingredient stock was deducted'
        AFTER stock_deducted_flag,
    ADD COLUMN payment_required_flag TINYINT NOT NULL DEFAULT 0
        COMMENT 'Placeholder flag for future payment support'
        AFTER stock_deducted_on,
    ADD COLUMN payment_status VARCHAR(50) NOT NULL DEFAULT 'NOT_REQUIRED'
        COMMENT 'Future payment status such as NOT_REQUIRED, PENDING, SUCCESS, FAILED, REFUNDED'
        AFTER payment_required_flag;

CREATE UNIQUE INDEX uk_serving_client_request
    ON txn_beverage_serving (requested_by_user_id, client_request_id);

CREATE INDEX idx_serving_status_machine
    ON txn_beverage_serving (machine_id, serving_status, requested_on);

CREATE INDEX idx_serving_stock_deducted
    ON txn_beverage_serving (stock_deducted_flag, serving_status);


-- =============================================================================
-- B. NEW TABLES FOR ROLE BASED ACCESS
-- =============================================================================

CREATE TABLE IF NOT EXISTS master_role (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key - Unique ID for each role',

    role_code VARCHAR(50) NOT NULL COMMENT 'Unique role code such as CUSTOMER, ADMIN, INVENTORY_USER, MACHINE_OPERATOR, BUSINESS_OWNER, SERVICE_ENGINEER',
    role_name VARCHAR(100) NOT NULL COMMENT 'Display name of the role',
    role_description VARCHAR(500) NULL COMMENT 'Description of what this role can do in the application',
    is_active TINYINT NOT NULL DEFAULT 1 COMMENT 'Indicates whether this role is active',

    created_by_id INT NOT NULL COMMENT 'Audit Column - User ID who created this role',
    created_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit Column - Date and time when this role was created',
    updated_by_id INT NULL COMMENT 'Audit Column - User ID who last updated this role',
    updated_on DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Audit Column - Date and time when this role was last updated',

    UNIQUE KEY uk_master_role_code (role_code),
    KEY idx_master_role_created_by (created_by_id),
    KEY idx_master_role_updated_by (updated_by_id),

    CONSTRAINT fk_master_role_created_by
        FOREIGN KEY (created_by_id) REFERENCES master_user (id),
    CONSTRAINT fk_master_role_updated_by
        FOREIGN KEY (updated_by_id) REFERENCES master_user (id)
) COMMENT='Master table for application roles used for role based access control';

CREATE TABLE IF NOT EXISTS map_user_role (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key - Unique ID for each user-role mapping',

    user_id INT NOT NULL COMMENT 'Foreign Key to master_user(id). User receiving the role',
    role_id INT NOT NULL COMMENT 'Foreign Key to master_role(id). Role assigned to the user',
    is_active TINYINT NOT NULL DEFAULT 1 COMMENT 'Indicates whether this role assignment is active',

    effective_from DATETIME NULL COMMENT 'Date and time from which this role assignment is valid',
    effective_to DATETIME NULL COMMENT 'Date and time until which this role assignment is valid',

    created_by_id INT NOT NULL COMMENT 'Audit Column - User ID who assigned this role',
    created_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit Column - Date and time when this role assignment was created',
    updated_by_id INT NULL COMMENT 'Audit Column - User ID who last updated this role assignment',
    updated_on DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Audit Column - Date and time when this role assignment was last updated',

    UNIQUE KEY uk_user_role (user_id, role_id),
    KEY idx_map_user_role_user (user_id),
    KEY idx_map_user_role_role (role_id),

    CONSTRAINT fk_map_user_role_user
        FOREIGN KEY (user_id) REFERENCES master_user (id),
    CONSTRAINT fk_map_user_role_role
        FOREIGN KEY (role_id) REFERENCES master_role (id),
    CONSTRAINT fk_map_user_role_created_by
        FOREIGN KEY (created_by_id) REFERENCES master_user (id),
    CONSTRAINT fk_map_user_role_updated_by
        FOREIGN KEY (updated_by_id) REFERENCES master_user (id)
) COMMENT='Mapping table assigning one or more roles to each user';


-- =============================================================================
-- C. NEW TABLES FOR LOGIN IDENTIFIERS AND OTP
-- =============================================================================

CREATE TABLE IF NOT EXISTS map_user_identifier (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key - Unique ID for each user identifier',

    user_id INT NOT NULL COMMENT 'Foreign Key to master_user(id). User owning this identifier',
    identifier_type VARCHAR(50) NOT NULL COMMENT 'Type of identifier such as EMAIL, PHONE. Avoid sensitive IDs like Aadhaar/PAN unless legally required',
    identifier_value VARCHAR(255) NOT NULL COMMENT 'Identifier value such as email address or phone number',
    verified_flag TINYINT NOT NULL DEFAULT 0 COMMENT 'Indicates whether this identifier has been verified',
    primary_flag TINYINT NOT NULL DEFAULT 0 COMMENT 'Indicates whether this is the primary identifier for login/communication',
    is_active TINYINT NOT NULL DEFAULT 1 COMMENT 'Indicates whether this identifier is active',

    verified_on DATETIME NULL COMMENT 'Date and time when this identifier was verified',

    created_by_id INT NOT NULL COMMENT 'Audit Column - User ID who created this identifier',
    created_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit Column - Date and time when this identifier was created',
    updated_by_id INT NULL COMMENT 'Audit Column - User ID who last updated this identifier',
    updated_on DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Audit Column - Date and time when this identifier was last updated',

    UNIQUE KEY uk_identifier_type_value (identifier_type, identifier_value),
    KEY idx_identifier_user (user_id),

    CONSTRAINT fk_identifier_user
        FOREIGN KEY (user_id) REFERENCES master_user (id),
    CONSTRAINT fk_identifier_created_by
        FOREIGN KEY (created_by_id) REFERENCES master_user (id),
    CONSTRAINT fk_identifier_updated_by
        FOREIGN KEY (updated_by_id) REFERENCES master_user (id)
) COMMENT='Stores user login identifiers like phone and email. Useful when one user can have multiple identifiers';

CREATE TABLE IF NOT EXISTS txn_user_otp (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key - Unique ID for each OTP transaction',

    user_id INT NULL COMMENT 'Foreign Key to master_user(id). Can be null before user registration is completed',
    identifier_type VARCHAR(50) NOT NULL COMMENT 'Identifier type to which OTP was sent, for example EMAIL or PHONE',
    identifier_value VARCHAR(255) NOT NULL COMMENT 'Email or phone number to which OTP was sent',
    otp_hash VARCHAR(255) NOT NULL COMMENT 'Hashed OTP. Never store plain OTP',
    otp_purpose VARCHAR(50) NOT NULL COMMENT 'Purpose such as REGISTER, LOGIN, RESET_PASSWORD, VERIFY_IDENTIFIER',
    otp_status VARCHAR(50) NOT NULL DEFAULT 'SENT' COMMENT 'OTP status such as SENT, VERIFIED, EXPIRED, FAILED',
    expires_on DATETIME NOT NULL COMMENT 'Date and time after which OTP is invalid',
    verified_on DATETIME NULL COMMENT 'Date and time when OTP was verified',
    attempt_count INT NOT NULL DEFAULT 0 COMMENT 'Number of verification attempts made by user',

    created_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time when OTP was generated',

    KEY idx_otp_identifier (identifier_type, identifier_value, otp_purpose, otp_status),
    KEY idx_otp_user (user_id),

    CONSTRAINT fk_otp_user
        FOREIGN KEY (user_id) REFERENCES master_user (id)
) COMMENT='Transaction table for OTP based registration, login, and identifier verification';


-- =============================================================================
-- D. NEW TABLES FOR MACHINE BEVERAGE SUPPORT AND AVAILABILITY REASON
-- =============================================================================

CREATE TABLE IF NOT EXISTS map_machine_beverage (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key - Unique ID for each machine-beverage mapping',

    machine_id INT NOT NULL COMMENT 'Foreign Key to master_vending_machine(id). Vending machine',
    beverage_id INT NOT NULL COMMENT 'Foreign Key to master_beverage(id). Beverage supported by this machine',
    is_enabled TINYINT NOT NULL DEFAULT 1 COMMENT 'Indicates whether this beverage is enabled on this machine',
    unavailable_reason VARCHAR(500) NULL COMMENT 'Reason why beverage is disabled on this machine, for example Machine does not support chilled drinks',
    display_order INT NOT NULL DEFAULT 0 COMMENT 'Display order of beverage on this machine',

    created_by_id INT NOT NULL COMMENT 'Audit Column - User ID who created this mapping',
    created_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit Column - Date and time when this mapping was created',
    updated_by_id INT NULL COMMENT 'Audit Column - User ID who last updated this mapping',
    updated_on DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Audit Column - Date and time when this mapping was last updated',

    UNIQUE KEY uk_machine_beverage (machine_id, beverage_id),
    KEY idx_machine_beverage_machine (machine_id),
    KEY idx_machine_beverage_beverage (beverage_id),
    KEY idx_machine_beverage_display (machine_id, display_order),

    CONSTRAINT fk_machine_beverage_machine
        FOREIGN KEY (machine_id) REFERENCES master_vending_machine (id),
    CONSTRAINT fk_machine_beverage_beverage
        FOREIGN KEY (beverage_id) REFERENCES master_beverage (id),
    CONSTRAINT fk_machine_beverage_created_by
        FOREIGN KEY (created_by_id) REFERENCES master_user (id),
    CONSTRAINT fk_machine_beverage_updated_by
        FOREIGN KEY (updated_by_id) REFERENCES master_user (id)
) COMMENT='Defines which beverages are supported or enabled on each vending machine';


-- =============================================================================
-- E. NEW TABLES FOR MACHINE COMMANDS AND CALLBACK AUDIT
-- =============================================================================

CREATE TABLE IF NOT EXISTS txn_machine_command (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key - Unique ID for each command sent to vending machine',

    command_reference_no VARCHAR(100) NOT NULL COMMENT 'Unique command reference number generated by backend',
    machine_id INT NOT NULL COMMENT 'Foreign Key to master_vending_machine(id). Machine receiving the command',
    serving_id INT NULL COMMENT 'Foreign Key to txn_beverage_serving(id). Serving transaction related to this command, if applicable',

    command_type VARCHAR(50) NOT NULL COMMENT 'Command type such as PREPARE_BEVERAGE, CANCEL_SERVING, SYNC_STOCK, HEALTH_CHECK',
    command_payload_json JSON NULL COMMENT 'Full command payload sent to machine as JSON',
    command_status VARCHAR(50) NOT NULL DEFAULT 'CREATED' COMMENT 'Command status such as CREATED, SENT, ACKNOWLEDGED, SUCCESS, FAILED, TIMEOUT',
    sent_on DATETIME NULL COMMENT 'Date and time when command was sent to machine',
    acknowledged_on DATETIME NULL COMMENT 'Date and time when machine acknowledged command',
    completed_on DATETIME NULL COMMENT 'Date and time when command completed',
    failure_reason VARCHAR(500) NULL COMMENT 'Failure reason if command failed',

    created_by_id INT NOT NULL COMMENT 'Audit Column - User ID who created this command',
    created_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit Column - Date and time when this command was created',
    updated_by_id INT NULL COMMENT 'Audit Column - User ID who last updated this command',
    updated_on DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Audit Column - Date and time when this command was last updated',

    UNIQUE KEY uk_machine_command_ref (command_reference_no),
    KEY idx_machine_command_machine (machine_id, command_status),
    KEY idx_machine_command_serving (serving_id),

    CONSTRAINT fk_machine_command_machine
        FOREIGN KEY (machine_id) REFERENCES master_vending_machine (id),
    CONSTRAINT fk_machine_command_serving
        FOREIGN KEY (serving_id) REFERENCES txn_beverage_serving (id),
    CONSTRAINT fk_machine_command_created_by
        FOREIGN KEY (created_by_id) REFERENCES master_user (id),
    CONSTRAINT fk_machine_command_updated_by
        FOREIGN KEY (updated_by_id) REFERENCES master_user (id)
) COMMENT='Audit table for every command sent from backend to vending machine';

CREATE TABLE IF NOT EXISTS txn_machine_callback (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key - Unique ID for each callback/event received from vending machine',

    machine_id INT NOT NULL COMMENT 'Foreign Key to master_vending_machine(id). Machine sending the callback',
    serving_id INT NULL COMMENT 'Foreign Key to txn_beverage_serving(id). Related serving transaction, if applicable',
    command_id INT NULL COMMENT 'Foreign Key to txn_machine_command(id). Related machine command, if applicable',

    callback_type VARCHAR(50) NOT NULL COMMENT 'Callback type such as HEARTBEAT, SERVING_STARTED, SERVING_SUCCESS, SERVING_FAILED, SERVING_STUCK, STOCK_STATUS',
    callback_status VARCHAR(50) NOT NULL DEFAULT 'RECEIVED' COMMENT 'Processing status such as RECEIVED, PROCESSED, IGNORED, ERROR',
    machine_event_time DATETIME NULL COMMENT 'Date and time of event according to vending machine',
    received_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time when backend received this callback',
    payload_json JSON NULL COMMENT 'Raw callback payload received from machine as JSON',
    error_code VARCHAR(100) NULL COMMENT 'Machine error code, if any',
    error_message VARCHAR(500) NULL COMMENT 'Machine error message, if any',

    KEY idx_callback_machine (machine_id, callback_type, received_on),
    KEY idx_callback_serving (serving_id),
    KEY idx_callback_command (command_id),

    CONSTRAINT fk_callback_machine
        FOREIGN KEY (machine_id) REFERENCES master_vending_machine (id),
    CONSTRAINT fk_callback_serving
        FOREIGN KEY (serving_id) REFERENCES txn_beverage_serving (id),
    CONSTRAINT fk_callback_command
        FOREIGN KEY (command_id) REFERENCES txn_machine_command (id)
) COMMENT='Stores every event/callback received from vending machine for audit and debugging';


-- =============================================================================
-- F. NEW TABLES FOR ALERTS
-- =============================================================================

CREATE TABLE IF NOT EXISTS txn_alert (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key - Unique ID for each alert',

    alert_reference_no VARCHAR(100) NOT NULL COMMENT 'Unique alert reference number generated by application',
    alert_type VARCHAR(50) NOT NULL COMMENT 'Alert type such as LOW_STOCK, OUT_OF_STOCK, EXPIRY, MACHINE_OFFLINE, SERVING_STUCK',
    alert_severity VARCHAR(50) NOT NULL DEFAULT 'MEDIUM' COMMENT 'Severity such as LOW, MEDIUM, HIGH, CRITICAL',
    alert_status VARCHAR(50) NOT NULL DEFAULT 'OPEN' COMMENT 'Status such as OPEN, ACKNOWLEDGED, RESOLVED, CLOSED',

    machine_id INT NULL COMMENT 'Foreign Key to master_vending_machine(id), if alert is machine specific',
    warehouse_id INT NULL COMMENT 'Foreign Key to master_warehouse(id), if alert is warehouse specific',
    ingredient_id INT NULL COMMENT 'Foreign Key to master_ingredient(id), if alert is ingredient specific',
    ingredient_subtype_id INT NULL COMMENT 'Foreign Key to master_ingredient_subtype(id), if alert is ingredient subtype specific',
    serving_id INT NULL COMMENT 'Foreign Key to txn_beverage_serving(id), if alert is serving specific',

    alert_title VARCHAR(200) NOT NULL COMMENT 'Short title shown to user, for example Milk stock low',
    alert_message VARCHAR(1000) NOT NULL COMMENT 'Detailed alert message shown to inventory or support users',
    generated_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time when alert was generated',
    acknowledged_by_id INT NULL COMMENT 'Foreign Key to master_user(id). User who acknowledged the alert',
    acknowledged_on DATETIME NULL COMMENT 'Date and time when alert was acknowledged',
    resolved_by_id INT NULL COMMENT 'Foreign Key to master_user(id). User who resolved the alert',
    resolved_on DATETIME NULL COMMENT 'Date and time when alert was resolved',
    resolution_remarks VARCHAR(1000) NULL COMMENT 'Remarks entered during alert resolution',

    UNIQUE KEY uk_alert_reference_no (alert_reference_no),
    KEY idx_alert_status_type (alert_status, alert_type, alert_severity),
    KEY idx_alert_machine (machine_id),
    KEY idx_alert_warehouse (warehouse_id),
    KEY idx_alert_ingredient (ingredient_id),
    KEY idx_alert_serving (serving_id),

    CONSTRAINT fk_alert_machine
        FOREIGN KEY (machine_id) REFERENCES master_vending_machine (id),
    CONSTRAINT fk_alert_warehouse
        FOREIGN KEY (warehouse_id) REFERENCES master_warehouse (id),
    CONSTRAINT fk_alert_ingredient
        FOREIGN KEY (ingredient_id) REFERENCES master_ingredient (id),
    CONSTRAINT fk_alert_subtype
        FOREIGN KEY (ingredient_subtype_id) REFERENCES master_ingredient_subtype (id),
    CONSTRAINT fk_alert_serving
        FOREIGN KEY (serving_id) REFERENCES txn_beverage_serving (id),
    CONSTRAINT fk_alert_ack_user
        FOREIGN KEY (acknowledged_by_id) REFERENCES master_user (id),
    CONSTRAINT fk_alert_res_user
        FOREIGN KEY (resolved_by_id) REFERENCES master_user (id)
) COMMENT='Stores alerts for low stock, expiry, machine offline, stuck serving, and other operational issues';


-- =============================================================================
-- G. NEW TABLES FOR FUTURE PAYMENT PLACEHOLDER
-- =============================================================================

CREATE TABLE IF NOT EXISTS txn_payment (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key - Unique ID for each payment transaction',

    payment_reference_no VARCHAR(100) NOT NULL COMMENT 'Unique payment reference number generated by application',
    serving_id INT NULL COMMENT 'Foreign Key to txn_beverage_serving(id). Serving transaction for which payment was made',
    user_id INT NOT NULL COMMENT 'Foreign Key to master_user(id). User making the payment',

    payment_amount DECIMAL(12,2) NOT NULL DEFAULT 0.00 COMMENT 'Payment amount charged for beverage/order',
    currency_code VARCHAR(10) NOT NULL DEFAULT 'INR' COMMENT 'Currency code such as INR, USD',
    payment_method VARCHAR(50) NULL COMMENT 'Payment method such as UPI, CARD, WALLET, CASH, CORPORATE_ACCOUNT',
    payment_gateway VARCHAR(100) NULL COMMENT 'Payment gateway name such as Razorpay, Paytm, Stripe, internal wallet',
    gateway_order_id VARCHAR(255) NULL COMMENT 'Gateway order id, if provided by payment gateway',
    gateway_payment_id VARCHAR(255) NULL COMMENT 'Gateway payment id, if provided by payment gateway',

    payment_status VARCHAR(50) NOT NULL DEFAULT 'NOT_INITIATED' COMMENT 'Payment status such as NOT_INITIATED, INITIATED, SUCCESS, FAILED, REFUNDED',
    initiated_on DATETIME NULL COMMENT 'Date and time when payment was initiated',
    completed_on DATETIME NULL COMMENT 'Date and time when payment completed successfully',
    failure_reason VARCHAR(500) NULL COMMENT 'Failure reason if payment failed',

    created_by_id INT NOT NULL COMMENT 'Audit Column - User ID who created this payment record',
    created_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit Column - Date and time when this payment was created',
    updated_by_id INT NULL COMMENT 'Audit Column - User ID who last updated this payment record',
    updated_on DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'Audit Column - Date and time when this payment was last updated',

    UNIQUE KEY uk_payment_reference_no (payment_reference_no),
    KEY idx_payment_serving (serving_id),
    KEY idx_payment_user (user_id),
    KEY idx_payment_status (payment_status),

    CONSTRAINT fk_payment_serving
        FOREIGN KEY (serving_id) REFERENCES txn_beverage_serving (id),
    CONSTRAINT fk_payment_user
        FOREIGN KEY (user_id) REFERENCES master_user (id),
    CONSTRAINT fk_payment_created_by
        FOREIGN KEY (created_by_id) REFERENCES master_user (id),
    CONSTRAINT fk_payment_updated_by
        FOREIGN KEY (updated_by_id) REFERENCES master_user (id)
) COMMENT='Future-ready payment transaction table. Can stay unused until payment module is implemented';

CREATE TABLE IF NOT EXISTS txn_payment_gateway_event (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Primary Key - Unique ID for each payment gateway event/webhook',

    payment_id INT NOT NULL COMMENT 'Foreign Key to txn_payment(id). Payment transaction related to this gateway event',
    event_type VARCHAR(100) NOT NULL COMMENT 'Gateway event type such as payment.success, payment.failed, refund.processed',
    event_status VARCHAR(50) NOT NULL DEFAULT 'RECEIVED' COMMENT 'Processing status such as RECEIVED, PROCESSED, IGNORED, ERROR',
    gateway_event_id VARCHAR(255) NULL COMMENT 'Unique event id provided by payment gateway',
    received_on DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time when backend received this gateway event',
    payload_json JSON NULL COMMENT 'Raw gateway event payload as JSON',

    KEY idx_gateway_event_payment (payment_id),
    KEY idx_gateway_event_type (event_type, event_status),

    CONSTRAINT fk_gateway_event_payment
        FOREIGN KEY (payment_id) REFERENCES txn_payment (id)
) COMMENT='Stores raw payment gateway events/webhooks for future payment audit';


-- =============================================================================
-- H. OPTIONAL SEED DATA FOR ROLES
-- Replace created_by_id = 1 with your actual system/admin user id.
-- =============================================================================

INSERT INTO master_role
(role_code, role_name, role_description, is_active, created_by_id)
VALUES
('CUSTOMER', 'Customer', 'Customer who orders beverages from mobile app', 1, 1),
('ADMIN', 'Admin', 'System administrator with configuration access', 1, 1),
('INVENTORY_USER', 'Inventory User', 'User responsible for stock refill and stock monitoring', 1, 1),
('MACHINE_OPERATOR', 'Machine Operator', 'User responsible for vending machine operation and maintenance coordination', 1, 1),
('SERVICE_ENGINEER', 'Service Engineer', 'Technical user responsible for machine service and issue resolution', 1, 1),
('BUSINESS_OWNER', 'Business Owner', 'Owner or manager who can view business reports and operational status', 1, 1)
ON DUPLICATE KEY UPDATE
    role_name = VALUES(role_name),
    role_description = VALUES(role_description),
    is_active = VALUES(is_active),
    updated_by_id = VALUES(created_by_id),
    updated_on = CURRENT_TIMESTAMP;















One final suggestion: keep a file called:
	- VendingMachine_Project_Vision.md

and write down every business rule you think of. Over time, that document will become more valuable than the code itself.




