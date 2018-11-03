<?php include('includes/head.php'); ?>
<?php 
$con = mysql_connect("localhost", "root", "") or die ("Sem conexão com o servidor");
$select = mysql_select_db("qrm") or die("Sem acesso ao DB, Entre em contato com o Administrado");
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
					<h2>Cadastro</h2>
					<form action="validacadastro.php" id="cadastro" name="cadastro" method="post">
						<fieldset class="acesso">
							<h3>Acesso</h3>
							<div class="row">
								<div class="col-md-6">
									<label>Email</label>
									<input type="text" name="loginCad" class="loginCad" placeholder="Login">
								</div>
								<div class="col-md-6">
									<label>Senha</label>
									<input type="password" name="senhaCad" class="senhaCad" placeholder="Senha">	
								</div>
							</div>
						</fieldset>								
						<fieldset>
							<h3>Dados Pessoais</h3>
							<div class="row">
								<div class="col-md-12">
									<label>Nome Completo</label>
									<input type="text" name="nomeCad" placeholder="Nome Completo" class="nomeCad">
								</div>
								
								<div class="col-md-6">
									<label>Data de Nascimeto</label>
									<input type="text" name="dataCad" class="dataCad" placeholder="Data de Nascimento">
								</div>
								<div class="col-md-6">
									<label>Sexo</label>
									<select name="sexoCad" class="sexoCad">
										<option value="">Sexo</option>
										<option value="f">Feminino</option>
										<option value="m">Masculino</option>
									</select>
								</div>	
                                <div class="col-md-6">
                                    <label>Telefone</label>
                                    <input type="text" name="telCad" placeholder="Telefone" class="telCad">
                                </div>
                                <div class="col-md-6">
                                    <label>Telefone de recado</label>
                                    <input type="text" name="telRecadoCad" placeholder="Telefone de recado" class="telCad">
                                </div>
								<div class="col-md-12">
									<label>Email</label>
									<input type="email" name="emailCad" class="emailCad" placeholder="Email">
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
										<option value="a">Fudeu</option>
										<option value="b">Muita</option>
										<option value="c">Coisa</option>									
									</select>			
								</div>
                            </div>
                            <input type="hidden" name="tipo" value="2">
						</fieldset>
						<div class="row">
							<div class="col-md-6 col-md-offset-3">
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