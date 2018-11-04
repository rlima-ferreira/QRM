<?php 
session_start();
if(!isset($_SESSION['email'])){
 	header("location: index.php");
 }
 ?>

<?php include('includes/head.php'); ?>
<?php 
$con = mysql_connect("localhost", "root", "") or die ("Sem conexão com o servidor");
$select = mysql_select_db("qrm") or die("Sem acesso ao DB, Entre em contato com o Administrado");
 $emailSession =  $_SESSION['email'];
 $tipoTeste = mysql_query("SELECT tipo_usuario from usuario where email='$emailSession'");

$tipoSwitch = '';
while($array = mysql_fetch_array($tipoTeste)){	
 	switch($array['tipo_usuario']){
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
}
 ?>
<body class="blue">
	<main id="cadastro">
		<div class="container">
			<div class="col-xs-12 col-md-12 logo">
				<h1><span>QR</span> Medical</h1>
			</div>
			<div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
				<div class="">
					<div class="blocoAcc">
					<h2>Painel</h2>
					<form action="validacadastro.php" id="cadastro" name="cadastro" method="post">
						<fieldset class="acesso">
							<h3>Acesso</h3>
							<div class="row">
							<?php $consultaUsu1 = mysql_query("SELECT * FROM usuario where email = '$emailSession'") or die(mysql_error()); ?>
								<?php while($row = mysql_fetch_array($consultaUsu1)):?>
								<div class="col-md-6">
									<label>Email</label>
									<input type="text" name="emailCad" class="emailCad" value="<?php echo $row['email']; ?>">
								</div>
								<div class="col-md-6">
									<label>Senha</label>
									<input type="password" name="senhaCad" class="senhaCad" value="******">	
								</div>
								
							</div>
						</fieldset>								
						<fieldset>
							<h3>Dados Pessoais</h3>
							<div class="row">
								<div class="col-md-12">
									<label>Nome Completo</label>
									<input type="text" name="nomeCad"value=" <?php echo $row['nome']; ?>" class="nomeCad">
								</div>
								<?php endwhile; ?>
								<?php $consultaUsuEspc1 = mysql_query("SELECT * FROM $tipoSwitch as t inner join usuario as u on t.idUsuario = u.idUsuario where u.email = '$emailSession'") or die(mysql_error()); ?>
								<?php while($row = mysql_fetch_array($consultaUsuEspc1)):?>
                                <div class="col-md-6">
                                    <label>CPF</label>
                                    <input type="text" name="cpfCad" placeholder="CPF" class="cpfCad" value="<?php echo $row['cpf']; ?>">
                                </div>
                                <div class="col-md-6">
                                    <label>RG</label>
                                    <input type="text" name="rgCad" class="rgCad" value="<?php echo $row['rg']; ?>">
								</div>
                                <div class="col-md-6">
									<label>Data de Nascimeto</label>
									<input type="text" name="dataCad" class="dataCad" value="<?php echo $row['data_nascimento']; ?>">
								</div>
								<div class="col-md-6">
									<label>Sexo</label>
									<select name="sexoCad" class="sexoCad">
										<option value="" <?php echo $row['sexo'] == '' ? "selected" : ""  ?>>Sexo</option>
										<option value="f" <?php echo $row['sexo'] == 'f' ? "selected" : ""  ?>>Feminino</option>
										<option value="m" <?php echo $row['sexo'] == 'm' ? "selected" : ""  ?> >Masculino</option>
									</select>
								</div>
								<?php endwhile; ?>	
                                <div class="col-md-6">
                                    <label>Telefone de recado</label>
                                    <input type="text" name="telRecadoCad" placeholder="Telefone de recado" class="telCad">
                                </div>
							</div>						
						</fieldset>
						<fieldset>
							<h3>Endereço</h3>
							<div class="row">
								<div class="col-md-4">
									<label>Logradouro</label>
									<select name="logradouroCad" class="logradouroCad">
										<option>Rua</option>
										<option>Avenida</option>
										<option>Travessa</option>
										<option>Estrada</option>
									</select>
								</div>
								<div class="col-md-8">
									<label>Endereço</label>
									<input type="text" name="endCad" class="endCad" placeholder="Endereço">					
								</div>
								<div class="col-md-6">
									<label>CEP</label>
									<input type="text" name="cepCad" class="cepCad" placeholder="CEP">					
								</div>
								<div class="col-md-6">
									<label>Bairro</label>
									<input type="text" name="bairroCad" class="bairroCad" placeholder="Bairro">
								</div>
								<div class="col-md-12">
									<label>complemento</label>
									<input type="text" name="complCad" class="complCad" placeholder="complemento">			
								</div>
								<div class="col-md-6">
									<label>Cidade</label>
									<select name="cidade">
										<option value="">Cidade</option>
										<option value="AC">Acre</option>
										<option value="AP">Amapá</option>
										<option value="BA">Bahia</option>
										<option value="DF">Distrito Federal</option>
										<option value="MT">Mato Grosso</option>
										<option value="MG">Minas Gerais</option>
										<option value="PB">Paraíba</option>
										<option value="PE">Pernambuco</option>									
									</select>			
								</div>
								<div class="col-md-6">
									<label>Estado</label>
									<select name="estado">
										<option value="">Estado</option>
										<option value="a">Rio de Janeiro</option>
										<option value="b">São Pauo</option>									
									</select>			
								</div>
                            </div>
                            <input type="hidden" name="tipo" value="<?php echo $tipoSwitch ?>">
						</fieldset>
						<fieldset>
							<h3>Informações Medicas</h3>
							<div class="row">
								<div class="col-md-6">
									<select name="tipoSangue" id="tipoSangue">
										<option value="">Tipo Sanguíneo</option>
										<option value="a">A</option>
										<option value="b">B</option>
										<option value="ab">AB</option>
										<option value="o">O</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<input type="text" name="alergia" placeholder="Alergia" class="alergia">
								</div>
								<div class="col-sm-12">
									<button>Adicionar mais</button>
								</div>
							</div>
						</fieldset>
						<div class="row">
							<div class="col-sm-8 col-md-6 col-md-offset-3">
								<input type="button" name="enviaCad" id="enviaCad" value="Cadastrar" >
							</div>							
						</div>
					</form>			
					</div>
				</div>			
			</div>
		</div>
	</main>
</body>
</html>