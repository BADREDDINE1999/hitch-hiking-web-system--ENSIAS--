

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `covoiturage`
--

-- --------------------------------------------------------
  CREATE database covoiturage
  USE covoiturage  
-- Structure de la table `departement`
--

CREATE TABLE IF NOT EXISTS `departement` (
  `dep_num` int(11) NOT NULL AUTO_INCREMENT,
  `dep_nom` varchar(30) NOT NULL,
 /* `vil_num` int(11) NOT NULL,*/
  PRIMARY KEY (`dep_num`)/*,
  KEY `vil_num` (`vil_num`)*/
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `departement`
--

/*INSERT INTO `departement` (`dep_num`, `dep_nom`, `vil_num`) VALUES
(1, 'GL', 7),
(2, 'eMBI', 6),
(3, 'IWIM', 7),
(4, 'SSI', 7),
(5, 'ISEM', 5),
(6, 'IeL', 16);*/

INSERT INTO `departement` (`dep_num`, `dep_nom`) VALUES
(1, 'GL'),
(2, 'eMBI'),
(3, 'IWIM'),
(4, 'SSI'),
(5, 'ISEM'),
(6, 'IeL');

-- --------------------------------------------------------

--
-- Structure de la table `division`
--

CREATE TABLE IF NOT EXISTS `division` (
  `div_num` int(11) NOT NULL AUTO_INCREMENT,
  `div_nom` varchar(30) NOT NULL,
  PRIMARY KEY (`div_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `division`
--

INSERT INTO `division` (`div_num`, `div_nom`) VALUES
(1, 'AnnÃ©e 1'),
(2, 'AnnÃ©e 2'),
(3, 'AnnÃ©e 3');


-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `per_num` int(11) NOT NULL,
  `dep_num` int(11) NOT NULL,
  `div_num` int(11) NOT NULL,
  PRIMARY KEY (`per_num`),
  KEY `dep_num` (`dep_num`),
  KEY `div_num` (`div_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`per_num`, `dep_num`, `div_num`) VALUES
(3, 6, 2),
(38, 6, 1),
(39, 2, 3),
(53, 2, 1),
(54, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

CREATE TABLE IF NOT EXISTS `fonction` (
  `fon_num` int(11) NOT NULL AUTO_INCREMENT,
  `fon_libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`fon_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `fonction`
--

INSERT INTO `fonction` (`fon_num`, `fon_libelle`) VALUES
(1, 'Directeur'),
(2, 'Chef de dÃ©partement'),
(3, 'Technicien'),
(4, 'SecrÃ©taire'),
(5, 'IngÃ©nieur'),
(6, 'Imprimeur'),
(7, 'Enseignant'),
(8, 'Chercheur');

-- --------------------------------------------------------

--
-- Structure de la table `parcours`
--

CREATE TABLE IF NOT EXISTS `parcours` (
  `par_num` int(11) NOT NULL AUTO_INCREMENT,
  `par_km` float NOT NULL,
  `vil_num1` int(11) NOT NULL,
  `vil_num2` int(11) NOT NULL,
  PRIMARY KEY (`par_num`),
  KEY `vil1` (`vil_num1`),
  KEY `vil2` (`vil_num2`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `parcours`
--

INSERT INTO `parcours` (`par_num`, `par_km`, `vil_num1`, `vil_num2`) VALUES
(1, 500, 10, 11),
(2, 100, 7, 5),
(3, 225, 8, 13),
(4, 300, 5, 13),
(5, 345, 15, 11),
(7, 45, 15, 16),
(8, 0, 15, 5),
(9, 0, 15, 5),
(10, 100, 15, 5);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `per_num` int(11) NOT NULL AUTO_INCREMENT,
  `per_nom` varchar(30) NOT NULL,
  `per_prenom` varchar(30) NOT NULL,
  `per_tel` char(14) NOT NULL,
  `per_mail` varchar(30) NOT NULL,
  `per_login` varchar(20) NOT NULL,
  `per_pwd` varchar(100) NOT NULL,
  PRIMARY KEY (`per_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`per_num`, `per_nom`, `per_prenom`, `per_tel`, `per_mail`, `per_login`, `per_pwd`) VALUES
(1, 'HOUSNI', 'Yasser', '0655555555', 'yasser@gmail.com', 'yasser', 'ab90e13fa7699df8a377946815cf5dc4'),
(3, 'Nait', 'Ayoub', '0655775555', 'ayoub@gmail.com', 'ayoub', 'th8f6bcd4621d373cade4e832627b4f6'),
(38, 'ADIL', 'OUSSAMA', '0666655555', 'oussamaadil@gmail.com', 'adil', 'lkjk1d8cd98f00b204e9800998ecf8427e'),
(39, 'Morchid', 'Amine', '0695555555', 'aminemorchid@gmail.com', 'amine', 'te5c74b64b4b8352ef2f181affb5ac2a'),
(52, 'Adam', 'Hawdi', '0655775555', 'adam@gmail.com', 'Adam', 'gf5c74b64b4b8352ef2f181affb5ac2a'),
(53, 'Hamid', 'Jaafar', '0789562314', 'jaafar@gmail.com', 'jaafar', 'yj1d8cd98f00b204e9800998ecf8427e'),
(54, 'Hary', 'Badr', '0654565859', 'badrhary@gmail.com', 'badrhary', 'sef4c21e98d1e2ec4e61dac94b6cdc07');

-- --------------------------------------------------------

--
-- Structure de la table `propose`
--

CREATE TABLE IF NOT EXISTS `propose` (
  `par_num` int(11) NOT NULL,
  `per_num` int(11) NOT NULL,
  `pro_date` date NOT NULL,
  `pro_time` time NOT NULL,
  `pro_place` int(11) NOT NULL,
  `pro_sens` tinyint(1) NOT NULL COMMENT '0 : vil1 -> vil2 1: vil2 -> vil1',
  PRIMARY KEY (`par_num`,`per_num`,`pro_date`,`pro_time`),
  KEY `per_num` (`per_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `propose`
--

INSERT INTO `propose` (`par_num`, `per_num`, `pro_date`, `pro_time`, `pro_place`, `pro_sens`) VALUES
(1, 1, '2021-07-31', '17:57:00', 4, 0),
(1, 1, '2021-07-31', '17:57:14', 1, 0),
(1, 1, '2021-07-03', '08:15:14', 7, 0),
(1, 1, '2021-07-04', '18:29:43', 3, 1),
(1, 1, '2021-07-06', '15:46:20', 4, 0),
(1, 39, '2021-07-04', '21:07:42', 0, 1),
(3, 1, '2021-07-31', '17:58:53', 4, 1),
(3, 1, '2021-07-31', '17:59:04', 5, 0),
(3, 1, '2021-07-04', '18:38:41', 2, 0),
(4, 1, '2021-07-03', '17:06:51', 3, 0),
(5, 1, '2021-07-05', '15:37:00', 3, 0),
(5, 1, '2021-07-12', '21:00:54', 3, 0),
(5, 1, '2021-07-13', '21:48:29', 3, 0),
(5, 1, '2021-07-14', '19:19:16', 3, 0),
(8, 1, '2021-07-23', '16:33:08', 3, 0);

-- --------------------------------------------------------

--
-- Structure de la table `salarie`
--

CREATE TABLE IF NOT EXISTS `salarie` (
  `per_num` int(11) NOT NULL,
  `sal_telprof` varchar(20) NOT NULL,
  `fon_num` int(11) NOT NULL,
  PRIMARY KEY (`per_num`),
  KEY `fon_num` (`fon_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `salarie`
--

INSERT INTO `salarie` (`per_num`, `sal_telprof`, `fon_num`) VALUES
(1, '0123456978', 4),
(52, '0666666666', 8);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE IF NOT EXISTS `ville` (
  `vil_num` int(11) NOT NULL AUTO_INCREMENT,
  `vil_nom` varchar(100) NOT NULL,
  PRIMARY KEY (`vil_num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `ville`
--

INSERT INTO `ville` (`vil_num`, `vil_nom`) VALUES
(5, 'Casa'),
(6, 'Rabat'),
(7, 'Tanger'),
(8, 'Fès'),
(9, 'Meknès'),
(10, 'Salé'),
(11, 'Béni Mellal'),
(12, 'Settat'),
(13, 'Marrakech'),
(14, 'Mohammédia'),
(15, 'Agadir'),
(16, 'Taza');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `departement`
--
/*ALTER TABLE `departement`
  ADD CONSTRAINT `departement_ibfk_1` FOREIGN KEY (`vil_num`) REFERENCES `ville` (`vil_num`);*/

--
-- Contraintes pour la table `etudiant`
--
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`per_num`) REFERENCES `personne` (`per_num`),
  ADD CONSTRAINT `etudiant_ibfk_2` FOREIGN KEY (`dep_num`) REFERENCES `departement` (`dep_num`),
  ADD CONSTRAINT `etudiant_ibfk_3` FOREIGN KEY (`div_num`) REFERENCES `division` (`div_num`);

--
-- Contraintes pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD CONSTRAINT `parcours_ibfk_2` FOREIGN KEY (`vil_num1`) REFERENCES `ville` (`vil_num`),
  ADD CONSTRAINT `parcours_ibfk_3` FOREIGN KEY (`vil_num2`) REFERENCES `ville` (`vil_num`);

--
-- Contraintes pour la table `propose`
--
ALTER TABLE `propose`
  ADD CONSTRAINT `propose_ibfk_1` FOREIGN KEY (`par_num`) REFERENCES `parcours` (`par_num`),
  ADD CONSTRAINT `propose_ibfk_2` FOREIGN KEY (`per_num`) REFERENCES `personne` (`per_num`);

--
-- Contraintes pour la table `salarie`
--
ALTER TABLE `salarie`
  ADD CONSTRAINT `salarie_ibfk_1` FOREIGN KEY (`per_num`) REFERENCES `personne` (`per_num`),
  ADD CONSTRAINT `salarie_ibfk_2` FOREIGN KEY (`fon_num`) REFERENCES `fonction` (`fon_num`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
