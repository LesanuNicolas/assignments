CREATE TABLE countries (
	country_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
    country_name varchar(100),
    population int4,
    area float8,
    CONSTRAINT countries_pk PRIMARY KEY (country_id)
);
CREATE TABLE cities (
	city_id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
    country_id int4,
    name varchar(100),
    population int4,
    density float8,
	CONSTRAINT cities_pk PRIMARY KEY (city_id)
);
ALTER TABLE cities ADD CONSTRAINT cities_fk FOREIGN KEY (country_id) REFERENCES countries(country_id);

