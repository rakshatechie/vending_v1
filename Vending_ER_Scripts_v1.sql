


-- Mermaid ER Diagram -- 

erDiagram

    master_user {
        INT id PK
        VARCHAR first_name
        VARCHAR middle_name
        VARCHAR last_name
        DATE date_of_birth
        VARCHAR email UK
        VARCHAR phone_number UK
        VARCHAR user_type
        VARCHAR preferred_language
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    master_beverage {
        INT id PK
        VARCHAR beverage_code UK
        VARCHAR beverage_name
        VARCHAR beverage_type
        VARCHAR beverage_description
        DECIMAL beverage_default_quantity_ml
        VARCHAR default_temperature_type
        DECIMAL default_temperature_celsius
        INT display_order
        TINYINT is_customizable
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    master_ingredient {
        INT id PK
        VARCHAR ingredient_code UK
        VARCHAR ingredient_name UK
        VARCHAR ingredient_category
        VARCHAR default_unit
        VARCHAR ingredient_description
        TINYINT is_allergen
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    master_ingredient_subtype {
        INT id PK
        VARCHAR ingredient_subtype_code UK
        VARCHAR ingredient_subtype_name UK
        VARCHAR physical_form
        VARCHAR ingredient_subtype_description
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    master_preparation_method {
        INT id PK
        VARCHAR preparation_method_code UK
        VARCHAR preparation_method_name UK
        VARCHAR preparation_method_description
        INT default_duration_seconds
        DECIMAL default_temperature_celsius
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    master_vending_machine_location {
        INT id PK
        VARCHAR location_code UK
        VARCHAR building_name
        VARCHAR floor_number
        VARCHAR area
        VARCHAR city
        VARCHAR district
        VARCHAR state
        VARCHAR country
        VARCHAR pin_code
        VARCHAR phone_number
        VARCHAR phone_number_alternate
        VARCHAR location_description
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    master_vending_machine {
        INT id PK
        VARCHAR machine_code UK
        VARCHAR machine_number
        VARCHAR serial_number UK
        VARCHAR model_number
        INT location_id FK
        DATE installation_date
        DATETIME last_service_on
        DATETIME next_service_due_on
        TINYINT supports_hot_water
        TINYINT supports_steam
        TINYINT supports_cold_beverage
        VARCHAR machine_status
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    master_warehouse {
        INT id PK
        VARCHAR warehouse_code UK
        VARCHAR warehouse_name
        VARCHAR city
        VARCHAR district
        VARCHAR state
        VARCHAR country
        VARCHAR pin_code
        VARCHAR phone_number
        VARCHAR phone_number_alternate
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    map_user_beverage {
        INT id PK
        INT user_id FK
        INT beverage_id FK
        TINYINT is_favorite
        INT preference_rank
        DECIMAL preferred_quantity_ml
        VARCHAR preferred_temperature_type
        VARCHAR sugar_level
        VARCHAR special_instructions
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    map_default_beverage_ingredient {
        INT id PK
        INT beverage_id FK
        INT ingredient_id FK
        INT ingredient_subtype_id FK
        DECIMAL default_quantity
        VARCHAR unit_of_measurement
        INT sequence_no
        TINYINT healthy_flag
        TINYINT is_mandatory
        TINYINT is_default
        TINYINT allow_user_customization
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    map_beverage_preparation_method {
        INT id PK
        INT beverage_id FK
        INT preparation_method_id FK
        INT method_sequence_no
        INT default_duration_seconds
        TINYINT is_default
        TINYINT is_active
        VARCHAR remarks
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    map_ingredient_ingredient_subtype {
        INT id PK
        INT ingredient_id FK
        INT ingredient_subtype_id FK
        INT display_order
        TINYINT is_default
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    map_machine_ingredient_stock {
        INT id PK
        INT machine_id FK
        INT ingredient_id FK
        INT ingredient_subtype_id FK
        DECIMAL current_quantity
        VARCHAR unit_of_measurement
        DECIMAL minimum_threshold_quantity
        DECIMAL maximum_capacity_quantity
        DATETIME last_stocked_on
        DATE earliest_expiry_date
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    map_warehouse_ingredient_stock {
        INT id PK
        INT warehouse_id FK
        INT ingredient_id FK
        INT ingredient_subtype_id FK
        DECIMAL current_quantity
        VARCHAR unit_of_measurement
        DECIMAL minimum_threshold_quantity
        DATETIME last_stocked_on
        DATE earliest_expiry_date
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    txn_stock_movement_history {
        INT id PK
        VARCHAR movement_reference_no UK
        VARCHAR movement_type
        INT source_warehouse_id FK
        INT source_machine_id FK
        INT destination_warehouse_id FK
        INT destination_machine_id FK
        INT ingredient_id FK
        INT ingredient_subtype_id FK
        DECIMAL quantity
        VARCHAR unit_of_measurement
        VARCHAR batch_number
        DATE expiry_date
        DATETIME movement_on
        VARCHAR remarks
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    master_user_beverage_combination {
        INT id PK
        INT user_id FK
        INT beverage_id FK
        VARCHAR combination_name
        INT combination_version_no
        TINYINT is_current
        DATETIME last_used_on
        INT iterations
        VARCHAR notes
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    map_user_combo_ingredient {
        INT id PK
        INT combo_id FK
        INT ingredient_id FK
        INT ingredient_subtype_id FK
        DECIMAL quantity
        VARCHAR unit_of_measurement
        INT sequence_no
        TINYINT is_active
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    txn_beverage_serving {
        INT id PK
        VARCHAR serving_reference_no UK
        INT machine_id FK
        INT requested_by_user_id FK
        INT served_for_user_id FK
        VARCHAR served_for_guest_name
        VARCHAR served_for_guest_phone
        VARCHAR served_for_guest_email
        INT beverage_id FK
        INT combo_id FK
        DECIMAL serving_quantity_ml
        VARCHAR serving_status
        DATETIME served_on
        VARCHAR failure_reason
        VARCHAR remarks
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    txn_beverage_serving_ingredient {
        INT id PK
        INT serving_id FK
        INT ingredient_id FK
        INT ingredient_subtype_id FK
        DECIMAL consumed_quantity
        VARCHAR unit_of_measurement
        INT machine_stock_id FK
        VARCHAR remarks
        INT created_by_id FK
        DATETIME created_on
        INT updated_by_id FK
        DATETIME updated_on
    }

    master_user ||--o{ master_user : created_by
    master_user ||--o{ master_user : updated_by

    master_user ||--o{ master_beverage : created_by
    master_user ||--o{ master_ingredient : created_by
    master_user ||--o{ master_ingredient_subtype : created_by
    master_user ||--o{ master_preparation_method : created_by
    master_user ||--o{ master_vending_machine_location : created_by
    master_user ||--o{ master_vending_machine : created_by
    master_user ||--o{ master_warehouse : created_by

    master_user ||--o{ map_user_beverage : has_preferences
    master_beverage ||--o{ map_user_beverage : selected_by_users

    master_beverage ||--o{ map_default_beverage_ingredient : has_default_recipe
    master_ingredient ||--o{ map_default_beverage_ingredient : used_in_recipe
    master_ingredient_subtype ||--o{ map_default_beverage_ingredient : recipe_subtype

    master_beverage ||--o{ map_beverage_preparation_method : has_methods
    master_preparation_method ||--o{ map_beverage_preparation_method : used_for_beverage

    master_ingredient ||--o{ map_ingredient_ingredient_subtype : has_subtypes
    master_ingredient_subtype ||--o{ map_ingredient_ingredient_subtype : belongs_to_ingredient

    master_vending_machine_location ||--o{ master_vending_machine : contains

    master_vending_machine ||--o{ map_machine_ingredient_stock : stores
    master_ingredient ||--o{ map_machine_ingredient_stock : machine_stock_item
    master_ingredient_subtype ||--o{ map_machine_ingredient_stock : machine_stock_subtype

    master_warehouse ||--o{ map_warehouse_ingredient_stock : stores
    master_ingredient ||--o{ map_warehouse_ingredient_stock : warehouse_stock_item
    master_ingredient_subtype ||--o{ map_warehouse_ingredient_stock : warehouse_stock_subtype

    master_warehouse ||--o{ txn_stock_movement_history : source_warehouse
    master_warehouse ||--o{ txn_stock_movement_history : destination_warehouse
    master_vending_machine ||--o{ txn_stock_movement_history : source_machine
    master_vending_machine ||--o{ txn_stock_movement_history : destination_machine
    master_ingredient ||--o{ txn_stock_movement_history : movement_ingredient
    master_ingredient_subtype ||--o{ txn_stock_movement_history : movement_subtype

    master_user ||--o{ master_user_beverage_combination : owns
    master_beverage ||--o{ master_user_beverage_combination : customized_as

    master_user_beverage_combination ||--o{ map_user_combo_ingredient : contains
    master_ingredient ||--o{ map_user_combo_ingredient : combo_ingredient
    master_ingredient_subtype ||--o{ map_user_combo_ingredient : combo_subtype

    master_vending_machine ||--o{ txn_beverage_serving : serves_from
    master_user ||--o{ txn_beverage_serving : requested_by
    master_user ||--o{ txn_beverage_serving : served_for
    master_beverage ||--o{ txn_beverage_serving : served_beverage
    master_user_beverage_combination ||--o{ txn_beverage_serving : uses_combo

    txn_beverage_serving ||--o{ txn_beverage_serving_ingredient : consumes
    master_ingredient ||--o{ txn_beverage_serving_ingredient : consumed_ingredient
    master_ingredient_subtype ||--o{ txn_beverage_serving_ingredient : consumed_subtype
    map_machine_ingredient_stock ||--o{ txn_beverage_serving_ingredient : deducted_from

