-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 25 août 2022 à 06:35
-- Version du serveur : 10.4.19-MariaDB
-- Version de PHP : 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ChatBD_BeOpenIT`
--

-- --------------------------------------------------------

--
-- Structure de la table `Chat_history`
--

CREATE TABLE `Chat_history` (
  `idChat_history` int(11) NOT NULL,
  `historyTime` varchar(50) NOT NULL,
  `historyDescription` varchar(100) NOT NULL,
  `history_userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Group_chat`
--

CREATE TABLE `Group_chat` (
  `idGroupChat` int(11) NOT NULL,
  `groupChat_history` varchar(50) NOT NULL,
  `groupChat_type` varchar(50) NOT NULL,
  `groupChat_description` varchar(100) NOT NULL,
  `groupChat_userId` int(11) NOT NULL,
  `groupChat_time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Individual_chat`
--

CREATE TABLE `Individual_chat` (
  `id_IndividualChat` int(11) NOT NULL,
  `individualChat_type` varchar(50) NOT NULL,
  `individualChat_history` varchar(50) NOT NULL,
  `individualChat_description` varchar(100) NOT NULL,
  `individualChat_userId` int(11) NOT NULL,
  `individualChat_time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Message`
--

CREATE TABLE `Message` (
  `idMessage` int(11) NOT NULL,
  `messageType` varchar(50) NOT NULL,
  `messageTitle` varchar(50) NOT NULL,
  `messageDescription` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Role`
--

CREATE TABLE `Role` (
  `roleId` int(11) NOT NULL,
  `roleTitle` varchar(50) NOT NULL,
  `roleDescription` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userPassword` varchar(50) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userPhone` varchar(30) NOT NULL,
  `user_roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Chat_history`
--
ALTER TABLE `Chat_history`
  ADD PRIMARY KEY (`idChat_history`),
  ADD KEY `history_userId` (`history_userId`);

--
-- Index pour la table `Group_chat`
--
ALTER TABLE `Group_chat`
  ADD PRIMARY KEY (`idGroupChat`),
  ADD KEY `Group_chat_ibfk_1` (`groupChat_userId`);

--
-- Index pour la table `Individual_chat`
--
ALTER TABLE `Individual_chat`
  ADD PRIMARY KEY (`id_IndividualChat`),
  ADD UNIQUE KEY `individualChat_userId` (`individualChat_userId`);

--
-- Index pour la table `Message`
--
ALTER TABLE `Message`
  ADD PRIMARY KEY (`idMessage`);

--
-- Index pour la table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`roleId`);

--
-- Index pour la table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_roleId` (`user_roleId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Chat_history`
--
ALTER TABLE `Chat_history`
  MODIFY `idChat_history` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Group_chat`
--
ALTER TABLE `Group_chat`
  MODIFY `idGroupChat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Individual_chat`
--
ALTER TABLE `Individual_chat`
  MODIFY `id_IndividualChat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Message`
--
ALTER TABLE `Message`
  MODIFY `idMessage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Role`
--
ALTER TABLE `Role`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Chat_history`
--
ALTER TABLE `Chat_history`
  ADD CONSTRAINT `Chat_history_ibfk_1` FOREIGN KEY (`history_userId`) REFERENCES `User` (`id`);

--
-- Contraintes pour la table `Group_chat`
--
ALTER TABLE `Group_chat`
  ADD CONSTRAINT `Group_chat_ibfk_1` FOREIGN KEY (`groupChat_userId`) REFERENCES `User` (`id`);

--
-- Contraintes pour la table `Individual_chat`
--
ALTER TABLE `Individual_chat`
  ADD CONSTRAINT `Individual_chat_ibfk_1` FOREIGN KEY (`individualChat_userId`) REFERENCES `User` (`id`);

--
-- Contraintes pour la table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `User_ibfk_1` FOREIGN KEY (`user_roleId`) REFERENCES `Role` (`roleId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
