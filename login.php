<?php
session_start();
include 'config/config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $identifier = $_POST['identifier'];
  $password = $_POST['password'];

  $errors = array();

  // Sanitize input
  $identifier = filter_var($identifier, FILTER_SANITIZE_STRING);

  // Validate input
  if (empty($identifier)) {
    $errors['username'] = "Please enter your username or email.";
  }

  if (empty($password)) {
    $errors['password'] = "Please enter your password.";
  }

  if (empty($errors)) {
    // Check if user exists
    $stmt = $mysqli->prepare("SELECT id, username, email, password FROM users WHERE username=? OR email=?");
    $stmt->bind_param("ss", $identifier, $identifier);
    $stmt->execute();
    $stmt->store_result();
    if ($stmt->num_rows == 1) {
      $stmt->bind_result($user_id, $username, $email, $hashed_password);
      $stmt->fetch();
      if (password_verify($password, $hashed_password)) {
        $_SESSION['user_id'] = $user_id;
        // Redirect to dashboard.php
        header("Location: dashboard/dashboard.php");
        exit();
      } else {
        $errors['login'] = "Invalid username or password.";
      }
    } else {
      $errors['login'] = "Invalid username or password.";
    }
    $stmt->close();

    // Remember Me functionality in login logic
    // Check if "Remember Me" checkbox is checked
    $remember = isset($_POST['remember']) && $_POST['remember'] === 'true';

    // If "Remember Me" checkbox is checked, set a cookie with user's credentials
    if ($remember) {
      setcookie("remember_username", $identifier, time() + (30 * 24 * 60 * 60)); // Set cookie for 30 days
      setcookie("remember_password", $password, time() + (30 * 24 * 60 * 60));
    } else {
      // If "Remember Me" checkbox is unchecked, delete any existing Remember Me cookies
      setcookie("remember_username", "", time() - 3600);
      setcookie("remember_password", "", time() - 3600);
    }

    // Error Handling: Redirect back to login page with error parameters in the URL
    if (!empty($errors['login'])) {
      header("Location: login.php?error=" . urlencode($errors['login']));
      exit();
    }
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <?php // Define the title for this specific page
  $title = "Login - Budget Mint";
  $meta_title = "";
  $meta_description = "";
  $meta_keywords = "";
  require ('dashboard/include/head.inc.php'); ?>
</head>

<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.php" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block">Budget Mint</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">
                  <div class="invalid-feedback">
                    <?php echo isset($errors['login']) ? $errors['login'] : ''; ?>
                  </div>
                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                    <p class="text-center small">Enter your username & password to login</p>
                  </div>

                  <?php require ('form/login_form.php'); ?>
                  <br>
                  <div class="col-12">
                    <p class="small mb-0">Don't have account? <a href="register.php">Create an
                        account</a></p>
                  </div>
                  <div class="col-12">
                    <p class="small mb-0">Forgot your password? <a href="password/password_reset_request.php">Reset it here</a>
                    </p>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->
  <?php require ('dashboard/include/script.inc.php'); ?>
</body>

</html>