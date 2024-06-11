<div class="row">
    <div class="col-sm-2"></div>

    <div class="col-sm-8">
        <div class="card">
            <div class="card-header">
                <div class="text-center"><h3>Seller Information:</h3></div>
            </div>
            <div class="card-body">
                <div class="form-group row">
                    <label class="col col-form-label"><b>E-mail:</b></label>
                    <div class="col">E-mail:</div>
                </div>
                <div class="form-group row">
                    <label class="col col-form-label"><b>Phone:</b></label>
                    <div class="col">+1 123 456 789</div>
                </div>
            </div>
        </div>

        <div class="row">&nbsp;</div>

        <div class="card">
            <div class="card-header">
                <div class="text-center"><h3>Payer Information:</h3></div>
            </div>
            <div class="card-body">
                <div class="form-group row">
                    <label class="col col-form-label"><b>First Name:</b></label>
                    <div class="col">${payer.firstName}</div>
                </div>
                <div class="form-group row">
                    <label class="col col-form-label"><b>Last Name:</b></label>
                    <div class="col">${payer.lastName}</div>
                </div>
                <div class="form-group row">
                    <label class="col col-form-label"><b>E-mail:</b></label>
                    <div class="col">${payer.email}</div>
                </div>
            </div>
        </div>

        <div class="row">&nbsp;</div>

        <div class="card">
            <div class="card-header">
                <div class="text-center"><h3>Order Details:</h3></div>
            </div>
            <div class="card-body">
                <div class="form-group row">
                    <label class="col col-form-label"><b>Order ID:</b></label>
                    <div class="col">${orderId}</div>
                </div>
                <div class="form-group row">
                    <label class="col col-form-label"><b>Ordered by:</b></label>
                    <div class="col">${loggedCustomer.fullname}</div>
                </div>
                <div class="form-group row">
                    <label class="col col-form-label"><b>Transaction Description:</b></label>
                    <div class="col">${transaction.description}</div>
                </div>
                <div class="row"><b>Items:</b></div>

                <c:forEach items="${transaction.itemList.items}" var="item" varStatus="status">
                    <div class="row">
                        <div class="col-2">${status.index + 1}</div>
                        <div class="col-8">
                            <div><h5>${item.name}</h5></div>
                            <div><fmt:formatNumber value="${item.price}" type="currency"/></div>
                            <div>
                                X ${item.quantity}
                            </div>
                            <div>= <b><fmt:formatNumber value="${item.price * item.quantity}" type="currency"/></b>
                            </div>
                        </div>
                    </div>
                    <div class="row">&nbsp;</div>
                </c:forEach>

                <div class="row">
                    <div class="col text-center">
                        <p>Subtotal: <fmt:formatNumber value="${transaction.amount.details.subtotal}"
                                                       type="currency"/></p>
                        <p>Tax: <fmt:formatNumber value="${transaction.amount.details.tax}" type="currency"/></p>
                        <p>Shipping Fee: <fmt:formatNumber value="${transaction.amount.details.shipping}"
                                                           type="currency"/></p>
                        <p>TOTAL: <b><fmt:formatNumber value="${transaction.amount.total}" type="currency"/></b></p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>