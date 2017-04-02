CREATE TABLE `actionexpression` (
  `SymbolId` bigint(20) NOT NULL,
  `ExpressionId` bigint(20) NOT NULL,
  KEY `FK_Action_Expression_ExpressionId_idx` (`ExpressionId`),
  CONSTRAINT `FK_Action_Expression_ExpressionId` FOREIGN KEY (`ExpressionId`) REFERENCES `expression` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `category` (
  `Id` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comment` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Content` varchar(500) DEFAULT NULL,
  `UserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_UserId_Comment_UserId` FOREIGN KEY (`Id`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `expression` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Content` varchar(255) DEFAULT NULL,
  `UserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Expression_User_UserId_idx` (`UserId`),
  CONSTRAINT `FK_Expression_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `expressionsymbol` (
  `ExpressionId` bigint(20) NOT NULL,
  `SymbolId` bigint(20) NOT NULL,
  PRIMARY KEY (`ExpressionId`,`SymbolId`),
  KEY `FK_ExpressionSymbols_Symbol_SymbolId_idx` (`SymbolId`),
  CONSTRAINT `FK_ExpressionSymbols_Expression_ExpressionId` FOREIGN KEY (`ExpressionId`) REFERENCES `expression` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ExpressionSymbols_Symbol_SymbolId` FOREIGN KEY (`SymbolId`) REFERENCES `symbol` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `lelproject` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `UserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_LELProject_User_UserId` FOREIGN KEY (`Id`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `lelprojectadmin` (
  `LELProjectId` bigint(20) NOT NULL,
  `UserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`LELProjectId`),
  KEY `FK_User_LELProjectAdmin_UserId_idx` (`UserId`),
  CONSTRAINT `FK_LELProject_LELProjectAdmin_LELProjectId` FOREIGN KEY (`LELProjectId`) REFERENCES `lelproject` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_User_LELProjectAdmin_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `notionexpression` (
  `SymbolId` bigint(20) NOT NULL,
  `ExpressionId` bigint(20) NOT NULL,
  PRIMARY KEY (`SymbolId`,`ExpressionId`),
  KEY `FK_Notion_Expression_ExpressionId_idx` (`ExpressionId`),
  CONSTRAINT `FK_Notion_Expression_ExpressionId` FOREIGN KEY (`ExpressionId`) REFERENCES `expression` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Notion_Symbol_SymbolId` FOREIGN KEY (`SymbolId`) REFERENCES `symbol` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `role` (
  `Id` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `symbol` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CategoryId` varchar(255) DEFAULT NULL,
  `LELProjectId` bigint(20) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `UserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Symbol_CategoryId` (`CategoryId`),
  KEY `IX_Symbol_LELProjectId` (`LELProjectId`),
  KEY `FK_Symbol_User_UserId_idx` (`UserId`),
  CONSTRAINT `FK_Symbol_Category_CategoryId` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`Id`),
  CONSTRAINT `FK_Symbol_LELProject_LELProjectId` FOREIGN KEY (`LELProjectId`) REFERENCES `lelproject` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `synonim` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `SymbolId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Synonim_Symbol_SymbolId_idx` (`SymbolId`),
  CONSTRAINT `FK_Synonim_Symbol_SymbolId` FOREIGN KEY (`SymbolId`) REFERENCES `symbol` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Lastname` varchar(45) DEFAULT NULL,
  `Alias` varchar(45) DEFAULT NULL,
  `RoleId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_User_Role_RoleId_idx` (`RoleId`),
  CONSTRAINT `FK_User_Role_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
