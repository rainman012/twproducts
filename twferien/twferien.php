<?php

defined( 'ABSPATH' ) or die( 'No script kiddies please!' );

/*

Plugin Name: Timo`s Ferienobjektverwaltung

Description: Gibt eine Tabelle mit den Preise für ein Ferienobjekt zurück

*/


/* Einbinden der CSS Datei - sie soll ggf. alle anderen CSS Dateien überschreiben*/
function twferien_set_stylesheet()
{
    wp_enqueue_style('twferien-style', plugins_url ( 'twferien.css', __FILE__ ), array(), '1.0.0', 'all');
}
add_action('wp_enqueue_scripts', 'twferien_set_stylesheet', PHP_INT_MAX);
add_action('admin_head', 'twferien_set_stylesheet', PHP_INT_MAX);


/* Nutzung z.B.: [getFerienPreisListe id="2"] */
function getFerienPreisListe_func($atts){
    global $wpdb;
	//echo "atts=".$atts["id"];
	$results = $wpdb->get_results( $wpdb->prepare("SELECT * FROM ferienuebernachtungspreise WHERE str_to_date(Ende, '%%d.%%m.%%Y') >= CURDATE() AND ID=%d", $atts["id"] ));
	//var_dump($results);
    $output = "";
    $output .= "<div class='ferien'>";
		$output .= "<h2>Preisliste</h2>";
		$output .= "<br>";
		$output .= "<table class='ferien' style='width:auto'>";
			$output .= "<tr>";
				$output .= "<th>Beschreibung</th>";
				$output .= "<th>Beginn</th>";
				$output .= "<th>Ende</th>";
				$output .= "<th>Tagespreis</th>";
				$output .= "<th>Mindestaufenthalt</th>";
				$output .= "<th>Wochenpreis</th>";
				$output .= "<th>Folgenachtpreis</th>";
			$output .= "</tr>";
			
		foreach ($results as $row) {
			$output .= "<tr>";
				$output .= "<td>".$row->Beschreibung."</td>";
				$output .= "<td>".$row->Beginn."</td>";
				$output .= "<td>".$row->Ende."</td>";
				$output .= "<td>".$row->Grundpreis." €</td>";
				$output .= "<td>".$row->Mindestaufenthalt." Tage</td>";
				$output .= "<td>".$row->Wochenpreis." €</td>";
				$output .= "<td>".$row->Folgenachtpreis." €</td>";
			$output .= "</tr>";
		}
		
		$output .= "</table>";
	$output .= "</div>";

    return $output;
}
add_shortcode( 'getFerienPreisListe', 'getFerienPreisListe_func' );

?>
