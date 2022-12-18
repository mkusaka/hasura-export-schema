CREATE TABLE
  "public"."prefectures" (
    "id" integer NOT NULL,
    "name" character varying(50) NOT NULL,
    PRIMARY KEY ("id")
  );

CREATE TABLE
  "public"."postalcodes" (
    "id" integer NOT NULL,
    "code" character varying(7) NOT NULL,
    "prefecture_id" integer NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "postalcodes_prefecture_id_foregin_key" FOREIGN KEY ("prefecture_id") REFERENCES "public"."prefectures" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
  );
