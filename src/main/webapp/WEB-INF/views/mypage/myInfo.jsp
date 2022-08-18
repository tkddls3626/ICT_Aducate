<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = CmmUtil.nvl((String)session.getAttribute("sessionId"));
    UserInfoDTO rDTO = (UserInfoDTO)request.getAttribute("rDTO");

    System.out.println(name);
%>

<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
-->
<!-- beautify ignore:start -->
<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="/assets/"
        data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Horizontal Layouts - Forms | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/assets/js/config.js"></script>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
            <div class="app-brand demo">
                <a href="/sneat/main-page" class="app-brand-link">
              <span class="app-brand-logo demo">
                <img src="/assets/img/icons/aducator/logo-side.jpg" alt="logo side"/>
              </span>
                </a>

                <%--            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">--%>
                <%--              <i class="bx bx-chevron-left bx-sm align-middle"></i>--%>
                <%--            </a>--%>
            </div>

            <div class="menu-inner-shadow"></div>

            <ul class="menu-inner py-1">
                <li class="menu-header small text-uppercase"></li>
                <li class="menu-item">
                    <a href="/sneat/cards-basic" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-dock-top"></i>
                        <div data-i18n="Account Settings">User</div>
                    </a>
                </li>
                <li class="menu-header small text-uppercase">
              <span class="menu-header-text">
                <hr class="dot">
              </span>
                </li>
                <li class="menu-item">
                    <a href="/sneat/cards-basic" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-dock-top"></i>
                        <div data-i18n="Account Settings">quiz</div>
                    </a>
                </li>
                <!-- Components -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text"><hr /></span></li>
                <!-- Cards -->
                <li class="menu-item">
                    <a href="/sneat/cards-basic" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-collection"></i>
                        <div data-i18n="Basic">Community</div>
                    </a>
                </li>
                <!-- User interface -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text"><hr /></span></li>
                <li class="menu-item">
                    <a href="/game" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-collection"></i>
                        <div data-i18n="Basic">Game</div>
                    </a>
                </li>
                <!-- Forms & Tables -->
                <li class="menu-header small text-uppercase"><span class="menu-header-text"><hr /></span></li>
                <!-- Forms -->
                <li class="menu-item">
                    <a href="/myInfo" class="menu-link">
                        <i class="menu-icon tf-icons bx bx-collection"></i>
                        <div data-i18n="Basic">my page</div>
                    </a>
                </li>
                <li class="menu-header small text-uppercase">
                </li>
                <li class="menu-item">
                    <a href="/logoutSession" class="menu-link">
                        <div data-i18n="Basic" style="color: red;">logout</div>
                    </a>
                </li>
            </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Navbar -->

            <nav
                    class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                    id="layout-navbar"
            >
                <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                    <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                        <i class="bx bx-menu bx-sm"></i>
                    </a>
                </div>

                <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                    <ul class="navbar-nav flex-row align-items-center ms-auto">
                        <!-- Place this tag where you want the button to render. -->
                        <li class="nav-item lh-1 me-3">
                            <a
                                    class="github-button"
                                    href="https://github.com/themeselection/sneat-html-admin-template-free"
                                    data-icon="octicon-star"
                                    data-size="large"
                                    data-show-count="true"
                                    aria-label="Star themeselection/sneat-html-admin-template-free on GitHub">Star</a
                            >
                        </li>

                        <!-- User -->
                        <li class="nav-item navbar-dropdown dropdown-user dropdown">
                            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                <div class="avatar avatar-online">
                                    <img src="/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar avatar-online">
                                                    <img src="/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <span class="fw-semibold d-block"><%=name%></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <i class="bx bx-user me-2"></i>
                                        <span class="align-middle">My Profile</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <i class="bx bx-cog me-2"></i>
                                        <span class="align-middle">Settings</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">
                        <span class="d-flex align-items-center align-middle">
                          <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                          <span class="flex-grow-1 align-middle">Billing</span>
                          <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="/sneat/auth-login-basic">
                                        <i class="bx bx-power-off me-2"></i>
                                        <span class="align-middle">Log Out</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!--/ User -->
                    </ul>
                </div>
            </nav>

            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">내 정보/</span> my page</h4>

                    <!-- Basic Layout & Basic with Icons -->
                        <!-- Basic with Icons -->
                        <div class="col-xxl">
                            <div class="card mb-4">
                                <div class="card-header d-flex align-items-center justify-content-between">
                                    <h5 class="mb-0">My Info</h5>
                                    <small class="text-muted float-end"></small>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="row mb-3">
                                            <label class="col-sm-2 col-form-label" for="basic-icon-default-fullname">Name</label>
                                            <div class="col-sm-10">
                                                <div class="input-group input-group-merge">
                              <span id="basic-icon-default-fullname2" class="input-group-text"
                              ><i class="bx bx-user"></i
                              ></span>
                                                    <input
                                                            type="text"
                                                            class="form-control"
                                                            id="basic-icon-default-fullname"
                                                            value="<%=name%>" readonly
                                                            aria-label="John Doe"
                                                            aria-describedby="basic-icon-default-fullname2"
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-2 col-form-label" for="basic-icon-default-company">User ID</label>
                                            <div class="col-sm-10">
                                                <div class="input-group input-group-merge">
                              <span id="basic-icon-default-company2" class="input-group-text"
                              ><i class="bx bx-user-pin"></i
                              ></span>
                                                    <input
                                                            type="text"
                                                            id="basic-icon-default-company"
                                                            class="form-control"
                                                            value="<%=rDTO.getUser_id()%>" readonly
                                                            aria-label="ACME Inc."
                                                            aria-describedby="basic-icon-default-company2"
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-2 col-form-label" for="basic-icon-default-email">Email</label>
                                            <div class="col-sm-10">
                                                <div class="input-group input-group-merge">
                                                    <span class="input-group-text"><i class="bx bx-envelope"></i></span>
                                                    <input
                                                            type="text"
                                                            id="basic-icon-default-email"
                                                            class="form-control"
                                                            value="<%=rDTO.getUser_email()%>" readonly
                                                            aria-label="john.doe"
                                                            aria-describedby="basic-icon-default-email2"
                                                    />
                                                </div>
                                                <div class="form-text">You can use letters, numbers & periods</div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-2 form-label" for="basic-icon-default-phone">Age</label>
                                            <div class="col-sm-10">
                                                <div class="input-group input-group-merge">
                              <span id="basic-icon-default-age" class="input-group-text"
                              ><i class="bx bx-card"></i
                              ></span>
                                                    <input
                                                            type="text"
                                                            id="basic-icon-default-phone"
                                                            class="form-control phone-mask"
                                                            value="<%=rDTO.getAge()%>" readonly
                                                            aria-label="658 799 8941"
                                                            aria-describedby="basic-icon-default-phone2"
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <label class="col-sm-2 form-label" for="basic-icon-default-sex">Sex</label>
                                            <div class="col-sm-10">
                                                <div class="input-group input-group-merge">
                             <span id="basic-icon-default-se" class="input-group-text"
                             ><i class="bx bx-card"></i
                             ></span>
                                                    <input
                                                            type="text"
                                                            id="basic-icon-default-sex"
                                                            class="form-control phone-mask"
                                                            value="<%=rDTO.getSex()%>" readonly
                                                            aria-label="658 799 8941"
                                                            aria-describedby="basic-icon-default-phone2"
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row justify-content-end">
                                            <div class="col-sm-10">
                                                <button type="button" onclick="location.href='/myInfoUpdate'" class="btn btn-primary">내정보 수정하기</button>
                                                <button type="button" onclick="location.href='/updatePasswd'" class="btn btn-primary">비밀번호 수정</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- / Content -->

                <!-- Footer -->
                <footer class="content-footer footer bg-footer-theme">
                    <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                        <div class="mb-2 mb-md-0">
                            ©
                            <script>
                                document.write(new Date().getFullYear());
                            </script>
                            , made with ❤️ by
                            <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                        </div>
                        <div>
                            <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                            <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                            <a
                                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                                    target="_blank"
                                    class="footer-link me-4"
                            >Documentation</a
                            >

                            <a
                                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                                    target="_blank"
                                    class="footer-link me-4"
                            >Support</a
                            >
                        </div>
                    </div>
                </footer>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>

    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->


<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="/assets/vendor/libs/jquery/jquery.js"></script>
<script src="/assets/vendor/libs/popper/popper.js"></script>
<script src="/assets/vendor/js/bootstrap.js"></script>
<script src="/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="/assets/js/main.js"></script>

<!-- Page JS -->

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
