$( document ).ready(function() {
    validaForm();
    $('.cpfCad').mask('999.999.999-99');
    $('.rgCad').mask('99.999.999-9');
    $('.dataCad').mask('99/99/9999')
    $('.telCad').mask('(00) 0000-00009')
    $('.cepCad').mask('99999-999')
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

	$('#enviaCad').click(function(){
		console.log(i);
		if (i <= 0){
			$('form').submit();
		}
	});
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