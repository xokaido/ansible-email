
CREATE TABLE IF NOT EXISTS `domains` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL auto_increment,
  `domain_id` int(11) NOT NULL,
  `password` varchar(106) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `aliases` (
  `id` int(11) NOT NULL auto_increment,
  `domain_id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

TRUNCATE TABLE `domains`;
TRUNCATE TABLE `users`;
TRUNCATE TABLE `aliases`;

INSERT INTO `domains` (`id` ,`name`) VALUES
  ('1', 'smswords.net'),
  ('2', 'sanalposturk.com');

INSERT INTO `users` (`id`, `domain_id`, `password` , `email`) VALUES
  ('1', '1', ENCRYPT('password' ), 'info@smswords.net'),
  ('2', '2', ENCRYPT('password' ), 'info@sanalposturk.com');




