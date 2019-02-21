<?php
header('Content-type: text/plain');
$codename = isset($_GET['codename']) ? $_GET['codename'] : $_POST['codename'];
if(!isset($codename)) {
  $codename = 'unknown';
}
if ($codename === 'xenial') {
  $server = $_SERVER['HTTP_HOST'];
  echo "# Wtfo Enterprises main xenial Repository\n";
  printf( "deb http://%s %s main\n", $server, $codename);
  echo "\n";
  printf( "# Wtfo Enterprises main %s Source Repository\n", $codename);
  echo "# The source repos are commented out by default because we\n";
  echo "# do not always make sources available for all packages or\n";
  echo "# for all platforms. If you want to access the source repos,\n";
  echo "# uncomment the following line.\n";
  printf( "# deb-src http://%s %s main\n", $server, $codename);
  echo "\n";
}
else {
  printf("# There is no Wtfo Enterprises apt repository for codename %s\n", $codename);
}
?>
