
-- Table structure for table `commentaire_ticket`
--

CREATE TABLE `commentaire_ticket` (
  `id_commentaire_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id_ticket` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `remarque` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (id_commentaire_ticket),
  FOREIGN KEY (ticket_id_ticket) REFERENCES ticket(id_ticket)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `degre_importance`
--

CREATE TABLE `degre_importance` (
  `id_degre_importance` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` TINYINT DEFAULT 0,
  PRIMARY KEY (id_degre_importance)
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
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
   PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plage_travail`
--

CREATE TABLE `plage_travail` (
  `id_plage` int(11) NOT NULL AUTO_INCREMENT,
  `id_ticket` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  PRIMARY KEY (id_plage),
  FOREIGN KEY (id_ticket) REFERENCES ticket(id_ticket),
  FOREIGN KEY (id_utilisateur) REFERENCES fos_user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

CREATE TABLE `projet` (
  `id_projet` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` TINYINT DEFAULT 0,
   PRIMARY KEY (id_projet)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projet_utilisateur`
--

CREATE TABLE `projet_utilisateur` (
  `id_projet` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (id_projet,id_utilisateur),
  FOREIGN KEY (id_projet) REFERENCES projet(id_projet),
  FOREIGN KEY (id_utilisateur) REFERENCES fos_user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Table structure for table `statut`
--

CREATE TABLE `statut` (
  `id_statut` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` TINYINT DEFAULT 0,
  `clos` TINYINT DEFAULT 0,
  `couleur` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (id_statut)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Table structure for table `suivi_ticket`
--

CREATE TABLE `suivi_ticket` (
  `id_suivi_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `id_statut` int(11) DEFAULT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `remarque` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (id_suivi_ticket),
  FOREIGN KEY (id_statut) REFERENCES statut(id_statut),
  FOREIGN KEY (id_ticket) REFERENCES ticket(id_ticket),
  FOREIGN KEY (id_utilisateur) REFERENCES fos_user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `actif` TINYINT DEFAULT 0,
  PRIMARY KEY (id_tag)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `id_degre_importance` int(11) DEFAULT NULL,
  `id_projet` int(11) DEFAULT NULL,
  `id_statut` int(11) DEFAULT NULL,
  `libelle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (id_ticket),
  FOREIGN KEY (id_degre_importance) REFERENCES degre_importance(id_degre_importance),
  FOREIGN KEY (id_projet) REFERENCES projet(id_projet),
  FOREIGN KEY (id_statut) REFERENCES statut(id_statut)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Table structure for mise à jour `mise_a_jour`
--

CREATE TABLE `mise_a_jour` (
  `id_mise_a_jour` int(11) NOT NULL AUTO_INCREMENT,
  `remarque` text COLLATE utf8_unicode_ci,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (id_mise_a_jour)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



--
-- Table structure for mise à jour `ticket_has_mise_a_jour`
--

CREATE TABLE `ticket_has_mise_a_jour` (
  `id_ticket` int(11) NOT NULL,
  `id_mise_a_jour` int(11) NOT NULL,
  PRIMARY KEY (id_ticket,id_mise_a_jour),
  FOREIGN KEY (id_ticket) REFERENCES ticket(id_ticket),
  FOREIGN KEY (id_mise_a_jour) REFERENCES mise_a_jour(id_mise_a_jour)
) ENGINE = InnoDB;

--
-- Table structure for ticket_tags `ticket_tags`
--
CREATE TABLE `ticket_tags` (
  `ticket_id_ticket` int(11) NOT NULL,
  `tags_id_tag` int(11) NOT NULL,
  PRIMARY KEY (ticket_id_ticket, tags_id_tag),
  FOREIGN KEY (tags_id_tag) REFERENCES tags(id_tag),
  FOREIGN KEY (ticket_id_ticket) REFERENCES ticket(id_ticket)
)ENGINE = InnoDB;
