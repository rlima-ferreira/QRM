<?php 

$senha = $_POST['senhaCad'];
$tipo = $_POST['tipo'];
$nome = $_POST['nomeCad'];
$data = $_POST['dataCad'];
$sexo = $_POST['sexoCad'];
$tel2 = isset($_POST['telRecadoCad']);
$email = strtolower($_POST['emailCad']);
$logradouro = $_POST['logradouroCad'];
$cep = $_POST['cepCad'];
$bairro = $_POST['bairroCad'];
$compl = $_POST['complCad'];
$cidade = $_POST['cidade'];
$estado = $_POST['estado'];
$cpf = $_POST['cpfCad'];
$rg = $_POST['rgCad'];

switch($tipo){
    case 0:
        $tipoSwitch = 'hospital';
        break;
    case 1:
        $tipoSwitch = 'socorrista';
        break;
    case 2:
        $tipoSwitch = 'paciente';
        break;
}

$con = mysql_connect("localhost", "root", "") or die ("Sem conexão com o servidor");
$select = mysql_select_db("qrm") or die("Sem acesso ao DB, Entre em contato com o Administrado");

$compl = mysql_real_escape_string($compl,$con);
$resultUsu = mysql_query("INSERT INTO usuario (senha, email, tipo_usuario, cep, logradouro, bairro, cidade, estado, nome) VALUES ('$senha', '$email', '$tipo','$cep','$logradouro','$bairro','$cidade','$estado', '$nome' )") or die (mysql_error()); 

$resultPaciente = mysql_query("INSERT INTO $tipoSwitch (idUsuario, rg, cpf, data_nascimento, sexo) VALUES ((SELECT idUsuario FROM usuario where email = '$email'),'$rg','$cpf','$data','$sexo')") or die (mysql_error());
if($tel2){
    $tel = $_POST['telRecadoCad'];
    $resultTel = mysql_query("INSERT INTO telefone VALUES((SELECT idUsuario FROM usuario where email = '$email'),'$tel')") or die(mysql_error());
}

session_start();

$_SESSION['email'] = $email;
$_SESSION['senha'] = $senha;
$_SESSION['tipo'] = $tipo;

header("location: painel.php");