<?php
// dotenv.php

// Specify the path to your .env file
$envFilePath = __DIR__ . '/.env';

// Check if the .env file exists
if (file_exists($envFilePath)) {
    // Parse the .env file
    $env = parse_ini_file($envFilePath);

    // Set environment variables
    foreach ($env as $key => $value) {
        putenv("$key=$value"); // Set environment variable for current script execution
        $_ENV[$key] = $value; // Set environment variable for current and child processes
    }
} else {
    // Handle the case where .env file is missing
    die('.env file not found. Please create a .env file in your project directory.');
}
?>
