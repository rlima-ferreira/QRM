$( document ).ready(function() {
    validaForm();
    $('.cpfCad').mask('999.999.999-99');
    $('.rgCad').mask('99.999.999-9');
    $('.dataCad').mask('99/99/9999')
    $('.telCad').mask('(00) 0000-00009')
    $('.cepCad').mask('99999-999')

    $('.adicionaAlergia').click(function(){
        $('.containerAlergia').append('<div><input type="text" name="alergia" placeholder="Alergia" class="alergia"/></div>');
	});
	$('.adicionaDoenca').click(function(){
        $('.containerDoenca').append('<div><input type="text" name="doenca" placeholder="Doença" class="doenca"/></div>');
	});
	$('.adicionaMedicamento').click(function(){
        $('.containeMedicamento').append('<div><input type="text" name="medicamento" placeholder="Medicamento" class="medicamento"/></div>');
    });
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