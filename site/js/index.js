$( document ).ready(function() {
	validaForm();
});

function validaForm(){
	var i = 1;
	$('.nomeCad, .dataCad, .emailCad, .senhaCad, .clinicaCad, .tipoCad, .rgCad, .cpfCad').on('blur', function() {
		$(this).parent('div').find('p').remove();
		$(this).removeClass('erroCad');
		$(this).addClass('acertoCad');
		i = 0;
		if($(this).val() == ""){
			$(this).parent('div').find('p').remove();
			$(this).removeClass('acertoCad');			
			$(this).addClass('erroCad');
			$(this).parent('div').append('<p>Este campo é obrigatório</p>');
			i++;
		}
	});
	$('.clinicaCad, .tipoCad').on('change', function(){
		$(this).parent('div').find('p').remove();
		$(this).removeClass('erroCad');
		$(this).addClass('acertoCad');
		i--;
		if($(this).val() == ""){
			$(this).parent('div').find('p').remove();
			$(this).removeClass('acertoCad');			
			$(this).addClass('erroCad');
			$(this).parent('div').append('<p>Este campo é obrigatório</p>');
			i++;
		}
	});
	// if($('.nomeCad, .dataCad, .loginCad, .senhaCad, .clinicaCad, .tipoCad').val() == ""){
	// 	i++;
	// }
	console.log(i);

	$('#enviaCad').click(function(){
		console.log(i);
		if (i <= 0){
			$('form').submit();
		}
	});
}

//adiciona campos de tel
function campoTel(){
	// var j=2;
	// 	$('.btntel').click(function(e){
	// 		if (j < 4) {	
	// 			$('#divBtnTel').append("<div class='col-md-6'><label>Telefone</label><input class='telCad' type='text' placeholder='Telefone "+j+"' name='telCad"+j+"'></div>");
	// 			j++;
	// 			e.preventDefault();
	// 		} else {
	// 			alert('Maximo 3 telefones');
	// 			e.preventDefault();
	// 		}
	// 	});
	
}

//cria o campo de hospital caso não escolha tipo de usuario normal
function campoHospital(){
	//montando o html;
	// $('.tipoCad').on('change', function(){
	// 	$('div.clinicaDiv').hide();
	// 	if($(this).val() != "" && $(this).val() != "0" && $(this).val() != "1"){
	// 		$('div.clinicaDiv').show();
	// 	}
	// });	
}