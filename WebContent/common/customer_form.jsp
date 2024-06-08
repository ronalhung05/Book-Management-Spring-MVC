<div class="row">
    <div class="col-lg-12 col-12">
        <!-- card -->
        <div class="card mb-6 shadow border-0">
            <!-- card body -->
            <div class="card-body p-6 ">
                <h4 class="mb-4 h5 mt-5">Category Information</h4>
                <div class="row">
                    <!-- input -->
                    <div class="mb-3 col-lg-6">
                        <label class="form-label">First name</label>
                        <input type="text" name="firstname" value="${customer.firstname}"
                               minlength="2" maxlength="30" class="form-control" placeholder="First Name"
                               required/>
                    </div>
                    <!-- input -->
                    <div class="mb-3 col-lg-6">
                        <label class="form-label">Last Name</label>
                        <input type="text" name="lastname" placeholder="Last name" value="${customer.lastname}"
                               class="form-control" required minlength="2" maxlength="30"/>
                    </div>
                    <div class="mb-3 col-lg-6">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" placeholder="Email" value="${customer.email}"
                               class="form-control" required minlength="2" maxlength="30"/>
                    </div>
                    <div class="mb-3 col-lg-6">
                        <label class="form-label">Phone</label>
                        <input type="number" name="phone" placeholder="Phone" value="${customer.phone}"
                               class="form-control" required minlength="2" maxlength="30"/>
                    </div>
                    <div class="mb-3 col-lg-6">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" id="password" placeholder="Password"
                               value="${customer.password}"
                               class="form-control" required minlength="2" maxlength="16"/>
                    </div>
                    <div class="mb-3 col-lg-6">
                        <label class="form-label">Confirm password </label>
                        <input type="password" name="confirmPassword" placeholder="Enter password again"
                               class="form-control" value="${customer.password}" required minlength="5" maxlength="16"
                               oninput="checkPasswordMatch(this)"/>
                    </div>
                    <div class="mb-3 col-lg-6">
                        <label class="form-label">Country</label>
                        <select class="form-select" name="country" id="country">
                            <c:forEach items="${mapCountries}" var="country">
                                <option value="${country.value}"
                                        <c:if test='${customer.country eq country.value}'>selected='selected'</c:if> >${country.key}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3 col-lg-6">
                        <label class="form-label">City</label>
                        <input type="text" name="city" value="${customer.city}" required
                               minlength="2" maxlength="32" placeholder="City" class="form-control"/>
                    </div>
                    <!-- input -->
                    <div class="mb-3 col-lg-6">
                        <label class="form-label">State</label>
                        <input type="text" name="state" value="${customer.state}" required
                               minlength="2" maxlength="32" placeholder="State" class="form-control"/>
                    </div>
                    <div class="mb-3 col-lg-6">
                        <label class="form-label">Zip Code</label>
                        <input type="text" name="zipcode" value="${customer.zipcode}"
                               required minlength="2" maxlength="32" placeholder="Zipcode" class="form-control"/>
                    </div>
                    <!-- Address Line 1 and 2 -->
                    <div class="mb-3 col-lg-6">
                        <label class="form-label">Address Line 1 <span class="manitory">*</span></label>
                        <input type="text" name="address1" class="form-control" value="${customer.addressLine1}"
                               required minlength="10" maxlength="128" placeholder="Address line 1"/>
                    </div>
                    <div class="mb-3 col-lg-6">
                        <label class="form-label">Address Line 2 <span class="manitory">*</span></label>
                        <input type="text" name="address2" class="form-control" value="${customer.addressLine2}"
                               required minlength="10" maxlength="128" placeholder="Address line 2"/>
                    </div>
                    &nbsp;
                    <div class="col-lg-12">
                        <button type="submit" class="btn btn-primary">Save</button>
                        <a href="new_book" class="btn btn-secondary ms-2">
                            Create a Book
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
