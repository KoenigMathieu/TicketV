-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 30, 2017 at 03:51 PM
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
  `actif` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `degre_importance`
--

INSERT INTO `degre_importance` (`id_degre_importance`, `libelle`, `actif`) VALUES
(2, 'Faible', '1'),
(3, 'Moyen', '1'),
(4, 'Majeur', '1'),
(5, 'Critique', '1');

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

--
-- Dumping data for table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, 'adriB', 'adrib', 'adriball.dev@gmail.com', 'adriball.dev@gmail.com', 1, NULL, '$2y$13$8tmGkn3bbr/4iJLCKLyZA.8k8onQyOOmQ6MoR3tESbPaEgvk.zVLS', '2017-03-30 12:56:40', NULL, NULL, 'a:0:{}'),
(2, 'matK', 'matk', 'mathieu.koenig@test.fr', 'mathieu.koenig@test.fr', 1, NULL, '$2y$13$ADWXrCrxZ2EOrMN9ehtDXOErBj/azGmyIacXjD97y0lyc8CBokJO2', '2017-03-30 12:22:13', NULL, NULL, 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `plage_travail`
--

CREATE TABLE `plage_travail` (
  `id_plage` int(11) NOT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

CREATE TABLE `projet` (
  `id_projet` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projet`
--

INSERT INTO `projet` (`id_projet`, `libelle`, `actif`) VALUES
(1, 'TicketV', '1');

-- --------------------------------------------------------

--
-- Table structure for table `projet_utilisateur`
--

CREATE TABLE `projet_utilisateur` (
  `id_projet` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projet_utilisateur`
--

INSERT INTO `projet_utilisateur` (`id_projet`, `id_utilisateur`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `statut`
--

CREATE TABLE `statut` (
  `id_statut` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statut`
--

INSERT INTO `statut` (`id_statut`, `libelle`, `actif`) VALUES
(1, 'En attente de délai', '1'),
(2, 'Planifié', '1'),
(3, 'En développement', '1'),
(4, 'Livré à l\'assurance qualité', '1'),
(5, 'Finalisé', '1'),
(6, 'Sans suite', '1');

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
  `actif` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id_tag`, `libelle`, `actif`) VALUES
(1, 'Développement', '1'),
(2, 'Test', '1'),
(3, 'Maintenance', '1'),
(4, 'Support', '1');

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
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `id_degre_importance`, `id_projet`, `id_statut`, `libelle`, `description`) VALUES
(1, 2, 1, 1, 'Interface utilisateur', 'Développement de l\'interface utilisateur de TicketV'),
(2, 2, 1, 1, 'Insertion d\'un suivi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(3, 4, 1, 2, 'Gestion des mises à jour', 'Permettre la gestion des mises à jour\r\n- Ajouter table mise à jour\r\n- Modifier les entités\r\n- Modifier le twig');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_tags`
--

CREATE TABLE `ticket_tags` (
  `ticket_id_ticket` int(11) NOT NULL,
  `tags_id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_tags`
--

INSERT INTO `ticket_tags` (`ticket_id_ticket`, `tags_id_tag`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commentaire_ticket`
--
ALTER TABLE `commentaire_ticket`
  ADD PRIMARY KEY (`id_commentaire_ticket`),
  ADD KEY `fk_commentaire_ticket_ticket1_idx` (`ticket_id_ticket`),
  ADD KEY `fk_commentaire_ticket_utilisateur1_idx` (`id_utilisateur`);

--
-- Indexes for table `degre_importance`
--
ALTER TABLE `degre_importance`
  ADD PRIMARY KEY (`id_degre_importance`);

--
-- Indexes for table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`);

--
-- Indexes for table `plage_travail`
--
ALTER TABLE `plage_travail`
  ADD PRIMARY KEY (`id_plage`),
  ADD KEY `fk_plage_travail_ticket1_idx` (`id_ticket`),
  ADD KEY `fk_plage_travail_utilisateur1_idx` (`id_utilisateur`);

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
  ADD KEY `IDX_C626378D76222944` (`id_projet`),
  ADD KEY `IDX_C626378D50EAE44` (`id_utilisateur`);

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
  ADD KEY `fk_suivi_ticket_ticket1_idx` (`id_ticket`),
  ADD KEY `fk_suivi_ticket_utilisateur1_idx` (`id_utilisateur`),
  ADD KEY `fk_suivi_ticket_statut1_idx` (`id_statut`);

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
  ADD KEY `fk_ticket_projet_idx` (`id_projet`),
  ADD KEY `fk_ticket_statut1_idx` (`id_statut`),
  ADD KEY `fk_ticket_degre_importance1_idx` (`id_degre_importance`);

--
-- Indexes for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  ADD PRIMARY KEY (`ticket_id_ticket`,`tags_id_tag`),
  ADD KEY `IDX_5D67811E2BADC204` (`ticket_id_ticket`),
  ADD KEY `IDX_5D67811EF8F6E2E9` (`tags_id_tag`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commentaire_ticket`
--
ALTER TABLE `commentaire_ticket`
  MODIFY `id_commentaire_ticket` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `degre_importance`
--
ALTER TABLE `degre_importance`
  MODIFY `id_degre_importance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `plage_travail`
--
ALTER TABLE `plage_travail`
  MODIFY `id_plage` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projet`
--
ALTER TABLE `projet`
  MODIFY `id_projet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `statut`
--
ALTER TABLE `statut`
  MODIFY `id_statut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `suivi_ticket`
--
ALTER TABLE `suivi_ticket`
  MODIFY `id_suivi_ticket` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id_tag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `commentaire_ticket`
--
ALTER TABLE `commentaire_ticket`
  ADD CONSTRAINT `FK_83247D242BADC204` FOREIGN KEY (`ticket_id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `FK_83247D2450EAE44` FOREIGN KEY (`id_utilisateur`) REFERENCES `fos_user` (`id`);

--
-- Constraints for table `plage_travail`
--
ALTER TABLE `plage_travail`
  ADD CONSTRAINT `FK_ADAECD3A50EAE44` FOREIGN KEY (`id_utilisateur`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_ADAECD3AB197184E` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`);

--
-- Constraints for table `projet_utilisateur`
--
ALTER TABLE `projet_utilisateur`
  ADD CONSTRAINT `FK_C626378D50EAE44` FOREIGN KEY (`id_utilisateur`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_C626378D76222944` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`);

--
-- Constraints for table `suivi_ticket`
--
ALTER TABLE `suivi_ticket`
  ADD CONSTRAINT `FK_3564D0F150EAE44` FOREIGN KEY (`id_utilisateur`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_3564D0F1B197184E` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `FK_3564D0F1C3534552` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id_statut`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FK_97A0ADA352E42FDF` FOREIGN KEY (`id_degre_importance`) REFERENCES `degre_importance` (`id_degre_importance`),
  ADD CONSTRAINT `FK_97A0ADA376222944` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id_projet`),
  ADD CONSTRAINT `FK_97A0ADA3C3534552` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id_statut`);

--
-- Constraints for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  ADD CONSTRAINT `FK_5D67811E2BADC204` FOREIGN KEY (`ticket_id_ticket`) REFERENCES `ticket` (`id_ticket`),
  ADD CONSTRAINT `FK_5D67811EF8F6E2E9` FOREIGN KEY (`tags_id_tag`) REFERENCES `tags` (`id_tag`);
