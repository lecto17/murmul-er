<%--
  Created by IntelliJ IDEA.
  User: seokjung
  Date: 17/08/2019
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ADMIN - notice</title>

    <!-- Custom fonts for this template -->
    <link href="/resources/bootstrap-sb-admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/bootstrap-sb-admin/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/bootstrap-sb-admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <link rel="stylesheet" href="/resources/sweetalert2/sweetalert2.css"/>
    <link rel="stylesheet" href="/resources/css/admin/csList.css"/>
    <script>
        let isadmin = ('${admin}' == 'true' ? true : false);
        if(isadmin === false){
            location.href = "/";
        }
    </script>
</head>

<body id="page-top">

<div id="wrapper">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary" style="display: inline">Notice list</h6><br>
            <h6 id="sublist" class="m-0 font-weight-bold text-primary" style="display: inline;">FAQ list</h6>

            <button id="delbtn" class="btn btn-danger btn-icon-split" style="float: right; margin-right: 10px;">
                    <span class="icon text-white-50">
                      <i class="fas fa-trash-alt"></i>
                    </span>
                <span class="text">글삭제</span>
            </button>
            <button id="addbtn" class="btn btn-success btn-icon-split" style="float: right; margin-right: 10px;">
                    <span class="icon text-white-50">
                      <i class="fas fa-pen"></i>
                    </span>
                <span class="text">글작성</span>
            </button>
            <a href="/admin" class="btn btn-primary btn-icon-split" style="float: right; margin-right: 10px;">
                    <span class="icon text-white-50">
                      <i class="fas fa-arrow-left"></i>
                    </span>
                <span class="text">뒤로가기</span>
            </a>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <td align="center"><input type="checkbox" id="check_all"></td>
                        <th>No</th>
                        <th>Title</th>
                        <th>Write-Date</th>
                        <th>modify</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="notice" items="${noticeList}" varStatus="noticeNum">
                        <tr>
                            <td align="center">
                                <input type="checkbox" name="del_chk" value="${notice.id}" onchange="$(this).checkOnOff(${notice.id})">
                            </td>
                            <td class="align-center" value="${noticeNum.count}">${notice.id}</td>
                            <td class="underline" id="question${noticeNum.count}" onclick="$.showContent(${noticeNum.count})">${notice.title}</td>
                            <td class="align-center" id="date">${notice.writeDate}</td>
                            <td class="align-center"><img id="img${notice.id}img${noticeNum.count}" class="editBtn selectedItem" src="/resources/img/etc/pencil.png" style="height: 20px; width: 20px;" onClick="$(this).edit()"></td>
                            <input type="hidden" id="answer${noticeNum.count}" value="${notice.content}">
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="/resources/bootstrap-sb-admin/vendor/jquery/jquery.min.js"></script>
<script src="/resources/js/admin/admin.js"></script>
<script src="/resources/bootstrap-sb-admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/bootstrap-sb-admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/bootstrap-sb-admin/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/bootstrap-sb-admin/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/bootstrap-sb-admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/bootstrap-sb-admin/js/demo/datatables-demo.js"></script>
<!-- 내가 추가한거 -->
<script>var fromWhere = "notice";</script>
<script src="/resources/sweetalert2/sweetalert2.min.js"></script>
<script src="/resources/js/admin/list.js"></script>
<script src="/resources/js/admin/csList.js"></script>

<script>
    $('#sublist').click(function () {
        location.href = "/admin/cs/faq";
    })
</script>
</body>

</html>
