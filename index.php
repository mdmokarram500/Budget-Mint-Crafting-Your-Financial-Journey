<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1w5SmgVsja7Vz6RFR5LH8+aR8FYu8QcEIfyQ0Qfs3BCt7F30V4O1bntC4n5qc0jrIqNHzdty9bDlIaD5Ud8eGQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <title>Budget Mint - Personal Finance Management</title>
    <style>
        body {
            padding-top: 3rem;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 800px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .btn-custom {
            margin-top: 1rem;
        }
        .feature-icon {
            text-align: center;
            margin-bottom: 1rem;
        }
        .feature-icon i {
            color: #007bff;
        }
        .feature-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }
        .feature-description {
            color: #666;
            margin-bottom: 1rem;
        }
        .carousel-item img {
            border-radius: 10px;
            width: 100%; /* Make the image fill the entire width */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Welcome to Budget Mint</h1>
        <p class="text-center">Budget Mint is your ultimate solution for personal finance management. Take control of your finances and achieve your financial goals with ease.</p>
        <img src="assets/f_end_page/report.png" alt="">
        <div class="row justify-content-center">
            <div class="col-auto">
                <a href="login.php" class="btn btn-primary btn-lg btn-custom">Login</a>
            </div>
            <div class="col-auto">
                <a href="register.php" class="btn btn-secondary btn-lg btn-custom">Register</a>
            </div>
        </div>

        <div class="row"> 
          <center>

            <h4 class="mt-5 mb-3">Key Features</h4>
          </center>
          <div class="col-md-4">
            <div class="feature-icon"><i class="fas fa-money-check-alt fa-3x"></i></div>
                <h5 class="feature-title">Expense Tracking</h5>
                <p class="feature-description">Record and categorize your daily expenses for better financial awareness and management.</p>
            </div>
            <div class="col-md-4">
                <div class="feature-icon"><i class="fas fa-hand-holding-usd fa-3x"></i></div>
                <h5 class="feature-title">Income Tracking</h5>
                <p class="feature-description">Log your various sources of income, including irregular or one-time income, to keep track of your earnings.</p>
            </div>
            <div class="col-md-4">
                <div class="feature-icon"><i class="fas fa-chart-line fa-3x"></i></div>
                <h5 class="feature-title">Budget Creation and Management</h5>
                <p class="feature-description">Create personalized budgets for different categories, set spending limits, and visualize cash flow.</p>
            </div>
           </div>

        <p class="text-center mt-5">Start your journey to financial success today with Budget Mint!</p>
    </div>
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-mEuF8NA43ZeoZuvuRtRm+a75k5S2t0OyZ5l5B2b00IyFMaVg/DzLTKOtLQ1Lv+dT" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-xrXJVRDuhQH3cd2VscXJWt3wPGytkrQQmgwfs2A09GvUz9uqMs33PCKF5a/y/aUh" crossorigin="anonymous"></script>
</body>
</html>
