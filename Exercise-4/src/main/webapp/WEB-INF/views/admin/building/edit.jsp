
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Thêm toà nhà</title>
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
                <div class="page-header">
                    <h1>Thêm hoặc sửa toà nhà</h1>
                </div>

                <form:form modelAttribute="buildingEdit" method="post" action="/admin/building-edit" id="listForm">
                    <form id="form-edit">
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Tên Toà Nhà</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input tyle="width: 100%;" path="name"></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Quận</label>
                            </div>
                            <div class="col-xs-4">
                                <select style="width: 100%;" name="district">
                                    <option value="">---Chọn Quận</option>
                                    <option value="QUAN_1">Quận 1</option>
                                    <option value="QUAN_2">Quận 2</option>
                                    <option value="QUAN_4">Quận 4</option>
                                </select>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Phường</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="ward" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Đường</label>
                            </div>
                            <div class="col-xs-9">
                                 <form:input style="width: 100%;" path="street" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Kết cấu</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="structure" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Số tầng hầm</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="numberOfBasement" ></form:input>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-3">
                                <label>Diện tích sàn</label>
                            </div>
                            <div class="col-xs-9" style="margin-bottom: 10px">
                                <form:input style="width: 100%;" path="floorArea" ></form:input>
                                <br>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Hướng</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="direction" ></form:input>
                                <br>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Hạng</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="level" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Diện tích thuê</label>
                            </div>
                            <div class="col-xs-9">
                                <input type="text" style="width: 100%;" name="rentArea" value="">
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Giá thuê</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="rentPrice" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Mô tả giá</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="rentPriceDescription" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Phí dịch vụ</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="serviceFee" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Phí ô tô</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="carFee" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Phí mô tô</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="motoFee" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Phí ngoài giờ</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="overtimeFee" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Tiền điện</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="electricityFee" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Tiền cọc</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="deposit" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Thanh toán</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="payment" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Thời hạn thuê</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="rentTime" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Thời gian trang trí</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="decorationTime" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Tên quản lý</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="managerName" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>SĐT quản lý</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="managerPhone" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Phí mua giới</label>
                            </div>
                            <div class="col-xs-9">
                                <form:input style="width: 100%;" path="brokerageFee" ></form:input>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Loại toà nhà</label>
                            </div>
                            <div class="col-xs-9">
                                <input type="checkbox" name="typeCode" value="NOI_THAT"> <span style="margin-right: 30px;">Nội thất</span>
                                <input type="checkbox" name="typeCode" value="TANG_TRET"> <span style="margin-right: 30px;">Tầng trệt</span>
                                <input type="checkbox" name="typeCode" value="NGUYEN_CAN"> <span style="margin-right: 30px;">Nguyên căn</span>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-xs-3">
                                <label>Ghi chú</label>
                            </div>
                            <div class="col-xs-9">
                                <input type="text" style="width: 100%;" name="note" value="">
                            </div>
                        </div>
                        <form:hidden path="id" id="BuildingID"></form:hidden>
                    </form>
                </form:form>
                <div class="row">
                    <div class="col-xs-3"></div>
                    <div class="col-xs-9">
                        <div class="row">
                            <div class="col-xs-6">
                                <c:if test="${not empty buildingEdit.id}">
                                    <button class="btn btn-primary" type="button" id="addBuilding">Cập nhập toà nhà</button>
                                    <button class="btn btn-danger" type="button" id="btnCancel">Huỷ thao tác</button>
                                </c:if>
                                <c:if test="${empty buildingEdit.id}">
                                    <button class="btn btn-primary" type="button" id="addBuilding">Thêm mới</button>
                                    <button class="btn btn-danger" type="button" id="btnCancel">Huỷ thao tác</button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->


    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

    <script>
        $('#addBuilding').click(function() {
            var data = {}; // Dung de tao kieu du lieu JSON Object
            var typeCode = []; // Dung de tao typeCode List
            var formData = $('#listForm').serializeArray(); // Chuyển thành các mảng đối tượng name - value
            $.each(formData, function(index, va) {
                if (va.name != "typeCode") {
                    data["" + va.name + ""] = va.value;
                }
                else {
                    typeCode.push(va.value);
                }
            });
            data["typeCode"] = typeCode;
            if (typeCode != "") {
                addOrUpdateBuilding(data);
            }
            else {
                window.location.href = "<c:url value="/admin/building-edit?typeCode=required"/>";
            }
            // Dung Ajax de call API
            function  addOrUpdateBuilding(data) {
                $.ajax({
                    url:"/api/building/update",
                    method: "PUT",
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
        });

        $('#btnCancel').click(function () {
            window.location.href = "/admin/building-list";
        });
    </script>

</body>
</html>
