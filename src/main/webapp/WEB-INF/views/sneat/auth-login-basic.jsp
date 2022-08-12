<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  class="light-style customizer-hide"
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

    <title>Login Basic - Pages | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

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
    <!-- Page -->
    <link rel="stylesheet" href="/assets/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/assets/js/config.js"></script>

    <style>
      .snslogin {
        display: inline-block;
        list-style: none;
        padding-left: 0;
      }
      .snslogin li {
        float:right;
        display: inline-block;
        margin-right: 15px;
        width: 30px;
      }
      .snslogin li img {
        width: 100%;
      }
      .snslogin span {
        margin-left: 5px;
        color: #697a8d;
      }
    </style>
  </head>

  <body>
    <!-- Content -->
    <div style="position: fixed; top: 10px; left: 20px;">
      <img src="/assets/img/icons/aducator/logo-side.jpg" alt="logo side"/>
    </div>
    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <a href="/sneat/main-page" class="app-brand-link gap-2">
                  <img src="/assets/img/icons/aducator/logo-main.jpg" alt="logo main"/>
                </a>
              </div>
              <!-- /Logo -->

              <!-- 22.08.02 hyegyeong -->
              <form id="formAuthentication" class="mb-3" action="/userCheck"  method="POST">
                <div class="mb-3">
                  <input
                    type="text"
                    class="form-control"
                    id="email"
                    name="user_id"
                    placeholder="ID / E-mail"
                    autofocus
                  />
                </div>
                <div class="mb-3 form-password-toggle">
                  <div class="input-group input-group-merge">
                    <input
                      type="password"
                      id="password"
                      class="form-control"
                      name="user_pwd"
                      placeholder="PASSWORD"
                      aria-describedby="password"
                    />
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                  </div>
                </div>
                <!--
                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="remember-me" />
                    <label class="form-check-label" for="remember-me"> Remember Me </label>
                  </div>
                </div>
                -->
                <div class="mb-3">
                  <button class="btn btn-primary d-grid w-100" type="submit">Log in</button>
                </div>
              </form>
              <div style="text-align: center">
                <a href="/sneat/auth-forgot-id-basic">
                  <small>아이디 찾기</small>
                </a>
                |
                <a href="/sneat/auth-forgot-password-basic">
                  <small>비밀번호 찾기</small>
                </a>
              </div>
              <p class="text-center">
                <a href="/sneat/auth-register-basic">
                  <span>Sign Up</span>
                </a>
              </p>
            </div>
            <ul class="snslogin">
              <li><img src="/assets/img/icons/aducator/twitter.jpg" alt="twitter login"/></li>
              <li><img src="/assets/img/icons/aducator/naver.jpg" alt="naver login"/></li>
              <li><img src="/assets/img/icons/aducator/facebook.jpg" alt="facebook login"/></li>
              <li><img src="/assets/img/icons/aducator/google.jpg" alt="google login"/></li>
            </ul>
          </div>
          <!-- /Register -->
        </div>
      </div>
    </div>

    <!-- / Content -->
<!--
    <div class="buy-now">
      <a
        href="https://themeselection.com/products/sneat-bootstrap-html-admin-template/"
        target="_blank"
        class="btn btn-danger btn-buy-now"
        >Upgrade to Pro</a
      >
    </div>
-->
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
