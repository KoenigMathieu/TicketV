-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 31, 2017 at 11:21 AM
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
(6, 'Sans suite', '1'),
(7, 'Clos', '1');

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

--
-- Dumping data for table `suivi_ticket`
--

INSERT INTO `suivi_ticket` (`id_suivi_ticket`, `id_statut`, `id_ticket`, `id_utilisateur`, `date`, `remarque`) VALUES
(7, 2, 3, 2, '2017-03-31 10:50:00', 'Création du ticket.'),
(9, 2, 3, 1, '2017-03-31 09:05:02', 'Modification du ticket.'),
(10, 1, 9, 1, '2017-03-31 09:18:51', 'Création du ticket.'),
(11, 1, 10, 1, '2017-03-31 09:19:01', 'Création du ticket.'),
(12, 1, 11, 1, '2017-03-31 09:19:09', 'Création du ticket.'),
(13, 1, 12, 1, '2017-03-31 09:19:32', 'Création du ticket.'),
(14, 1, 13, 1, '2017-03-31 09:19:41', 'Création du ticket.'),
(15, 1, 14, 1, '2017-03-31 09:19:49', 'Création du ticket.'),
(16, 1, 15, 1, '2017-03-31 09:19:57', 'Création du ticket.'),
(17, 1, 16, 1, '2017-03-31 09:20:04', 'Création du ticket.'),
(18, 1, 17, 1, '2017-03-31 09:20:12', 'Création du ticket.'),
(19, 1, 18, 1, '2017-03-31 09:20:20', 'Création du ticket.');

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
(3, 4, 1, 2, 'Gestion des mises à jour', 'Permettre la gestion des mises à jour :\r\n- Ajouter table mise à jour\r\n- Modifier les entités\r\n- Générer le CRUD\r\n- Modifier le twig\r\n\r\nAttention : Vérifier qu\'on ne perde pas les twig déjà modifiés'),
(9, 2, 1, 1, 'Ticket 1', 'I have been building a multi-site micro CMS using Symfony2. To order the pages I have created a Hierarchical tree traversal system. Because there are multiple sites in the database, each page has its own id field too as the left and right values are not unique. On the administration side, there was no issue. In 2011 I wrote an admin system for a besboke eCommerce site in Symfony 1.4 and created a full tree traversal system with jQuery drag and drop ordering. So a few weeks ago I ported my old code into Symfony2 which was remarkably easy as there are many similarities between the two frameworks.\r\n\r\nThe issue came on the front end. I am using the Symfony2 menu bundle from KnpLabswhich works a treat but in order to generate the side navigation I need to get the current active page and all its children. I added a OneToMany relationship on the pages entity to itself to get the children pages with one query:e into Symfony2 which only took a day ish.'),
(10, 2, 1, 1, 'Ticket 2', 'I have been building a multi-site micro CMS using Symfony2. To order the pages I have created a Hierarchical tree traversal system. Because there are multiple sites in the database, each page has its own id field too as the left and right values are not unique. On the administration side, there was no issue. In 2011 I wrote an admin system for a besboke eCommerce site in Symfony 1.4 and created a full tree traversal system with jQuery drag and drop ordering. So a few weeks ago I ported my old code into Symfony2 which was remarkably easy as there are many similarities between the two frameworks.\r\n\r\nThe issue came on the front end. I am using the Symfony2 menu bundle from KnpLabswhich works a treat but in order to generate the side navigation I need to get the current active page and all its children. I added a OneToMany relationship on the pages entity to itself to get the children pages with one query:e into Symfony2 which only took a day ish.'),
(11, 2, 1, 1, 'Ticket 3', 'I have been building a multi-site micro CMS using Symfony2. To order the pages I have created a Hierarchical tree traversal system. Because there are multiple sites in the database, each page has its own id field too as the left and right values are not unique. On the administration side, there was no issue. In 2011 I wrote an admin system for a besboke eCommerce site in Symfony 1.4 and created a full tree traversal system with jQuery drag and drop ordering. So a few weeks ago I ported my old code into Symfony2 which was remarkably easy as there are many similarities between the two frameworks.\r\n\r\nThe issue came on the front end. I am using the Symfony2 menu bundle from KnpLabswhich works a treat but in order to generate the side navigation I need to get the current active page and all its children. I added a OneToMany relationship on the pages entity to itself to get the children pages with one query:e into Symfony2 which only took a day ish.'),
(12, 2, 1, 1, 'Ticket 4', 'I have been building a multi-site micro CMS using Symfony2. To order the pages I have created a Hierarchical tree traversal system. Because there are multiple sites in the database, each page has its own id field too as the left and right values are not unique. On the administration side, there was no issue. In 2011 I wrote an admin system for a besboke eCommerce site in Symfony 1.4 and created a full tree traversal system with jQuery drag and drop ordering. So a few weeks ago I ported my old code into Symfony2 which was remarkably easy as there are many similarities between the two frameworks.\r\n\r\nThe issue came on the front end. I am using the Symfony2 menu bundle from KnpLabswhich works a treat but in order to generate the side navigation I need to get the current active page and all its children. I added a OneToMany relationship on the pages entity to itself to get the children pages with one query:e into Symfony2 which only took a day ish.'),
(13, 2, 1, 1, 'Ticket 5', 'I have been building a multi-site micro CMS using Symfony2. To order the pages I have created a Hierarchical tree traversal system. Because there are multiple sites in the database, each page has its own id field too as the left and right values are not unique. On the administration side, there was no issue. In 2011 I wrote an admin system for a besboke eCommerce site in Symfony 1.4 and created a full tree traversal system with jQuery drag and drop ordering. So a few weeks ago I ported my old code into Symfony2 which was remarkably easy as there are many similarities between the two frameworks.\r\n\r\nThe issue came on the front end. I am using the Symfony2 menu bundle from KnpLabswhich works a treat but in order to generate the side navigation I need to get the current active page and all its children. I added a OneToMany relationship on the pages entity to itself to get the children pages with one query:e into Symfony2 which only took a day ish.'),
(14, 2, 1, 1, 'Ticket 6', 'I have been building a multi-site micro CMS using Symfony2. To order the pages I have created a Hierarchical tree traversal system. Because there are multiple sites in the database, each page has its own id field too as the left and right values are not unique. On the administration side, there was no issue. In 2011 I wrote an admin system for a besboke eCommerce site in Symfony 1.4 and created a full tree traversal system with jQuery drag and drop ordering. So a few weeks ago I ported my old code into Symfony2 which was remarkably easy as there are many similarities between the two frameworks.\r\n\r\nThe issue came on the front end. I am using the Symfony2 menu bundle from KnpLabswhich works a treat but in order to generate the side navigation I need to get the current active page and all its children. I added a OneToMany relationship on the pages entity to itself to get the children pages with one query:e into Symfony2 which only took a day ish.'),
(15, 2, 1, 1, 'Ticket 7', 'I have been building a multi-site micro CMS using Symfony2. To order the pages I have created a Hierarchical tree traversal system. Because there are multiple sites in the database, each page has its own id field too as the left and right values are not unique. On the administration side, there was no issue. In 2011 I wrote an admin system for a besboke eCommerce site in Symfony 1.4 and created a full tree traversal system with jQuery drag and drop ordering. So a few weeks ago I ported my old code into Symfony2 which was remarkably easy as there are many similarities between the two frameworks.\r\n\r\nThe issue came on the front end. I am using the Symfony2 menu bundle from KnpLabswhich works a treat but in order to generate the side navigation I need to get the current active page and all its children. I added a OneToMany relationship on the pages entity to itself to get the children pages with one query:e into Symfony2 which only took a day ish.'),
(16, 2, 1, 1, 'Ticket 8', 'I have been building a multi-site micro CMS using Symfony2. To order the pages I have created a Hierarchical tree traversal system. Because there are multiple sites in the database, each page has its own id field too as the left and right values are not unique. On the administration side, there was no issue. In 2011 I wrote an admin system for a besboke eCommerce site in Symfony 1.4 and created a full tree traversal system with jQuery drag and drop ordering. So a few weeks ago I ported my old code into Symfony2 which was remarkably easy as there are many similarities between the two frameworks.\r\n\r\nThe issue came on the front end. I am using the Symfony2 menu bundle from KnpLabswhich works a treat but in order to generate the side navigation I need to get the current active page and all its children. I added a OneToMany relationship on the pages entity to itself to get the children pages with one query:e into Symfony2 which only took a day ish.'),
(17, 2, 1, 1, 'Ticket 9', 'I have been building a multi-site micro CMS using Symfony2. To order the pages I have created a Hierarchical tree traversal system. Because there are multiple sites in the database, each page has its own id field too as the left and right values are not unique. On the administration side, there was no issue. In 2011 I wrote an admin system for a besboke eCommerce site in Symfony 1.4 and created a full tree traversal system with jQuery drag and drop ordering. So a few weeks ago I ported my old code into Symfony2 which was remarkably easy as there are many similarities between the two frameworks.  The issue came on the front end. I am using the Symfony2 menu bundle from KnpLabswhich works a treat but in order to generate the side navigation I need to get the current active page and all its children. I added a OneToMany relationship on the pages entity to itself to get the children pages with one query:e into Symfony2 which only took a day ish.'),
(18, 2, 1, 1, 'Ticket 10', 'I have been building a multi-site micro CMS using Symfony2. To order the pages I have created a Hierarchical tree traversal system. Because there are multiple sites in the database, each page has its own id field too as the left and right values are not unique. On the administration side, there was no issue. In 2011 I wrote an admin system for a besboke eCommerce site in Symfony 1.4 and created a full tree traversal system with jQuery drag and drop ordering. So a few weeks ago I ported my old code into Symfony2 which was remarkably easy as there are many similarities between the two frameworks.  The issue came on the front end. I am using the Symfony2 menu bundle from KnpLabswhich works a treat but in order to generate the side navigation I need to get the current active page and all its children. I added a OneToMany relationship on the pages entity to itself to get the children pages with one query:e into Symfony2 which only took a day ish.');

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
(3, 2),
(9, 1),
(10, 3),
(11, 3),
(12, 2),
(12, 3),
(13, 1),
(13, 4),
(14, 1),
(15, 3),
(16, 4),
(17, 2),
(18, 1),
(18, 2),
(18, 3);

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
  MODIFY `id_statut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `suivi_ticket`
--
ALTER TABLE `suivi_ticket`
  MODIFY `id_suivi_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id_tag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
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
