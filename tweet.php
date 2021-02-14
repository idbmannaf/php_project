<?php
require __DIR__ . '/vendor/autoload.php';
use App\classes\Database;
use App\classes\Session;

if(!Session::getSessionData("loggedin")){
    header("Location:login.php");
}
$message = Session::getFlashData("message");
$conn = new Database();
//get form values start
if(isset($_GET['tid'])){
    $conn = New Database();
    $tid = $conn->escape($_GET['tid']); 
    $info = $conn->getRecord("tweets",$tid);
  
}

//end

?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>Add New Tweet</title>

    <!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/starter-template/"> -->

    

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">


    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="assets/css/starter-template.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
  </head>
  <body>
    
<!-- navbar start -->
<?php require "partials/navbar.php"; ?>
<!-- navbar end -->



  <div class="starter-template text-center py-5 px-3">
    <h1>welcome <?php echo Session::getSessionData("username") ?> : <?php echo Session::getSessionData("userid") ?></h1>
    <!-- flash message start -->
    <?php
if(isset($message) && $message){
    ?>
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Message: </strong> <?php echo $message; ?>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<?php
}
?>
    <!-- flash message end -->

    <h3><a href="tweetform.php">Add New</a></h3>
    <?php 
    if($info){
    ?>
    <div class="card mb-3">
  <img src="assets/tweetimage/<?php echo $info['image'] ?>" class="card-img-top" alt="<?php echo $info['title'] ?>">
  <div class="card-body">
    <h5 class="card-title"><?php echo $info['title'] ?></h5>
    <p class="card-text">
    <?php echo $info['details'] ?>
    </p>
    <p class="card-text"><small class="text-muted">Last updated <?php echo $info['created'] ?></small></p>
  </div>
</div>
    <?php
    }
    ?>
    
  </div>
<!-- footer start -->
<?php require "partials/footer.php"; ?>
<!-- footer end -->
<!--  -->




<!--  -->


<script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/ef16f745ed.js" crossorigin="anonymous"></script>

      
  </body>
</html>

