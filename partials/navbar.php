<?php
use App\classes\Session;
?>
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.php"><img class="img-fluid" src="assets/img/logo.png" alt="logo"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
        <li class="nav-item active">
          <a class="nav-link" aria-current="page" href="index.php">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Category</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Archive</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Blog</a>
        </li>
       
        <?php
if(Session::getSessionData("loggedin")){
        ?>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">My Menu</a>
          <ul class="dropdown-menu" aria-labelledby="dropdown01">
            <li><a class="dropdown-item" href="tweetform.php">New</a></li>
            <li><a class="dropdown-item" href="tweetall.php">All Tweets</a></li>
            <li><a class="dropdown-item" href="dashboard.php">Profile</a></li>
          </ul>
        </li>
        <?php
}
        ?>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
      <?php
if(Session::getSessionData("loggedin")){
echo "<a href='#'>".Session::getSessionData("username") . "</a><a href='logout.php'>Logout</a>";
}
else{
      ?>
      <a class="btn btn-outline-success" type="button" href="login.php">Login</a> 
      <a class="btn btn-outline-success" type="button" href="registration.php">Registration</a>
    <?php
}
    ?>
    </div>
  </div>
</nav>
