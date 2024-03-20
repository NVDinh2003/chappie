<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<%-- <c:url var="APIurl" value="/api-admin-phone"/> <!-- Thay đổi đường dẫn API -->
<c:url var="phoneURL" value="/admin-phone"/> <!-- Thay đổi đường dẫn trang sản phẩm --> --%>
<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
</head>
<body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                <c:if test="${not empty message}">
                    <div class="alert alert-${alert}">
                        ${message}
                    </div>
                </c:if>
                        <form action="admin-home" method="post">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Hãng SX</label>
                                <div class="col-sm-9">
                                    <select class="form-control" id="maHangSX" name="maHangSX">

                                        <c:if test="${not empty categories}">
                                            <option value="">Chọn hãng SX</option>
                                            <c:forEach var="item" items="${categories}">

           <option value="${item.maHangSX}" <c:if test="${item.maHangSX == model.maHangSX}">selected</c:if>>${item.tenHangSX}</option>
                                            </c:forEach>
                                        </c:if>
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
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Ram</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="ram" name="ram" value="${model.RAM}" required/>
                                </div>
                            </div>
                            <br/>
                                           <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Dung lượng</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="dungLuong" name="dungLuong" value="${model.dungLuong}" required/>
                                </div>
                            </div>
                            <br/>

                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Mô tả</label>
                                <div class="col-sm-9">                                 
                                    <textarea rows="" cols="" id="content" name="content" style="width: 820px;height: 175px">${model.chiTiet}</textarea>
                                </div>
                            </div>
                            <br/>
                            <br/>

                    <div class="form-group">
                        <div class="col-sm-12">
                            <c:if test="${not empty model.id}">
                                                <input type="hidden" value="${model.id}" id="pid" name="pid"/>
                                 <button type="" class="btn btn-white btn-warning btn-bold" >Update</button>
                            </c:if>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
        
</body>
</html>
