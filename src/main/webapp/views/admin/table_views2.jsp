<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new" />
<c:url var="NewURL" value="/admin-new" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Manager</title>
</head>
<body>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Tables</h1>
		<p class="mb-4">
			DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official
				DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<c:if test="${check == 0 }">
								<tr>
									<th>ID</th>
									<th>Tên điện thoại</th>
									<th>Giá</th>
									<th>RAM</th>
									<th>Dung lượng</th>
									<th>Thao tác</th>
								</tr>
							</c:if>
							<c:if test="${check == 1 }">
								<tr>
									<th>Họ</th>
									<th>Tên</th>
									<th>Email</th>
									<th>Số điện thoại</th>
									<th>Ngày Sinh</th>
									<th>Địa chỉ</th>
									<th>Role</th>
								</tr>
							</c:if>
						</thead>
						<tfoot>
							<c:if test="${check == 0 }">
								<tr>
									<th>ID</th>
									<th>Tên điện thoại</th>
									<th>Giá</th>
									<th>RAM</th>
									<th>Dung lượng</th>
									<th>Thao tác</th>
								</tr>
							</c:if>
							<c:if test="${check == 1 }">
								<tr>
									<th>Họ</th>
									<th>Tên</th>
									<th>Email</th>
									<th>Số điện thoại</th>
									<th>Ngày Sinh</th>
									<th>Địa chỉ</th>
									<th>Role</th>
								</tr>
							</c:if>
						</tfoot>
						<tbody>
							<c:if test="${check == 0 }">
								<c:forEach items="${model}" var="item">
									<tr>
										<td>${item.id }</td>
										<td>${item.tenDT }</td>
										<td>${item.getDonGiaFormat() }</td>
										<td>${item.RAM }GB</td>
										<td>${item.dungLuong }</td>
<td><c:url var="editURL" value="/admin-home/phone">
		<c:param name="action" value="edit-phone" />
		<c:param name="id" value="${item.id}" />
</c:url> <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" title="Update" 
	href='${editURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i> </a></td>
									
<!-- Trong phần thao tác của từng dòng -->
<%-- <td>
    <c:url var="editURL" value="/admin-home">
        <c:param name="id" value="${item.id}" />
    </c:url>
    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" title="Update" href='${editURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i> </a>
</td> --%>

<%-- <!-- Trong phần thao tác của từng dòng -->
<td>
    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip" title="Update" href="javascript:void(0);" onclick="editPhone(${item.id})">
        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
    </a>
</td> --%>
									
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${check == 1 }">
								<c:forEach items="${user }" var="item">
									<tr>
										<td>${item.ho }</td>
										<td>${item.ten }</td>
										<td>${item.email }</td>
										<td>${item.sdt }</td>
										<td>${item.ngaySinh }</td>
										<td>${item.diaChi }</td>
										<c:if test="${item.role==1 }">
											<td>Admin</td>
										</c:if>
										<c:if test="${item.role==0 }">
											<td>User</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->
</body>

<!-- <script>
    function editPhone(id) {
        // Assuming 'id' is the identifier for the phone you want to edit
        // Perform an AJAX request to the servlet to fetch the phone details
        $.ajax({
            url: '/admin-home',
            type: 'GET',
            data: { action: 'edit-phone', id: id },
            success: function (data) {
                // Handle the response data (phone details) here
                // You can populate the form fields with the received data
            },
            error: function (error) {
                console.error('Error fetching phone details:', error);
            }
        });
    }
</script> -->

</html>