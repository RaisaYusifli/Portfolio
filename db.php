<?php
    $conn=mysqli_connect('localhost', 'root', '123456789', 'raisa');

      if(!$conn){
          die('Could not Connect MySql Server:' .mysql_error());
        }
?> 