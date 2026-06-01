# vending_v1
Creating my first repository to create a vending related database design
# Beverage Vending Machine Platform

## Overview

A scalable beverage vending machine platform designed to support:

* Hot and cold beverages
* Custom beverage recipes
* User-specific beverage preferences
* Inventory management
* Multi-machine deployment
* Warehouse stock tracking
* Beverage serving analytics

The system is designed as an enterprise-grade solution using domain-driven database modeling and can be extended into a complete cloud-native SaaS platform.

---

## Business Problem

Traditional vending machines offer limited personalization and weak inventory visibility.

This platform addresses:

* Personalized beverage configurations
* Ingredient-level recipe management
* Real-time stock tracking
* Multi-location machine management
* Warehouse to machine inventory movement
* Beverage consumption analytics

---

## Core Features

### Beverage Management

* Beverage catalog
* Beverage categories
* Preparation methods
* Ingredient mapping

### User Personalization

* Favorite beverages
* User-specific beverage combinations
* Versioned recipe preferences
* Beverage consumption history

### Inventory Management

* Warehouse stock management
* Machine stock management
* Stock movement tracking
* Expiry monitoring

### Machine Management

* Multi-building deployment
* Multi-floor deployment
* Machine maintenance tracking
* Machine capability management

### Analytics

* Beverage consumption trends
* Ingredient usage trends
* User preference analysis
* Refill prediction

---

## Database Design

Current database contains:

### Master Tables

* master_user
* master_beverage
* master_ingredient
* master_ingredient_subtype
* master_preparation_method
* master_vending_machine
* master_vending_machine_location
* master_warehouse

### Mapping Tables

* map_user_beverage
* map_default_beverage_ingredient
* map_beverage_preparation_method
* map_machine_ingredient_stock
* map_warehouse_ingredient_stock
* map_user_combo_ingredient

### Transaction Tables

* txn_beverage_serving
* txn_beverage_serving_ingredient
* txn_stock_movement_history

---

## Technology Stack

Backend:

* Java
* Spring Boot
* Spring Data JPA
* MySQL

Frontend:

* Angular

Cloud:

* AWS

DevOps:

* Docker
* GitHub Actions

---

## Future Enhancements

* QR code ordering
* Mobile application
* Loyalty program
* AI-based beverage recommendation
* Predictive stock replenishment
* IoT integration with vending machines
* Machine health monitoring
* AWS Event Driven Architecture

---

## Status

Currently in system design and database modeling phase.



