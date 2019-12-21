
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `clothes` (
  `identifier` varchar(40) NOT NULL,
  `charid` int(11) NOT NULL,
  `clothes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
