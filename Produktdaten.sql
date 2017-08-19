-- phpMyAdmin SQL Dump
-- version 4.2.12
-- http://www.phpmyadmin.net
--
-- Host: rdbms
-- Erstellungszeit: 19. Aug 2017 um 18:04
-- Server Version: 5.6.37-log
-- PHP-Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `DB3023205`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Produktdaten`
--

CREATE TABLE IF NOT EXISTS `Produktdaten` (
  `ProduktID` int(1) DEFAULT NULL,
  `Hersteller` varchar(12) DEFAULT NULL,
  `Produktname` varchar(24) DEFAULT NULL,
  `Preis` decimal(4,2) DEFAULT NULL,
  `ASIN` varchar(10) DEFAULT NULL,
  `Amazonbewertung` decimal(2,1) DEFAULT NULL,
  `Höhe` decimal(3,1) DEFAULT NULL,
  `Breite` decimal(3,1) DEFAULT NULL,
  `Tiefe` decimal(2,1) DEFAULT NULL,
  `Gewicht` varchar(5) DEFAULT NULL,
  `Farbe` varchar(11) DEFAULT NULL,
  `Material` varchar(7) DEFAULT NULL,
  `Batteriebetrieb` varchar(5) DEFAULT NULL,
  `Batterien vorhanden` varchar(4) DEFAULT NULL,
  `Stromverbrauch` varchar(10) DEFAULT NULL,
  `Garantie` varchar(8) DEFAULT NULL,
  `Funkwecker` varchar(4) DEFAULT NULL,
  `Weckzeiten` int(1) DEFAULT NULL,
  `Displaytyp` varchar(3) DEFAULT NULL,
  `Farbe Beleuchtung` varchar(4) DEFAULT NULL,
  `Uhrzeitformat` varchar(6) DEFAULT NULL,
  `Multizeitfunktion` varchar(2) DEFAULT NULL,
  `Zeitzonen` varchar(2) DEFAULT NULL,
  `Datumsanzeige` varchar(2) DEFAULT NULL,
  `Thermometer` varchar(2) DEFAULT NULL,
  `Stromanschluss` varchar(4) DEFAULT NULL,
  `Spezialfunktionen` varchar(24) DEFAULT NULL,
  `Nachtmodus` varchar(17) DEFAULT NULL,
  `Anzahl Klingeltöne` varchar(10) DEFAULT NULL,
  `Bemerkungen` varchar(19) DEFAULT NULL,
  `Bedienfreundlichkeit` varchar(10) DEFAULT NULL,
  `Menüsprache` varchar(10) DEFAULT NULL,
  `Anleitungssprache` varchar(19) DEFAULT NULL,
  `Beschreibung` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `Produktdaten`
--

INSERT INTO `Produktdaten` (`ProduktID`, `Hersteller`, `Produktname`, `Preis`, `ASIN`, `Amazonbewertung`, `Höhe`, `Breite`, `Tiefe`, `Gewicht`, `Farbe`, `Material`, `Batteriebetrieb`, `Batterien vorhanden`, `Stromverbrauch`, `Garantie`, `Funkwecker`, `Weckzeiten`, `Displaytyp`, `Farbe Beleuchtung`, `Uhrzeitformat`, `Multizeitfunktion`, `Zeitzonen`, `Datumsanzeige`, `Thermometer`, `Stromanschluss`, `Spezialfunktionen`, `Nachtmodus`, `Anzahl Klingeltöne`, `Bemerkungen`, `Bedienfreundlichkeit`, `Menüsprache`, `Anleitungssprache`, `Beschreibung`) VALUES
(1, 'Colico', 'Smart LED-Digital-Wecker', 12.95, 'B01N3TAE1T', 4.8, 14.7, 8.6, 5.3, '181g', 'schwarz', NULL, '3xAAA', 'nein', NULL, 'Standard', 'Nein', NULL, 'LCD', 'Blau', '12/24h', NULL, NULL, 'ja', 'ja', 'nein', NULL, 'automatisch', NULL, 'Plagiat von Ankoda?', NULL, NULL, 'englisch/chinesisch', '\r\n\r\n<ul class="a-unordered-list a-vertical a-spacing-none">\r\n 	<li><span class="a-list-item">Colico digitaler Wecker mit Uhrzeit, Datum und Temperatur - extra goßes Display</span></li>\r\n 	<li><span class="a-list-item">IQ Light Funktion: Ein Lichtsensor reguliert die Displayhelligkeit je nach Tageszeit. Das Display wird heller, je dunkler es im Raum wird und ist tagsüber und auch nachts optimal lesbar</span></li>\r\n 	<li><span class="a-list-item">Bedienungsfeld auf der Rückseite des Weckers: Einstellung von Uhrzeit und Anzeige 12h/24h (kein Funkwecker), Einstellung von Datum und Weckzeit • Schalter Lichtsensor on/off und Alarm on/off</span></li>\r\n 	<li><span class="a-list-item">Mit Snooze Taste (Schlummerfunktion) und Kurzlicht • Energieversorgung: 3x AAA Batterien (nicht in der Lieferung enthalten)</span></li>\r\n 	<li><span class="a-list-item">Handlich und kabellos - auch als Reisewecker geeignet</span></li>\r\n</ul>\r\n'),
(2, 'Ankoda', 'LED Digital-Wecker', 9.98, 'B01NC326LH', 4.6, 13.5, 7.5, 4.5, '181g', 'schwarz', 'ABS', '3xAAA', 'nein', NULL, 'Standard', 'Nein', NULL, 'LCD', NULL, '12/24h', NULL, NULL, 'ja', 'ja', 'nein', NULL, 'automatisch', NULL, 'Plagiat von Colico?', NULL, NULL, 'englisch/chinesisch', '\r\n\r\n<ul class="a-unordered-list a-vertical a-spacing-none">\r\n 	<li><span class="a-list-item">Material: ABS. Größe: 13,5 cm x 7,5 cm x 4,5 cm. Anzeigen Farbe: Schwarz. Hintergrundbeleuchtung Farbe: Weiß. Fall Farbe: Schwarz.</span></li>\r\n 	<li><span class="a-list-item">IQ Light Funktion: ein Lichtsensor reguliert die Displayhelligkeit je nach Tageszeit. Das Display wird heller, je dunkler es wird und ist somit tagsüber und nachts optimal lesbar.</span></li>\r\n 	<li><span class="a-list-item">Bedienungsfeld auf der Rückseite des Weckers: Einstellung von Uhrzeit und Anzeige 12h/24h (kein Funkwecker), Einstellung von Datum und Weckzeit • Schalter Lichtsensor on/off und Alarm on/off.</span></li>\r\n 	<li><span class="a-list-item">Mit Snooze Taste (Schlummerfunktion) und Kurzlicht • Energieversorgung: 3x AAA Batterien (nicht in der Lieferung enthalten).</span></li>\r\n 	<li><span class="a-list-item">Paket beinhaltet: 1 x Wecker. 1 x Englisch Anweisung.</span></li>\r\n</ul>\r\n'),
(3, 'Hama', 'RC550', 22.57, 'B00BVWJ5RU', 4.4, 9.5, 8.0, 2.5, NULL, 'schwarz', 'Plastik', '2 AA', 'ja', NULL, 'Standard', 'Ja', 1, 'LCD', NULL, '12/24h', NULL, NULL, 'ja', 'ja', 'nein', NULL, 'ein-/ausschaltbar', NULL, NULL, NULL, NULL, NULL, '<div class="text-content">Der Hama Funk Wecker RC550 ist ein Funkwecker mit digitaler Anzeige. Neben der automatischen Zeitanpassung, überzeugt der Hama Funk Wecker RC550 durch eine Vielzahl von Funktionen und ein ansprechendes Design.\r\n<br><br>\r\n<strong>Die Funktionen des Hama Funk Weckers RC550</strong>\r\n<br>\r\nDurch seine Funkverbindung wird der RC550 automatisch auf die jeweils geltende Zeit eingestellt. Das gilt auch für die Zeitumstellungen im Frühjahr und im Herbst, wenn dann auf Sommer- respektive Winterzeit umgestellt wird. Die jeweilige Uhrzeit wird über das digitale Display angezeigt. Es präsentiert die Uhrzeit schön groß, so dass man diese schnell erkennen kann. Neben der Uhrzeit zeigt der RC550 zusätzlich die Weckzeit, das Datum und die Temperatur an. Zusätzlich verfügt der RC550 über eine weitere Funktion, die automatisch ausgelöst wird. Bei Dunkelheit aktiviert sich die Nachtlicht-Funktion. Das bedeutet, eine orangefarbene Hintergrundbeleuchtung sorgt dafür, dass auch im Dunkeln die Uhrzeit, die Weckzeit, das Datum und die Temperatur schnell erkannt werden können. Außerdem stört diese Beleuchtung nicht beim Schlafen.\r\n<br><br>\r\n<strong>Einfache Bedienung </strong>\r\n<br>\r\nDer Funkwecker RC550 lässt sich einfach bedienen. Die Bedienung erfolgt ausschließlich über die Vorderseite der Uhr. Dazu betätigt man die Zeit oder den Wert, den man verändern möchte und stellt diese dann durch simple Tastenbedienung ein. Auch auf der Rückseite des Gerätes lassen sich Einstellungen vornehmen. So kann man hier zum Beispiel durch eine Schalterbetätigung die Einstellungen ab Werk wieder herstellen. Auf der Rückseite befindet sich auch die RCC-Taste, mit deren Hilfe man das Funksignal suchen und die Anzeige zwischen °Celsius und Fahrenheit wechseln kann.\r\n<br><br>\r\n<strong>Design und Material</strong>\r\n<br>\r\nEnergie erhält der RC550 durch zwei AA Mignon Batterien, die im Lieferumfang enthalten sind. Das Gehäuse ist aus solidem Kunststoff hergestellt. Das Design der Uhr ist viereckig und mit der schwarzen Optik kann der RC550 unproblematisch in die bestehende Einrichtung integriert werden. Hama ist ein Hersteller, der für seine Erfahrung und qualitativ hochwertigen Produkte bekannt ist.<br></div>'),
(4, 'Tsumbay', 'DdRLceKTZ0402', 11.99, 'B06XTMW6P2', 4.7, 14.2, 12.4, 6.2, '222g', 'grün', NULL, '3xAAA', 'nein', NULL, 'Standard', NULL, NULL, 'LCD', NULL, '12/24h', NULL, NULL, 'ja', 'ja', 'USB', 'Timer, Schwerkraftsensor', 'automatisch', NULL, NULL, NULL, NULL, NULL, '\r\n\r\n<ul class="a-unordered-list a-vertical a-spacing-none">\r\n 	<li><span class="a-list-item">Es ist ein Schwerkraft-Sensor Wecker. Jede Seite zeigt unterschieliche Funktion: Datum und Zeit, Alarm, Countdown, Temperatur.</span></li>\r\n 	<li><span class="a-list-item">Nachtmodus, Sie können in der Nacht deutliche Zeit mit ganz weiches Licht sehen, es ist sehr gut für die Mütter, die Laktation in der Nacht brauchen.</span></li>\r\n 	<li><span class="a-list-item">Es hat ein groß Bildschirm und kann die Zeit, Wecker, Datum, Temperaturmodus, Alarm und Countdown einstellen. Mit Signalton können Sie im sanften Klingeln wecken. Der Alarm dauert ein Minute oder können Sie auch dem Wecker einfach drehen, um den Alarm zu stoppen.</span></li>\r\n 	<li><span class="a-list-item">Netter Wecker für Eltern, Kinder und Geschenk für Freunde.</span></li>\r\n 	<li><span class="a-list-item">[Qualitätsgarantie] 100% POSITIVE AMAZON-VERKÄUFER-BEWERTUNGEN; 100% ZUFRIEDENHEITS-GARANTIE u. 40 Tagesgeld-Rückseiten-Garantie</span></li>\r\n</ul>\r\n\r\n'),
(5, 'Hama', 'RC200', 12.99, 'B002IKFYPG', 4.1, 9.2, 12.6, 5.6, NULL, 'schwarz', 'Plastik', '2 AAA', 'ja', NULL, 'Standard', 'Ja', 2, 'LCD', NULL, '12/24h', 'ja', 'ja', 'ja', 'ja', 'nein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<strong>Zeitgemäßer Hama Funkwecker RC200</strong><br>\r\nMit einem zuverlässigen Wecker erreichen Sie die optimale Pünktlichkeit und erhalten weitere bedeutende Angaben. Dieser attraktive Hama Funkwecker RC200 in Schwarz ist mit fortschrittlichen Funktionen ausgestattet. Er verfügt über ein Thermometer, das sowohl in Celsius als auch in Fahrenheit eingestellt werden kann. Außerdem hat eine Hintergrundbleuchtung, um auch im Dunkeln die Zeit zu erkennen und er kann die genaue Zeit automatisch anpassen. Egal, ob auf Reisen oder Zuhause, der präzise Wecker von Hama ist mit zwei Weckzeiten versehen und kann deshalb vielseitig zum Einsatz kommen. Im Übrigen kann der ebenfalls integrierte Kalender die Wochentaganzeige in fünf Sprachen, nämlich Englisch, Deutsch, Italienisch, Französisch und Spanisch, anzeigen. Die Schlummerfunktion stellt ein weiteres Highlight dar.\r\n<br><br>\r\n<strong>Weitere nützliche Eigenschaften</strong>\r\n<br>\r\nDie Uhrzeit der Zeitzone ist manuell einstellbar, wenn sich die DCF-Zeit von der Zeit in der jeweiligen Zeitzone unterscheidet. Das kann für Sie sehr wichtig sein, wenn Sie sich viel auf Reisen in ferne Länder begeben, damit Sie stets auf dem Laufenden sind. Die beiden unterschiedlichen Weckzeiten können für zwei Personen mit verschiedenen Zeiten zum Aufstehen genutzt werden. Oder sie werden verwendet, um zum Beispiel die Tabletteneinnahme nicht zu verpassen. Sehen Sie sich den hochwertigen Zeitmesser einmal an! Auf <a href="https://www.amazon.de/s/ref=nb_sb_noss?__mk_de_DE=%C3%85M%C3%85%C5%BD%C3%95%C3%91&amp;url=search-alias%3Dkitchen&amp;field-keywords=Hama+Funk+Wecker+RC200-+ASIN+B002IKFYPG">Amazon</a> können Sie sich weitere wertvolle Details des formschönen Funkweckers anschauen und ihn hier auch gleich bestellen. Dieser exakte Wecker, der mit zwei AAA Mikro Batterien betrieben wird, wird Sie pünktlich wecken und weitere für Sie interessante Angaben bereitstellen. Mit seiner Hilfe kommen Sie nie mehr zu spät.'),
(6, 'TFA Dostmann', 'Bingo Funk-Wecker', NULL, 'B00LO9BZ8M', 4.3, 8.8, 8.4, 3.4, '195gr', 'weiß/grün', 'Plastik', '2 AA', NULL, NULL, 'Standard', 'Ja', NULL, 'LCD', NULL, '?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
