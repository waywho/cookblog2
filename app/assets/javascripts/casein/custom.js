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
	  	$(this).closest("tr").before($(this).data('fields').replace(regexp, time));
	});


    $('.wysihtml5').each(function(i, elem) {
      $(elem).wysihtml5( {
      	toolbar: {
	      'font-styles': true,
	      'color': true,
	      'emphasis': {
	        'small': true
	      },
	      'blockquote': true,
	      'lists': true,
	      'html': true,
	      'link': true,
	      'image': true,
	      'smallmodals': false
	    }
      });
    });

    function split( val ) {
      return val.split( /,\s*/ );
    };
    function extractLast( term ) {
      return split( term ).pop();
    };

    $( "#keywords" )
      // don't navigate away from the field on tab when selecting an item
      .bind( "keydown", function( event ) {
        if ( event.keyCode === $.ui.keyCode.TAB &&
            $( this ).autocomplete( "instance" ).menu.active ) {
          event.preventDefault();
        }
      })
      .autocomplete({
        minLength: 0,
        source: function( request, response ) {
          // delegate back to autocomplete, but extract the last term
          response( $.ui.autocomplete.filter(
            $('#keywords').data('autocomplete-source'), extractLast( request.term ) ) );
        },
        focus: function() {
          // prevent value inserted on focus
          return false;
        },
        select: function( event, ui ) {
          var terms = split( this.value );
          // remove the current input
          terms.pop();
          // add the selected item
          terms.push( ui.item.value );
          // add placeholder to get the comma-and-space at the end
          terms.push( "" );
          this.value = terms.join( ", " );
          return false;
        }
      });
})