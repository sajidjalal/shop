<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>Profile Page | ABC - Admin & Dashboard Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="/public/layouts/assets/images/favicon.png">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- DataTables -->
    <link href="/public/layouts/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/public/layouts/assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />

    <!-- Responsive datatable examples -->
    <link href="/public/layouts/assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />


    <!-- Bootstrap Css -->
    <link href="/public/layouts/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="/public/layouts/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="/public/layouts/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

    <!-- Custome Css -->
    <link href="/public/layouts/assets/customeTheme/css/custome.css" id="app-style" rel="stylesheet" type="text/css" />



    <!-- JAVASCRIPT -->
    <script src="/public/layouts/assets/libs/jquery/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
    <script src="/public/layouts/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/public/layouts/assets/libs/sweetalert/js/sweetalert.min.js"></script>
    <script src="/public/layouts/assets/libs/metismenu/metisMenu.min.js"></script>
    <script src="/public/layouts/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="/public/layouts/assets/libs/node-waves/waves.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- <script src="/public/layouts/assets/libs/jquery/jquery.validate.min.js"></script> -->


</head>

<body data-sidebar="dark">

    <!-- <body data-layout="horizontal" data-topbar="dark"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">


        <header id="page-topbar">
            <div class="navbar-header">
                <div class="d-flex">
                    <!-- LOGO -->
                    <div class="navbar-brand-box">
                        <a href="index.html" class="logo logo-dark">
                            <span class="logo-sm">
                                <img src="/public/layouts/assets/images/facebook_profile_image.png" alt="" height="22">
                            </span>
                            <span class="logo-lg">
                                <img src="/public/layouts/assets/images/facebook_profile_image.png" alt="" height="17">
                            </span>
                        </a>

                        <a href="index.html" class="logo logo-light">
                            <span class="logo-sm">
                                <img src="/public/layouts/assets/images/facebook_profile_image.png" alt="" height="22">
                            </span>
                            <span class="logo-lg">
                                <img src="/public/layouts/assets/images/facebook_profile_image.png" alt="" height="19">
                            </span>
                        </a>
                    </div>

                    <button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect" id="vertical-menu-btn">
                        <i class="fa fa-fw fa-bars"></i>
                    </button>


                </div>

                <div class="d-flex">

                    <div class="dropdown d-inline-block d-lg-none ms-2">
                        <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="mdi mdi-magnify"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0" aria-labelledby="page-header-search-dropdown">

                            <form class="p-3">
                                <div class="form-group m-0">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="dropdown d-inline-block">
                        <button type="button" class="btn header-item waves-effect" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img id="header-lang-img" src="/public/layouts/assets/images/flags/india.png" alt="Header Language" height="16">
                        </button>
                        <div class="dropdown-menu dropdown-menu-end">


                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="en">
                                <img src="/public/layouts/assets/images/flags/india.png" alt="user-image" class="me-1" height="12"> <span class="align-middle">English</span>
                            </a>


                        </div>
                    </div>


                    <div class="dropdown d-none d-lg-inline-block ms-1">
                        <button type="button" class="btn header-item noti-icon waves-effect" data-toggle="fullscreen">
                            <i class="bx bx-fullscreen"></i>
                        </button>
                    </div>



                    <div class="dropdown d-inline-block">
                        <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="rounded-circle header-profile-user" src="https://i.stack.imgur.com/YQu5k.png" alt="Header Avatar">
                            <span class="d-none d-xl-inline-block ms-1" key="t-<?= $userInfo->first_name; ?>">
                                <?= $userInfo->first_name; ?>
                            </span>
                            <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end">
                            <!-- item-->
                            <a class="dropdown-item" href="/admin/profile">
                                <i class="bx bx-user font-size-16 align-middle me-1"></i>
                                <span key="t-profile">
                                    Profile
                                </span>
                            </a>

                            <!-- <a class="dropdown-item" href="#"><i class="bx bx-wallet font-size-16 align-middle me-1"></i> <span key="t-my-wallet">My Wallet</span></a>
                            <a class="dropdown-item d-block" href="#"><span class="badge bg-success float-end">11</span><i class="bx bx-wrench font-size-16 align-middle me-1"></i> <span key="t-settings">Settings</span></a>
                            <a class="dropdown-item" href="#"><i class="bx bx-lock-open font-size-16 align-middle me-1"></i> <span key="t-lock-screen">Lock screen</span></a>
                            <div class="dropdown-divider"></div> -->

                            <a class="dropdown-item text-danger" href="#">
                                <i class="bx bx-power-off font-size-16 align-middle me-1 text-danger"></i> <span key="t-logout" onclick="logout();">
                                    Logout
                                </span>
                            </a>
                        </div>
                    </div>

                    <div class="dropdown d-inline-block">
                        <!-- <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
                            <i class="bx bx-cog bx-spin"></i>
                        </button> -->
                    </div>

                </div>
            </div>
        </header>

        <!-- ========== Left Sidebar Start ========== -->
        <div class="vertical-menu">

            <div data-simplebar class="h-100">

                <!--- Sidemenu -->
                <div id="sidebar-menu">
                    <!-- Left Menu Start -->
                    <ul class="metismenu list-unstyled" id="side-menu">
                        <li class="menu-title" key="t-menu">Menu</li>

                        <li>
                            <a href="javascript: void(0);" class="has-arrow waves-effect">
                                <i class="bx bx-home-circle"></i>
                                <span key="t-dashboards">Dashboards</span>
                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li><a href="/admin/profile" key="t-task-list">
                                        Profile
                                    </a></li>
                                <!-- <li><a href="tasks-kanban.html" key="t-kanban-board">Kanban Board</a></li>
                                <li><a href="tasks-create.html" key="t-create-task">Create Task</a></li> -->
                            </ul>
                        </li>



                        <li>
                            <a href="javascript: void(0);" class="has-arrow waves-effect">
                                <i class="bx bx-layout"></i>
                                <span key="t-item">Products</span>
                            </a>
                            <ul class="sub-menu" aria-expanded="true">
                                <li>
                                    <a href="/admin/item-list" key="t-itemlist">Item List</a>

                                </li>
                                <li>
                                    <!-- <a href="/admin/cust-create" key="t-createitem">Create Lead</a> -->
                                </li>
                            </ul>
                        </li>

                        <!-- <li>
                            <a href="javascript: void(0);" class="has-arrow waves-effect">
                                <i class="bx bx-layout"></i>
                                <span key="t-product">Product</span>
                            </a>
                            <ul class="sub-menu" aria-expanded="true">
                                <li>
                                    <a href="/admin/productlist" key="t-itemlist">Product List</a>
                                </li>
                                <li> <a href="javascript: void(0);" key="t-createitem">Create Product</a>

                                </li>
                            </ul>
                        </li> -->

                        <!-- <li>
                            <a href="javascript: void(0);" class="has-arrow waves-effect">
                                <i class="bx bx-layout"></i>
                                <span key="t-product">Project</span>
                            </a>
                            <ul class="sub-menu" aria-expanded="true">
                                <li>
                                    <a href="/admin/projectList" key="t-itemlist">Project List</a>
                                </li>
                                <li> <a href="javascript: void(0);" key="t-createitem">Create Project</a>

                                </li>
                            </ul>
                        </li> -->







                    </ul>
                </div>
                <!-- Sidebar -->
            </div>
        </div>
        <!-- Left Sidebar End -->



        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->
        <div class="main-content">