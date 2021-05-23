<html>
<?php  session_start();  ?>
<head>
<title>
ΚΑΛΟΣΟΡΗΣΕΣ
</title>
</head>
<body>
<h1> ΚΑΛΟΣΟΡΗΣΕΣ <?php

if(isset($_SESSION["olo"])){
 print("$_SESSION[olo]");
}elseif($_SESSION["olo"]==null){

    header("Location:login.php");
        exit();
}else{
 

    header("Location:login.php");
    exit();

}

  ?>  </h1>


<body>

</html>
