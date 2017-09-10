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
	$results = $wpdb->get_results( $wpdb->prepare("SELECT * FROM uebernachtungspreise WHERE str_to_date(Ende, '%%d.%%m.%%Y') >= CURDATE() AND ID=%d", $atts["id"] ));
	$result = $wpdb->get_row( $wpdb->prepare("SELECT * FROM objektpreise WHERE ID=%d", $atts["id"] ));
	//var_dump($result);
    $output = "";
    $output .= "<div class='ferien'>";
		$output .= "<h2>Preisliste</h2><br>";
		$output .= "<h4>Mietpreise</h4>";
		$output .= "<table class='ferien' style='width:auto'>";
			$output .= "<tr>";
				$output .= "<th>Saison</th>";
				$output .= "<th>Beginn</th>";
				$output .= "<th>Ende</th>";
				$output .= "<th>Tag</th>";
				$output .= "<th>Woche</th>";
				$output .= "<th>Folgenacht</th>";
				$output .= "<th>Mind.</th>";
			$output .= "</tr>";
			
		foreach ($results as $row) {
			$output .= "<tr>";
				$output .= "<td>".$row->Beschreibung."</td>";
				$output .= "<td>".$row->Beginn."</td>";
				$output .= "<td>".$row->Ende."</td>";
				$output .= "<td>".$row->Grundpreis." €</td>";
				$output .= "<td>".$row->Wochenpreis." €</td>";
				$output .= "<td>".$row->Folgenachtpreis." €</td>";
				$output .= "<td>".$row->Mindestaufenthalt." Tage</td>";
			$output .= "</tr>";
		}
		
		$output .= "</table>";
		$output .= "<h4>Sonstige Bedinungen und Zusatzpreise</h4>";
		
		$output .= "<table class='ferien' style='width:auto'>";
			$output .= "<tr>";
				$output .= "<th>Beschreibung</th>";
				$output .= "<th></th>";
			$output .= "</tr>";
			$output .= "<tr>";
				$output .= "<td>Anzahlung</td>";
				$output .= "<td>".$result->Anzahlung." %</td>";
			$output .= "</tr>";	
			$output .= "<tr>";
				$output .= "<td>Kaution</td>";
				$output .= "<td>".$result->Kaution." €</td>";
			$output .= "</tr>";	
			$output .= "<tr>";
				$output .= "<td>Endreinigung</td>";
				$output .= "<td>".$result->Endreinigung." €</td>";
			$output .= "</tr>";	
			$output .= "<tr>";
				$output .= "<td>Wäschepaket (optional)</td>";
				$output .= "<td>".$result->Waeschepaket." € pro Person</td>";
			$output .= "</tr>";	
			$output .= "<tr>";
				$output .= "<td>Haustier (optional)</td>"; 
				$output .= "<td>".$result->Haustier." € pro Haustier</td>";
			$output .= "</tr>";	
		$output .= "</table>";
	$output .= "</div>";

    return $output;
}
add_shortcode( 'getFerienPreisListe', 'getFerienPreisListe_func' );

?>
