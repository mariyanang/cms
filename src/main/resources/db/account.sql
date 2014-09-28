CREATE TABLE  `cms`.`account` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(10) NOT NULL,
  `lastName` VARCHAR(20) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


