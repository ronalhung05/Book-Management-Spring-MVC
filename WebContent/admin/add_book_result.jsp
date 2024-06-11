<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="page_head.jsp">
		<jsp:param name="pageTitle" value="Add Book to Order" />
	</jsp:include>
</head>
<body>
<div class="container">
	<div class="row">&nbsp;</div>

	<div class="row">
		<div class="col text-center text-success">
			<h3>
				The book <i>${book.title}</i> has been added to the order ID <b>${order.orderId}</b>
			</h3>			
		</div>
	</div>
	
	<div class="row">&nbsp;</div>
	
	<div class="row">
		<div class="col text-center">
			<input type="button" class="btn btn-primary"value="Close" onclick="javascript: self.close();" />
		</div>
	</div>
	
	<script>
		window.onunload = function() {
			window.opener.location.reload();
		}
	</script>
</div>	
</body>
</html>