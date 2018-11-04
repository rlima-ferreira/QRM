<?php include('includes/head.php'); ?>
<body>
	<main id="home">
		<div class="container">
			<div class="col-sm-4 col-sm-offset-4 logo">
				<h1><span>QR</span> Medical</h1>
			</div>
			<div class="col-sm-4 col-sm-offset-4">
				<div class="blocoAcc">
					<form action="valida.php" method="post">			
						<fieldset>
							<input class="form-control" type="text" name="email" id="email" placeholder="Email">
							<hr>
							<input class="form-control" type="password" name="senha" id="senha" placeholder="Senha">
							<input type="submit" name="submit" id="submit" value="Logar">
						</fieldset>	
					</form>	
					<div class="linkAcoes">
						<a href="cadastro.php" class="cadastro" title="registrar">Registrar</a>
						<a href="#" title="não consigo logar">não consigo logar</a>
					</div>
				</div>
												
			</div>
		</div>
	</main>
</body>
</html>