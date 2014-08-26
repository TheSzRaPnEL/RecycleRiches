<?php
	$dane = fread(fopen("plik.txt", "r"), filesize("plik.txt"));
	echo $dane;
?>