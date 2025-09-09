-- Seed a test admin user
-- Email: admin@axiva.app
-- Password: password

-- -- Create the user in auth.users
-- INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, recovery_token, recovery_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, confirmation_token, email_change, email_change_sent_at)
-- VALUES
--   ('00000000-0000-0000-0000-000000000000', 'f8128f84-1b32-412b-8259-4d7a80e11c4a', 'authenticated', 'authenticated', 'admin@axiva.app', crypt('password', gen_salt('bf')), NOW(), '', NULL, NULL, '{"provider":"email","providers":["email"]}', '{}', NOW(), NOW(), '', '', NULL);

-- -- Create the corresponding identity
-- INSERT INTO auth.identities (id, user_id, provider, provider_id, identity_data, last_sign_in_at, created_at, updated_at)
-- VALUES
--   ('f8128f84-1b32-412b-8259-4d7a80e11c4a', 'f8128f84-1b32-412b-8259-4d7a80e11c4a', 'email', 'admin@axiva.app', '{"sub":"f8128f84-1b32-412b-8259-4d7a80e11c4a","email":"admin@axiva.app"}', NOW(), NOW(), NOW());

-- -- Link the user to the public.operators table as an admin
-- INSERT INTO public.operators (id, role)
-- VALUES
--   ('f8128f84-1b32-412b-8259-4d7a80e11c4a', 'ROLE_ADMIN');
