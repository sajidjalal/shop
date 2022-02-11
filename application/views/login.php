<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>Login | ABC - Admin & Dashboard Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="/public/layouts/assets/images/favicon.png">

    <!-- Bootstrap Css -->
    <link href="/public/layouts/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="/public/layouts/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="/public/layouts/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

</head>

<body>
    <div class="account-pages my-5 pt-sm-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card overflow-hidden">
                        <div class="bg-primary bg-soft">
                            <div class="row">
                                <div class="col-7">
                                    <div class="text-primary p-4">
                                        <h5 class="text-primary">Welcome Back !</h5>
                                        <p>Sign in to continue with ABC.</p>
                                    </div>
                                </div>
                                <div class="col-5 align-self-end">
                                    <img src="/public/layouts/assets/images/profile-img.png" alt="" class="img-fluid">
                                </div>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <div class="auth-logo">
                                <a href="index.html" class="auth-logo-light">
                                    <div class="avatar-md profile-user-wid mb-4">
                                        <span class="avatar-title rounded-circle bg-light">
                                            <img src="/public/layouts/assets/images/logo-light.svg" alt="" class="rounded-circle" height="34">
                                        </span>
                                    </div>
                                </a>

                                <a href="index.html" class="auth-logo-dark">
                                    <div class="avatar-md profile-user-wid mb-4">
                                        <span class="avatar-title rounded-circle bg-light">
                                            <img src="/public/layouts/assets/images/facebook_profile_image.png" alt="" class="rounded-circle" height="34">

                                        </span>
                                    </div>
                                </a>
                            </div>
                            <div class="p-2">
                                <form action="" name="signin" class="login">

                                    <div class="mb-3">
                                        <label for="Email" class="form-label">Email</label>
                                        <input type="text" class="form-control" id="email_signin" placeholder="Enter Email" name="email_signin" id="email_signin">
                                        <label id="email_signinxxx_Error" class="myError" style="display: none;"></label>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Password</label>
                                        <div class="input-group auth-pass-inputgroup">
                                            <input type="password" class="form-control" placeholder="Enter password" aria-label="Password" aria-describedby="password-addon" name="password_signin" id="password_signin">
                                            <button class="btn btn-light " type="button" id="password-addon"><i class="mdi mdi-eye-outline"></i></button>
                                            <label id="password_signin_Error" class="myError" style="display: none;"></label>
                                        </div>
                                    </div>

                                    <!-- <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="remember-check">
                                        <label class="form-check-label" for="remember-check">
                                            Remember me
                                        </label>
                                    </div> -->

                                    <div class="mt-3 d-grid">
                                        <button class="btn btn-primary waves-effect waves-light" type="submit">Log In</button>
                                    </div>

                                    <!-- <div class="mt-4 text-center">
                                        <h5 class="font-size-14 mb-3">Sign in with</h5>

                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <a href="javascript::void()" class="social-list-item bg-primary text-white border-primary">
                                                    <i class="mdi mdi-facebook"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="javascript::void()" class="social-list-item bg-info text-white border-info">
                                                    <i class="mdi mdi-twitter"></i>
                                                </a>
                                            </li>
                                            <li class="list-inline-item">
                                                <a href="javascript::void()" class="social-list-item bg-danger text-white border-danger">
                                                    <i class="mdi mdi-google"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div> -->

                                    <div class="mt-4 text-center">
                                        <a href="auth-recoverpw.html" class="text-muted"><i class="mdi mdi-lock me-1"></i> Forgot your password?</a>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="mt-5 text-center">

                        <div>
                            <!-- <p>Don't have an account ? <a href="auth-register.html" class="fw-medium text-primary"> Signup now </a> </p> -->

                            <p>©
                                <script>
                                    document.write(new Date().getFullYear())
                                </script>
                                ABC. Crafted with
                                <i class="mdi mdi-heart text-danger"></i> by ABC
                            </p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- end account-pages -->

    <!-- JAVASCRIPT -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="/public/layouts/assets/libs/jquery/jquery.min.js"></script>
    <script src="/public/layouts/assets/libs/jquery/jquery.validate.min.js"></script>
    <script src="/public/layouts/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/public/layouts/assets/libs/metismenu/metisMenu.min.js"></script>
    <script src="/public/layouts/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="/public/layouts/assets/libs/node-waves/waves.min.js"></script>

    <!-- App js -->
    <script src="/public/layouts/assets/js/app.js"></script>

    <!-- Custome js -->
    <script src="/public/layouts/assets/customeTheme/js/login.js"></script>

</body>

</html>