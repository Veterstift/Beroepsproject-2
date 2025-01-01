-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 01 jan 2025 om 18:54
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_db`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `admin`
--

INSERT INTO `admin` (`id`, `first_name`, `last_name`, `username`, `password`) VALUES
(1, 'Kenneth', 'van der Maazen', 'admin', '$2y$10$AiWyoQ1vhRqsSClp0kzWreqmA0ECaDC6AdWykNqZQnW0P94hEgBYi');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'Planten'),
(2, 'Dieren'),
(3, 'Vissen'),
(4, 'Insecten'),
(5, 'Hulp middellen'),
(6, 'Gidsen'),
(7, 'Informatie');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `crated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `comment`
--

INSERT INTO `comment` (`comment_id`, `comment`, `user_id`, `post_id`, `crated_at`) VALUES
(29, 'Nice', 1, 35, '2025-01-01 09:10:09');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(127) NOT NULL,
  `post_text` text NOT NULL,
  `category` int(11) NOT NULL,
  `publish` int(2) NOT NULL DEFAULT 1,
  `cover_url` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `crated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `post`
--

INSERT INTO `post` (`post_id`, `post_title`, `post_text`, `category`, `publish`, `cover_url`, `crated_at`) VALUES
(21, 'Test #1', 'Dit is de eerste test, kijken of het goed gaat.', 1, 1, 'default.jpg', '2024-12-27 01:58:02'),
(31, 'herintroductie wilde bloemen en bijen', '<div><div>Lorem ipsum dolor sit amet. Aut vitae sunt ut earum sint et voluptates totam non atque delectus qui itaque esse. Et praesentium sint ea adipisci obcaecati et officiis dolores. Sed ducimus voluptate 33 ullam possimus ea deserunt laboriosam sit omnis porro. A expedita perspiciatis quo adipisci voluptatum aut porro labore. </div><div>Qui iure accusamus aut amet tempore sit iusto quia et excepturi quia. Eum iure veniam qui nesciunt sint ut nisi error. Hic cupiditate quae sit maiores magnam non dolor dicta ad temporibus quisquam. </div><div>Et fugit doloremque hic accusamus autem ut dolores ipsum aut omnis odit et blanditiis minima. Aut omnis quam ea deserunt dolor aut veritatis consequuntur qui ratione minus est aliquid illum est illum illo. Sed ratione nihil et dolor sint et dolorem iste et nemo numquam et quis distinctio eum ipsam doloremque in ullam quod. Vel quod enim sed animi repellendus sed quam sunt nam ratione nesciunt ab commodi natus eos totam veritatis est quam molestiae.&nbsp;</div></div>', 4, 1, 'COVER-6774acdb3b3e02.66981481.jpg', '2025-01-01 03:47:55'),
(32, 'herintroductie wilde vissen', '<div><div>Lorem ipsum dolor sit amet. In iste labore sed pariatur magni et consequatur itaque. Sed autem quod in eius sunt est asperiores labore qui tempore neque et cumque voluptatem. Eum quis voluptate qui amet minima id iure voluptatibus ut nihil quibusdam? Aut blanditiis amet non galisum suscipit quo minus necessitatibus et illum enim et dolores maiores. </div><div>Sit cupiditate culpa hic beatae vero ut dicta nihil eos voluptas molestiae et minima fugiat ea iste quas cum perspiciatis sequi. Est omnis corporis eum itaque magnam et dolorem aspernatur et deserunt laboriosam aut iusto sequi in repellat similique! Ea iure consequatur aut laboriosam quisquam aut internos veniam ut sint exercitationem! Et molestiae beatae aut rerum quisquam qui voluptatem cupiditate qui tempore quod sit numquam consequuntur. </div><div>Vel numquam magnam qui quam galisum aut amet voluptas ea veniam consequatur eum officia sequi et pariatur sunt. Ut delectus necessitatibus et libero expedita qui illum quibusdam.&nbsp;</div></div>', 2, 1, 'COVER-6774b3f087bc62.87171446.jpg', '2025-01-01 04:18:08'),
(33, 'Zwarte Kraai', '<div><div class=\"pix-soort-field\" style=\"display: flex; flex-direction: column; margin-top: 25px; width: 800px; color: rgb(33, 37, 41); font-family: Lato, sans-serif; font-size: 17px;\"><h2 id=\"soort_target_pix_species_beschrijvingen_herkenning\" style=\"margin-block: 0.5rem 1rem; font-family: Rubik, sans-serif; font-weight: 700; line-height: 2; color: rgb(128, 176, 12); font-size: 23px; margin-top: 0.25rem;\"><span style=\"color: rgb(33, 37, 41); font-family: Lato, sans-serif; font-size: 17px; font-weight: 400;\">De bekendste kraai komt bij ons voor in de volledig zwarte vorm. In Nederland komen ze voor in het hele land met uitzondering van uitgestrekte bosgebieden. In de winter zie je ze ook vaak in groepen.</span></h2><h2 id=\"soort_target_pix_species_beschrijvingen_herkenning\" style=\"margin-block: 0.5rem 1rem; font-family: Rubik, sans-serif; font-weight: 700; line-height: 2; color: rgb(128, 176, 12); font-size: 23px; margin-top: 0.25rem;\">Herkenning</h2><div>46 cm. Verenkleed geheel zwart, hetgeen het enige verschil is met bonte kraai. Te onderscheiden van veel grotere raaf door geluid, rechte staart en gladde keel, en van juveniele roek door zwaardere, minder puntige snavel en ontbreken van \'broek\'. Gewoonlijk alleen of in paren, behalve op slaapplaats. Opent hard voedsel (bijvoorbeeld krabben of noten) door het van enige hoogte naar beneden te laten vallen.</div></div><div class=\"pix-soort-field\" style=\"display: flex; flex-direction: column; margin-top: 25px; width: 800px; color: rgb(33, 37, 41); font-family: Lato, sans-serif; font-size: 17px;\"><h2 id=\"soort_target_pix_species_beschrijvingen_verspreiding\" style=\"margin-block: 0.5rem 1rem; font-family: Rubik, sans-serif; font-weight: 700; line-height: 2; color: rgb(128, 176, 12); font-size: 23px; margin-top: 0.25rem;\">Verspreiding</h2><div>Komt voornamelijk voor in de westelijke helft van Europa en de oostelijke helft van Azië, met uitzondering van Zuidoost-Azië. In Nederland een talrijke broedvogel, jaarrond aanwezig.</div></div><div class=\"pix-soort-field\" style=\"display: flex; flex-direction: column; margin-top: 25px; width: 800px; color: rgb(33, 37, 41); font-family: Lato, sans-serif; font-size: 17px;\"><h2 id=\"soort_target_pix_species_beschrijvingen_biotopen\" style=\"margin-block: 0.5rem 1rem; font-family: Rubik, sans-serif; font-weight: 700; line-height: 2; color: rgb(128, 176, 12); font-size: 23px; margin-top: 0.25rem;\">Biotopen</h2><div>Broedt in (half)open landschappen met bomen, maar ook wel in hoogspanningsmasten. Komt op veel verschillende plekken voor, bijvoorbeeld bij akkers, weiden, in bossen en parken, maar ook in stedelijke gebieden. Voornamelijk in kleinschalig cultuurlandschap.</div></div><div class=\"pix-soort-field\" style=\"display: flex; flex-direction: column; margin-top: 25px; width: 800px; color: rgb(33, 37, 41); font-family: Lato, sans-serif; font-size: 17px;\"><h2 id=\"soort_target_pix_species_beschrijvingen_levenswijze\" style=\"margin-block: 0.5rem 1rem; font-family: Rubik, sans-serif; font-weight: 700; line-height: 2; color: rgb(128, 176, 12); font-size: 23px; margin-top: 0.25rem;\">Levenswijze</h2><div><span style=\"font-weight: bolder;\">Voedsel</span><br>Zoals alle kraaien zeer gevarieerd. Allerlei soorten kleine dieren, vruchten en zaden, aas.</div><div><span style=\"font-weight: bolder;\">Eieren</span><br>Aantal eieren in legsel meestal 4-6, zelden 7. Buikig. Glad en enigszins glanzend. Als die van de roek. Verschillende tinten van lichtblauw, groenachtig-blauw of groen. Bezet met olijfgroene, olijfbruine, donkerbruine en blauwgrijze spikkels, vlekken, strepen en krabbels. Van vrijwel ongetekend tot zeer sterk getekende eieren. Zeer zelden roze met rode en purperachtige tekens. Geen verschillen tussen de eieren van de zwarte kraai en de bonte kraai. Formaat 43,3 x 30,4 mm.</div></div><div class=\"pix-soort-field\" style=\"display: flex; flex-direction: column; margin-top: 25px; width: 800px; color: rgb(33, 37, 41); font-family: Lato, sans-serif; font-size: 17px;\"><h2 id=\"soort_target_pix_species_beschrijvingen_geluid\" style=\"margin-block: 0.5rem 1rem; font-family: Rubik, sans-serif; font-weight: 700; line-height: 2; color: rgb(128, 176, 12); font-size: 23px; margin-top: 0.25rem;\">Geluid</h2><div>Gewone roep een krassend \'kraah\'; soms een zacht \'gonk\'. Ook andere geluiden, meestal afleidingen van gewone roep.</div></div></div>', 0, 1, 'COVER-6774cb3331a4b5.75428275.jpg', '2025-01-01 05:57:23'),
(34, 'Ziekte van Lyme bij katten', '<div><span style=\"color: rgb(74, 74, 74); font-family: Adelle, Helvetica, Arial, serif, italic; font-size: 30px; font-weight: 700;\">De meeste katten hebben wel eens een tekenbeet gehad. Teken zijn vervelende parasieten die ziektes bij zich kunnen dragen. Een ervan is de ziekte van Lyme. In dit artikel vertellen we je alles over de ziekte van Lyme bij de kat en wat je kunt doen om dit te voorkomen.</span></div><div><span style=\"color: rgb(74, 74, 74); font-family: Adelle, Helvetica, Arial, serif, italic; font-size: 30px; font-weight: 700;\"><br></span></div><div><h2 id=\"Wat-is-de-ziekte-van-Lyme\" style=\"-webkit-font-smoothing: auto; margin-top: 1.5em; margin-bottom: 0px; font-weight: 700; font-family: Adelle, Helvetica, Arial, serif, italic; line-height: 1.2em; font-size: 3.6rem; color: rgb(74, 74, 74);\">Wat is de ziekte van Lyme?</h2><div>De ziekte van Lyme wordt veroorzaakt door een bacterie genaamd Borrelia Burgdorferi. Deze bacterie wordt overgedragen door teken; kleine, spinachtige&nbsp;<span style=\"text-decoration-line: underline;\"><a href=\"https://dierenzorggids.nl/artikel/parasieten-bij-de-kat/\" style=\"background: 0px 0px; cursor: pointer; text-decoration-line: none; color: rgb(24, 89, 164);\">parasieten</a></span>&nbsp;die leven van het bloed van zoogdieren. Ongeveer één op de vijf teken in Nederland draagt de Borrelia bacterie bij zich, die de oorzaak is van de ziekte van Lyme (bron:&nbsp;<span style=\"text-decoration-line: underline;\"><a href=\"https://www.rivm.nl/vragen-en-antwoorden-tekenbeten-en-lyme#:~:text=In%20Nederland%20is%20gemiddeld%20%C3%A9%C3%A9n,kan%20veroorzaken%20(Borrelia%20burgdorferi).\" target=\"_blank\" rel=\"noopener\" style=\"background: 0px 0px; cursor: pointer; text-decoration-line: none; color: rgb(24, 89, 164);\">RIVM</a></span>). Ze krijgen de bacteriën binnen via knaagdieren of vogels. Wanneer een besmette teek je kat bijt, kan de bacterie dus overgedragen worden en zo de ziekte van Lyme veroorzaken.</div><h2 id=\"Kunnen-katten-de-ziekte-van-Lyme-krijgen\" style=\"-webkit-font-smoothing: auto; margin-top: 1.5em; margin-bottom: 0px; font-weight: 700; font-family: Adelle, Helvetica, Arial, serif, italic; line-height: 1.2em; font-size: 3.6rem; color: rgb(74, 74, 74);\">Kunnen katten de ziekte van Lyme krijgen?</h2><div>Katten kunnen, net als mensen, ook de ziekte van Lyme krijgen. Omdat katten vaak de “egel teek” (Ixodes hexagonus) oplopen en niet de “bos teek” (Ixodes ricinus; de teek die mensen en honden meestal hebben), krijgen ze ook minder vaak de ziekte van Lyme. Daarnaast verloopt de ziekte bij katten meestal zonder klachten. Toch kunnen de symptomen van Lyme bij katten ook zeer ernstig zijn. Het is daarom raadzaam&nbsp;<span style=\"text-decoration-line: underline;\"><a href=\"https://dierenzorggids.nl/artikel/teek-kat/\" style=\"background: 0px 0px; cursor: pointer; text-decoration-line: none; color: rgb(24, 89, 164);\">teken bij je kat</a></span>&nbsp;te bestrijden.</div><h2 id=\"Symptomen-van-de-ziekte-van-lyme-bij-de-kat\" style=\"-webkit-font-smoothing: auto; margin-top: 1.5em; margin-bottom: 0px; font-weight: 700; font-family: Adelle, Helvetica, Arial, serif, italic; line-height: 1.2em; font-size: 3.6rem; color: rgb(74, 74, 74);\">Symptomen van de ziekte van lyme bij de kat</h2><div>Wanneer een kat wel symptomen heeft van de ziekte van Lyme, zijn de ziekteverschijnselen soms erg vaag. Koorts en lusteloosheid zijn de veel geziene klachten. In meer ernstige gevallen treedt er kreupelheid op en kunnen er nierproblemen ontstaan. De kat voelt zich dan wel erg ziek. Omdat de klachten vaak pas na maanden tot jaren opspelen, is de relatie tot de ziekte van Lyme lastig aan te tonen.</div><h2 id=\"Ziekte-van-Lyme-behandeling\" style=\"-webkit-font-smoothing: auto; margin-top: 1.5em; margin-bottom: 0px; font-weight: 700; font-family: Adelle, Helvetica, Arial, serif, italic; line-height: 1.2em; font-size: 3.6rem; color: rgb(74, 74, 74);\">Ziekte van Lyme behandeling</h2><div>De eerste twaalf uur na vastbijten van de teek in de huid van de kat, is de kans op een besmetting met Borrelia laag. Hierna loopt het risico op een besmetting steeds op. Door middel van een&nbsp;<span style=\"text-decoration-line: underline;\"><a href=\"https://dierenzorggids.nl/artikel/bloedonderzoek-bij-hond-en-kat/\" style=\"background: 0px 0px; cursor: pointer; text-decoration-line: none; color: rgb(24, 89, 164);\">bloedonderzoek</a></span>&nbsp;bij de dierenarts kan de ziekte van Lyme vastgesteld worden. Echter, de uitslag van dit onderzoek is vaak niet betrouwbaar. Daarom bestaat de diagnose van de ziekte van Lyme bij de kat ook uit het uitsluiten van andere ziekten en aandoeningen die de klachten kunnen veroorzaken.</div><div>Een behandeling tegen de ziekte van Lyme bestaat uit een antibioticakuur van enkele weken. Soms helpt antibiotica niet voldoende om de ziekte te genezen. Ook kan de kat drager van de ziekte zijn, zonder er klachten van te hebben.</div><h2 id=\"Hoe-kan-je-een-teek-bij-de-kat-verwijderen\" style=\"-webkit-font-smoothing: auto; margin-top: 1.5em; margin-bottom: 0px; font-weight: 700; font-family: Adelle, Helvetica, Arial, serif, italic; line-height: 1.2em; font-size: 3.6rem; color: rgb(74, 74, 74);\">Hoe kan je een teek bij de kat verwijderen?</h2><div>Heb je een teek bij je kat gevonden dan is het raadzaam deze zo snel mogelijk te verwijderen. Dit doe je op de volgende manier:</div><ul style=\"margin: 1.5em 0px 0px; color: rgb(74, 74, 74); font-family: &quot;Open Sans&quot;, Helvetica, Arial, serif; font-size: 18px;\"><li>Strijk de haren rondom de teek uit elkaar.</li><li style=\"margin-top: 1.5rem;\">Gebruik een tekenpincet of tekenhaakje en pak de teek hiermee zo dicht mogelijk op de huid van je kat vast. Gebruik hiervoor geen gewoon pincet, hiermee knijp je de teek stuk.</li><li style=\"margin-top: 1.5rem;\">Verwijder de teek nu voorzichtig en met een draaiende beweging.</li><li style=\"margin-top: 1.5rem;\">Sommige katten blijven niet stilzitten, waardoor het weghalen van een teek lastig kan zijn. Vraag in dat geval je dierenarts om hulp.</li><li style=\"margin-top: 1.5rem;\">Controleer de tekenbeet regelmatig gedurende enkele dagen na het weghalen. Wordt de huid rood of ontstoken, bezoek dan een dierenarts.</li></ul><h2 id=\"Ziekte-van-Lyme-voorkomen-bij-de-kat\" style=\"-webkit-font-smoothing: auto; margin-top: 1.5em; margin-bottom: 0px; font-weight: 700; font-family: Adelle, Helvetica, Arial, serif, italic; line-height: 1.2em; font-size: 3.6rem; color: rgb(74, 74, 74);\">Ziekte van Lyme voorkomen bij de kat</h2><div>Je kunt teken en dus de ziekte van Lyme bij katten voorkomen, door je kat het hele jaar een teekwerend middel van de dierenarts te geven. Let erop dat je je kat geen middel tegen teken bij honden geeft! Deze zijn zeer giftig voor katten. Is je kat veel buiten, controleer dan dagelijks op de aanwezigheid van teken. Doe dit door met je handen over de hele vacht van je kat heen te strijken en kijk of je oneffenheden voelt.</div><h2 id=\"Veelgestelde-vragen-over-de-ziekte-van-Lyme-bij-een-kat\" style=\"-webkit-font-smoothing: auto; margin-top: 1.5em; margin-bottom: 0px; font-weight: 700; font-family: Adelle, Helvetica, Arial, serif, italic; line-height: 1.2em; font-size: 3.6rem; color: rgb(74, 74, 74);\">Veelgestelde vragen over de ziekte van Lyme bij een kat</h2><h3 style=\"-webkit-font-smoothing: auto; margin-top: 0.5em; margin-bottom: 0px; font-weight: 700; font-family: Adelle, Helvetica, Arial, serif, italic; line-height: 1.2em; font-size: 3rem; color: rgb(74, 74, 74);\">Hoe gevaarlijk is een teek bij een kat?</h3><div>Teken zijn na muggen de meest ziekte verspreidende parasieten. Ze kunnen ziekten op mens en dier overbrengen, zoals de ziekte van Lyme, Ehrlichia en Anaplasma. Omdat je niet aan een teek kunt zien of deze een ziekte bij zich draagt, kan je elke teek bij je kat het beste zo snel mogelijk verwijderen.</div><h3 style=\"-webkit-font-smoothing: auto; margin-top: 1.5em; margin-bottom: 0px; font-weight: 700; font-family: Adelle, Helvetica, Arial, serif, italic; line-height: 1.2em; font-size: 3rem; color: rgb(74, 74, 74);\">Kan een teek van kat op mens?</h3><div>Een teek kan zowel op een mens als op een kat gevonden worden. Omdat teken niet kunnen springen, kunnen ze zich niet zomaar van de ene gastheer naar de andere verplaatsen. Een teek kan in theorie dus van een kat op een mens gaan, maar dit is onwaarschijnlijk.</div><h3 style=\"-webkit-font-smoothing: auto; margin-top: 1.5em; margin-bottom: 0px; font-weight: 700; font-family: Adelle, Helvetica, Arial, serif, italic; line-height: 1.2em; font-size: 3rem; color: rgb(74, 74, 74);\">Waar zitten teken meestal bij katten?</h3><div>Teken kunnen overal op de kat voorkomen, maar hebben een voorkeur voor de kop, nek, hals en oren. Ook vind je ze tussen de voorpoten, tussen de tenen en onder de staart van de kat.</div></div>', 0, 1, 'COVER-6774cb745608c7.35405195.jpg', '2025-01-01 05:58:28'),
(35, 'Flora en fauna', '<div><span style=\"color: rgb(255, 255, 255); font-family: Inter, &quot;Helvetica Neue&quot;, Helvetica, Roboto, Arial, sans-serif; font-size: 18.08px; background-color: rgb(12, 14, 32);\">Volgens de Wet Natuurbescherming is het voor veel ruimtelijke ontwikkelingen verplicht om een QuickScan Natuurwetgeving uit te voeren. Hierbij wordt bekeken of de ontwikkeling negatieve effecten kan hebben op beschermde dieren of planten.</span></div>', 0, 1, 'COVER-6774cb9d568f60.95530685.jpg', '2025-01-01 05:59:09');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `post_like`
--

CREATE TABLE `post_like` (
  `like_id` int(11) NOT NULL,
  `liked_by` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `liked_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `post_like`
--

INSERT INTO `post_like` (`like_id`, `liked_by`, `post_id`, `liked_at`) VALUES
(76, 1, 32, '2025-01-01 07:36:21');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `fname`, `username`, `password`) VALUES
(1, 'Kenneth van der Maazen', 'Kenneth', '$2y$10$Ngo9.VE3YcbKPozBzTYFf.gYyWvs7xGdMtwb/89ruUWP8rpk1cRgC');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexen voor tabel `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexen voor tabel `post_like`
--
ALTER TABLE `post_like`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT voor een tabel `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT voor een tabel `post_like`
--
ALTER TABLE `post_like`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
