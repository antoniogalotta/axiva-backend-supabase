# Project Overview

This project is the Supabase backend for the Axiva application. It provides the database schema and policies for managing medical data related to patients and their venous accesses.

**Key Technologies:**

*   **Supabase:** Used as the backend-as-a-service platform.
*   **PostgreSQL:** The underlying database for Supabase.
*   **SQL:** Used for database schema definition and policies.

**Architecture:**

The project follows a standard Supabase structure. The database schema is defined in a migration file, and the Supabase project configuration is managed in the `config.toml` file.

The database schema includes the following tables:

*   `patients`: Stores patient information.
*   `venous-accesses`: Manages details of venous access devices.
*   `follow-ups`: Tracks follow-up appointments and notes.
*   `operators`: Defines user roles and permissions.
*   `removal-reasons`: Lists reasons for device removal.

Row-level security policies are implemented to ensure that authenticated users can only access their own data.

# Building and Running

**1. Install Dependencies:**

```bash
npm install
```

**2. Run Supabase Locally:**

To start the Supabase services locally, run the following command:

```bash
npx supabase start
```

This will start the Supabase Docker containers and provide you with local Supabase credentials.

**3. Apply Migrations:**

To apply the database migrations, run:

```bash
npx supabase db reset
```

**4. Stop Supabase:**

To stop the local Supabase services, run:

```bash
npx supabase stop
```

# Development Conventions

*   **Database Migrations:** All database schema changes should be managed through Supabase migration files.
*   **Policies:** Row-level security policies are used to control data access. Ensure that policies are defined for all tables.
*   **Testing:** TODO: Add instructions for running tests.
