<?php 

$senha = $_POST['senhaCad'];
$tipo = $_POST['tipo'];
$nome = $_POST['nomeCad'];
$data = $_POST['dataCad'];
$sexo = $_POST['sexoCad'];
$tel = $_POST['telCad'];
$tel2 = isset($_POST['telRecadoCad']);
$email = $_POST['emailCad'];
$logradouro = $_POST['logradouroCad'];
$cep = $_POST['cepCad'];
$bairro = $_POST['bairroCad'];
$compl = $_POST['complCad'];
$cidade = $_POST['cidade'];
$estado = $_POST['estado'];


$con = mysql_connect("localhost", "root", "") or die ("Sem conexão com o servidor");
$select = mysql_select_db("qrm") or die("Sem acesso ao DB, Entre em contato com o Administrado");

$compl = mysql_real_escape_string($compl,$con);
$resultUsu = mysql_query("INSERT INTO usuario (senha, email, tipo, cep, logradouro, bairro, cidade, estado) VALUES ('$senha', '$email', '$tipo','$cep','$logradouro','$bairro','$cidade','$estado' )") or die (mysql_error()); 
 
$resultTel1 = mysql_query("INSERT INTO telefone VALUES('$tel',(SELECT idUsuario FROM usuario where login = '$email'))") or die(mysql_error());

if ($tel2) {
	$tel2 = $_POST['telRecadoCad2'];
	$resultTel2 = mysql_query("INSERT INTO telefone VALUES('$tel2',(SELECT idUsuario FROM usuario where login = '$email'))") or die(mysql_error());
}

session_start();

$_SESSION['email'] = $email;
$_SESSION['senha'] = $senha;
$_SESSION['tipo'] = $tipo;

header("location: painel.php");