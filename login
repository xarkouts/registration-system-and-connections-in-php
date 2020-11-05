<html>
<?php

session_start();


?>

<head>
    <title>
        login
    </title>
    <?php
    $host = "localhost";
    $dbname = "egrfiphp";
    $username = "root";
    $password = "";


    if (isset($_SESSION["olo"]) == true) {
        header("Location:ka.php");
        exit();
    }

    $sindesi_db = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);


    $select = "SELECT onomaxristi,kodikoprosbasis FROM egrafes;";

    $dedomena = $sindesi_db->query($select);

    if (isset($_POST["sub"])) {
        $loginname = aspida_post("lon");
        $loginpass = aspida_post("lko");
    }

    ?>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>

<body>
    <br>
    <br>
    <br>
    <br>
    <br>
    <h1 style="text-align: center; color:white; background-color: black;  border: 1px solid black;
  margin: 2px;
  padding: 4px;">Login</h1>

    <div style="text-align:center;">
        <form action="" method="post" class="form-check">

            <input type="text" name="lon" placeholder="Username"><br>



            <input type="password" name="lko" placeholder=" Password"><br>


            <button type="submit" name="sub" class="btn btn-primary">login </button> <a href="dokimi.php">register</a> <br>

            <?php


            if (isset($_POST["sub"])) {
                while ($antistixisi = $dedomena->fetch()) {

                    if ($loginname == $antistixisi["onomaxristi"] && $loginpass == $antistixisi["kodikoprosbasis"]) {
                        $_SESSION["olo"] = $loginname;
                        $_SESSION["kol"] = $loginpass;
                        print("$_SESSION[olo]");
                        print("$_SESSION[kol]");
                        header("Location:ka.php");
                        exit();
                    }
                }
                if (isset($loginname) && $loginname == null) {
                    print("to onoma xristi den mpori na einai kaino <br>");
                }

                if (isset($loginpass) && $loginpass == null) {
                    print("o kodikos prosbathis den mpori na einai kaino");
                }
                if (!($loginname == $antistixisi["onomaxristi"]) && !($loginpass == $antistixisi["kodikoprosbasis"])) {
                    print("to onoma xristi i o kodikos prosbathis den tergiadoyn");
                }
            }
            ?>

