<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8" />

    <title>Raisa - Portfolio</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="templatemo" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- animate -->
    <link rel="stylesheet" href="css/animate.min.css" />
    <!-- bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- font-awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <!-- google font -->
    <link
      href="http://fonts.googleapis.com/css?family=Raleway:400,300,700,800"
      rel="stylesheet"
      type="text/css"
    />
    <!-- fullpage -->
    <link rel="stylesheet" href="css/jquery.fullPage.css" />
    <!-- custom -->
    <link rel="stylesheet" href="css/templatemo-style.css" />
  </head>
  <body>

      <?php
      include "db.php";

      $query_row = mysqli_query($conn, "SELECT * FROM `portfolio` WHERE `id`='1'");
      $portfolio= mysqli_fetch_assoc($query_row);
      
      ?>

    <div id="fullpage">
      <!-- start home -->
      <div id="home" class="section">
        <div class="container">
          <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8 wow fadeIn" data-wow-delay="0.9s">
              <h3>Simple and Elegant</h3>
              <h1><?= $portfolio['name'] . " " . $portfolio['surname']; ?></h1>
              <h2 class="rotate"><?= $portfolio['job']; ?></h2>
              <p><?= $portfolio['job_desc']; ?></p>
              <a
                href="#work"
                class="btn btn-default smoothScroll wow fadeInUp"
                data-wow-delay="1s"
                >Get started</a
              >
            </div>
            <div class="col-md-2"></div>
          </div>
        </div>
      </div>
      <!-- end home -->




      <!-- start work -->

      <div id="work" class="section">
        <div class="container">
          <div class="row">
            <div class="col-md-12 wow bounce">
              <h2>WHAT I DO</h2>
            </div>
          </div>
          <div class="row">
        <?php 

          $query_row = mysqli_query($conn, "SELECT * FROM `whatido` LIMIT 3");
          
          while ($whatido = mysqli_fetch_assoc($query_row)) {
            echo '<div class="col-md-4 col-xs-11 wow fadeInUp" data-wow-delay="0.6s">
                    <div class="media">
                        <div class="media-object media-left">
                          <i class="fa fa-paper-plane"></i>
                        </div>
                        <div class="media-body">
                          <h3 class="media-heading">' . $whatido['name'] . '</h3>
                          <p>' . $whatido['description'] . '</p>
                        </div>
                    </div>
                  </div>';
          }
          ?>
          </div>
        </div>
      </div>
      <!-- end work -->

      <!-- start about -->
      <div id="about" class="section">
        <div class="container">
          <div class="row">
            <div
              class="col-md-6 col-xs-11 wow fadeInLeft"
              data-wow-delay="0.9s"
            >
              <h2>ABOUT ME</h2>
              <h4>Front-End developer</h4>
              <p>
                Hi, I'm Raisa Yusifli. I'm a Front-End developer and I study at
                Baku Engineering University. I really enjoy coding.
              </p>
            </div>

            <div
              class="col-md-6 col-xs-11 wow fadeInRight"
              data-wow-delay="0.9s"
            >
              <?php 
                $query_row = mysqli_query($conn, "SELECT * FROM `skills` LIMIT 4");
                while ($skills = mysqli_fetch_assoc($query_row)) {
                  echo '  <span>'. $skills['name'] .'<small>'. $skills['value'] .'%</small></span>
                          <div class="progress">
                            <div
                              class="progress-bar progress-bar-danger"
                              role="progressbar"
                              aria-valuenow="60"
                              aria-valuemin="0"
                              aria-valuemax="100"
                              style="width:'. $skills['value'] .'%"
                            ></div>
                          </div>';
                }
              ?>

            </div>
          </div>
        </div>
      </div> 
      <!-- end about -->

      <!-- start portfolio -->
      <div id="portfolio" class="section">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <h2 class="wow bounce">Gallery</h2>
            </div>

            <?php
              $query = mysqli_query($conn, "SELECT * FROM `images`");
              $i = 0;
              $col_md = 4;
              while($images= mysqli_fetch_assoc($query)){
                
                if($i>=3)
                  $col_md = 6;
                  
                echo '<div class="col-md-'.$col_md.' col-xs-6 wow fadeIn" data-wow-delay="0.6s">
                        <div class="portfolio-thumb">'.
                          "<img
                            src='{$images['path']}'
                            class='img-responsive'
                            alt='portfolio img'
                          />"
                          .'<div class="portfolio-overlay">
                            <h4>'.$images['description'].'</h4>"
                          </div>
                        </div>
                      </div>';

                  $i++;

              }
            ?>     
            
        

          </div>
        </div>
      </div>
      <!-- end portfolio -->

      <!-- start contact -->
      <div id="contact" class="section">
        <div class="container">
          <div class="row">
            <div
              class="col-lg-5 col-lg-offset-1 col-md-6 wow fadeInUp"
              data-wow-delay="0.6s"
            >
              <address>
                <p class="contact-title">CONTACT ME</p>
                <p><i class="fa fa-phone"></i><?= $portfolio['phone']?></p>
                <p><i class="fa fa-envelope-o"></i><?= $portfolio['email']?></p>
                <p>
                  <i class="fa fa-map-marker"></i> <?= $portfolio['city']?>
                </p>
              </address>
            </div>
            <div
              class="col-lg-6 col-md-6 col-xs-10 wow fadeInUp"
              data-wow-delay="0.6s"
            >
              <form role="form" method="post" action="contact.php">
                <input
                  name="name"
                  type="text"
                  class="form-control"
                  id="name"
                  placeholder="Your Name"
                />
                <input
                  name="email"
                  type="email"
                  class="form-control"
                  id="email"
                  placeholder="Your Email"
                />
                <textarea
                  name="message"
                  rows="5"
                  class="form-control"
                  id="message"
                  placeholder="Your Message"
                ></textarea>
                <input
                  name="send"
                  type="submit"
                  class="form-control"
                  id="send"
                  value="SEND ME"
                />
              </form>
            </div>
            <div class="col-md-1 col-sm-1"></div>
          </div>
        </div>
      </div>
      <!-- end contact -->

      <!-- start footer -->
      <footer>
        <div class="container">
          <div class="row">
            <div class="col-md-12 wow fadeIn" data-wow-delay="0.9s">
              <hr />
              <ul class="social-icon">
                <li><a href="#" class="fa fa-facebook"></a></li>
                <li><a href="#" class="fa fa-twitter"></a></li>
                <li><a href="#" class="fa fa-instagram"></a></li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
      <!-- end footer -->
    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- fullpage -->
    <script src="js/jquery.fullPage.js"></script>
    <!-- smoothScroll -->
    <script src="js/smoothscroll.js"></script>
    <!-- wow -->
    <script src="js/wow.min.js"></script>
    <!-- text rotater -->
    <script src="js/jquery.simple-text-rotator.js"></script>
    <!-- custom -->
    <script src="js/custom.js"></script>
  </body>
</html>
