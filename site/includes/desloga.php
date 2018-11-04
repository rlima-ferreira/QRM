<?php 
session_start();
session_destroy();
header('location: http://localhost/QRM/site/index.php?deslogado');