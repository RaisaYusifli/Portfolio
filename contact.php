<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer-master/src/Exception.php';
require 'PHPMailer-master/src/PHPMailer.php';
require 'PHPMailer-master/src/SMTP.php';


if (isset($_POST["name"]) && isset($_POST["email"])) {
  $mail = new PHPMailer();

  $mail->CharSet = "utf-8";
  $mail->IsSMTP();
  $mail->SMTPAuth = true;
  $mail->Username = "yusifliraisa@gmail.com";
  $mail->Password = "hfcemoqyxqqrzyij";
  $mail->SMTPSecure = "ssl";
  $mail->Host = "smtp.gmail.com";
  $mail->Port = 465;
  $mail->From = "yusifliraisa@gmail.com";
  $mail->FromName = $_POST['name'];
  $mail->AddAddress("yusiflireise2003@gmail.com");
  $mail->IsHTML(true);
  $mail->Subject = 'Contact Form Submission';

  $email = $_POST['email'];
  $body = $_POST['message'];

  $mail->Body = "
  From: $email

  Message: $body
  ";

  if ($mail->Send()) {
    $message = "Your mail sent successfully!";
    $redirect = "index.php";
} else {
    $message = "Error - ".$mail->ErrorInfo;
    $redirect = "index.php";
}

echo <<<HTML
<script>
    alert("$message");
    window.location.href = "$redirect";
</script>
HTML;
}
?>
