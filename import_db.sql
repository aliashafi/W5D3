DROP TABLE cattoys;
DROP TABLE cats;
DROP TABLE toys;


CREATE TABLE cats (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  color TEXT,
  breed TEXT
);

CREATE TABLE toys (
  id SERIAL PRIMARY KEY,
  price FLOAT,
  color TEXT,
  name TEXT
);

CREATE TABLE cattoys (
  id SERIAL PRIMARY KEY,
  cat_id INTEGER,
  toy_id INTEGER,

  FOREIGN KEY (toy_id) REFERENCES toys(id),
  FOREIGN KEY (cat_id) REFERENCES cats(id)
);

INSERT INTO
  cats (name, color, breed)
VALUES
  ('eugene', 'black', 'bengal'),
  ('nina', 'grey', 'russian blue'),
  ('lil rat', 'grey', 'ragdoll'),
  ('snowball', 'white', 'persian cat'),
  ('andrew', 'yellow', 'siamese');

INSERT INTO
  toys (price, color, name)
VALUES
  (100, 'red', 'yarn'),
  (10, 'blue', 'ball'),
  (5,'white','feather'),
  (50, 'brown', 'scratching post'),
  (25, 'green', 'fireworks');

INSERT INTO
  cattoys (cat_id, toy_id)
VALUES 
  ((SELECT cats.id FROM cats WHERE name = 'eugene'), (SELECT toys.id FROM toys WHERE toys.name = 'yarn')),
  ((SELECT cats.id FROM cats WHERE name = 'nina'), (SELECT toys.id FROM toys WHERE toys.name = 'yarn')),
  ((SELECT cats.id FROM cats  WHERE name = 'lil rat'), (SELECT toys.id FROM toys WHERE toys.name = 'ball')),
  ((SELECT cats.id FROM cats WHERE name = 'snowball'), (SELECT toys.id FROM toys WHERE toys.name = 'feather')),
  ((SELECT cats.id FROM cats WHERE name = 'andrew'), (SELECT toys.id FROM toys WHERE toys.name = 'fireworks'));

