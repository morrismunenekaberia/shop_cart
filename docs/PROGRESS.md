# Project Progress Checklist

- [x] **0 Git setup**
  - **Status:** Done
  - **Notes:** Initialized git repository, added initial README.md, created initial commit, and linked GitHub remote.
- [x] **1 Project and packages**
  - **Status:** Done
  - **Notes:** Created Flutter project for Android, added required packages (`supabase_flutter`, `provider`, `url_launcher`, `image_picker`, `cached_network_image`, `intl`), and ran `flutter pub get`.
- [x] **2 Folders theme config**
  - **Status:** Done
  - **Notes:** Created folder structure with `.gitkeep` placeholders, Material 3 light theme with green seed, `config.dart` with placeholder constants, `PERFORMANCE.md`, and lightweight `main.dart`.
- [ ] **3 Supabase connection**
  - **Status:** Not started
  - **Notes:** Configure client initialization and test connectivity.
- [ ] **4 Models**
  - **Status:** Not started
  - **Notes:** Create data models for profiles, products, orders, and order items.
- [ ] **5 Home screen with fake data**
  - **Status:** Not started
  - **Notes:** Build customer catalog view with lazy list/grid and dummy products.
- [ ] **6 Product details**
  - **Status:** Not started
  - **Notes:** Create product detail view with image display, description, and quantity selection.
- [ ] **7 Navigation**
  - **Status:** Not started
  - **Notes:** Set up routing and screen transitions.
- [ ] **8 Auth service**
  - **Status:** Not started
  - **Notes:** Implement Supabase Auth service methods (sign in, sign up, sign out).
- [ ] **9 Login and signup**
  - **Status:** Not started
  - **Notes:** Build authentication UI screens for customer login and registration.
- [ ] **10 Products from Supabase**
  - **Status:** Not started
  - **Notes:** Replace fake data with real-time or remote query from Supabase Postgres.
- [ ] **11 Cart provider**
  - **Status:** Not started
  - **Notes:** Implement cart state management using ChangeNotifier / Provider.
- [ ] **12 Cart screen**
  - **Status:** Not started
  - **Notes:** Build cart overview with item quantities, pricing breakdown, and checkout action.
- [ ] **13 Checkout screen**
  - **Status:** Not started
  - **Notes:** Build checkout UI with fulfillment choice (delivery vs pickup) and phone number prompt.
- [ ] **14 Save orders**
  - **Status:** Not started
  - **Notes:** Insert order and order_items records into Supabase.
- [ ] **15 Order history**
  - **Status:** Not started
  - **Notes:** Customer screen listing past orders and current order status.
- [ ] **16 Admin gate**
  - **Status:** Not started
  - **Notes:** Enforce admin role checks to protect business owner screens.
- [ ] **17 Manage products**
  - **Status:** Not started
  - **Notes:** Admin screen to create, edit, upload photos, and toggle product availability.
- [ ] **18 Admin orders**
  - **Status:** Not started
  - **Notes:** Admin screen to review orders and update fulfillment status.
- [ ] **19 M-Pesa push function**
  - **Status:** Not started
  - **Notes:** Supabase Edge Function to initiate Daraja STK Push requests.
- [ ] **20 M-Pesa callback function**
  - **Status:** Not started
  - **Notes:** Supabase Edge Function webhook to receive payment status from Safaricom.
- [ ] **21 Connect payment to checkout**
  - **Status:** Not started
  - **Notes:** Integrate payment trigger and polling/listening on checkout screen.
- [ ] **22 Loading and error states**
  - **Status:** Not started
  - **Notes:** Implement skeleton screens, empty state placeholders, and error toasts.
- [ ] **23 Notifications**
  - **Status:** Not started
  - **Notes:** Feedback dialogs / snackbars for order events and payment confirmations.
- [ ] **24 App icon and splash**
  - **Status:** Not started
  - **Notes:** Configure launcher icon and native splash screen assets.
- [ ] **25 Release APK**
  - **Status:** Not started
  - **Notes:** Generate optimized release APK using `--split-per-abi`.
- [ ] **26 README and handover**
  - **Status:** Not started
  - **Notes:** Final documentation review and handover notes.

## Current task
Completing documentation setup (AGENTS.md, docs/PROJECT_CONTEXT.md, docs/ARCHITECTURE.md, docs/PROGRESS.md, docs/DECISIONS.md, docs/SETUP.md).

## Known issues
None.

## Next step
Section 3: Setup Supabase connection and client integration.
