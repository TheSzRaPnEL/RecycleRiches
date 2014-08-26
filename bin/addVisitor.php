<?php
	$dane = fread(fopen("plik.txt", "r"), filesize("plik.txt"));
	$dane = $dane + 1;
	fwrite(fopen("plik.txt", "w+"), $dane);
	echo $dane;
?>