<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="col-lg-6">
		<div class="card">
			<div class="card-header">Example Form</div>
			<div class="card-body card-block">
				<form action="login" method="post">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">아이디</div>
							<input type="text" id="username3" name="USER_ID"
								class="form-control">
							<div class="input-group-addon">
								<i class="fa fa-user"></i>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">비밀번호</div>
							<input type="password" id="password3" name="PASSWORD"
								class="form-control">
							<div class="input-group-addon">
								<i class="fa fa-asterisk"></i>
							</div>
						</div>
					</div>
					<div class="form-actions form-group">
						<button type="submit" class="btn btn-primary btn-sm">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>