-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 16 Okt 2021 pada 08.40
-- Versi server: 5.6.41-84.1
-- Versi PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newchils_health`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ChangeSet`
--

CREATE TABLE `ChangeSet` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Versioned\\ChangeSet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Versioned\\ChangeSet',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` enum('open','published','reverted') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'open',
  `IsInferred` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PublishDate` datetime DEFAULT NULL,
  `LastSynced` datetime DEFAULT NULL,
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ChangeSetItem`
--

CREATE TABLE `ChangeSetItem` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Versioned\\ChangeSetItem') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Versioned\\ChangeSetItem',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `VersionBefore` int(11) NOT NULL DEFAULT '0',
  `VersionAfter` int(11) NOT NULL DEFAULT '0',
  `Added` enum('explicitly','implicitly') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'implicitly',
  `ChangeSetID` int(11) NOT NULL DEFAULT '0',
  `ObjectID` int(11) NOT NULL DEFAULT '0',
  `ObjectClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\SessionManager\\Models\\LoginSession','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','Page','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ChangeSetItem_ReferencedBy`
--

CREATE TABLE `ChangeSetItem_ReferencedBy` (
  `ID` int(11) NOT NULL,
  `ChangeSetItemID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ErrorPage`
--

CREATE TABLE `ErrorPage` (
  `ID` int(11) NOT NULL,
  `ErrorCode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `ErrorPage`
--

INSERT INTO `ErrorPage` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ErrorPage_Live`
--

CREATE TABLE `ErrorPage_Live` (
  `ID` int(11) NOT NULL,
  `ErrorCode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `ErrorPage_Live`
--

INSERT INTO `ErrorPage_Live` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ErrorPage_Versions`
--

CREATE TABLE `ErrorPage_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `ErrorPage_Versions`
--

INSERT INTO `ErrorPage_Versions` (`ID`, `RecordID`, `Version`, `ErrorCode`) VALUES
(1, 4, 1, 404),
(2, 4, 2, 404),
(3, 5, 1, 500),
(4, 5, 2, 500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `File`
--

CREATE TABLE `File` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Assets\\File','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT '0',
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  `FileHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileFilename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileVariant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `FileLink`
--

CREATE TABLE `FileLink` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Assets\\Shortcodes\\FileLink') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\Shortcodes\\FileLink',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `LinkedID` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `ParentClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\SessionManager\\Models\\LoginSession','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','Page','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `File_EditorGroups`
--

CREATE TABLE `File_EditorGroups` (
  `ID` int(11) NOT NULL,
  `FileID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `File_Live`
--

CREATE TABLE `File_Live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Assets\\File','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT '0',
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  `FileHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileFilename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileVariant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `File_Versions`
--

CREATE TABLE `File_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `WasDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `WasDraft` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SilverStripe\\Assets\\File','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  `FileHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileFilename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileVariant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `File_ViewerGroups`
--

CREATE TABLE `File_ViewerGroups` (
  `ID` int(11) NOT NULL,
  `FileID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `Group`
--

CREATE TABLE `Group` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\Group') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\Group',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Locked` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `Group`
--

INSERT INTO `Group` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'SilverStripe\\Security\\Group', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, 0),
(2, 'SilverStripe\\Security\\Group', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Administrators', NULL, 'administrators', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `Group_Members`
--

CREATE TABLE `Group_Members` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `Group_Members`
--

INSERT INTO `Group_Members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `Group_Roles`
--

CREATE TABLE `Group_Roles` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `LoginAttempt`
--

CREATE TABLE `LoginAttempt` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\LoginAttempt') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\LoginAttempt',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailHashed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` enum('Success','Failure') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Success',
  `IP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `LoginAttempt`
--

INSERT INTO `LoginAttempt` (`ID`, `ClassName`, `LastEdited`, `Created`, `Email`, `EmailHashed`, `Status`, `IP`, `MemberID`) VALUES
(1, 'SilverStripe\\Security\\LoginAttempt', '2021-10-16 07:58:37', '2021-10-16 07:58:37', NULL, 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Success', '36.72.214.213', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `LoginSession`
--

CREATE TABLE `LoginSession` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\SessionManager\\Models\\LoginSession') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\SessionManager\\Models\\LoginSession',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `LastAccessed` datetime DEFAULT NULL,
  `IPAddress` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserAgent` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Persistent` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `Member`
--

CREATE TABLE `Member` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\Member') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\Member',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `FirstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TempIDHash` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TempIDExpired` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AutoLoginHash` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `Member`
--

INSERT INTO `Member` (`ID`, `ClassName`, `LastEdited`, `Created`, `FirstName`, `Surname`, `Email`, `TempIDHash`, `TempIDExpired`, `Password`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`) VALUES
(1, 'SilverStripe\\Security\\Member', '2021-10-16 07:58:37', '2021-10-16 07:56:54', 'Default Admin', NULL, 'admin', 'a22780636afa79e81858fffb1cfc858486973a06', '2021-10-19 07:58:37', NULL, NULL, NULL, 'none', NULL, NULL, NULL, 'en_US', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `MemberPassword`
--

CREATE TABLE `MemberPassword` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\MemberPassword') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\MemberPassword',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `MemberPassword`
--

INSERT INTO `MemberPassword` (`ID`, `ClassName`, `LastEdited`, `Created`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`) VALUES
(1, 'SilverStripe\\Security\\MemberPassword', '2021-10-16 07:56:54', '2021-10-16 07:56:54', NULL, NULL, 'none', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `Permission`
--

CREATE TABLE `Permission` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\Permission') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\Permission',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `Permission`
--

INSERT INTO `Permission` (`ID`, `ClassName`, `LastEdited`, `Created`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(1, 'SilverStripe\\Security\\Permission', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'CMS_ACCESS_CMSMain', 0, 1, 1),
(2, 'SilverStripe\\Security\\Permission', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'CMS_ACCESS_AssetAdmin', 0, 1, 1),
(3, 'SilverStripe\\Security\\Permission', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'CMS_ACCESS_ReportAdmin', 0, 1, 1),
(4, 'SilverStripe\\Security\\Permission', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'SITETREE_REORGANISE', 0, 1, 1),
(5, 'SilverStripe\\Security\\Permission', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'ADMIN', 0, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `PermissionRole`
--

CREATE TABLE `PermissionRole` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\PermissionRole') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\PermissionRole',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `PermissionRoleCode`
--

CREATE TABLE `PermissionRoleCode` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\PermissionRoleCode') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\PermissionRoleCode',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `RedirectorPage`
--

CREATE TABLE `RedirectorPage` (
  `ID` int(11) NOT NULL,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `RedirectorPage_Live`
--

CREATE TABLE `RedirectorPage_Live` (
  `ID` int(11) NOT NULL,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `RedirectorPage_Versions`
--

CREATE TABLE `RedirectorPage_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `RememberLoginHash`
--

CREATE TABLE `RememberLoginHash` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\RememberLoginHash') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\RememberLoginHash',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `DeviceID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Hash` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `LoginSessionID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `SiteConfig`
--

CREATE TABLE `SiteConfig` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\SiteConfig\\SiteConfig') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\SiteConfig\\SiteConfig',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tagline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'LoggedInUsers'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `SiteConfig`
--

INSERT INTO `SiteConfig` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Tagline`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`) VALUES
(1, 'SilverStripe\\SiteConfig\\SiteConfig', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Your Site Name', 'your tagline here', 'Anyone', 'LoggedInUsers', 'LoggedInUsers');

-- --------------------------------------------------------

--
-- Struktur dari tabel `SiteConfig_CreateTopLevelGroups`
--

CREATE TABLE `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `SiteConfig_EditorGroups`
--

CREATE TABLE `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `SiteConfig_ViewerGroups`
--

CREATE TABLE `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `SiteTree`
--

CREATE TABLE `SiteTree` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTree','Page','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Page',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `MetaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ExtraMeta` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ReportClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `SiteTree`
--

INSERT INTO `SiteTree` (`ID`, `ClassName`, `LastEdited`, `Created`, `CanViewType`, `CanEditType`, `Version`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `ParentID`) VALUES
(1, 'Page', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 2, 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>.</p><p>You can now access the <a href=\"http://docs.silverstripe.org\">developer documentation</a>, or begin the <a href=\"http://www.silverstripe.org/learn/lessons\">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(2, 'Page', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 2, 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 0),
(3, 'Page', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 2, 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 0),
(4, 'SilverStripe\\ErrorPage\\ErrorPage', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 2, 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 0),
(5, 'SilverStripe\\ErrorPage\\ErrorPage', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 2, 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `SiteTreeLink`
--

CREATE TABLE `SiteTreeLink` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTreeLink') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\CMS\\Model\\SiteTreeLink',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `LinkedID` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `ParentClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\SessionManager\\Models\\LoginSession','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','Page','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `SiteTree_EditorGroups`
--

CREATE TABLE `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `SiteTree_Live`
--

CREATE TABLE `SiteTree_Live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTree','Page','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Page',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `MetaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ExtraMeta` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ReportClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` (`ID`, `ClassName`, `LastEdited`, `Created`, `CanViewType`, `CanEditType`, `Version`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `ParentID`) VALUES
(1, 'Page', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 2, 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>.</p><p>You can now access the <a href=\"http://docs.silverstripe.org\">developer documentation</a>, or begin the <a href=\"http://www.silverstripe.org/learn/lessons\">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(2, 'Page', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 2, 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 0),
(3, 'Page', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 2, 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 0),
(4, 'SilverStripe\\ErrorPage\\ErrorPage', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 2, 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 0),
(5, 'SilverStripe\\ErrorPage\\ErrorPage', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 2, 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `SiteTree_Versions`
--

CREATE TABLE `SiteTree_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `WasDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `WasDraft` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTree','Page','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Page',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `MetaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ExtraMeta` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ReportClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `SiteTree_Versions`
--

INSERT INTO `SiteTree_Versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `WasDeleted`, `WasDraft`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `CanViewType`, `CanEditType`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `ParentID`) VALUES
(1, 1, 1, 0, 0, 1, 0, 0, 'Page', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>.</p><p>You can now access the <a href=\"http://docs.silverstripe.org\">developer documentation</a>, or begin the <a href=\"http://www.silverstripe.org/learn/lessons\">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(2, 1, 2, 1, 0, 1, 0, 0, 'Page', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href=\"admin/\">the CMS</a>.</p><p>You can now access the <a href=\"http://docs.silverstripe.org\">developer documentation</a>, or begin the <a href=\"http://www.silverstripe.org/learn/lessons\">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(3, 2, 1, 0, 0, 1, 0, 0, 'Page', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 0),
(4, 2, 2, 1, 0, 1, 0, 0, 'Page', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 0),
(5, 3, 1, 0, 0, 1, 0, 0, 'Page', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 0),
(6, 3, 2, 1, 0, 1, 0, 0, 'Page', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 0),
(7, 4, 1, 0, 0, 1, 0, 0, 'SilverStripe\\ErrorPage\\ErrorPage', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 0),
(8, 4, 2, 1, 0, 1, 0, 0, 'SilverStripe\\ErrorPage\\ErrorPage', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 0),
(9, 5, 1, 0, 0, 1, 0, 0, 'SilverStripe\\ErrorPage\\ErrorPage', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 0),
(10, 5, 2, 1, 0, 1, 0, 0, 'SilverStripe\\ErrorPage\\ErrorPage', '2021-10-16 07:08:04', '2021-10-16 07:08:04', 'Inherit', 'Inherit', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `SiteTree_ViewerGroups`
--

CREATE TABLE `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `VirtualPage`
--

CREATE TABLE `VirtualPage` (
  `ID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `VirtualPage_Live`
--

CREATE TABLE `VirtualPage_Live` (
  `ID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `VirtualPage_Versions`
--

CREATE TABLE `VirtualPage_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ChangeSet`
--
ALTER TABLE `ChangeSet`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `State` (`State`),
  ADD KEY `ID` (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `PublisherID` (`PublisherID`);

--
-- Indeks untuk tabel `ChangeSetItem`
--
ALTER TABLE `ChangeSetItem`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ObjectUniquePerChangeSet` (`ObjectID`,`ObjectClass`,`ChangeSetID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ChangeSetID` (`ChangeSetID`),
  ADD KEY `Object` (`ObjectID`,`ObjectClass`);

--
-- Indeks untuk tabel `ChangeSetItem_ReferencedBy`
--
ALTER TABLE `ChangeSetItem_ReferencedBy`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ChangeSetItemID` (`ChangeSetItemID`),
  ADD KEY `ChildID` (`ChildID`);

--
-- Indeks untuk tabel `ErrorPage`
--
ALTER TABLE `ErrorPage`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `ErrorPage_Live`
--
ALTER TABLE `ErrorPage_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `ErrorPage_Versions`
--
ALTER TABLE `ErrorPage_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indeks untuk tabel `File`
--
ALTER TABLE `File`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Name` (`Name`(191)),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `FileHash` (`FileHash`(191));

--
-- Indeks untuk tabel `FileLink`
--
ALTER TABLE `FileLink`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `LinkedID` (`LinkedID`),
  ADD KEY `Parent` (`ParentID`,`ParentClass`);

--
-- Indeks untuk tabel `File_EditorGroups`
--
ALTER TABLE `File_EditorGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FileID` (`FileID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indeks untuk tabel `File_Live`
--
ALTER TABLE `File_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Name` (`Name`(191)),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `FileHash` (`FileHash`(191));

--
-- Indeks untuk tabel `File_Versions`
--
ALTER TABLE `File_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `Name` (`Name`(191)),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `FileHash` (`FileHash`(191));

--
-- Indeks untuk tabel `File_ViewerGroups`
--
ALTER TABLE `File_ViewerGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FileID` (`FileID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indeks untuk tabel `Group`
--
ALTER TABLE `Group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`);

--
-- Indeks untuk tabel `Group_Members`
--
ALTER TABLE `Group_Members`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indeks untuk tabel `Group_Roles`
--
ALTER TABLE `Group_Roles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `PermissionRoleID` (`PermissionRoleID`);

--
-- Indeks untuk tabel `LoginAttempt`
--
ALTER TABLE `LoginAttempt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `EmailHashed` (`EmailHashed`(191));

--
-- Indeks untuk tabel `LoginSession`
--
ALTER TABLE `LoginSession`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LastAccessed` (`LastAccessed`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indeks untuk tabel `Member`
--
ALTER TABLE `Member`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Surname` (`Surname`(191)),
  ADD KEY `FirstName` (`FirstName`(191)),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `Email` (`Email`(191));

--
-- Indeks untuk tabel `MemberPassword`
--
ALTER TABLE `MemberPassword`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indeks untuk tabel `Permission`
--
ALTER TABLE `Permission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `Code` (`Code`(191));

--
-- Indeks untuk tabel `PermissionRole`
--
ALTER TABLE `PermissionRole`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Title` (`Title`(191)),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indeks untuk tabel `PermissionRoleCode`
--
ALTER TABLE `PermissionRoleCode`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Indeks untuk tabel `RedirectorPage`
--
ALTER TABLE `RedirectorPage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LinkToID` (`LinkToID`);

--
-- Indeks untuk tabel `RedirectorPage_Live`
--
ALTER TABLE `RedirectorPage_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LinkToID` (`LinkToID`);

--
-- Indeks untuk tabel `RedirectorPage_Versions`
--
ALTER TABLE `RedirectorPage_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `LinkToID` (`LinkToID`);

--
-- Indeks untuk tabel `RememberLoginHash`
--
ALTER TABLE `RememberLoginHash`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `LoginSessionID` (`LoginSessionID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `DeviceID` (`DeviceID`),
  ADD KEY `Hash` (`Hash`);

--
-- Indeks untuk tabel `SiteConfig`
--
ALTER TABLE `SiteConfig`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indeks untuk tabel `SiteConfig_CreateTopLevelGroups`
--
ALTER TABLE `SiteConfig_CreateTopLevelGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indeks untuk tabel `SiteConfig_EditorGroups`
--
ALTER TABLE `SiteConfig_EditorGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indeks untuk tabel `SiteConfig_ViewerGroups`
--
ALTER TABLE `SiteConfig_ViewerGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indeks untuk tabel `SiteTree`
--
ALTER TABLE `SiteTree`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`(191));

--
-- Indeks untuk tabel `SiteTreeLink`
--
ALTER TABLE `SiteTreeLink`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `LinkedID` (`LinkedID`),
  ADD KEY `Parent` (`ParentID`,`ParentClass`);

--
-- Indeks untuk tabel `SiteTree_EditorGroups`
--
ALTER TABLE `SiteTree_EditorGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indeks untuk tabel `SiteTree_Live`
--
ALTER TABLE `SiteTree_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`(191));

--
-- Indeks untuk tabel `SiteTree_Versions`
--
ALTER TABLE `SiteTree_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`(191));

--
-- Indeks untuk tabel `SiteTree_ViewerGroups`
--
ALTER TABLE `SiteTree_ViewerGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indeks untuk tabel `VirtualPage`
--
ALTER TABLE `VirtualPage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- Indeks untuk tabel `VirtualPage_Live`
--
ALTER TABLE `VirtualPage_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- Indeks untuk tabel `VirtualPage_Versions`
--
ALTER TABLE `VirtualPage_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `ChangeSet`
--
ALTER TABLE `ChangeSet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ChangeSetItem`
--
ALTER TABLE `ChangeSetItem`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ChangeSetItem_ReferencedBy`
--
ALTER TABLE `ChangeSetItem_ReferencedBy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ErrorPage`
--
ALTER TABLE `ErrorPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `ErrorPage_Live`
--
ALTER TABLE `ErrorPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `ErrorPage_Versions`
--
ALTER TABLE `ErrorPage_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `File`
--
ALTER TABLE `File`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `FileLink`
--
ALTER TABLE `FileLink`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `File_EditorGroups`
--
ALTER TABLE `File_EditorGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `File_Live`
--
ALTER TABLE `File_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `File_Versions`
--
ALTER TABLE `File_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `File_ViewerGroups`
--
ALTER TABLE `File_ViewerGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `Group`
--
ALTER TABLE `Group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `Group_Members`
--
ALTER TABLE `Group_Members`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `Group_Roles`
--
ALTER TABLE `Group_Roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `LoginAttempt`
--
ALTER TABLE `LoginAttempt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `LoginSession`
--
ALTER TABLE `LoginSession`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `Member`
--
ALTER TABLE `Member`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `MemberPassword`
--
ALTER TABLE `MemberPassword`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `Permission`
--
ALTER TABLE `Permission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `PermissionRole`
--
ALTER TABLE `PermissionRole`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `PermissionRoleCode`
--
ALTER TABLE `PermissionRoleCode`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `RedirectorPage`
--
ALTER TABLE `RedirectorPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `RedirectorPage_Live`
--
ALTER TABLE `RedirectorPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `RedirectorPage_Versions`
--
ALTER TABLE `RedirectorPage_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `RememberLoginHash`
--
ALTER TABLE `RememberLoginHash`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `SiteConfig`
--
ALTER TABLE `SiteConfig`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `SiteConfig_CreateTopLevelGroups`
--
ALTER TABLE `SiteConfig_CreateTopLevelGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `SiteConfig_EditorGroups`
--
ALTER TABLE `SiteConfig_EditorGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `SiteConfig_ViewerGroups`
--
ALTER TABLE `SiteConfig_ViewerGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `SiteTree`
--
ALTER TABLE `SiteTree`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `SiteTreeLink`
--
ALTER TABLE `SiteTreeLink`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `SiteTree_EditorGroups`
--
ALTER TABLE `SiteTree_EditorGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `SiteTree_Live`
--
ALTER TABLE `SiteTree_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `SiteTree_Versions`
--
ALTER TABLE `SiteTree_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `SiteTree_ViewerGroups`
--
ALTER TABLE `SiteTree_ViewerGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `VirtualPage`
--
ALTER TABLE `VirtualPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `VirtualPage_Live`
--
ALTER TABLE `VirtualPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `VirtualPage_Versions`
--
ALTER TABLE `VirtualPage_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
