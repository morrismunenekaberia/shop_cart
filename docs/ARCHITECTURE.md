# Architecture

## Directory Structure

```text
lib/
├── core/               # Configuration constants (Supabase credentials, environment) and global theme setup
├── models/             # Data models with serialization / deserialization (Profile, Product, Order, OrderItem)
├── services/           # External API & backend clients (Supabase client, M-Pesa payment service, auth service)
├── providers/          # State management logic using Provider (CartProvider, AuthProvider, ProductProvider)
├── screens/
│   ├── customer/       # Customer-facing views (Home, ProductDetails, Cart, Checkout, OrderHistory)
│   └── admin/          # Business owner admin screens (ManageProducts, AdminOrders)
└── widgets/            # Reusable UI components (buttons, product cards, loading skeletons, input fields)

supabase/
├── config.toml         # Supabase CLI project configuration (project_id = "shop_cart")
├── migrations/         # Database migrations and schema versioning
└── functions/          # Deno/TypeScript Edge Functions (M-Pesa STK push trigger and payment confirmation callback)
```

The `supabase/` folder at the repository root holds all database migrations and M-Pesa Edge Functions. The Supabase GitHub integration points at the repository root (`'.'`) with automatic deployment turned off. This guarantees database schema migrations and edge function updates are audited and deployed deliberately rather than triggered automatically on every git push.

## Database Schema & Row Level Security (RLS)

### Tables and Columns
1. **`profiles`**
   - `id` (uuid, primary key, references `auth.users.id`)
   - `email` (text)
   - `phone` (text)
   - `role` (text, e.g. `'customer'` or `'admin'`, default `'customer'`)
   - `created_at` (timestamptz)

2. **`products`**
   - `id` (uuid, primary key, default `gen_random_uuid()`)
   - `name` (text, not null)
   - `description` (text)
   - `price` (numeric, not null)
   - `image_url` (text)
   - `is_available` (boolean, default `true`)
   - `created_at` (timestamptz)

3. **`orders`**
   - `id` (uuid, primary key, default `gen_random_uuid()`)
   - `user_id` (uuid, references `profiles.id`, not null)
   - `total_amount` (numeric, not null)
   - `fulfillment_type` (text, `'delivery'` or `'pickup'`)
   - `delivery_address` (text, nullable)
   - `phone_number` (text, not null)
   - `status` (text, e.g. `'pending'`, `'paid'`, `'completed'`, `'cancelled'`)
   - `mpesa_checkout_request_id` (text, nullable)
   - `created_at` (timestamptz)

4. **`order_items`**
   - `id` (uuid, primary key, default `gen_random_uuid()`)
   - `order_id` (uuid, references `orders.id` on delete cascade, not null)
   - `product_id` (uuid, references `products.id`, not null)
   - `quantity` (integer, not null)
   - `unit_price` (numeric, not null)

### Security Rules (RLS)
- **Customer Order Isolation:** Customers can only read and insert their own orders and corresponding order items (`auth.uid() = user_id`).
- **Product Management:** Anyone can read available products (`SELECT`), but only users with `role = 'admin'` can insert, update, or delete products.
- **Payment Verification:** Order status can only be transitioned to `'paid'` by the authorized M-Pesa webhook callback running via Supabase Edge Function using the Service Role Key.

## User Flows

### Customer Flow
1. **Authentication:** Login / Signup with email or phone.
2. **Catalog / Home:** Browse product grid with categories, pricing, and availability.
3. **Product Details:** View product image, description, and adjust quantity to add to cart.
4. **Cart:** Review selected items, adjust quantities, or remove items.
5. **Checkout:** Select fulfillment (Delivery with address, or Pickup) and confirm phone number for payment.
6. **M-Pesa Payment:** Initiate Daraja STK Push prompt on user's phone, wait for callback / status confirmation.
7. **Order History:** View past orders, delivery status, and payment receipts.

### Admin Flow
1. **Admin Gate:** Protected route accessible only to users with `role = 'admin'`.
2. **Manage Products:** Add new products with image upload, edit names/prices/descriptions, and toggle availability.
3. **Admin Orders:** View incoming orders in real time, inspect item details and delivery addresses, and mark fulfillment progress.
