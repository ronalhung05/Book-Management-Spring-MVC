<!-- Container for the form -->
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <!-- E-mail Field -->
            <div class="form-group">
                <%--@declare id="email"--%><label for="email">E-mail:</label>
                <input type="email" id="email" name="email" class="form-control" value="${customer.email}" required minlength="5"
                       maxlength="64"/>
                <div class="invalid-feedback">
                    Please provide a valid email.
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <!-- First Name Field -->
            <div class="form-group">
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" name="firstname" class="form-control" value="${customer.firstname}" required
                       minlength="2" maxlength="30"/>
                <div class="invalid-feedback">
                    Please provide first name.
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <!-- Last Name Field -->
            <div class="form-group">
                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" name="lastname" class="form-control" value="${customer.lastname}" required
                       minlength="2" maxlength="30"/>
                <div class="invalid-feedback">
                    Please provide last name.
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <!-- Password Field -->
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control" value="${customer.password}"
                       required minlength="5" maxlength="16"/>
                <div class="invalid-feedback">
                    Please provide a valid password.
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <!-- Confirm Password Field -->
            <div class="form-group">
                <label for="password">Confirm Password:</label>
                <input type="password" name="confirmPassword" class="form-control" value="${customer.password}" required
                       minlength="5" maxlength="16" oninput="checkPasswordMatch(this)"/>
            </div>
            <div class="invalid-feedback">
                Please provide a valid password.
            </div>
        </div>
        <div class="col-md-6">
            <!-- Phone Number Field -->
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone"  name="phone" class="form-control" value="${customer.phone}" required minlength="9"
                       maxlength="10"/>
                <div class="invalid-feedback">
                    Please provide a valid phone number.
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <!-- Address Line 1 Field -->
            <div class="form-group">
                <label for="address1">Address Line 1:</label>
                <input type="text"  id="address1" name="address1" class="form-control" value="${customer.addressLine1}" required
                       minlength="10" maxlength="128"/>
                <div class="invalid-feedback">
                    Please provide a valid address.
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <!-- Address Line 2 Field -->
            <div class="form-group">
                <label>Address Line 2:</label>
                <input type="text" name="address2" class="form-control" value="${customer.addressLine2}"
                       maxlength="128"/>
            </div>
        </div>
        <div class="col-md-6">
            <!-- City Field -->
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" class="form-control" value="${customer.city}" required minlength="2"
                       maxlength="32"/>
                <div class="invalid-feedback">
                    Please provide a valid city.
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <!-- State Field -->
            <div class="form-group">
                <label for="state">State:</label>
                <input type="text" id="state" name="state" class="form-control" value="${customer.state}" required minlength="2"
                       maxlength="45"/>
                <div class="invalid-feedback">
                    Please provide a valid state.
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <!-- Zip Code Field -->
            <div class="form-group">
                <label for="zipcode">Zip Code:</label>
                <input type="text" id="zipcode" name="zipcode" class="form-control" value="${customer.zipcode}" required
                       minlength="3" maxlength="24"/>
                <div class="invalid-feedback">
                    Please provide a valid zipcode.
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <!-- Country Field -->
            <div class="form-group">
                <label for="country">Country:</label>
                <select name="country" id="country" required class="form-control">
                    <c:forEach items="${mapCountries}" var="country">
                        <option value="${country.value}"
                                <c:if test='${customer.country eq country.value}'>selected='selected'</c:if>>${country.key}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">
                    Please choose a valid country.
                </div>
            </div>
        </div>
    </div>

    <!-- Spacer Row -->
    <div class="row mt-3">
        <div class="col text-center">
            <!-- Buttons -->
            <button type="submit" class="btn btn-primary mr-3">Save</button>
            <input type="button" value="Cancel" class="btn btn-secondary" onclick="history.go(-1);"/>
        </div>
    </div>
</div>

