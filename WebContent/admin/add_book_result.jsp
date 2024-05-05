<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book to Order</title>
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
            <input type="button" class="btn btn-primary" value="Close" onclick="javascript: self.close();"/>
        </div>
    </div>

    <script>
        window.onunload = function () {
            window.opener.location.reload();
        }
    </script>
</div>
</body>
</html>
