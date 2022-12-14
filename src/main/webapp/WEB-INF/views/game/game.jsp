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
    <style>
        #info{float:left; margin-left: 50px; font-size : 30px;}
        #contents{background-color: rgb(199, 199, 199); width: 1350px; height: 750px; margin: 0 auto;}
        #tajaContents{width:100%; height: 95%; position: relative}
        #inputContents{text-align: center; border-top-style: solid; border-top-color: black; padding-top: 5px;}
        #inputText{display:inline-block}
        #inputBtn{display:inline-block;}
    </style>
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
                    <a href="/sneat/cards-basic" class="menu-link">
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
            <div id="info">
                <div id="score"></div>
                <div id="life"></div>
            </div>
            <div id="contents">
                <div id="tajaContents"></div>
                <div id="inputContents">
                    <div id="inputText">
                        <input type="text" id="tajaText" />
                    </div>
                    <div id="inputBtn">
                        <button id="tajaBtn">start</button>
                    </div>
                </div>
            </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
                <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                    <div class="mb-2 mb-md-0">
                        ??
                        <script>
                            document.write(new Date().getFullYear());
                        </script>
                        , made with ?????? by
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
<script type="text/javascript">
    var taja = ["?????? ?????? ?????? ??????", "??????", "????????? ??????????????????", "?????????", "?????? ?????????", "????????? ??????????????? ?????? ???????????????", "????????? ?????? ??????", "????????? ?????????", "????????? ????????? ??? ????????????", "????????????",
        "?????? ????????? ????????? ?????? ???????????? ?????????", "Space Angel", "??????????????????", "Give All to Love", "?????? ????????? ?????? ??????", "????????????", "?????? ??????", "????????????", "49?????????", "??????"
    ];

    var tajaContents = document.getElementById("tajaContents");

    // ?????? ??????
    var newObj = [];

    // taja??? ??? ???????????? top??? ???????????? ?????? ?????????
    var plusTop = new Array(taja.length);
    for (let i = 0; i < plusTop.length; i++) {
        plusTop[i] = 0;
    }

    const TAJAWIDTH = 150;
    const TAJAHEIGHT = 30;

    // setInterval??? ?????? ??????
    const DRAWTIME = 1000;
    const DOWNTIME = 500;

    // ?????? ??????
    var life = 5;
    var lifeDiv = document.getElementById("life");
    lifeDiv.innerHTML = "LIFE : " + life;

    // ?????? ??????
    var score = 0;
    var scoreDiv = document.getElementById("score");
    scoreDiv.innerHTML = "SCORE : " + score;

    // taja????????? index ?????? ?????? ??????
    var idx = 0;

    // ????????? ????????? ???????????? ?????? ?????????
    function drawTaja() {
        var randomPick = 0;
        var temp = null;

        // ???????????? taja????????? ???????????? ?????? for???
        for (let i = 0; i < taja.length; i++) {
            randomPick = Math.round(Math.random() * (taja.length - 1));
            temp = taja[randomPick];
            taja[randomPick] = taja[i];
            taja[i] = temp;
        }

        // ????????? ???????????? ????????? ????????? ????????? ???????????? ?????? setInteval ????????? ?????????.
        var drawInterval = setInterval(function () {

            var leftWidth = Math.round(Math.random() * 1200);
            var tajaDiv = document.createElement("div");
            tajaDiv.classList.add("tajaWord");
            tajaDiv.style.width = TAJAWIDTH + "px";
            tajaDiv.style.height = TAJAHEIGHT + "px";
            tajaDiv.style.position = "absolute";
            tajaDiv.style.textAlign = "center";
            tajaDiv.innerHTML = taja[idx++];
            tajaContents.appendChild(tajaDiv);
            // leftWidth ????????? 0 < leftWidth < 1200 ?????? ?????????????????? ?????????
            // ????????? width??? ?????? ????????? ?????? tajaContents??? ????????? ????????? ??? ????????????.
            // ????????? ??? ????????? ???????????? ?????? ??????????????? ?????? ?????? ?????????????????? ???????????????.
            if (leftWidth + TAJAWIDTH >= tajaContents.offsetWidth) {
                tajaDiv.style.left = (leftWidth - TAJAWIDTH) + "px";
            } else {
                tajaDiv.style.left = leftWidth + "px";
            }

            // ????????? tajaDiv??? ????????? ?????? newObj ????????? ?????????.
            newObj.push(tajaDiv);

            if (newObj.length === taja.length) {
                clearInterval(drawInterval);
            }
        }, DRAWTIME);
    }
    // ????????? ???????????? ?????? ?????????
    function downTaja() {
        setInterval(function () {
            for (let i = 0; i < taja.length; i++) {
                if (i < newObj.length) {
                    newObj[i].style.top = plusTop[i] + "px";
                    // ????????? ????????? ??????(??????) ???????????? ????????? ?????? ??????
                    if (plusTop[i] + TAJAHEIGHT >= tajaContents.offsetHeight) {
                        if (tajaContents.contains(newObj[i])) {
                            tajaContents.removeChild(newObj[i]);
                            life--;
                            lifeDiv.innerHTML = "LIFE : " + life;

                            // ????????? ?????? ????????? ??????
                            if (life === 0) {
                                alert('5?????? ????????? ?????? ??????????????????.');
                                alert('??? ' + score + '?????? ?????????????????????.');
                                location.reload();
                            }

                            // life??? ?????? ????????? ????????? ???????????? ??????
                            if (newObj.length === taja.length) { // ????????? ????????? ??? ????????? ??????
                                if (!tajaContents.hasChildNodes()) { // ???????????? ????????? ???????????? ?????? ??????
                                    alert('?????? ????????? ???????????????.(?????????)');
                                    alert('??? ' + score + '?????? ?????????????????????.');
                                    location.reload();
                                }
                            }

                        }
                    }
                    plusTop[i] += 30;
                }
            }
        }, DOWNTIME);

    }


    var tajaText = document.getElementById("tajaText");
    tajaText.addEventListener("keydown", function (e) {
        // enter ????????? ???
        if (e.keyCode === 13) {
            for (let i = 0; i < newObj.length; i++) {
                // ?????? ??? ????????? ????????? ????????? ???????????? ???
                if (tajaText.value === newObj[i].innerHTML) {
                    tajaContents.removeChild(newObj[i]);
                    score += 100;
                    scoreDiv.innerHTML = "SCORE : " + score;

                    // ????????? ????????? ????????? ????????? ??????
                    // life??? ??? ?????????????????? clear ?????? ??????
                    if (newObj.length === taja.length) {
                        if (!tajaContents.hasChildNodes()) {
                            alert('?????? ????????? ???????????????.(?????????)');
                            alert('??? ' + score + '?????? ?????????????????????.');
                            location.reload();
                        }

                    }

                }
            }
            // enter ????????? ??? input ??? ?????????
            tajaText.value = "";
        }
    });

    // ?????? ????????? ?????? ??????
    var count = 0;

    // ????????????
    var tajaBtn = document.getElementById("tajaBtn");
    tajaBtn.addEventListener("click", function () {
        // ????????? ????????? ????????? ???????????? ??????????????? ?????? 1?????? ??????????????? count????????? ??????
        if (count === 0) {
            drawTaja();
            downTaja();
        }
        count++;
    });
</script>
</body>
</html>
