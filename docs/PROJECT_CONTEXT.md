# Project Context

## What the App Is
A Flutter Android ordering application built for a small business. 
- **Customer features:** Customers can browse products, add items to cart, select between delivery or pickup, and complete payment via Safaricom M-Pesa (Daraja STK push).
- **Owner/Admin features:** The business owner has access to a hidden admin area to manage products (add, edit, toggle availability) and track customer orders.

## Technology Stack
- **Framework:** Flutter (Android only target)
- **State Management:** Provider
- **Backend & Database:** Supabase (Auth, Postgres Database, Storage for product photos, Edge Functions for server-side logic)
- **Payments:** Safaricom M-Pesa Daraja STK Push (Sandbox for development/testing, production-ready design)
- **Version Control:** Git and GitHub

## Core Rules & Constraints
- **Platform:** Android only.
- **Performance:** Strictly adhere to all rules outlined in `PERFORMANCE.md` (e.g., lazy builder lists, const constructors, cached network images with bounded decode dimensions, lightweight entrypoint).
- **Security:** Never commit API keys, service role secrets, or credentials to git or documentation. Keep placeholder keys in `lib/core/config.dart`.
- **Workflow:** Execute one small task at a time, verify functionality and static analysis, and commit after each working step.

## Target Audience
The app is operated by a non-technical small business owner and everyday shoppers. Keep the UI clean, intuitive, uncluttered, and simple to navigate.
