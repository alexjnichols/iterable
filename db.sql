DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  plan_type VARCHAR(255) NOT NULL,
  candidate VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS page_views;
CREATE TABLE page_views (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT(11) UNSIGNED,
  page VARCHAR(255) NOT NULL,
  device VARCHAR(255) NOT NULL,
  browser VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  event_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- INSERT INTO `customers` (id, email, first_name, last_name, plan_type, candidate)
-- VALUES
-- (1, 'customer1@email.com', 'alexander', 'johnson', 'pro', 'alex nichols'),
-- (2, 'customer2@email.com', 'john', 'kline', 'free', 'alex nichols'),
-- (3, 'customer3@email.com', 'ryan', 'slater', 'basic', 'alex nichols'),
-- (4, 'customer4@email.com', 'jesse', 'gold', 'enterprise', 'alex nichols'),
-- (5, 'customer5@email.com', 'chrintina', 'ives', 'pro', 'alex nichols'),
-- (6, 'customer6@email.com', 'karl', 'gomez', 'free', 'alex nichols'),
-- (7, 'customer7@email.com', 'phil', 'simmons', 'basic', 'alex nichols'),
-- (8, 'customer8@email.com', 'kaitlyn', 'heck', 'enterprise', 'alex nichols'),
-- (9, 'customer9@email.com', 'joseph', 'smith', 'pro', 'alex nichols'),
-- (10, 'customer10@email.com', 'master', 'chief', 'free', 'alex nichols');

-- INSERT INTO `page_views` (id, user_id, page, device, browser, location, event_time)
-- VALUES
-- (1, 1, 'home page', 'mac', 'chrome', 'san diego', '2025-07-10'),
-- (2, 2, 'pricing', 'iphone', 'safari', 'paso robles', '2025-03-15'),
-- (3, 3, 'settings', 'dell', 'firefox', 'santa barbara', '2025-07-09'),
-- (4, 4, 'product', 'andriod', 'chrome', 'bakersfield', '2025-07-08'),
-- (5, 5, 'services', 'chrome book', 'chrome', 'oceanside', '2025-07-10'),
-- (6, 6, 'home page', 'mac', 'safari', 'encinitas', '2025-06-15'),
-- (7, 7, 'pricing', 'iphone', 'chrome', 'del mar', '2025-01-15'),
-- (8, 8, 'settings', 'dell', 'chrome', 'chula vista', '2025-02-15'),
-- (9, 9, 'product', 'andriod', 'firefox', 'la jolla', '2025-07-04'),
-- (10, 10, 'services', 'chrome book', 'firefox', 'carlsbad', '2025-07-05'),
-- (11, 1, 'home page', 'mac', 'safari', 'san diego', '2025-07-06'),
-- (12, 2, 'pricing', 'dell', 'chrome', 'paso robles', '2025-04-15'),
-- (13, 3, 'settings', 'andriod', 'chrome', 'santa barbara', '2025-02-15'),
-- (14, 4, 'product', 'chrome book', 'firefox', 'bakersfield', '2025-05-15'),
-- (15, 5, 'services', 'iphone', 'safari', 'oceanside', '2025-07-07'),
-- (16, 6, 'home page', 'mac', 'safari', 'encinitas', '2025-07-10'),
-- (17, 7, 'pricing', 'dell', 'chrome', 'del mar', '2025-07-03'),
-- (18, 8, 'settings', 'iphone', 'chrome', 'chula vista', '2025-06-15'),
-- (19, 9, 'product', 'andriod', 'chrome', 'la jolla', '2025-05-15'),
-- (20, 10, 'services', 'chrome book', 'chrome', 'carlsbad', '2025-07-08'),
-- (21, 1, 'home page', 'mac', 'safari', 'san diego', '2025-02-15'),
-- (22, 2, 'pricing', 'dell', 'firefox', 'paso robles', '2025-03-15'),
-- (23, 3, 'settings', 'iphone', 'safari', 'santa barbara', '2025-03-15'),
-- (24, 4, 'product', 'andriod', 'firefox', 'bakersfield', '2025-04-15'),
-- (25, 5, 'services', 'chrome book', 'chrome', 'oceanside', '2025-07-04'),
-- (26, 6, 'home page', 'mac', 'chrome', 'encinitas', '2025-03-15'),
-- (27, 7, 'pricing', 'dell', 'firefox', 'del mar', '2025-03-15'),
-- (28, 8, 'settings', 'iphone', 'chrome', 'chula vista', '2025-03-15'),
-- (29, 9, 'product', 'andriod', 'chrome', 'la jolla', '2025-01-15'),
-- (30, 10, 'services', 'chrome book', 'firefox', 'carlsbad', '2025-03-15');