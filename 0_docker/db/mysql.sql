-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2023 at 01:51 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `idm3project2023`
--
DROP DATABASE IF EXISTS `idm3project2023`;
CREATE DATABASE IF NOT EXISTS `idm3project2023` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `idm3project2023`;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
                           `ProjectID` int(11) NOT NULL,
                           `ProjectName` varchar(50) NOT NULL,
                           `ProjectDescription` varchar(500) NOT NULL,
                           `UserID` int(11) NOT NULL,
                           `Category` varchar(50) NOT NULL,
                           `ProjectDescriptionSummary` varchar(100) NOT NULL,
                           `ProjectImage` varchar(200) NOT NULL,
                           `CreationDate` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`ProjectID`, `ProjectName`, `ProjectDescription`, `UserID`, `Category`, `ProjectDescriptionSummary`, `ProjectImage`, `CreationDate`) VALUES
                                                                                                                                                                (1, 'sea life', 'The oceans are home to some of the most magnificent creatures both great and small, wild and wonderful. Yet human interference is damaging marine ecosystems around the world causing a vast decline in marine life and the health of the oceans. But there are a few inspiring individuals out there who have dedicated their lives to ocean conservation and helping the creatures of the great wild blue. ', 1, 'Digital Media', 'a look at sea life in winter', 'p1sea.jpg', '2023-09-22'),
                                                                                                                                                                (2, 'winter view', 'If you think wintertime is an excuse to put your camera away and stay warm indoors, then you need to read this article! Winter photography can be one of the most rewarding challenges in photography, whether you are interested in landscapes, cityscapes, seascapes, wildlife, or even portraits!\r\n\r\nIn this article, we will cover a variety of tips, ideas, and examples; everything from the technical to the creative! You might be surprised, too–some of these tips go against the conventional wisdom you’', 2, 'Digital Media', 'winter in the lock down', 'p2snow.jpg', '2023-09-23'),
                                                                                                                                                                (3, '3D cartoons', '3D character modeling is a graphic design technique that creates a three-dimensional digital representation of a surface or an object. Artists use specific software, start with a simple shape, and slowly enrich it with more details', 1, 'IT', 'a collection of 3D Disney characters', 'p3disney.jpg', '2023-09-23'),
                                                                                                                                                                (6, 'Man-in-the-Moon', 'What is organic chemistry? Organic chemistry is the field of chemistry over the study of organic substances and compounds – that is, those that contain carbon in their molecular structure, combined with other elements such as hydrogen, nitrogen, oxygen, and sulfur.', 1, 'organic chemistry', 'The Effect of Gamma Rays on Man-in-the-Moon Marigolds', 'p6artshowcase.jpg', '2023-09-23');

-- --------------------------------------------------------

--
-- Table structure for table `projectasset`
--

DROP TABLE IF EXISTS `projectasset`;
CREATE TABLE `projectasset` (
                                `AssetID` int(11) NOT NULL,
                                `ProjectID` int(11) NOT NULL,
                                `AssetName` varchar(50) NOT NULL,
                                `AssetDescription` varchar(500) NOT NULL,
                                `AssetType` varchar(50) NOT NULL,
                                `Asset` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projectasset`
--

INSERT INTO `projectasset` (`AssetID`, `ProjectID`, `AssetName`, `AssetDescription`, `AssetType`, `Asset`) VALUES
                                                                                                               (1, 1, 'underwater', 'an image shot under water', 'IMAGE', 'underthesea123444.png'),
                                                                                                               (2, 1, 'white seal', 'winter white seal bla bla', 'IMAGE', 'whiteseal.jpg'),
                                                                                                               (3, 1, 'sea sounds', 'sound of the sea on a winters night', 'AUDIO', 'winternightatsea.MP3'),
                                                                                                               (4, 2, 'snow on my shoe', 'snow landing on my shoe', 'VIDEO', 'shoe.MP4'),
                                                                                                               (5, 2, 'snow on trees', 'photo of snowy trees', 'IMAGE', 'snowyTrees.jpeg'),
                                                                                                               (6, 3, 'Mickey Mouse', 'mickey mouse contemporary view 3D', 'IMAGE', 'mickey.jpeg'),
                                                                                                               (7, 3, 'Minnie Mouse', 'Minnie Mouse like you have never seen her', 'IMAGE', 'mmouse.jpeg'),
                                                                                                               (8, 3, 'Donald Duck', 'Donald Duck contemporary twist', 'IMAGE', 'dduck.jgeg'),
                                                                                                               (9, 6, 'Earth', 'Paper on Earth ', 'f', 'Earth.doc');

-- --------------------------------------------------------

--
-- Table structure for table `showcase`
--

DROP TABLE IF EXISTS `showcase`;
CREATE TABLE `showcase` (
                            `ShowcaseID` int(11) NOT NULL,
                            `Name` varchar(50) NOT NULL,
                            `Description` varchar(500) NOT NULL,
                            `Image` varchar(200) NOT NULL,
                            `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `showcase`
--

INSERT INTO `showcase` (`ShowcaseID`, `Name`, `Description`, `Image`, `Status`) VALUES
                                                                                    (1, 'Art Showcase', 'a collection of art pieces to celebrate the beauty of winter', 'chemshowcase.jpg', 'PENDING'),
                                                                                    (2, 'bio-pharma showcase', 'A look at bio-pharma in limerick', 'chemshowcase.jpg', 'LIVE'),
                                                                                    (3, 'Sea times', 'a collection of immersive digital pieces to celebrate the beauty of the sea ', 'artshowcase.jpg', 'LIVE'),
                                                                                    (4, 'Politics showcase', 'a collection of 3rd year work.', 'politicshowcase.jpg', 'LIVE'),
                                                                                    (9, 'spring', 'nice spring pictures', 'pictureyellowFish.png', 'PENDING'),
                                                                                    (13, 'lights of limerick', 'nice lights', 'abc.jpg', 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `showcaseproject`
--

DROP TABLE IF EXISTS `showcaseproject`;
CREATE TABLE `showcaseproject` (
                                   `ShowcaseProjectID` int(11) NOT NULL,
                                   `ProjectID` int(11) NOT NULL,
                                   `ShowcaseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `showcaseproject`
--

INSERT INTO `showcaseproject` (`ShowcaseProjectID`, `ProjectID`, `ShowcaseID`) VALUES
                                                                                   (1, 1, 3),
                                                                                   (2, 3, 4),
                                                                                   (3, 2, 4),
                                                                                   (4, 3, 4),
                                                                                   (5, 3, 2),
                                                                                   (6, 1, 1),
                                                                                   (7, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `UserID` int(11) NOT NULL,
                        `FirstName` varchar(50) NOT NULL,
                        `Surname` varchar(50) NOT NULL,
                        `EmailAddress` varchar(100) NOT NULL,
                        `UserType` varchar(50) NOT NULL,
                        `UserName` varchar(50) NOT NULL,
                        `Password` varchar(50) NOT NULL,
                        `Organization` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `FirstName`, `Surname`, `EmailAddress`, `UserType`, `UserName`, `Password`, `Organization`) VALUES
                                                                                                                              (1, 'TRYANxxx', 'Ryanxxxxx', 'TRyan@gmail.comx', 'STUDENT', 'TRYAN', 'pass123', 'litx'),
                                                                                                                              (2, 'Mary', 'Smith', 'MS@homail.com', 'STUDENT', 'MSith', '123pass', ''),
                                                                                                                              (3, 'Peter', 'Carr', 'PC@somebusiness.ie', 'VIEWER', 'PCbus', 'PC123', 'buzz tech - 3d modelling'),
                                                                                                                              (4, 'Elizabeth', 'Bourke', 'Elizabeth.Bourke@TUS.ie', 'Admin', 'EBourke', 'Bourke123', ''),
                                                                                                                              (6, 'Tom', 'Smith', 'xx@jj.com', 'ADMIN', 'tsmith', 'pass123', ''),
                                                                                                                              (7, 'firstName', 'surname', 'emailAddress', 'ADMIN', 'userName', 'password222', ''),
                                                                                                                              (8, 'Elizabeth', 'Bourke', 'Elizabeth_Bourke@hotmail.com', 'ADMIN', 'usernameliz', 'pass2222', 'lit'),
                                                                                                                              (9, 'Elizabeth', 'Bourke', 'Elizabeth_Bourke@hotmail.com', 'VIEWER', 'TRYAN', 'pass2222', 'lit'),
                                                                                                                              (10, 'b', 'b', '123@gmail.com', 'VIEWER', 'b', 'pass2222', 'bbbb'),
                                                                                                                              (11, 'Elizabeth1', 'Elizabeth1', '1Elizabeth_Bourke@hotmail.com', 'VIEWER', 'usernameliz1', 'vv1', 'lit1'),
                                                                                                                              (12, 'c1', 'c1', 'c1', 'VIEWER', 'cc1', 'c1', 'vv1'),
                                                                                                                              (13, 'd', 'd', 'd', 'VIEWER', 'd', 'd', 'ddddd'),
                                                                                                                              (14, 'f', 'f', 'f', 'VIEWER', 'f', 'f', 'fff'),
                                                                                                                              (15, 'g', 'g', 'g', 'VIEWER', 'g', 'g', 'g'),
                                                                                                                              (17, 'b', 'b', 'j', 'VIEWER', 'lizb', 'j', 'ddd'),
                                                                                                                              (18, 'jjjj', 'jj', 'jj', 'VIEWER', 'jjj', 'jjj', 'jjjj'),
                                                                                                                              (19, 'x', 'x', 'xx', 'x', 'x', 'x', ''),
                                                                                                                              (20, 'liz', 'bou', 'x', 'ADMIN', 'x', 'x', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `project`
--
ALTER TABLE `project`
    ADD PRIMARY KEY (`ProjectID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `projectasset`
--
ALTER TABLE `projectasset`
    ADD PRIMARY KEY (`AssetID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `showcase`
--
ALTER TABLE `showcase`
    ADD PRIMARY KEY (`ShowcaseID`);

--
-- Indexes for table `showcaseproject`
--
ALTER TABLE `showcaseproject`
    ADD PRIMARY KEY (`ShowcaseProjectID`),
  ADD KEY `ShowcaseID` (`ShowcaseID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
    MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `projectasset`
--
ALTER TABLE `projectasset`
    MODIFY `AssetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `showcase`
--
ALTER TABLE `showcase`
    MODIFY `ShowcaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `showcaseproject`
--
ALTER TABLE `showcaseproject`
    MODIFY `ShowcaseProjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
    MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `project`
--
ALTER TABLE `project`
    ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `projectasset`
--
ALTER TABLE `projectasset`
    ADD CONSTRAINT `projectasset_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `showcaseproject`
--
ALTER TABLE `showcaseproject`
    ADD CONSTRAINT `showcaseproject_ibfk_1` FOREIGN KEY (`ShowcaseID`) REFERENCES `showcase` (`ShowcaseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `showcaseproject_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;