-- ALPEREN UGUS
-- CWID: 10864101

CREATE TABLE chain
(
    name TEXT NOT NULL,
    city TEXT,
    state TEXT,
    PRIMARY KEY (name)
);

CREATE TABLE business
(
    id SERIAL NOT NULL,
    name TEXT,
    street_address TEXT,
    city TEXT,
    state TEXT,
    zip int,
    chain_name TEXT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (chain_name) REFERENCES chain(name)
);

CREATE TABLE business_type
(
    business_id SERIAL NOT NULL,
    business_type TEXT NOT NULL,
    PRIMARY KEY (business_id, business_type),
    FOREIGN KEY (business_id) REFERENCES business(id)
);

CREATE TABLE menu
(
    business_id SERIAL NOT NULL,
    label TEXT NOT NULL,
    url TEXT,
    PRIMARY KEY(business_id, label),
    FOREIGN KEY (business_id) REFERENCES business(id)
);

CREATE TABLE reviewer
(
    screen_time TEXT NOT NULL,
    identitiy_provider TEXT NOT NULL,
    PRIMARY KEY (screen_time, identitiy_provider)
);

CREATE TABLE business_reviewer_xref
(
    business_id SERIAL NOT NULL,
    reviewer_screen_time TEXT NOT NULL,
    reviewer_identitiy_provider TEXT NOT NULL,
    views int,
    rating int,
    comments TEXT,
    review_date date,
    PRIMARY KEY (business_id, reviewer_screen_time, reviewer_identitiy_provider),
    FOREIGN KEY (business_id) REFERENCES business(id),
    FOREIGN KEY (reviewer_screen_time, reviewer_identitiy_provider) REFERENCES reviewer(screen_time, identitiy_provider)
);