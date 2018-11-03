-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03-Nov-2018 às 22:02
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qrm`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alergia`
--

CREATE TABLE `alergia` (
  `idAlergia` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `idAtendimento` int(11) NOT NULL,
  `idSocorrista` int(10) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `data_atendimento` date DEFAULT NULL,
  `hora_atendimento` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `doencas`
--

CREATE TABLE `doencas` (
  `idAlergia` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospital`
--

CREATE TABLE `hospital` (
  `idHospital` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `responsavel_nome` varchar(200) NOT NULL,
  `cnpj` varchar(30) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicamento`
--

CREATE TABLE `medicamento` (
  `idAlergia` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `idPaciente` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `tipo_sanguineo` varchar(6) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idAlergia` int(11) DEFAULT NULL,
  `idMedicamento` int(11) DEFAULT NULL,
  `idDoenca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `socorrista`
--

CREATE TABLE `socorrista` (
  `idSocorrista` int(10) UNSIGNED NOT NULL,
  `idHospital` int(10) UNSIGNED NOT NULL,
  `nome` varchar(200) NOT NULL,
  `rg` varchar(16) NOT NULL,
  `cpf` varchar(16) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `num_telefone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `cep` int(11) DEFAULT NULL,
  `logradouro` varchar(200) DEFAULT NULL,
  `bairro` varchar(200) DEFAULT NULL,
  `cidade` varchar(200) DEFAULT NULL,
  `estado` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alergia`
--
ALTER TABLE `alergia`
  ADD PRIMARY KEY (`idAlergia`);

--
-- Indexes for table `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`idAtendimento`),
  ADD KEY `fk_paciente` (`idPaciente`),
  ADD KEY `fk_socorrista` (`idSocorrista`) USING BTREE;

--
-- Indexes for table `doencas`
--
ALTER TABLE `doencas`
  ADD PRIMARY KEY (`idAlergia`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`idHospital`),
  ADD KEY `idUsuario` (`idUsuario`) USING BTREE;

--
-- Indexes for table `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`idAlergia`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`idPaciente`),
  ADD KEY `idUsuario` (`idUsuario`) USING BTREE;

--
-- Indexes for table `socorrista`
--
ALTER TABLE `socorrista`
  ADD PRIMARY KEY (`idSocorrista`),
  ADD KEY `fk_hospital` (`idHospital`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`idUsuario`,`num_telefone`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `idAtendimento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `idHospital` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paciente`
--
ALTER TABLE `paciente`
  MODIFY `idPaciente` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socorrista`
--
ALTER TABLE `socorrista`
  MODIFY `idSocorrista` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `telefone`
--
ALTER TABLE `telefone`
  MODIFY `idUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `fk_paciente` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`idPaciente`);

--
-- Limitadores para a tabela `socorrista`
--
ALTER TABLE `socorrista`
  ADD CONSTRAINT `fk_hospital` FOREIGN KEY (`idHospital`) REFERENCES `hospital` (`idHospital`);

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `fk_tel_user` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
