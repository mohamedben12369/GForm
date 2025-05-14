-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2025 at 07:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fff`
--

-- --------------------------------------------------------

--
-- Table structure for table `axes`
--

CREATE TABLE `axes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `axes`
--

INSERT INTO `axes` (`id`, `nom`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Hardskills', NULL, '2025-05-12 04:18:04', '2025-05-12 04:18:04'),
(2, 'SoftSkills', NULL, '2025-05-12 04:18:04', '2025-05-12 04:18:04'),
(3, 'EHR', NULL, '2025-05-12 04:18:04', '2025-05-12 04:18:04'),
(4, 'Beaurithique', NULL, '2025-05-12 04:18:04', '2025-05-12 04:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `competences`
--

CREATE TABLE `competences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `niveau_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sous_domaine_id` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `utilisateur_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cv`
--

CREATE TABLE `cv` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `formateur_id` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diplomes`
--

CREATE TABLE `diplomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `etablissement_id` bigint(20) UNSIGNED NOT NULL,
  `type_diplome_id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `date_obtention` date NOT NULL,
  `utilisateur_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `domaines`
--

CREATE TABLE `domaines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `domaines`
--

INSERT INTO `domaines` (`id`, `nom`, `created_at`, `updated_at`) VALUES
(1, 'Informatique', '2025-05-12 04:18:04', '2025-05-12 04:18:04'),
(2, 'Gestion', '2025-05-12 04:18:04', '2025-05-12 04:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `entreprises`
--

CREATE TABLE `entreprises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `CNSS` varchar(50) NOT NULL,
  `utilisateur_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entreprise_formation`
--

CREATE TABLE `entreprise_formation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `formation_id` bigint(20) UNSIGNED NOT NULL,
  `entreprise_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `etablissements`
--

CREATE TABLE `etablissements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `pays` varchar(100) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date DEFAULT NULL,
  `lieu` varchar(255) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `entreprise` varchar(255) NOT NULL,
  `utilisateur_id` bigint(20) UNSIGNED NOT NULL,
  `type_experience_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formateurs`
--

CREATE TABLE `formateurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `utilisateur_id` bigint(20) UNSIGNED NOT NULL,
  `type_formateur_id` bigint(20) UNSIGNED NOT NULL,
  `sous_domaine_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formateur_sousdomaine`
--

CREATE TABLE `formateur_sousdomaine` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `formateur_id` bigint(20) UNSIGNED NOT NULL,
  `sous_domaine_id` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formations`
--

CREATE TABLE `formations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `lieu` varchar(100) NOT NULL,
  `modalite` varchar(50) NOT NULL,
  `nombrePlaces` int(11) NOT NULL,
  `prix` double NOT NULL,
  `duree` varchar(50) NOT NULL,
  `prerequis` text NOT NULL,
  `programme` text NOT NULL,
  `objectifs` text NOT NULL,
  `DatedeCreation` date NOT NULL,
  `type_formation_id` bigint(20) UNSIGNED NOT NULL,
  `statut_formation_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formation_formateur`
--

CREATE TABLE `formation_formateur` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `formation_id` bigint(20) UNSIGNED NOT NULL,
  `formateur_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formation_theme`
--

CREATE TABLE `formation_theme` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `formation_id` bigint(20) UNSIGNED NOT NULL,
  `theme_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(139, '2025_05_08_102852_create__axes_table', 1),
(140, '2025_05_10_000001_create_roles_table', 1),
(141, '2025_05_10_000002_create_utilisateurs_table', 1),
(142, '2025_05_10_000003_create_entreprises_table', 1),
(143, '2025_05_10_000004_create_type_formateurs_table', 1),
(144, '2025_05_10_000005_create_formateurs_table', 1),
(145, '2025_05_10_000007_create_sous_domaines_table', 1),
(146, '2025_05_10_000008_create_theme_formations_table', 1),
(147, '2025_05_10_000009_create_type_formations_table', 1),
(148, '2025_05_10_000010_create_statut_formations_table', 1),
(149, '2025_05_10_000011_create_formations_table', 1),
(150, '2025_05_10_000012_create_formation_formateur_table', 1),
(151, '2025_05_10_161609_create_formation_theme_table', 1),
(152, '2025_05_10_161950_create_entreprise_formation_table', 1),
(153, '2025_05_10_183419_create_securite_question_table', 1),
(154, '2025_05_10_183420_add_securite_question_to_utilisateurs', 1),
(155, '2025_05_11_000001_create_type_experience_table', 1),
(156, '2025_05_11_000002_create_experience_table', 1),
(157, '2025_05_11_000003_create_competences_table', 1),
(158, '2025_05_11_080208_add_niveauxtocompetence_table', 1),
(159, '2025_05_11_120000_add_sous_domaine_to_formateurs_table', 1),
(160, '2025_05_11_121000_create_cv_table', 1),
(161, '2025_05_11_130000_create_etablissements_table', 1),
(162, '2025_05_11_130100_create_type_diplomes_table', 1),
(163, '2025_05_11_130200_create_diplomes_table', 1),
(164, '2025_05_11_131000_add_utilisateur_to_competences_table', 1),
(165, '2025_05_11_140000_create_questions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `niveaux`
--

CREATE TABLE `niveaux` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL,
  `permession` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `nom`, `permession`, `color`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'all', 'red', 'admin-icon', '2025-05-12 04:14:27', '2025-05-12 04:14:27'),
(2, 'Editor', 'edit', 'blue', 'editor-icon', '2025-05-12 04:14:27', '2025-05-12 04:14:27'),
(3, 'User', 'view', 'green', 'user-icon', '2025-05-12 04:14:27', '2025-05-12 04:14:27'),
(4, 'Admin', 'all', 'red', 'admin-icon', '2025-05-12 04:18:04', '2025-05-12 04:18:04'),
(5, 'Editor', 'edit', 'blue', 'editor-icon', '2025-05-12 04:18:04', '2025-05-12 04:18:04'),
(6, 'User', 'view', 'green', 'user-icon', '2025-05-12 04:18:04', '2025-05-12 04:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `securite_question`
--

CREATE TABLE `securite_question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sous_domaines`
--

CREATE TABLE `sous_domaines` (
  `code` varchar(10) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `domaine_code` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `axes_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statut_formations`
--

CREATE TABLE `statut_formations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `dateCreation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theme_formations`
--

CREATE TABLE `theme_formations` (
  `idtheme` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(255) NOT NULL,
  `sous_domaine_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_diplomes`
--

CREATE TABLE `type_diplomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_diplomes`
--

INSERT INTO `type_diplomes` (`id`, `nom`, `created_at`, `updated_at`) VALUES
(1, 'Intra_entreprise', '2025-05-12 04:14:27', '2025-05-12 04:14:27'),
(2, 'Certification', '2025-05-12 04:14:27', '2025-05-12 04:14:27'),
(3, 'Diplôme', '2025-05-12 04:14:27', '2025-05-12 04:14:27'),
(4, 'Intra_entreprise', '2025-05-12 04:18:04', '2025-05-12 04:18:04'),
(5, 'Certification', '2025-05-12 04:18:04', '2025-05-12 04:18:04'),
(6, 'Diplôme', '2025-05-12 04:18:04', '2025-05-12 04:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `type_experience`
--

CREATE TABLE `type_experience` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_experience`
--

INSERT INTO `type_experience` (`id`, `nom`, `created_at`, `updated_at`) VALUES
(1, 'Stage', '2025-05-12 04:14:27', '2025-05-12 04:14:27'),
(2, 'Emploi', '2025-05-12 04:14:27', '2025-05-12 04:14:27'),
(3, 'Bénévolat', '2025-05-12 04:14:27', '2025-05-12 04:14:27'),
(4, 'Stage', '2025-05-12 04:18:04', '2025-05-12 04:18:04'),
(5, 'Emploi', '2025-05-12 04:18:04', '2025-05-12 04:18:04'),
(6, 'Bénévolat', '2025-05-12 04:18:04', '2025-05-12 04:18:04');

-- --------------------------------------------------------

--
-- Table structure for table `type_formateurs`
--

CREATE TABLE `type_formateurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_formations`
--

CREATE TABLE `type_formations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `reponse` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(255) NOT NULL,
  `securite_question_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `axes`
--
ALTER TABLE `axes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `competences`
--
ALTER TABLE `competences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competences_niveau_id_foreign` (`niveau_id`),
  ADD KEY `competences_sous_domaine_id_foreign` (`sous_domaine_id`),
  ADD KEY `competences_utilisateur_id_foreign` (`utilisateur_id`);

--
-- Indexes for table `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cv_formateur_id_foreign` (`formateur_id`);

--
-- Indexes for table `diplomes`
--
ALTER TABLE `diplomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diplomes_utilisateur_id_foreign` (`utilisateur_id`),
  ADD KEY `diplomes_etablissement_id_foreign` (`etablissement_id`),
  ADD KEY `diplomes_type_diplome_id_foreign` (`type_diplome_id`);

--
-- Indexes for table `domaines`
--
ALTER TABLE `domaines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domaines_nom_unique` (`nom`);

--
-- Indexes for table `entreprises`
--
ALTER TABLE `entreprises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entreprises_email_unique` (`email`),
  ADD KEY `entreprises_utilisateur_id_foreign` (`utilisateur_id`);

--
-- Indexes for table `entreprise_formation`
--
ALTER TABLE `entreprise_formation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entreprise_formation_formation_id_foreign` (`formation_id`),
  ADD KEY `entreprise_formation_entreprise_id_foreign` (`entreprise_id`);

--
-- Indexes for table `etablissements`
--
ALTER TABLE `etablissements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experience_utilisateur_id_foreign` (`utilisateur_id`),
  ADD KEY `experience_type_experience_id_foreign` (`type_experience_id`);

--
-- Indexes for table `formateurs`
--
ALTER TABLE `formateurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formateurs_utilisateur_id_foreign` (`utilisateur_id`),
  ADD KEY `formateurs_type_formateur_id_foreign` (`type_formateur_id`),
  ADD KEY `formateurs_sous_domaine_id_foreign` (`sous_domaine_id`);

--
-- Indexes for table `formateur_sousdomaine`
--
ALTER TABLE `formateur_sousdomaine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formateur_sousdomaine_formateur_id_foreign` (`formateur_id`),
  ADD KEY `formateur_sousdomaine_sous_domaine_id_foreign` (`sous_domaine_id`);

--
-- Indexes for table `formations`
--
ALTER TABLE `formations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formations_type_formation_id_foreign` (`type_formation_id`),
  ADD KEY `formations_statut_formation_id_foreign` (`statut_formation_id`);

--
-- Indexes for table `formation_formateur`
--
ALTER TABLE `formation_formateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formation_formateur_formation_id_foreign` (`formation_id`),
  ADD KEY `formation_formateur_formateur_id_foreign` (`formateur_id`);

--
-- Indexes for table `formation_theme`
--
ALTER TABLE `formation_theme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formation_theme_formation_id_foreign` (`formation_id`),
  ADD KEY `formation_theme_theme_id_foreign` (`theme_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `niveaux`
--
ALTER TABLE `niveaux`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `securite_question`
--
ALTER TABLE `securite_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sous_domaines`
--
ALTER TABLE `sous_domaines`
  ADD PRIMARY KEY (`code`),
  ADD KEY `sous_domaines_domaine_code_foreign` (`domaine_code`),
  ADD KEY `sous_domaines_axes_id_foreign` (`axes_id`);

--
-- Indexes for table `statut_formations`
--
ALTER TABLE `statut_formations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_formations`
--
ALTER TABLE `theme_formations`
  ADD PRIMARY KEY (`idtheme`),
  ADD KEY `theme_formations_sous_domaine_code_foreign` (`sous_domaine_code`);

--
-- Indexes for table `type_diplomes`
--
ALTER TABLE `type_diplomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_experience`
--
ALTER TABLE `type_experience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_formateurs`
--
ALTER TABLE `type_formateurs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_formations`
--
ALTER TABLE `type_formations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `utilisateurs_email_unique` (`email`),
  ADD UNIQUE KEY `utilisateurs_tel_unique` (`tel`),
  ADD KEY `utilisateurs_role_id_foreign` (`role_id`),
  ADD KEY `utilisateurs_securite_question_id_foreign` (`securite_question_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `axes`
--
ALTER TABLE `axes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `competences`
--
ALTER TABLE `competences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv`
--
ALTER TABLE `cv`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diplomes`
--
ALTER TABLE `diplomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domaines`
--
ALTER TABLE `domaines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `entreprises`
--
ALTER TABLE `entreprises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entreprise_formation`
--
ALTER TABLE `entreprise_formation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `etablissements`
--
ALTER TABLE `etablissements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formateurs`
--
ALTER TABLE `formateurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formateur_sousdomaine`
--
ALTER TABLE `formateur_sousdomaine`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formations`
--
ALTER TABLE `formations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formation_formateur`
--
ALTER TABLE `formation_formateur`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formation_theme`
--
ALTER TABLE `formation_theme`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `niveaux`
--
ALTER TABLE `niveaux`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `securite_question`
--
ALTER TABLE `securite_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statut_formations`
--
ALTER TABLE `statut_formations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_formations`
--
ALTER TABLE `theme_formations`
  MODIFY `idtheme` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_diplomes`
--
ALTER TABLE `type_diplomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `type_experience`
--
ALTER TABLE `type_experience`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `type_formateurs`
--
ALTER TABLE `type_formateurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_formations`
--
ALTER TABLE `type_formations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `competences`
--
ALTER TABLE `competences`
  ADD CONSTRAINT `competences_niveau_id_foreign` FOREIGN KEY (`niveau_id`) REFERENCES `niveaux` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `competences_sous_domaine_id_foreign` FOREIGN KEY (`sous_domaine_id`) REFERENCES `sous_domaines` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `competences_utilisateur_id_foreign` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `cv_formateur_id_foreign` FOREIGN KEY (`formateur_id`) REFERENCES `formateurs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `diplomes`
--
ALTER TABLE `diplomes`
  ADD CONSTRAINT `diplomes_etablissement_id_foreign` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `diplomes_type_diplome_id_foreign` FOREIGN KEY (`type_diplome_id`) REFERENCES `type_diplomes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `diplomes_utilisateur_id_foreign` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entreprises`
--
ALTER TABLE `entreprises`
  ADD CONSTRAINT `entreprises_utilisateur_id_foreign` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entreprise_formation`
--
ALTER TABLE `entreprise_formation`
  ADD CONSTRAINT `entreprise_formation_entreprise_id_foreign` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entreprise_formation_formation_id_foreign` FOREIGN KEY (`formation_id`) REFERENCES `formations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `experience_type_experience_id_foreign` FOREIGN KEY (`type_experience_id`) REFERENCES `type_experience` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `experience_utilisateur_id_foreign` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `formateurs`
--
ALTER TABLE `formateurs`
  ADD CONSTRAINT `formateurs_sous_domaine_id_foreign` FOREIGN KEY (`sous_domaine_id`) REFERENCES `sous_domaines` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `formateurs_type_formateur_id_foreign` FOREIGN KEY (`type_formateur_id`) REFERENCES `type_formateurs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `formateurs_utilisateur_id_foreign` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `formateur_sousdomaine`
--
ALTER TABLE `formateur_sousdomaine`
  ADD CONSTRAINT `formateur_sousdomaine_formateur_id_foreign` FOREIGN KEY (`formateur_id`) REFERENCES `formateurs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `formateur_sousdomaine_sous_domaine_id_foreign` FOREIGN KEY (`sous_domaine_id`) REFERENCES `sous_domaines` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `formations`
--
ALTER TABLE `formations`
  ADD CONSTRAINT `formations_statut_formation_id_foreign` FOREIGN KEY (`statut_formation_id`) REFERENCES `statut_formations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `formations_type_formation_id_foreign` FOREIGN KEY (`type_formation_id`) REFERENCES `type_formations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `formation_formateur`
--
ALTER TABLE `formation_formateur`
  ADD CONSTRAINT `formation_formateur_formateur_id_foreign` FOREIGN KEY (`formateur_id`) REFERENCES `formateurs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `formation_formateur_formation_id_foreign` FOREIGN KEY (`formation_id`) REFERENCES `formations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `formation_theme`
--
ALTER TABLE `formation_theme`
  ADD CONSTRAINT `formation_theme_formation_id_foreign` FOREIGN KEY (`formation_id`) REFERENCES `formations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `formation_theme_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `theme_formations` (`idtheme`) ON DELETE CASCADE;

--
-- Constraints for table `sous_domaines`
--
ALTER TABLE `sous_domaines`
  ADD CONSTRAINT `sous_domaines_axes_id_foreign` FOREIGN KEY (`axes_id`) REFERENCES `axes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sous_domaines_domaine_code_foreign` FOREIGN KEY (`domaine_code`) REFERENCES `domaines` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `theme_formations`
--
ALTER TABLE `theme_formations`
  ADD CONSTRAINT `theme_formations_sous_domaine_code_foreign` FOREIGN KEY (`sous_domaine_code`) REFERENCES `sous_domaines` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `utilisateurs_securite_question_id_foreign` FOREIGN KEY (`securite_question_id`) REFERENCES `securite_question` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
