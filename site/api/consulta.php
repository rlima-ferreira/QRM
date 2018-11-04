<?php 

// as variáveis login e senha recebem os dados digitados na página anterior
$login = $_POST['email'];
$senha = $_POST['senha'];
//$token = $_POST['token'];


// as próximas 3 linhas são responsáveis em se conectar com o bando de dados.
$con = mysql_connect("127.0.0.1", "root", "") or die ("Sem conexão com o servidor");
$select = mysql_select_db("qrm") or die("Sem acesso ao DB, Entre em contato com o Administrado");

// A variavel $result pega as varias $login e $senha, faz uma pesquisa na tabela de usuarios
$result = mysql_query("SELECT * FROM `usuario` WHERE `email` = '$email' AND `senha`= '$senha'");

if(mysql_num_rows ($result) > 0 )
{
    $consulta
	$teste = mysql_fetch_array($consulta);
	echo "<pre>";
	print_r($teste);
	echo "</pre>";
} else {
    echo "n"
}