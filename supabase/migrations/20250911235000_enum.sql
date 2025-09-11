create type "public"."ImplantSite" as enum ('LEFT', 'RIGHT');

create type "public"."ImplantSiteVein" as enum ('BASILICA', 'BRACHIAL', 'CEPHALIC', 'FEMORAL');

create type "public"."VenousAccessType" as enum ('MIDLINE', 'MINI_MIDLINE', 'PICC', 'FICC');

alter table "public"."follow-ups" alter column "venous_access_id" set not null;

alter table "public"."operators" alter column "role" set data type "AppRole" using "role"::text::"AppRole";

alter table "public"."venous-accesses" alter column "implant_date" set default now();

alter table "public"."venous-accesses" alter column "site" set data type "ImplantSite" using "site"::"ImplantSite";

alter table "public"."venous-accesses" alter column "site_vein" set data type "ImplantSiteVein" using "site_vein"::"ImplantSiteVein";

alter table "public"."venous-accesses" alter column "type" set data type "VenousAccessType" using "type"::"VenousAccessType";