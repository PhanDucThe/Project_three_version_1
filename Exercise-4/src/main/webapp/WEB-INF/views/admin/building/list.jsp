
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Danh Sách Toà Nhà</title>
</head>
<body>
    <div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Quản Lí Toà Nhà</li>
            </ul><!-- /.breadcrumb -->


        </div>
        <!-- start-page-content -->
        <div class="page-content">
            <div class="col-xs-12 col-sm-12 widget-container-col ui-sortable" style="min-height: 38.4px;">
                <div class="widget-box ui-sortable-handle collapsed" style="opacity: 1; margin-bottom: 45px;">
                    <div class="widget-header">
                        <h5 class="widget-title">Tìm Kiếm</h5>
                        <div class="widget-toolbar">
                            <a href="#" data-action="collapse">
                                <i class="ace-icon fa fa-chevron-down"></i>
                            </a>
                        </div>
                    </div>

                    <div class="widget-body"
                         style="display: none; font-family: 'Times New Roman', Times, serif; font-weight: 500;">
                        <div class="widget-main">
                            <form:form id="formSearchBuilding" action="/admin/building-list" method="get" modelAttribute="modelSearch">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <label>Tên Toà Nhà</label> <br>
                                        <form:input path="name" style="width: 100%;"></form:input>
                                    </div>
                                    <div class="col-xs-6">
                                        <label>Diện Tích Sàn</label> <br>
                                        <form:input path="floorArea" style="width: 100%;"></form:input>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-2">
                                        <label>Quận hiện có</label> <br>
                                        <form:select path="district">
                                            <form:option value="">---Quận hiện có---</form:option>
                                            <form:options items="${district}"></form:options>
                                        </form:select>
                                    </div>
                                    <div class="col-xs-5">
                                        <label>Phường</label> <br>
                                        <form:input path="ward" style="width: 100%;"></form:input>
                                    </div>
                                    <div class="col-xs-5">
                                        <label>Đường</label> <br>
                                        <form:input path="street" style="width: 100%;"></form:input>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <label>Số tâng hầm</label> <br>
                                        <form:input path="numberOfBasement" style="width: 100%;"></form:input>
                                    </div>
                                    <div class="col-xs-4">
                                        <label>Hướng</label> <br>
                                        <form:input path="direction" style="width: 100%;"></form:input>
                                    </div>
                                    <div class="col-xs-4">
                                        <label>Hạng</label> <br>
                                        <form:input path="level" style="width: 100%;"></form:input>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-3">
                                        <label>Diện tích từ</label> <br>
                                        <form:input path="areaFrom" style="width: 100%;"></form:input>
                                    </div>
                                    <div class="col-xs-3">
                                        <label>Diện tích đến</label> <br>
                                        <form:input path="areaTo" style="width: 100%;"></form:input>
                                    </div>
                                    <div class="col-xs-3">
                                        <label>Giá thuê từ</label> <br>
                                        <form:input path="rentPriceFrom" style="width: 100%;"></form:input>
                                    </div>
                                    <div class="col-xs-3">
                                        <label>Giá thuê đến</label> <br>
                                        <form:input path="rentPriceTo" style="width: 100%;"></form:input>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <label>Tên quản lý</label> <br>
                                        <form:input path="managerName" style="width: 100%;"></form:input>
                                    </div>
                                    <div class="col-xs-4">
                                        <label>Điện thoại quản lý</label> <br>
                                        <form:input path="managerPhone" style="width: 100%;"></form:input>
                                    </div>
                                    <div class="col-xs-2">
                                        <label>Chọn nhân viên phụ trách</label>
                                        <form:select style="width: 100%;" path="staffId">
                                            <form:option value="">Chọn nhân viên</form:option>
                                            <form:options  items="${staffList}" />
                                        </form:select>
                                    </div>
                                </div>
                                <div class="row">
                                    <br>
                                    <div class="col-xs-6">
                                        <form:checkboxes path="typeCode" items="${TypeCodes}" />
                                    </div>
                                </div>
                            </form:form>
                            <br>
                            <button type="button" class="btn btn-primary" id="btnSearchBuilding">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-search-heart" viewBox="0 0 16 16">
                                    <path d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018"></path>
                                    <path
                                            d="M13 6.5a6.47 6.47 0 0 1-1.258 3.844q.06.044.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11">
                                    </path>
                                </svg>
                                Tìm Kiếm
                            </button>
                        </div>
                    </div>

                    <div class="row" style="margin-left: 1170px; margin-bottom: 0px;">
                        <a href="/admin/building-edit">
                            <button style="color: green; border: green 1px solid;" title="Thêm Toà Nhà">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-building-fill-add" viewBox="0 0 16 16">
                                    <path
                                            d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0" />
                                    <path
                                            d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z" />
                                </svg>
                            </button>
                        </a>
                        <button style="color: red; border: red 1px solid;" title="Xoá Toà Nhà" id="btnDeleteBuilding">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-building-fill-dash" viewBox="0 0 16 16">
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1" />
                                <path
                                        d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Danh sách toà nhà -->
            <div class="row" style="margin-top: 50px;">
                <div class="col-xs-12" style="font-size: 12px; padding: 0px;">
                    <table id="tablelist" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>Tên toà nhà</th>
                            <th>Địa chỉ</th>
                            <th>Số tầng hầm</th>
                            <th>Giá thuê</th>
                            <th>Tên quản lí</th>
                            <th>Số điện thoại</th>
                            <th>DT Sàn</th>
                            <th>DT Trống</th>
                            <th>DT Thuê</th>
                            <th>Phí mua giới</th>
                            <th>Phí dịch vụ</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>

                        <tbody>

                            <c:forEach var="item" items="${listBuilding}">
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td>${item.name}</td>
                                    <td>${item.address}</td>
                                    <td>${item.numberOfBasement}</td>
                                    <td>${item.rentPrice}</td>
                                    <td>${item.managerName}</td>
                                    <td>${item.managerPhone}</td>
                                    <td>${item.floorArea}</td>
                                    <td>${item.emptyArea}</td>
                                    <td>${item.rentArea}</td>
                                    <td>${item.brokerageFee}</td>
                                    <td>${item.serviceFee}</td>

                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-xs btn-success" title="Giao toà nhà" onclick="assignmentBuilding(${item.id})">
                                                <i class="ace-icon glyphicon glyphicon-list"></i>
                                            </button>

                                            <a class="btn btn-xs btn-info" href="/admin/building-edit-${item.id}" title="Sửa toà nhà">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </a>

                                            <button class="btn btn-xs btn-danger" title="Xoá toà nhà" onclick="deleteBuilding(${item.id})">
                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>


                        </tbody>
                    </table>
                </div><!-- /.span -->
            </div>


        </div>
        <!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

    <div class="modal fade" id="assignmentBuildingmyModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Danh sách nhân viên</h4>
                </div>
                <div class="modal-body">
                    <table id="staffList" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th style="text-align: center;">Chọn</th>
                            <th>Tên nhân viên</th>
                        </tr>
                        </thead>

                        <tbody>

                        </tbody>
                    </table>
                    <input type="hidden" id="buildingId" name="Building" value="1">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnassignmentBuilding">Giao toà
                        nhà</button>
                    <button type="button" class="btn btn-danger">Đóng</button>
                </div>
            </div>

        </div>
    </div>

    <script>
        function assignmentBuilding(buildingId) {
            $('#assignmentBuildingmyModal').modal();
            loadStaff(buildingId);
            $('#buildingId').val();
        }

        function loadStaff(buildingId) {
            $.ajax({
                url:"/api/building/" + buildingId + '/staffs',
                method: "GET",
                // data: JSON.stringify(data),
                // contentType: "application/json",
                dataType: "JSON",
                success: function(response) {
                    var row = '';
                    $.each(response.data, function (index, item) {
                        row += '<tr>';
                        row += '<td class="text-center">' +
                            '<input type="checkbox" value="' + item.staffId +
                            '" id="checkbox_' + item.staffId +
                            '" class="check-box-element" ' +
                            (item.checked ? 'checked' : '') +
                            ' /></td>';
                        row += '<td>' + item.fullName + '</td>';
                        row += '</tr>';
                    });
                    $('#staffList tbody').html(row);
                    console.info("Success");
                },
                error: function(response) {
                    console.log("Fail");
                    window.location.href = "<c:url value="/admin/building-list?message=error"/>";
                }
            });
        }

        $('#btnassignmentBuilding').click(function(e) {
            e.preventDefault();
            var data = {};
            data["buildingId"] = $('#buildingId').val();
            var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function() {
                return $(this).val();
            }).get();
            data['staffs'] = staffs;
            if (data['staffs'] != '') {
                assingment(data);
            }
            console.log("OK");
        });
        function assingment(data) {
            $.ajax({
                url:"/api/building/assigment",
                method: "POST",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "JSON",
                success: function(response) {
                    console.info("Success");
                },
                error: function(response) {
                    console.info("Giao Khong Thanh Cong");
                    window.location.href = "<c:url value="/admin/building-list?message=error"/>";
                }
            });
        }
    </script>
    <script>
        $('#btnSearchBuilding').click(function(event) {
            event.preventDefault();
            $('#formSearchBuilding').submit();
        });
        function deleteBuilding(id) {
            var buildingId = [id];
            deleteBuildings(buildingId);
        }

        $('#btnDeleteBuilding').click(function(e) {
            e.preventDefault();
            var buildings = $('#tablelist').find('tbody input[type = checkbox]:checked').map(function() {
                return $(this).val();
            }).get();
            deleteBuildings(buildings);
        });

        function deleteBuildings(data) {
            $.ajax({
                url:"/api/building/" + data,
                method: "DELETE",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "JSON",
                success: function(respond) {
                    console.log("OK");
                },
                error: function(respond) {
                    console.log("Fail");
                }
            });
        }
    </script>
</body>
</html>
