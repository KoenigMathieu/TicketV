-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 12, 2017 at 04:57 PM
-- Server version: 5.5.42-log
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ticketV`
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `degre_importance`
--

INSERT INTO `degre_importance` (`id_degre_importance`, `libelle`, `actif`) VALUES
(1, 'Important', 1),
(2, 'Urgent', 1),
(3, 'Mineur', 1);

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
(1, 'AdrienB', 'adrienb', 'adriball.dev@gmail.com', 'adriball.dev@gmail.com', 1, NULL, '$2y$13$Xyy/syOkSeNJiW39sg1WNuiY4FKDAT3jASMVEWC6riRoS51DyAqFG', '2017-04-12 14:06:53', NULL, NULL, 'a:0:{}');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mise_a_jour`
--

INSERT INTO `mise_a_jour` (`id_mise_a_jour`, `remarque`, `date`, `version`, `effectue`, `id_projet`) VALUES
(2, 'Test', '2017-04-10 00:00:00', 'Maverick', 0, 7),
(3, 'Test test', '2012-01-01 00:00:00', 'Snow Leopard', 0, 7);

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
  `actif` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projet`
--

INSERT INTO `projet` (`id_projet`, `libelle`, `actif`) VALUES
(7, 'Projet TicketV', 1);

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
(7, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statut`
--

INSERT INTO `statut` (`id_statut`, `libelle`, `actif`, `clos`, `couleur`) VALUES
(1, 'En cours', 1, 1, '#3bd731'),
(2, 'En Test', 1, 1, '#2963ba'),
(3, 'Planifié', 1, 0, '#ba55ad'),
(4, 'Sans suite', 1, 0, '#a29a09'),
(5, 'Non revu', 1, 0, '#ffffff'),
(6, 'Clos', 1, 1, '#cc1915');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `suivi_ticket`
--

INSERT INTO `suivi_ticket` (`id_suivi_ticket`, `id_statut`, `id_ticket`, `id_utilisateur`, `date`, `remarque`) VALUES
(2, 1, 2, 1, '2017-04-04 13:05:36', 'Création du ticket du ticket.'),
(3, 2, 3, 1, '2017-04-04 14:32:50', 'Création du ticket du ticket.'),
(4, 3, 4, 1, '2017-04-04 14:33:13', 'Création du ticket du ticket.'),
(5, 1, 5, 1, '2017-04-04 14:33:36', 'Création du ticket du ticket.'),
(6, 1, 6, 1, '2017-04-04 14:33:50', 'Création du ticket du ticket.'),
(7, 3, 7, 1, '2017-04-04 14:34:03', 'Création du ticket du ticket.'),
(8, 4, 8, 1, '2017-04-04 14:35:00', 'Création du ticket du ticket.'),
(9, 4, 9, 1, '2017-04-05 16:19:31', 'Création du ticket du ticket.'),
(10, 5, 10, 1, '2017-04-05 16:19:47', 'Création du ticket du ticket.'),
(11, 6, 2, 1, '2017-04-07 17:42:31', 'Modification du ticket.'),
(12, 6, 2, 1, '2017-04-11 07:37:39', 'Modification du ticket.'),
(13, 6, 2, 1, '2017-04-11 11:58:21', 'Modification du ticket.'),
(14, 6, 2, 1, '2017-04-11 12:21:16', 'Modification du ticket.'),
(15, 6, 2, 1, '2017-04-11 12:21:24', 'Modification du ticket.'),
(16, 6, 2, 1, '2017-04-12 14:51:09', 'Modification du ticket.');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id_tag` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id_tag`, `libelle`, `actif`) VALUES
(1, 'Développement', 1),
(2, 'Test', 1),
(3, 'Support', 1),
(4, 'Maintenance', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `id_degre_importance`, `id_projet`, `id_statut`, `libelle`, `description`, `id_mise_a_jour`) VALUES
(2, 1, 7, 6, 'Ticket 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 2),
(3, 1, 7, 2, 'Ticket 2', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l''imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n''a pas fait que survivre cinq siècles, mais s''est aussi adapté à la bureautique informatique, sans que son contenu n''en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.\r\n\r\nOn sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L''avantage du Lorem Ipsum sur un texte générique comme ''Du texte. Du texte. Du texte.'' est qu''il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour ''Lorem Ipsum'' vous conduira vers de nombreux sites qui n''en sont encore qu''à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d''y rajouter de petits clins d''oeil, voire des phrases embarassantes).', NULL),
(4, 1, 7, 3, 'Ticket 3', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l''imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n''a pas fait que survivre cinq siècles, mais s''est aussi adapté à la bureautique informatique, sans que son contenu n''en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.\r\n\r\nOn sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L''avantage du Lorem Ipsum sur un texte générique comme ''Du texte. Du texte. Du texte.'' est qu''il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour ''Lorem Ipsum'' vous conduira vers de nombreux sites qui n''en sont encore qu''à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d''y rajouter de petits clins d''oeil, voire des phrases embarassantes).', NULL),
(5, 2, 7, 1, 'Ticket 4', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l''imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n''a pas fait que survivre cinq siècles, mais s''est aussi adapté à la bureautique informatique, sans que son contenu n''en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.\r\n\r\nOn sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L''avantage du Lorem Ipsum sur un texte générique comme ''Du texte. Du texte. Du texte.'' est qu''il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour ''Lorem Ipsum'' vous conduira vers de nombreux sites qui n''en sont encore qu''à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d''y rajouter de petits clins d''oeil, voire des phrases embarassantes).', NULL),
(6, 1, 7, 1, 'Ticket 5', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l''imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n''a pas fait que survivre cinq siècles, mais s''est aussi adapté à la bureautique informatique, sans que son contenu n''en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.\r\n\r\nOn sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L''avantage du Lorem Ipsum sur un texte générique comme ''Du texte. Du texte. Du texte.'' est qu''il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour ''Lorem Ipsum'' vous conduira vers de nombreux sites qui n''en sont encore qu''à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d''y rajouter de petits clins d''oeil, voire des phrases embarassantes).', NULL),
(7, 1, 7, 3, 'Ticket 6', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l''imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n''a pas fait que survivre cinq siècles, mais s''est aussi adapté à la bureautique informatique, sans que son contenu n''en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.\r\n\r\nOn sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L''avantage du Lorem Ipsum sur un texte générique comme ''Du texte. Du texte. Du texte.'' est qu''il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour ''Lorem Ipsum'' vous conduira vers de nombreux sites qui n''en sont encore qu''à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d''y rajouter de petits clins d''oeil, voire des phrases embarassantes).', NULL),
(8, 1, 7, 4, 'Ticket 7', 'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l''imprimerie depuis les années 1500, quand un peintre anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n''a pas fait que survivre cinq siècles, mais s''est aussi adapté à la bureautique informatique, sans que son contenu n''en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.\r\n\r\nOn sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L''avantage du Lorem Ipsum sur un texte générique comme ''Du texte. Du texte. Du texte.'' est qu''il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour ''Lorem Ipsum'' vous conduira vers de nombreux sites qui n''en sont encore qu''à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d''y rajouter de petits clins d''oeil, voire des phrases embarassantes).', NULL),
(9, 1, 7, 4, 'Ticket 7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', NULL),
(10, 1, 7, 5, 'Ticket 8', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', NULL);

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
-- Dumping data for table `ticket_tags`
--

INSERT INTO `ticket_tags` (`ticket_id_ticket`, `tags_id_tag`) VALUES
(2, 1),
(4, 1),
(5, 1),
(7, 1),
(10, 1),
(3, 2),
(4, 2),
(5, 2),
(8, 2),
(9, 2),
(3, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(6, 4);

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
  MODIFY `id_commentaire_ticket` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `degre_importance`
--
ALTER TABLE `degre_importance`
  MODIFY `id_degre_importance` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mise_a_jour`
--
ALTER TABLE `mise_a_jour`
  MODIFY `id_mise_a_jour` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `plage_travail`
--
ALTER TABLE `plage_travail`
  MODIFY `id_plage` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projet`
--
ALTER TABLE `projet`
  MODIFY `id_projet` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `statut`
--
ALTER TABLE `statut`
  MODIFY `id_statut` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `suivi_ticket`
--
ALTER TABLE `suivi_ticket`
  MODIFY `id_suivi_ticket` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id_tag` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
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
