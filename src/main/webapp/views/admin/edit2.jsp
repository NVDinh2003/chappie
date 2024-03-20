<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-phone"/> <!-- Thay đổi đường dẫn API -->
<c:url var="phoneURL" value="/admin-phone"/> <!-- Thay đổi đường dẫn trang sản phẩm -->

<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12">
                <c:if test="${not empty messageResponse}">
                    <div class="alert alert-${alert}">
                        ${messageResponse}
                    </div>
                </c:if>
                <form id="formSubmit">
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Hãng SX</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="maHangSX" name="maHangSX">
                                <!-- Thêm logic để hiển thị loại sản phẩm -->
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.maHangSX}" <c:if test="${category.maHangSX == model.maHangSX}">selected</c:if>>${category.tenHangSX}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <br/>
                    <br/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Tên điện thoại</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="tenDT" name="tenDT" value="${model.tenDT}" required/>
                        </div>
                    </div>
                    <br/>
                    <br/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Đơn giá</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="donGia" name="donGia" value="${model.donGia}" required/>
                        </div>
                    </div>
                    <!-- Thêm các trường khác -->
                    <br/>
                                        <br/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Ram</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="donGia" name="donGia" value="${model.RAM}" required/>
                        </div>
                    </div>
                    <!-- Thêm các trường khác -->
                    <br/>
                                        <br/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Dung lượng</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="donGia" name="donGia" value="${model.dungLuong}" required/>
                        </div>
                    </div>
                    <!-- Thêm các trường khác -->
                    <br/>
                                        <br/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Ảnh 1</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="donGia" name="donGia" value="${model.image1}" required/>
                        </div>
                    </div>
                    <!-- Thêm các trường khác -->
                    <br/>
                                        <br/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Ảnh 2</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="donGia" name="donGia" value="${model.image2}" required/>
                        </div>
                    </div>
                    
                                                
<%--                     <!-- Upload ảnh 1 -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Ảnh 1</label>
                        <div class="col-sm-9">
                            <input type="file" id="fileImage1" name="fileImage1" accept="image/*" />
                            <img id="previewImage1" src="${model.image1}" style="max-width: 100px; max-height: 100px;" alt="Image 1" />
                        </div>
                    </div>
    
                    <!-- Upload ảnh 2 -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Ảnh 2</label>
                        <div class="col-sm-9">
                            <input type="file" id="fileImage2" name="fileImage2" accept="image/*" />
                            <img id="previewImage2" src="${model.image2}" style="max-width: 100px; max-height: 100px;" alt="Image 2" />
                        </div>
                    </div> --%>
                    <!-- Thêm các trường khác -->
                    <br/>
                                        <br/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Mô tả</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="donGia" name="donGia" value="${model.chiTiet}" required/>
                        </div>
                    </div>
                    <!-- Thêm các trường khác -->
                    <br/>
                    <br/>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <c:if test="${not empty model.id}">
                                <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật sản phẩm" id="btnAddOrUpdatePhone"/>
                            </c:if>
                            <c:if test="${empty model.id}">
                                <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm sản phẩm" id="btnAddOrUpdatePhone"/>
                            </c:if>
                        </div>
                    </div>
                    <input type="hidden" value="${model.id}" id="id" name="id"/>
                </form>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function(){
            // ... (code CKEDITOR và logic khác nếu cần)
        });

        $('#btnAddOrUpdatePhone').click(function (e) {
            e.preventDefault();
            var data = {};
            var formData = $('#formSubmit').serializeArray();

            $.each(formData, function (i, v) {
                data["" + v.name + ""] = v.value;
            });

            // Thêm logic khác nếu cần

            var id = $('#id').val();
            if (id == "") {
                addOrUpdatePhone(data, 'POST');
            } else {
                addOrUpdatePhone(data, 'PUT');
            }
        });

        function addOrUpdatePhone(data, method) {
            $.ajax({
                url: '${APIurl}',
                type: method,
                contentType: 'application/json',
                data: JSON.stringify(data),
                dataType: 'json',
                success: function (result) {
                    window.location.href = "${phoneURL}?type=edit&id=" + result.id + "&message=update_success";
                },
                error: function (error) {
                    window.location.href = "${phoneURL}?type=list&maxPageItem=2&page=1&message=error_system";
                }
            });
        }
    </script>
</body>
</html>
