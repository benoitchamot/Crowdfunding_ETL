-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/fFvWk6
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- STEP 1: create table before importing from category.csv
CREATE TABLE "category" (
    "category_id" VARCHAR(4)   NOT NULL,
    "category" VARCHAR(12)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

-- STEP 2: create table before importing from contacts.csv
CREATE TABLE "contact" (
    "contact_id" INT   NOT NULL,
    "first_name" VARCHAR(12)   NOT NULL,
    "last_name" VARCHAR(13)   NOT NULL,
    "email" VARCHAR(42)   NOT NULL,
    CONSTRAINT "pk_contact" PRIMARY KEY (
        "contact_id"
     )
);

-- STEP 3: create table before importing from subcategory.csv
CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(8)   NOT NULL,
    "subcategory" VARCHAR(17)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

-- STEP 4: create table before importing from campaign.csv
CREATE TABLE "campaign" (
    "cf_id" INT   NOT NULL,
    "contact_id" INT   NOT NULL,
    "company_name" VARCHAR(33)   NOT NULL,
    "description" VARCHAR(53)   NOT NULL,
    "goal" DECIMAL   NOT NULL,
    "pledged" DECIMAL   NOT NULL,
    "outcome" VARCHAR(10)   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" VARCHAR(2)   NOT NULL,
    "currency" VARCHAR(3)   NOT NULL,
    "launched_date" VARCHAR(10)   NOT NULL,
    "end_date" VARCHAR(10)   NOT NULL,
    "category_id" VARCHAR(4)   NOT NULL,
    "subcategory_id" VARCHAR(8)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

-- STEP 4.1: Convert string to date in campaign table (after data import)
ALTER TABLE campaign
	ALTER launched_date TYPE date USING TO_DATE(launched_date,'YYYY-MM-DD'),
	ALTER end_date TYPE date USING TO_DATE(end_date,'YYYY-MM-DD');

-- Add FOREIGN KEYS constraints
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contact" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");
