<?php
session_set_cookie_params([
    'lifetime' => 0,
    'path' => '/',
    'domain' => 'localhost',
    'secure' => true,
    'httponly' => true,
]);

session_start();
include 'config/config.php';

if (!isset($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

$prev_full_name = $prev_username = $prev_email = $prev_date_of_birth = $prev_mobile_number = $prev_country_code = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
        die("CSRF token validation failed.");
    }

    $full_name = $_POST['full_name'];
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    $date_of_birth = $_POST['date_of_birth'];
    $mobile_number = $_POST['mobile_number'];
    $country_code = $_POST['country_code'];


    // Store previous form data
    $prev_full_name = $full_name;
    $prev_username = $username;
    $prev_email = $email;
    $prev_date_of_birth = $date_of_birth;
    $prev_mobile_number = $mobile_number;
    $prev_country_code = $country_code;

    // Validate input and enforce password policies
    $errors = array();

    if (empty($full_name)) {
        $errors['full_name'] = "Enter your name.";
    }

    // if (empty($date_of_birth)) {
    //     $errors['date_of_birth'] = "Enter your date of birth.";
    // }  


    // Check if date of birth is provided
    if (empty($date_of_birth)) {
        $errors['date_of_birth'] = "Enter your date of birth.";
    } else {
        // Convert date of birth to a DateTime object for comparison
        $dob = new DateTime($date_of_birth);
        // Define the minimum age requirement
        $min_age = 13;
        $min_month_offset = 6;
        // Calculate the minimum allowed date (13 years and 6 months ago from today)
        $min_allowed_date = new DateTime();
        $min_allowed_date->modify("-$min_age years");
        $min_allowed_date->modify("-$min_month_offset months");

        // Compare the date of birth with the minimum allowed date
        if ($dob > $min_allowed_date) {
            $errors['date_of_birth'] = "You must be at least $min_age years and $min_month_offset months old.";
        }
    }




    if (empty($mobile_number)) {
        $errors['mobile_number'] = "Enter your mobile number.";
    }

    if (empty($email)) {
        $errors['email'] = "Enter your email address.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors['email'] = "Invalid email format.";
    }

    if (empty($username)) {
        $errors['username'] = "Choose a username.";
    }

    if (empty($password)) {
        $errors['password'] = "Enter your password.";
    } else {
        // Trim the password to remove leading and trailing spaces
        $password = trim($password);
    
        if (strlen($password) < 8) {
            $errors['password'] = "Password must be at least 8 characters long.";
        } elseif (!preg_match("/[A-Z]/", $password) || !preg_match("/[a-z]/", $password) || !preg_match("/\d/", $password) || !preg_match("/\W/", $password)) {
            $errors['password'] = "Password must include at least one uppercase letter, one lowercase letter, one digit, and one special character.";
        }
    }
    

    if (empty($confirm_password)) {
        $errors['confirm_password'] = "Confirm your password.";
    } elseif ($password !== $confirm_password) {
        $errors['confirm_password'] = "Passwords do not match.";
    }

    if (empty($errors)) {
        // Check if email already exists
        $stmt = $mysqli->prepare("SELECT id FROM users WHERE email=?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();
        if ($stmt->num_rows > 0) {
            $errors['email'] = "Email already exists. Please use a different email.";
        }

        // Check if username already exists
        $stmt = $mysqli->prepare("SELECT id FROM users WHERE username=?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->store_result();
        if ($stmt->num_rows > 0) {
            $errors['username'] = "Username already exists. Please choose a different username.";
        }

        // Check if mobile number already exists
        $stmt = $mysqli->prepare("SELECT id FROM users WHERE mobile_number=?");
        $stmt->bind_param("s", $mobile_number);
        $stmt->execute();
        $stmt->store_result();
        if ($stmt->num_rows > 0) {
            $errors['mobile_number'] = "Mobile number already exists. Please use a different mobile number.";
        }

        // If none of the above checks fail, insert new user into database
        if (empty($errors)) {
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            $registration_ip = $_SERVER['REMOTE_ADDR']; // Get user's IP address
            $registration_device = $_SERVER['HTTP_USER_AGENT']; // Get user's device info
            $registration_location = isset($_POST['registration_location']) ? $_POST['registration_location'] : ''; // Get user's location from form submission

            // Additional network information can be captured here

            // Insert the user record into the database
            $stmt = $mysqli->prepare("INSERT INTO users (full_name, username, email, password, date_of_birth, mobile_number, country_code, registration_ip, registration_device, registration_location) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("ssssssssss", $full_name, $username, $email, $hashed_password, $date_of_birth, $mobile_number, $country_code, $registration_ip, $registration_device, $registration_location);
            if ($stmt->execute()) {
                // Registration successful, redirect to login page
                header("Location: login.php");
                exit();
            } else {
                $errors['general'] = "Error: " . $stmt->error;
            }
            $stmt->close();
        }
    }
}

// Session Hijacking Prevention: Regenerate session ID after successful login
session_regenerate_id(true);
 
// Set security headers
    header("Content-Security-Policy: default-src 'self'; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com;");
    header("X-Content-Type-Options: nosniff");
    header("X-Frame-Options: DENY");
    header("X-XSS-Protection: 1; mode=block");


session_regenerate_id(true);
?>

<!DOCTYPE html>
<html lang="en">
<head>
<?php // Define the title for this specific page
    $title = "Register - Budget Mint";
    $meta_title = "";
    $meta_description = "";
    $meta_keywords = "";
    require ('dashboard/include/head.inc.php'); ?>
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com;">
</head>

<body>
    <main>
        <div class="container">
            <section
                class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
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

                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
                                        <p class="text-center small">Enter your personal details to create account</p>
                                    </div>

                                    <?php require ('form/register_form.php'); ?>


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




<!-- API K shat ho ga
<script>
window.addEventListener('DOMContentLoaded', (event) => {
    // Function to get user's location
    function getUserLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            console.log("Geolocation is not supported by this browser.");
        }
    }

    // Callback function to handle user's location
    function showPosition(position) {
        const latitude = position.coords.latitude;
        const longitude = position.coords.longitude;
        // Here, you can store latitude and longitude in the database or use a reverse geocoding service to get location details
        // For example:
        fetch(`https://api.opencagedata.com/geocode/v1/json?q=${latitude}+${longitude}&key=YOUR_API_KEY`)
            .then(response => response.json())
            .then(data => {
                const location = data.results[0].formatted;
                console.log(location);
                // Now you can store the location in a hidden form field or pass it to the server via AJAX
                document.getElementById('registration_location').value = location;
            })
            .catch(error => console.error('Error:', error));
    }

    // Call the function to get user's location when the page loads
    getUserLocation();
});
</script> -->