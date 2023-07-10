<!DOCTYPE html>
<html lang="en">

<head>
  <title>Danh sách nhân viên | Qu?n tr? Admin</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>

<body onload="time()" class="app sidebar-mini rtl">
  <!-- Navbar-->
  <header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
      aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


      <!-- User Menu-->
      <li><a class="app-nav__item" href="/index.html"><i class='bx bx-log-out bx-rotate-180'></i> </a>

      </li>
    </ul>
  </header>
  <!-- Sidebar menu-->
  <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
  <aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="/images/hay.jpg" width="50px"
        alt="User Image">
      <div>
        <p class="app-sidebar__user-name"><b>Võ Tr??ng</b></p>
        <p class="app-sidebar__user-designation">Chào m?ng b?n tr? l?i</p>
      </div>
    </div>
    <hr>
    <ul class="app-menu">
      <li><a class="app-menu__item haha" href="phan-mem-ban-hang.html"><i class='app-menu__icon bx bx-cart-alt'></i>
          <span class="app-menu__label">POS Bán Hàng</span></a></li>
      <li><a class="app-menu__item " href="index.html"><i class='app-menu__icon bx bx-tachometer'></i><span
            class="app-menu__label">B?ng ?i?u khi?n</span></a></li>
      <li><a class="app-menu__item " href="table-data-table.html"><i class='app-menu__icon bx bx-id-card'></i> <span
            class="app-menu__label">Qu?n lý nhân viên</span></a></li>
      <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-user-voice'></i><span
            class="app-menu__label">Qu?n lý khách hàng</span></a></li>
      <li><a class="app-menu__item" href="table-data-product.html"><i
            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Qu?n lý s?n ph?m</span></a>
      </li>
      <li><a class="app-menu__item" href="table-data-oder.html"><i class='app-menu__icon bx bx-task'></i><span
            class="app-menu__label">Qu?n lý ??n hàng</span></a></li>
      <li><a class="app-menu__item" href="table-data-banned.html"><i class='app-menu__icon bx bx-run'></i><span
            class="app-menu__label">Qu?n lý n?i b?
          </span></a></li>
      <li><a class="app-menu__item" href="table-data-money.html"><i class='app-menu__icon bx bx-dollar'></i><span
            class="app-menu__label">B?ng kê l??ng</span></a></li>
      <li><a class="app-menu__item active" href="quan-ly-bao-cao.html"><i
            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
      </li>
      <li><a class="app-menu__item" href="page-calendar.html"><i class='app-menu__icon bx bx-calendar-check'></i><span
            class="app-menu__label">L?ch công tác </span></a></li>
      <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">Cài
            ??t h? th?ng</span></a></li>
    </ul>
  </aside>
  <main class="app-content">
    <div class="row">
      <div class="col-md-12">
        <div class="app-title">
          <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="#"><b>Báo cáo doanh thu    </b></a></li>
          </ul>
          <div id="clock"></div>
        </div>
      </div>
    </div>
        <div class="row">
            <div class="col-md-6 col-lg-3">
                <div class="widget-small primary coloured-icon"><i class='icon  bx bxs-user fa-3x'></i>
                    <div class="info">
                        <h4>T?ng Nhân viên</h4>
                        <p><b>26 nhân viên</b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="widget-small info coloured-icon"><i class='icon bx bxs-purchase-tag-alt fa-3x' ></i>
                    <div class="info">
                        <h4>T?ng s?n ph?m</h4>
                        <p><b>8580 s?n ph?m</b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="widget-small warning coloured-icon"><i class='icon fa-3x bx bxs-shopping-bag-alt'></i>
                    <div class="info">
                        <h4>T?ng ??n hàng</h4>
                        <p><b>457 ??n hàng</b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="widget-small danger coloured-icon"><i class='icon fa-3x bx bxs-info-circle' ></i>
                    <div class="info">
                        <h4>B? c?m</h4>
                        <p><b>4 nhân viên</b></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-lg-3">
                <div class="widget-small primary coloured-icon"><i class='icon fa-3x bx bxs-chart' ></i>
                    <div class="info">
                        <h4>T?ng thu nh?p</h4>
                        <p><b>104.890.000 ?</b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="widget-small info coloured-icon"><i class='icon fa-3x bx bxs-user-badge' ></i>
                    <div class="info">
                        <h4>Nhân viên m?i</h4>
                        <p><b>3 nhân viên</b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="widget-small warning coloured-icon"><i class='icon fa-3x bx bxs-tag-x' ></i>
                    <div class="info">
                        <h4>H?t hàng</h4>
                        <p><b>1 s?n ph?m</b></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="widget-small danger coloured-icon"><i class='icon fa-3x bx bxs-receipt' ></i>
                    <div class="info">
                        <h4>??n hàng h?y</h4>
                        <p><b>2 ??n hàng</b></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div>
                        <h3 class="tile-title">S?N PH?M BÁN CH?Y</h3>
                    </div>
                    <div class="tile-body">
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th>Mã s?n ph?m</th>
                                    <th>Tên s?n ph?m</th>
                                    <th>Giá ti?n</th>
                                    <th>Danh m?c</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>71309005</td>
                                    <td>Bàn ?n g? Theresa</td>
                                    <td>5.600.000 ?</td>
                                    <td>Bàn ?n</td>
                                </tr>
                                <tr>
                                    <td>62304003</td>
                                    <td>Bàn ?n Vitali m?t ?á</td>
                                    <td>33.235.000 ?</td>
                                    <td>Bàn ?n</td>
                                </tr>
                                <tr>
                                    <td>72109004</td>
                                    <td>Gh? làm vi?c Zuno</td>
                                    <td>3.800.000 ?</td>
                                    <td>Gh? g?</td>
                                </tr>
                                <tr>
                                    <td>83826226</td>
                                    <td>T? ly - t? bát</td>
                                    <td>2.450.000 ?</td>
                                    <td>T?</td>
                                </tr>
                                <tr>
                                    <td>71304041</td>
                                    <td>Bàn ?n m? r?ng Vegas</td>
                                    <td>21.550.000 ?</td>
                                    <td>Bàn thông minh</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div>
                            <h3 class="tile-title">T?NG ??N HÀNG</h3>
                        </div>
                        <div class="tile-body">
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                            <th>ID ??n hàng</th>
                                            <th>Khách hàng</th>
                                            <th>??n hàng</th>
                                            <th>S? l??ng</th>
                                            <th>T?ng ti?n</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                            <td>MD0837</td>
                                            <td>Tri?u Thanh Phú</td>
                                            <td>Gh? làm vi?c Zuno, Bàn ?n g? Theresa</td>
                                            <td>2 s?n ph?m</td>
                                            <td>9.400.000 ?</td>
                                    </tr>
                                    <tr>
                                            <td>M?8265</td>
                                            <td>Nguy?n Th? Ng?c C?m</td>
                                            <td>Gh? ?n g? Lucy màu tr?ng</td>
                                            <td>1 s?n ph?m</td>
                                            <td>3.800.000 ?</td>   
                                    </tr>
                                    <tr>
                                            <td>MT9835</td>
                                            <td>??ng Hoàng Phúc</td>
                                            <td>Gi??ng ng? Jimmy, Bàn ?n m? r?ng cao c?p Dolas, Gh? làm vi?c Zuno</td>
                                            <td>3 s?n ph?m</td>
                                            <td>40.650.000 ?</td>
                                    </tr>
                                    <tr>
                                            <td>ER3835</td>
                                            <td>Nguy?n Th? M? Y?n</td>
                                            <td>Bàn ?n m? r?ng Gepa</td>
                                            <td>1 s?n ph?m</td>
                                            <td>16.770.000 ?</td>
                                    </tr>
                                    <tr>
                                            <td>AL3947</td>
                                            <td>Ph?m Th? Ng?c</td>
                                            <td>Bàn ?n Vitali m?t ?á, Gh? ?n g? Lucy màu tr?ng</td>
                                            <td>2 s?n ph?m</td>
                                            <td>19.770.000 ?</td>
                                    </tr>
                                    <tr>
                                            <td>QY8723</td>
                                            <td>Ngô Thái An</td>
                                            <td>Gi??ng ng? Kara 1.6x2m</td>
                                            <td>1 s?n ph?m</td>
                                            <td>14.500.000 ?</td>
                                    </tr>
                                    <tr>
                                       <th colspan="4">T?ng c?ng:</th>
                                        <td>104.890.000 ?</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div>
                            <h3 class="tile-title">S?N PH?M ?Ã H?T</h3>
                        </div>
                        <div class="tile-body">
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                            <th>Mã s?n ph?m</th>
                                            <th>Tên s?n ph?m</th>
                                            <th>?nh</th>
                                            <th>S? l??ng</th>
                                            <th>Tình tr?ng</th>
                                            <th>Giá ti?n</th>
                                            <th>Danh m?c</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                            <td>83826226</td>
                                            <td>T? ly - t? bát</td>
                                            <td><img src="/img-sanpham/tu.jpg" alt="" width="100px;"></td>
                                            <td>0</td>
                                            <td><span class="badge bg-danger">H?t hàng</span></td>
                                            <td>2.450.000 ?</td>
                                            <td>T?</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div>
                        <h3 class="tile-title">NHÂN VIÊN M?I</h3>
                    </div>
                    <div class="tile-body">
                        <table class="table table-hover table-bordered" id="sampleTable">
                            <thead>
                                <tr>
                                    <th>H? và tên</th>
                                    <th>??a ch?</th>
                                    <th>Ngày sinh</th>
                                    <th>Gi?i tính</th>
                                    <th>S?T</th>
                                    <th>Ch?c v?</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>H? Th? Thanh Ngân</td>
                                    <td>155-157 Tr?n Qu?c Th?o, Qu?n 3, H? Chí Minh </td>
                                    <td>12/02/1999</td>
                                    <td>N?</td>
                                    <td>0926737168</td>
                                    <td>Bán hàng</td>
                                </tr>
                                <tr>
                                    <td>Tr?n Kh? Ái</td>
                                    <td>6 Nguy?n L??ng B?ng, Tân Phú, Qu?n 7, H? Chí Minh</td>
                                    <td>22/12/1999</td>
                                    <td>N?</td>
                                    <td>0931342432</td>
                                    <td>Bán hàng</td>
                                </tr>
                                <tr>
                                    <td>Nguy?n ??ng Tr?ng Nhân</td>
                                    <td>59C Nguy?n ?ình Chi?u, Qu?n 3, H? Chí Minh </td>
                                    <td>23/07/1996</td>
                                    <td>Nam</td>
                                    <td>0846881155</td>
                                    <td>D?ch v?</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="tile">
                    <h3 class="tile-title">D? LI?U HÀNG THÁNG</h3>
                    <div class="embed-responsive embed-responsive-16by9">
                        <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="tile">
                    <h3 class="tile-title">TH?NG KÊ DOANH S?</h3>
                    <div class="embed-responsive embed-responsive-16by9">
                        <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-right" style="font-size: 12px">
            <p><b>H? th?ng qu?n lý V2.0 | Code by Tr??ng</b></p>
        </div>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="admin/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="admin/js/plugins/chart.js"></script>
    <script type="text/javascript">
    var data = {
      labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
      datasets: [{
          label: "D? li?u ??u tiên",
          fillColor: "rgba(255, 255, 255, 0.158)",
          strokeColor: "black",
          pointColor: "rgb(220, 64, 59)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "green",
          data: [20, 59, 90, 51, 56, 100, 40, 60, 78, 53, 33, 81]
        },
        {
          label: "D? li?u k? ti?p",
          fillColor: "rgba(255, 255, 255, 0.158)",
          strokeColor: "rgb(220, 64, 59)",
          pointColor: "black",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "green",
          data: [48, 48, 49, 39, 86, 10, 50, 70, 60, 70, 75, 90]
        }
      ]
    };


        var ctxl = $("#lineChartDemo").get(0).getContext("2d");
        var lineChart = new Chart(ctxl).Line(data);

        var ctxb = $("#barChartDemo").get(0).getContext("2d");
        var barChart = new Chart(ctxb).Bar(data);
    </script>
    <!-- Google analytics script-->
    <script type="text/javascript">
        if (document.location.hostname == 'pratikborsadiya.in') {
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
            ga('create', 'UA-72504830-1', 'auto');
            ga('send', 'pageview');
        }
    </script>
</body>

</html>