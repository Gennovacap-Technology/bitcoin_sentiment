CREATE TABLE "public"."data" (
  "keyword" CHARACTER VARYING( 100 ) COLLATE "pg_catalog"."default" NOT NULL,
  "sentiment" NUMERIC NOT NULL,
  "date_of_sentiment" DATE NOT NULL DEFAULT CURRENT_DATE
 );
