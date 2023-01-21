CREATE TABLE "pseudo"."dist_sale_aggregate" ("distributorid" uuid NOT NULL, "amount" int8 NOT NULL DEFAULT 0, PRIMARY KEY ("distributorid") , FOREIGN KEY ("distributorid") REFERENCES "public"."distributor"("id") ON UPDATE restrict ON DELETE restrict);