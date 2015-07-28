SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `actividad`
-- ----------------------------
DROP TABLE IF EXISTS `actividad`;
CREATE TABLE `actividad` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `ResponsableUsuario` int(10) DEFAULT NULL,
  `ResponsableCliente` int(10) DEFAULT NULL,
  `FechaVencimiento` datetime NOT NULL,
  `FechaCreacion` datetime NOT NULL,
  `Usuario` int(10) NOT NULL,
  `DescripcionCierre` varchar(255) DEFAULT NULL,
  `Estado` int(10) NOT NULL,
  `TipoActividad` int(10) NOT NULL,
  `Oportunidad` int(10) NOT NULL,
  `Documento` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `responsableUsuarioFK` (`ResponsableUsuario`),
  KEY `responsableClienteFK` (`ResponsableCliente`),
  KEY `estadoFK` (`Estado`),
  KEY `tipoActividadFK` (`TipoActividad`),
  KEY `oportunidadFK` (`Oportunidad`),
  KEY `usuarioAct_fk` (`Usuario`),
  KEY `documentoAct_fk` (`Documento`),
  CONSTRAINT `documentoAct_fk` FOREIGN KEY (`Documento`) REFERENCES `documento` (`ID`),
  CONSTRAINT `estadoFK` FOREIGN KEY (`Estado`) REFERENCES `estado` (`Id`),
  CONSTRAINT `oportunidadFK` FOREIGN KEY (`Oportunidad`) REFERENCES `oportunidad` (`ID`),
  CONSTRAINT `responsableClienteFK` FOREIGN KEY (`ResponsableCliente`) REFERENCES `contacto` (`ID`),
  CONSTRAINT `responsableUsuarioFK` FOREIGN KEY (`ResponsableUsuario`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `tipoActividadFK` FOREIGN KEY (`TipoActividad`) REFERENCES `tipoactividad` (`ID`),
  CONSTRAINT `usuarioAct_fk` FOREIGN KEY (`Usuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `contacto`
-- ----------------------------
DROP TABLE IF EXISTS `contacto`;
CREATE TABLE `contacto` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  `Apellido` varchar(150) NOT NULL,
  `Cargo` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Celular` varchar(11) DEFAULT NULL,
  `Chat` varchar(50) DEFAULT NULL,
  `Comentarios` varchar(255) DEFAULT NULL,
  `Empresa` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `EMPRESA` (`Empresa`),
  CONSTRAINT `empresa_fk` FOREIGN KEY (`EMPRESA`) REFERENCES `empresa` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `documento`
-- ----------------------------
DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Oportunidad` int(10) DEFAULT NULL,
  `Ruta` varchar(200) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `Tamano` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `oportunidad_doc_fk` (`Oportunidad`),
  CONSTRAINT `oportunidad_doc_fk` FOREIGN KEY (`Oportunidad`) REFERENCES `oportunidad` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of documento
-- ----------------------------
INSERT INTO `documento` VALUES ('9', 'presentacionPlantilla', null, 'C:/argosPlanning/plantillas/presentacionPlantilla.ppt', 'ppt', '900096');
INSERT INTO `documento` VALUES ('11', 'minutaPlantilla', null, 'C:/argosPlanning/plantillas/minutaPlantilla.doc', 'doc', '34304');
INSERT INTO `documento` VALUES ('12', 'propuestaPlantilla', null, 'C:/argosPlanning/plantillas/propuestaPlantilla.ppt', 'ppt', '1555968');
COMMIT;
-- ----------------------------
-- Table structure for `empresa`
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `RUT` decimal(15,0) DEFAULT NULL,
  `Rubro` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `estado`
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Estado_Nombre` (`Nombre`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estado
-- ----------------------------
INSERT INTO `estado` VALUES ('1', 'Abierta', null);
INSERT INTO `estado` VALUES ('2', 'Cerrada', null);
INSERT INTO `estado` VALUES ('3', 'Cancelada', null);
COMMIT;
-- ----------------------------
-- Table structure for `oportunidad`
-- ----------------------------
DROP TABLE IF EXISTS `oportunidad`;
CREATE TABLE `oportunidad` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CodigoInterno` varchar(10) DEFAULT NULL,
  `Empresa` int(10) NOT NULL,
  `Usuario` int(10) NOT NULL,
  `Contacto` int(10) NOT NULL,
  `Titulo` varchar(70) NOT NULL,
  `TipoProyecto` int(10) NOT NULL,
  `Tecnologia` int(10) NOT NULL,
  `DescripcionCierre` varchar(255) DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Estado` int(10) NOT NULL,
  `Documento` int(10) DEFAULT NULL,
  `FechaCierre` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `estado_fk` (`Estado`),
  KEY `usuario_fk` (`Usuario`),
  KEY `tipoProyecto_fk` (`TipoProyecto`),
  KEY `empresafk` (`Empresa`),
  KEY `tecnologia_fk` (`Tecnologia`),
  KEY `documento_fk` (`Documento`),
  KEY `contacto_fk` (`Contacto`),
  CONSTRAINT `contacto_fk` FOREIGN KEY (`Contacto`) REFERENCES `contacto` (`ID`),
  CONSTRAINT `documento_fk` FOREIGN KEY (`Documento`) REFERENCES `documento` (`ID`),
  CONSTRAINT `estado_fk` FOREIGN KEY (`Estado`) REFERENCES `estado` (`Id`),
  CONSTRAINT `tecnologia_fk` FOREIGN KEY (`Tecnologia`) REFERENCES `tecnologia` (`Id`),
  CONSTRAINT `tipoProyecto_fk` FOREIGN KEY (`TipoProyecto`) REFERENCES `tipoproyecto` (`Id`),
  CONSTRAINT `usuario_fk` FOREIGN KEY (`Usuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `rol`
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES ('1', 'Admin');
COMMIT;
-- ----------------------------
-- Table structure for `seguimiento`
-- ----------------------------
DROP TABLE IF EXISTS `seguimiento`;
CREATE TABLE `seguimiento` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `UsuarioCreador` int(10) NOT NULL,
  `FechaVencimiento` datetime NOT NULL,
  `FechaAnuncio` datetime NOT NULL,
  `Actividad` int(10) NOT NULL,
  `Enviado` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `usuario_creador_fk` (`UsuarioCreador`),
  KEY `actividadFK` (`Actividad`),
  CONSTRAINT `actividadFK` FOREIGN KEY (`Actividad`) REFERENCES `actividad` (`ID`),
  CONSTRAINT `usuario_creador_fk` FOREIGN KEY (`UsuarioCreador`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `seguimientotiposeguimiento`
-- ----------------------------
DROP TABLE IF EXISTS `seguimientotiposeguimiento`;
CREATE TABLE `seguimientotiposeguimiento` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Seguimiento` int(10) NOT NULL,
  `TipoSeguimiento` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `seguimiento_fk` (`Seguimiento`),
  KEY `tipoSeguimiento_fk` (`TipoSeguimiento`),
  CONSTRAINT `seguimiento_fk` FOREIGN KEY (`Seguimiento`) REFERENCES `seguimiento` (`ID`),
  CONSTRAINT `tipoSeguimiento_fk` FOREIGN KEY (`TipoSeguimiento`) REFERENCES `tiposeguimiento` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `seguimientousuario`
-- ----------------------------
DROP TABLE IF EXISTS `seguimientousuario`;
CREATE TABLE `seguimientousuario` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Seguimiento` int(10) NOT NULL,
  `Usuario` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `seguimiento_usu_fk` (`Usuario`),
  KEY `usuario_seg_fk` (`Seguimiento`),
  CONSTRAINT `seguimiento_usu_fk` FOREIGN KEY (`Usuario`) REFERENCES `seguimiento` (`ID`),
  CONSTRAINT `usuario_seg_fk` FOREIGN KEY (`Seguimiento`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for `tecnologia`
-- ----------------------------
DROP TABLE IF EXISTS `tecnologia`;
CREATE TABLE `tecnologia` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Tecnologia_Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tecnologia
-- ----------------------------
INSERT INTO `tecnologia` VALUES ('1', 'Java', null);
INSERT INTO `tecnologia` VALUES ('2', 'Android', null);
INSERT INTO `tecnologia` VALUES ('3', 'Iphone', null);
INSERT INTO `tecnologia` VALUES ('4', 'Flash', null);
INSERT INTO `tecnologia` VALUES ('5', 'C++', null);
COMMIT;
-- ----------------------------
-- Table structure for `tipoactividad`
-- ----------------------------
DROP TABLE IF EXISTS `tipoactividad`;
CREATE TABLE `tipoactividad` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Tipo_Actividad_Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipoactividad
-- ----------------------------
INSERT INTO `tipoactividad` VALUES ('1', 'LLamada', null);
INSERT INTO `tipoactividad` VALUES ('2', 'Reunion', null);
INSERT INTO `tipoactividad` VALUES ('3', 'Conferencia', null);
INSERT INTO `tipoactividad` VALUES ('4', 'Propuesta', null);
INSERT INTO `tipoactividad` VALUES ('5', 'Cotizacion', null);
INSERT INTO `tipoactividad` VALUES ('6', 'Respuesta RFP', null);
INSERT INTO `tipoactividad` VALUES ('7', 'Agendar Reunion', null);
INSERT INTO `tipoactividad` VALUES ('8', 'Analisis', null);
INSERT INTO `tipoactividad` VALUES ('9', 'Presentacion', null);
COMMIT;
-- ----------------------------
-- Table structure for `tipoproyecto`
-- ----------------------------
DROP TABLE IF EXISTS `tipoproyecto`;
CREATE TABLE `tipoproyecto` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(70) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_TipoProyecto_Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tipoproyecto
-- ----------------------------
INSERT INTO `tipoproyecto` VALUES ('1', 'Web', null);
INSERT INTO `tipoproyecto` VALUES ('2', 'Desktop', null);
INSERT INTO `tipoproyecto` VALUES ('3', 'Movil', null);
COMMIT;
-- ----------------------------
-- Table structure for `tiposeguimiento`
-- ----------------------------
DROP TABLE IF EXISTS `tiposeguimiento`;
CREATE TABLE `tiposeguimiento` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_TipoSeguimiento_NOMBRE` (`NOMBRE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tiposeguimiento
-- ----------------------------
INSERT INTO `tiposeguimiento` VALUES ('1', 'Email', null);
INSERT INTO `tiposeguimiento` VALUES ('2', 'SMS', null);
COMMIT;
-- ----------------------------
-- Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(40) NOT NULL,
  `Nick` varchar(10) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Celular` decimal(10,0) DEFAULT NULL,
  `Cargo` varchar(50) NOT NULL,
  `Contrasena` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Usuario_Nick` (`Nick`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'Valentina', 'avalers', 'sua', '22', 'valentina.avalers@gmail.com', '94239382', 'jefe', '123');
COMMIT;
-- ----------------------------
-- Table structure for `usuariorol`
-- ----------------------------
DROP TABLE IF EXISTS `usuariorol`;
CREATE TABLE `usuariorol` (
  `usuario` int(10) NOT NULL,
  `rol` int(110) NOT NULL,
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `rol` (`rol`),
  KEY `usuario_rol_fk` (`usuario`),
  CONSTRAINT `rol_fk` FOREIGN KEY (`rol`) REFERENCES `rol` (`ID`),
  CONSTRAINT `usuario_rol_fk` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuariorol
-- ----------------------------
INSERT INTO `usuariorol` VALUES ('1', '1', '2');
INSERT INTO `usuariorol` VALUES ('1', '2', '3');
COMMIT;
