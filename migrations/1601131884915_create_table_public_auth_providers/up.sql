CREATE TABLE "public"."auth_providers"("id" serial NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "name" text NOT NULL, "method" text NOT NULL, "active" boolean NOT NULL DEFAULT false, "auth_provider_config_id" integer NOT NULL, PRIMARY KEY ("id") );
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_auth_providers_updated_at"
BEFORE UPDATE ON "public"."auth_providers"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_auth_providers_updated_at" ON "public"."auth_providers" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
