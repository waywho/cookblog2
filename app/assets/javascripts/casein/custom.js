// CASEIN CUSTOM
// Use this file for your project-specific Casein JavaScript


$(document).ready(function () {



	$('form').on('click', '.remove_fields', function(event) {
		$(this).prev("input[type=hidden]").val("1")
	  	$(this).closest('fieldset').hide()
	  	event.preventDefault();
	});

	$('.add_fields').on('click', function() {
		event.preventDefault();
	  	var time = new Date().getTime();
	  	var regexp = new RegExp($(this).data('id'), "g");
	  	$(this).before($(this).data('fields').replace(regexp, time));
	  	$('#courseformat_highlights_attributes_'+time+"_description").froalaEditor({
	      	inlineMode: false,
	      	charCounterCount: true,
	      	linkConvertEmailAddress: true,
	      	heightMin: 100, 
	      	toolbarButtons: ['bold', 'italic', 'underline', 
	      	'strikeThrough', '|', 'color', 'formatOL', 'formatUL', 'quote', 'insertLink', 'undo', 'redo', 
	      	'clearFormatting', 'selectAll', 'html']
	      });
	});



})