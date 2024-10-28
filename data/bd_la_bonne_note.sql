-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 28, 2024 at 09:29 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_la_bonne_note`
--

-- --------------------------------------------------------

--
-- Table structure for table `favori`
--

CREATE TABLE `favori` (
  `IdProf` int NOT NULL,
  `IdEleve` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `infoprof`
--

CREATE TABLE `infoprof` (
  `IdProf` int NOT NULL,
  `IdNiveau` int NOT NULL,
  `IdMatiere` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `infosup`
--

CREATE TABLE `infosup` (
  `IdUtilisateur` int NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  `Complément` varchar(50) NOT NULL,
  `Arrondissement` int NOT NULL,
  `Naissance` date NOT NULL,
  `Prof` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `infosup`
--

INSERT INTO `infosup` (`IdUtilisateur`, `Adresse`, `Complément`, `Arrondissement`, `Naissance`, `Prof`) VALUES
(1, '230 Rue du Faubourg Saint-Antoine', '', 12, '2000-01-01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `localisation`
--

CREATE TABLE `localisation` (
  `IdUtilisateur` int NOT NULL,
  `Longitude` double NOT NULL,
  `Latitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `localisation`
--

INSERT INTO `localisation` (`IdUtilisateur`, `Longitude`, `Latitude`) VALUES
(1, 2.3884398, 48.8493696);

-- --------------------------------------------------------

--
-- Table structure for table `matière`
--

CREATE TABLE `matière` (
  `IdMatiere` int NOT NULL,
  `NomMatiere` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matière`
--

INSERT INTO `matière` (`IdMatiere`, `NomMatiere`) VALUES
(1, 'Math'),
(2, 'Français'),
(3, 'Histoire-Géo'),
(4, 'Anglais'),
(5, 'SVT'),
(6, 'Physique-Chimie'),
(7, 'Espagnol'),
(8, 'Allemand'),
(9, 'Philosophie');

-- --------------------------------------------------------

--
-- Table structure for table `niveau`
--

CREATE TABLE `niveau` (
  `IdNiveau` int NOT NULL,
  `NomNiveau` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `niveau`
--

INSERT INTO `niveau` (`IdNiveau`, `NomNiveau`) VALUES
(1, '6eme'),
(2, '5eme'),
(3, '4eme'),
(4, '3eme'),
(5, 'Seconde'),
(6, 'Première'),
(7, 'Terminal');

-- --------------------------------------------------------

--
-- Table structure for table `potentiel`
--

CREATE TABLE `potentiel` (
  `IdProf` int NOT NULL,
  `IdEleve` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suivi`
--

CREATE TABLE `suivi` (
  `IdProf` int NOT NULL,
  `IdEleve` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `IdUtilisateur` int NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prénom` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`IdUtilisateur`, `Nom`, `Prénom`, `Email`, `Password`) VALUES
(1, 'eleveNom', 'elevePrenom', 'eleve@eleve.fr', '12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favori`
--
ALTER TABLE `favori`
  ADD PRIMARY KEY (`IdProf`,`IdEleve`),
  ADD KEY `IdEleve` (`IdEleve`);

--
-- Indexes for table `infoprof`
--
ALTER TABLE `infoprof`
  ADD PRIMARY KEY (`IdProf`);

--
-- Indexes for table `infosup`
--
ALTER TABLE `infosup`
  ADD PRIMARY KEY (`IdUtilisateur`);

--
-- Indexes for table `localisation`
--
ALTER TABLE `localisation`
  ADD PRIMARY KEY (`IdUtilisateur`);

--
-- Indexes for table `matière`
--
ALTER TABLE `matière`
  ADD PRIMARY KEY (`IdMatiere`);

--
-- Indexes for table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`IdNiveau`);

--
-- Indexes for table `potentiel`
--
ALTER TABLE `potentiel`
  ADD PRIMARY KEY (`IdProf`,`IdEleve`),
  ADD KEY `IdEleve` (`IdEleve`);

--
-- Indexes for table `suivi`
--
ALTER TABLE `suivi`
  ADD PRIMARY KEY (`IdProf`,`IdEleve`),
  ADD KEY `IdEleve` (`IdEleve`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`IdUtilisateur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `matière`
--
ALTER TABLE `matière`
  MODIFY `IdMatiere` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `IdNiveau` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `IdUtilisateur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favori`
--
ALTER TABLE `favori`
  ADD CONSTRAINT `favori_ibfk_1` FOREIGN KEY (`IdProf`) REFERENCES `utilisateurs` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favori_ibfk_2` FOREIGN KEY (`IdEleve`) REFERENCES `utilisateurs` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `infoprof`
--
ALTER TABLE `infoprof`
  ADD CONSTRAINT `infoprof_ibfk_1` FOREIGN KEY (`IdProf`) REFERENCES `utilisateurs` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `infosup`
--
ALTER TABLE `infosup`
  ADD CONSTRAINT `infosup_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `utilisateurs` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `localisation`
--
ALTER TABLE `localisation`
  ADD CONSTRAINT `localisation_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `utilisateurs` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `potentiel`
--
ALTER TABLE `potentiel`
  ADD CONSTRAINT `potentiel_ibfk_1` FOREIGN KEY (`IdProf`) REFERENCES `utilisateurs` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `potentiel_ibfk_2` FOREIGN KEY (`IdEleve`) REFERENCES `utilisateurs` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `suivi`
--
ALTER TABLE `suivi`
  ADD CONSTRAINT `suivi_ibfk_1` FOREIGN KEY (`IdProf`) REFERENCES `utilisateurs` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `suivi_ibfk_2` FOREIGN KEY (`IdEleve`) REFERENCES `utilisateurs` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
