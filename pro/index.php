<?php
$mysqli = new mysqli("172.20.14.132", "mysql", "mysql","sample",33006); 
    if(!$mysqli)  { 
        echo"database error"; 
    }else{ 
        echo"php env successful"; 
    } 
$mysqli->close(); 
