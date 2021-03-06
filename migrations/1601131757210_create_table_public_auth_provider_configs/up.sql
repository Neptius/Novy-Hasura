CREATE TABLE "public"."auth_provider_configs"("id" serial NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "client_id" text NOT NULL, "client_secret" text NOT NULL, "authorize_url" text NOT NULL, "token_url" text NOT NULL, "redirect_url" text NOT NULL, "user_url" text NOT NULL, "response_type" text NOT NULL, "scope" text, "user_path" text NOT NULL, "user_id_path" text NOT NULL, "user_pseudo_path" text NOT NULL, "user_img_url" text, "user_img_path" text NOT NULL, PRIMARY KEY ("id") );
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
CREATE TRIGGER "set_public_auth_provider_configs_updated_at"
BEFORE UPDATE ON "public"."auth_provider_configs"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_auth_provider_configs_updated_at" ON "public"."auth_provider_configs" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
