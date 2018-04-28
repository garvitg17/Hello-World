<html>
<head>
</head>
<body>  

<?php

// define variables and set to empty values
$name = $addr = $email = $mob = $bankacc = $passid = "";
$db = new SQLite3('mysqlitedb.db');


if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $name = $_POST["username"];
  $email = $_POST["email"];
  $addr = $_POST["address"];
  $mob = $_POST["mob"];
  $bankacc = $_POST["bankacc"];
  $passid = $_POST["passid"];
  $qstr = "SELECT * from records where email = $email"
  $insres = $db->query($qstr);
}

if($insres.getCount() <= 0)
{
	$reg = $db->query('insert into records values ("$name" , "$addr" , "$email", "$mob", "$bankacc" , "$passid")') 

}
else
{
	echo "Already Registered"
}

 $balan = $db->query("SELECT * from table where bankacc ='$bankacc' AND passid = '$passid' AND balance >= 1000")
 if($balan.getCount() >= 1)
 {
 	$reg = $db->query('insert into records values ("$name" , "$addr" , "$email", "$mob", "$bankacc" , "$passid")') 
 }
else
{
	echo "Invalid Account No./Password/ Balance less than 1000"
}

echo "<h2>Records:</h2>";

$results = $db->query('SELECT * FROM records');
while ($row = $results->fetchArray()) {
	    echo "<br> $row[0] $row[1] $row[2] $row[3] $row[4]";
}
/*echo $name;
echo "<br>";
echo $email;
echo "<br>";
echo $website;
echo "<br>";
echo $comment;
echo "<br>";
echo $gender;*/
?>

</body>
</html>
