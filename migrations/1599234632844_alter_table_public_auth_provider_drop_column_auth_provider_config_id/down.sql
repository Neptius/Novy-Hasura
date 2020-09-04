ALTER TABLE "public"."auth_provider" ADD COLUMN "auth_provider_config_id" int4;
ALTER TABLE "public"."auth_provider" ALTER COLUMN "auth_provider_config_id" DROP NOT NULL;
