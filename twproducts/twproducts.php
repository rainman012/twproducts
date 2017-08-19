<?php

defined( 'ABSPATH' ) or die( 'No script kiddies please!' );

/*

Plugin Name: Timo`s Produkt Importer

Description: Gibt eine Tabelle mit Produktdaten zurück

*/


 /* Einbinden der CSS Datei - sie soll ggf. alle anderen CSS Dateien überschreiben*/
 function twproducts_set_stylesheet()
{
    wp_enqueue_style('twproducts-style', plugins_url ( 'twproducts.css', __FILE__ ), array(), '1.0.0', 'all');
}
add_action('wp_enqueue_scripts', 'twproducts_set_stylesheet', PHP_INT_MAX);
add_action('admin_head', 'twproducts_set_stylesheet', PHP_INT_MAX);

//




/* Nutzung z.B.: [getProduktData pid="2"] */
function getProduktData_func($atts){


    //settings_fields( 'twproducts-plugin-settings' );


    $proddb_user = esc_attr( get_option('proddb_user') );
    $proddb_password = esc_attr( get_option('proddb_password') );
    $proddb_name = esc_attr( get_option('proddb_name') );
    $proddb_host = esc_attr( get_option('proddb_host') );


    $proddb= new wpdb($proddb_user,$proddb_password,$proddb_name,$proddb_host);
                //var_dump($proddb);


    //$proddb= new wpdb('db2','1eBTkPhNryVULrH8','db2','localhost');
    $results = $proddb->get_row( $proddb->prepare("SELECT * FROM Produktdaten WHERE ProduktID=%d", $atts["pid"] ));
    $existing_columns = $proddb->get_col("DESC Produktdaten", 0);

    $output = "";
    $output .= "<div class='produktdaten'>";
    $output .= "<h2>Beschreibung</h2>";
    $output .= $results->Beschreibung;
    $output .= "</div>";
    $output .= "<br><br>";

    $output .= "<table class='produktdaten' style='width:auto'>";
    $output .= "<tr>";
    $output .= "<th>Produkdetails</th>";
    $output .= "<th></th>";
    $output .= "</tr>";

        foreach ($existing_columns as $col) {
     	if ($col == "ProduktID") {
        		continue;
    		}
     	if ($col == "Beschreibung") {
        		continue;
    		}
    $output .= "<tr>";
    $output .= "<td>".$col."</td>";
    $output .= "<td>".$results->$col."</td>";
    $output .= "</tr>";
    }

    $output .= "</table>";

    return $output;
}
add_shortcode( 'getProduktData', 'getProduktData_func' );



/* Menuepunkt im Admin Bereich erstellen */

add_action('admin_menu', 'twproducts_setup_menu');

function twproducts_setup_menu(){
        //Einkaufswagen als base64
        $icon = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAMAAADXqc3KAAAAS1BMVEX///+ZAADVlpbnw8P9+vqsMDD04+O0Q0P15ub47e3Ynp62SEinIyOgEhLpx8fGcHC+XFzw2dnEa2vhs7Pjurrrzs7Ng4PIdna6UlLypiyXAAAAcklEQVR42q3R3QqAIAyGYT/TrMzK7O/+rzQoaowcQfQebTxHY+pDFoDLQe99i0Xz0mkRj8wBRgIVJBglSBKUEhgJlAVvu65ccBT82hSxNnR+h3WuaKdqTCpbwqiphqAFK96ggeJqANhTSja/QuU0m39tB0YMA27UxlohAAAAAElFTkSuQmCC";
        add_menu_page( 'TW-Products Plugin Page', 'TW-Products', 'manage_options', 'twproducts', 'twproducts_init', $icon );
}


add_action( 'admin_init', function() {
    register_setting( 'twproducts-plugin-settings', 'proddb_name' );
    register_setting( 'twproducts-plugin-settings', 'proddb_user' );
    register_setting( 'twproducts-plugin-settings', 'proddb_host' );
    register_setting( 'twproducts-plugin-settings', 'proddb_password' );
});

function twproducts_init(){
    ?>
        <div class='produktdaten' >
            <H1>TW-Products - Settings</H1>
            <br>
            <form action="options.php" method="post">

                <?php
                    settings_fields( 'twproducts-plugin-settings' );
                    do_settings_sections( 'twproducts-plugin-settings' );
                ?>
                <table  >
                        <tr>
                                <td>Datenbank Name:</td>
                                <td><input type="text" placeholder="Datenbank Name" name="proddb_name" value="<?php echo esc_attr( get_option('proddb_name') ); ?>" size="50" /></td>
                        </tr>
                        <tr>
                                <td>Datenbank User:</td>
                                <td><input type="text" placeholder="Datenbank User" name="proddb_user" value="<?php echo esc_attr( get_option('proddb_user') ); ?>" size="50" /></td>
                        </tr>
                        <tr>
                                <td>Datenbank Host:</td>
                                <td><input type="text" placeholder="Datenbank Host" name="proddb_host" value="<?php echo esc_attr( get_option('proddb_host') ); ?>" size="50" /></td>
                        </tr>
                        <tr>
                                <td>Datenbank Passwort:</td>
                                <td><input type="password" placeholder="Datenbank Passwort" name="proddb_password" value="<?php echo esc_attr( get_option('proddb_password') ); ?>" size="50" /></td>
                        </tr>
                </table>
                                        <?php submit_button(); ?>
            </form>
        </div>
    <?php
}

/* Settings - Link in der Plugins Übersicht setzen */
 function set_plugin_meta($links, $file) {

    $plugin = plugin_basename(__FILE__);

    if ($file == $plugin) {
        return array_merge(
            $links,
            array( sprintf( '<a href="admin.php?page=twproducts">%s</a>', __('Settings') ) )
        );
    }
    return $links;
}
add_filter( 'plugin_row_meta', 'set_plugin_meta', 10, 2 );



 /*Plugin für den TinyMC Editor*/
 class TinyMCE_TWProducts_Class {

    //Prüfen, ob wir im Admin Bereich sind
    function __construct() {
        if ( is_admin() ) {
            add_action( 'init', array( &$this, 'setup_twproducts_plugin' ) );
        }
    }

    /**
    * Prüfen ob der User die Rechte zum Schreiben hat und der Visuelle Editor aktiv ist
    */
    function setup_twproducts_plugin() {
        if ( ! current_user_can( 'edit_posts' ) && ! current_user_can( 'edit_pages' ) ) {
            return;
        }
        if ( get_user_option( 'rich_editing' ) !== 'true' ) {
            return;
        }
        add_filter( 'mce_external_plugins', array( &$this, 'add_tinymce_plugin' ) );
        add_filter( 'mce_buttons', array( &$this, 'add_tinymce_toolbar_button' ) );
    }

    /**
     * TinyMCE plugin kompatibles JS File hinzufügen
     *
     * @param array $plugin_array Array der registrierten TinyMCE Plugins
     * @return array modifiziertes Array der registrierten TinyMCE Plugins
     */
    function add_tinymce_plugin( $plugin_array ) {
        $plugin_array['twproducts_class'] = plugin_dir_url( __FILE__ ) . 'tinymce-twproducts-class.js';
        return $plugin_array;
    }


    /**
     * Button hinzufügen, womit der User Produktdetails hinzufügen kann
     *
     * @param array $buttons Array der registrierten TinyMCE Buttons
     * @return array modifiziertes Array der registrierten TinyMCE Buttons
     */
    function add_tinymce_toolbar_button( $buttons ) {
        array_push( $buttons, 'twproducts_class' );
        return $buttons;
    }

}


 $tinymce_custom_class = new TinyMCE_TWProducts_Class;





?>
