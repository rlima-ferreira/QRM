-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 04-Nov-2018 às 03:17
-- Versão do servidor: 10.1.36-MariaDB
-- versão do PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
  `nome` varchar(100) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `idAtendimento` int(10) UNSIGNED NOT NULL,
  `idSocorrista` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `data_atendimento` date DEFAULT NULL,
  `hora_atendimento` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `doenca`
--

CREATE TABLE `doenca` (
  `idDoenca` int(11) NOT NULL,
  `nome` varchar(100) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospital`
--

CREATE TABLE `hospital` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `cep` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `logradouro` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `bairro` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `cidade` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `estado` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `responsavel_nome` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `senha` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `cnpj` varchar(20) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospital_possui_socorrista`
--

CREATE TABLE `hospital_possui_socorrista` (
  `idHospital_possui_socorrista` int(11) NOT NULL,
  `idSocorrista` int(11) DEFAULT NULL,
  `idHospital` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medicamento`
--

CREATE TABLE `medicamento` (
  `idMedicamento` int(11) NOT NULL,
  `nome` varchar(100) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `telefone` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `contato_familiar` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `tipo_sanguineo` varchar(6) COLLATE latin1_general_ci NOT NULL,
  `rg` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `cpf` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `socorrista`
--

CREATE TABLE `socorrista` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `telefone` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `cep` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `logradouro` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `bairro` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `cidade` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `estado` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `rg` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `cpf` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `senha` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `email` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `senha` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `cep` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `logradouro` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `bairro` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `cidade` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `estado` varchar(100) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alergia`
--
ALTER TABLE `alergia`
  ADD PRIMARY KEY (`idAlergia`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indexes for table `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`idAtendimento`),
  ADD KEY `idSocorrista` (`idSocorrista`),
  ADD KEY `idPaciente` (`idPaciente`);

--
-- Indexes for table `doenca`
--
ALTER TABLE `doenca`
  ADD PRIMARY KEY (`idDoenca`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `senha` (`senha`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Indexes for table `hospital_possui_socorrista`
--
ALTER TABLE `hospital_possui_socorrista`
  ADD PRIMARY KEY (`idHospital_possui_socorrista`),
  ADD KEY `idSocorrista` (`idSocorrista`),
  ADD KEY `idHospital` (`idHospital`);

--
-- Indexes for table `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`idMedicamento`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `rg` (`rg`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Indexes for table `socorrista`
--
ALTER TABLE `socorrista`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `rg` (`rg`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `senha` (`senha`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `senha` (`senha`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alergia`
--
ALTER TABLE `alergia`
  MODIFY `idAlergia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `idAtendimento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doenca`
--
ALTER TABLE `doenca`
  MODIFY `idDoenca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital_possui_socorrista`
--
ALTER TABLE `hospital_possui_socorrista`
  MODIFY `idHospital_possui_socorrista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `idMedicamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socorrista`
--
ALTER TABLE `socorrista`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `alergia`
--
ALTER TABLE `alergia`
  ADD CONSTRAINT `alergia_ibfk_1` FOREIGN KEY (`idAlergia`) REFERENCES `paciente` (`idUsuario`);

--
-- Limitadores para a tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `atendimento_ibfk_1` FOREIGN KEY (`idSocorrista`) REFERENCES `socorrista` (`idUsuario`),
  ADD CONSTRAINT `atendimento_ibfk_2` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`idUsuario`);

--
-- Limitadores para a tabela `doenca`
--
ALTER TABLE `doenca`
  ADD CONSTRAINT `doenca_ibfk_1` FOREIGN KEY (`idDoenca`) REFERENCES `paciente` (`idUsuario`);

--
-- Limitadores para a tabela `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `hospital_possui_socorrista`
--
ALTER TABLE `hospital_possui_socorrista`
  ADD CONSTRAINT `hospital_possui_socorrista_ibfk_1` FOREIGN KEY (`idSocorrista`) REFERENCES `socorrista` (`idUsuario`),
  ADD CONSTRAINT `hospital_possui_socorrista_ibfk_2` FOREIGN KEY (`idHospital`) REFERENCES `hospital` (`idUsuario`);

--
-- Limitadores para a tabela `medicamento`
--
ALTER TABLE `medicamento`
  ADD CONSTRAINT `medicamento_ibfk_1` FOREIGN KEY (`idMedicamento`) REFERENCES `paciente` (`idUsuario`);

--
-- Limitadores para a tabela `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `socorrista`
--
ALTER TABLE `socorrista`
  ADD CONSTRAINT `socorrista_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
