(function() {
    tinymce.PluginManager.add( 'twproducts_class', function( editor, url ) {
        // Add Button to Visual Editor Toolbar
        editor.addButton('twproducts_class', {
            title: 'Produktdetails hinzufügen',
            cmd: 'twproducts_class',
            image: url + '/icon.png',
        });

        // Add Command when Button Clicked
        editor.addCommand('twproducts_class', function() {
			
			
			
            // Check we have selected some text selected
            var text = editor.selection.getContent({
                'format': 'html'
            });
			
            if ( text.length > 0 ) {
                alert( 'Bitte keinen Text markieren!' );
                return;
            }
			
			// Ask the user to enter a CSS class
            var result = prompt('Bitte die ProduktID eingeben');
            if ( !result ) {
                return;
            }
            if (result.length === 0) {
                return;
            }
			
			editor.insertContent('[getProduktData pid="' + result + '"]');
        });
    });
})();