-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 25, 2017 at 10:05 AM
-- Server version: 5.6.33
-- PHP Version: 5.6.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `TicketV`
--

-- --------------------------------------------------------

--
-- Table structure for table `commentaire_ticket`
--

CREATE TABLE `commentaire_ticket` (
  `id_commentaire_ticket` int(11) NOT NULL,
  `ticket_id_ticket` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `remarque` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `degre_importance`
--

CREATE TABLE `degre_importance` (
  `id_degre_importance` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mise_a_jour`
--

CREATE TABLE `mise_a_jour` (
  `id_mise_a_jour` int(11) NOT NULL,
  `remarque` text COLLATE utf8_unicode_ci,
  `date` datetime NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `effectue` tinyint(4) DEFAULT '0',
  `id_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plage_travail`
--

CREATE TABLE `plage_travail` (
  `id_plage` int(11) NOT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `date_debut` date NOT NULL,
  `heure_debut` time NOT NULL,
  `date_fin` date NOT NULL,
  `heure_fin` time NOT NULL,
  `remarque` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

CREATE TABLE `projet` (
  `id_projet` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projet_utilisateur`
--

CREATE TABLE `projet_utilisateur` (
  `id_projet` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statut`
--

CREATE TABLE `statut` (
  `id_statut` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` tinyint(4) DEFAULT '0',
  `clos` tinyint(4) DEFAULT '0',
  `couleur` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suivi_ticket`
--

CREATE TABLE `suivi_ticket` (
  `id_suivi_ticket` int(11) NOT NULL,
  `id_statut` int(11) DEFAULT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `remarque` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id_tag` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL,
  `id_degre_importance` int(11) DEFAULT NULL,
  `id_projet` int(11) DEFAULT NULL,
  `id_statut` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `id_mise_a_jour` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_has_mise_a_jour`
--

CREATE TABLE `ticket_has_mise_a_jour` (
  `id_ticket` int(11) NOT NULL,
  `id_mise_a_jour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_tags`
--

CREATE TABLE `ticket_tags` (
  `ticket_id_ticket` int(11) NOT NULL,
  `tags_id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commentaire_ticket`
--
ALTER TABLE `commentaire_ticket`
  ADD PRIMARY KEY (`id_commentaire_ticket`),
  ADD KEY `ticket_id_ticket` (`ticket_id_ticket`);

--
-- Indexes for table `degre_importance`
--
ALTER TABLE `degre_importance`
  ADD PRIMARY KEY (`id_degre_importance`);

--
-- Indexes for table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mise_a_jour`
--
ALTER TABLE `mise_a_jour`
  ADD PRIMARY KEY (`id_mise_a_jour`),
  ADD KEY `id_projet` (`id_projet`);

--
-- Indexes for table `plage_travail`
--
ALTER TABLE `plage_travail`
  ADD PRIMARY KEY (`id_plage`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id_projet`);

--
-- Indexes for table `projet_utilisateur`
--
ALTER TABLE `projet_utilisateur`
  ADD PRIMARY KEY (`id_projet`,`id_utilisateur`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`id_statut`);

--
-- Indexes for table `suivi_ticket`
--
ALTER TABLE `suivi_ticket`
  ADD PRIMARY KEY (`id_suivi_ticket`),
  ADD KEY `id_statut` (`id_statut`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id_tag`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_degre_importance` (`id_degre_importance`),
  ADD KEY `id_projet` (`id_projet`),
  ADD KEY `id_statut` (`id_statut`),
  ADD KEY `id_mise_a_jour` (`id_mise_a_jour`);

--
-- Indexes for table `ticket_has_mise_a_jour`
--
ALTER TABLE `ticket_has_mise_a_jour`
  ADD PRIMARY KEY (`id_ticket`,`id_mise_a_jour`),
  ADD KEY `id_mise_a_jour` (`id_mise_a_jour`);

--
-- Indexes for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  ADD PRIMARY KEY (`ticket_id_ticket`,`tags_id_tag`),
  ADD KEY `tags_id_tag` (`tags_id_tag`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commentaire_ticket`
--
ALTER TABLE `commentaire_ticket`
  MODIFY `id_commentaire_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `degre_importance`
--
ALTER TABLE `degre_importance`
  MODIFY `id_degre_importance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mise_a_jour`
--
ALTER TABLE `mise_a_jour`
  MODIFY `id_mise_a_jour` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `plage_travail`
--
ALTER TABLE `plage_travail`
  MODIFY `id_plage` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projet`
--
ALTER TABLE `projet`
  MODIFY `id_projet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `statut`
--
ALTER TABLE `statut`
  MODIFY `id_statut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `suivi_ticket`
--
ALTER TABLE `suivi_ticket`
  MODIFY `id_suivi_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id_tag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `commentaire_ticket`
--
ALTER TABLE `commentaire_ticket`
  ADD CONSTRAINT `commentaire_ticket_ibfk_1` FOREIGN KEY (`ticket_id_ticket`) REFERENCES `ticket` (`id_ticket`);

--
-- Constraints for table `mise_a_jour`
--
ALTER TABLE `mise_a_jour`
  ADD CONSTRAINT `mise_a_jour_ibfk_1` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`);

--
-- Constraints for table `plage_travail`
--
ALTER TABLE `plage_travail`
  ADD CONSTRAINT `plage_travail_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `plage_travail_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `projet_utilisateur`
--
ALTER TABLE `projet_utilisateur`
  ADD CONSTRAINT `projet_utilisateur_ibfk_1` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`),
  ADD CONSTRAINT `projet_utilisateur_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `suivi_ticket`
--
ALTER TABLE `suivi_ticket`
  ADD CONSTRAINT `suivi_ticket_ibfk_1` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id_statut`),
  ADD CONSTRAINT `suivi_ticket_ibfk_2` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `suivi_ticket_ibfk_3` FOREIGN KEY (`id_utilisateur`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_degre_importance`) REFERENCES `degre_importance` (`id_degre_importance`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id_statut`),
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`id_mise_a_jour`) REFERENCES `mise_a_jour` (`id_mise_a_jour`);

--
-- Constraints for table `ticket_has_mise_a_jour`
--
ALTER TABLE `ticket_has_mise_a_jour`
  ADD CONSTRAINT `ticket_has_mise_a_jour_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `ticket_has_mise_a_jour_ibfk_2` FOREIGN KEY (`id_mise_a_jour`) REFERENCES `mise_a_jour` (`id_mise_a_jour`);

--
-- Constraints for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  ADD CONSTRAINT `ticket_tags_ibfk_1` FOREIGN KEY (`tags_id_tag`) REFERENCES `tags` (`id_tag`),
  ADD CONSTRAINT `ticket_tags_ibfk_2` FOREIGN KEY (`ticket_id_ticket`) REFERENCES `ticket` (`id_ticket`);
