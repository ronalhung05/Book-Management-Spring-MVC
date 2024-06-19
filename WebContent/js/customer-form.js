function checkPasswordMatch(confirmPassword) {
    if (confirmPassword.value != $("#password").val()) {
        confirmPassword.setCustomValidity("Passwords do not match!");
    } else {
        confirmPassword.setCustomValidity("");
    }
}