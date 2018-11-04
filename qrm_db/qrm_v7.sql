-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 04-Nov-2018 às 11:35
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
  `tipo_sanguineo` varchar(6) COLLATE latin1_general_ci NOT NULL,
  `rg` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `cpf` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `data_nascimento` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `sexo` varchar(10) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `paciente`
--

INSERT INTO `paciente` (`idUsuario`, `tipo_sanguineo`, `rg`, `cpf`, `data_nascimento`, `sexo`) VALUES
(10, '', '12.312.657-5', '133.333.332-34', '04/04/2018', 'm'),
(11, '', '12.317.777-7', '133.777.777-77', '05/05/2018', 'm');

-- --------------------------------------------------------

--
-- Estrutura da tabela `socorrista`
--

CREATE TABLE `socorrista` (
  `idUsuario` int(11) NOT NULL,
  `cep` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `logradouro` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `bairro` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `cidade` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `estado` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `rg` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `cpf` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `senha` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` varchar(10) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `idUsuario` int(11) NOT NULL,
  `numero` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `telefone`
--

INSERT INTO `telefone` (`idUsuario`, `numero`) VALUES
(10, '(21) 3333-33333'),
(11, '(21) 3333-33333');

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
  `estado` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `nome` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tipo_usuario` varchar(4) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `email`, `senha`, `cep`, `logradouro`, `bairro`, `cidade`, `estado`, `nome`, `tipo_usuario`) VALUES
(6, 'teste1234@teste.com', '1234567', '21221-312', 'Avenida', 'CENTRO', 'MT', 'a', '', '2'),
(10, 'teste12345@teste.com', '1234567', '21221-312', 'Avenida', 'CENTRO', 'MT', 'a', '', '2'),
(11, 'teste123456@teste.com', '1234567', '21221-312', 'Avenida', 'CENTRO', 'MT', 'a', 'Marcello vasconcelos ferreira', '2');

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
  ADD UNIQUE KEY `rg` (`rg`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Indexes for table `socorrista`
--
ALTER TABLE `socorrista`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `rg` (`rg`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`idUsuario`,`numero`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `email` (`email`);

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
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
  ADD CONSTRAINT `fk_pac_usu` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `socorrista`
--
ALTER TABLE `socorrista`
  ADD CONSTRAINT `socorrista_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
