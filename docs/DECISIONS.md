# Architecture & Technical Decisions Log

### 1. Backend Selection: Supabase
- **Decision:** Use Supabase (Postgres, Auth, Storage, Edge Functions) as the backend platform.
- **Rationale:** The application data model (products, orders, order items, profiles) is relational, requiring strong consistency, foreign keys, and Row Level Security. Supabase provides a free tier suitable for starting out and includes built-in authentication and Edge Functions for payment webhooks.

### 2. Code Splitting: Deferred Imports Skipped
- **Decision:** Do not use deferred imports (`import ... deferred as ...`).
- **Rationale:** Deferred imports only provide tangible bundle splitting benefits on Flutter Web; they add unnecessary async complexity on Flutter Android native builds without noticeable startup benefit.

### 3. Payment Method: Exclusively M-Pesa
- **Decision:** Pay on delivery is omitted; payments are processed exclusively via Safaricom M-Pesa (Daraja STK push).
- **Rationale:** Reduces cash-handling risk and order cancellation friction for the small business owner, while aligning with standard regional mobile commerce workflows.

### 4. Build Strategy: Release APK with `--split-per-abi`
- **Decision:** Build production Android release APKs using `flutter build apk --split-per-abi`.
- **Rationale:** Generates separate APKs targeted to specific device ABIs (armeabi-v7a, arm64-v8a, x86_64), cutting individual download and install sizes significantly compared to a universal fat APK.
