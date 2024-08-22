let elInputUsername = document.querySelector('#userId');
let elSuccessMessage = document.querySelector('.success-message');
let elFailureMessage = document.querySelector('.failure-message');
let elFailureMessageTwo = document.querySelector('.failure-message2');

let elInputPassword = document.querySelector('#password');
let elInputPasswordRetype = document.querySelector('#password-retype');
let elMismatchMessage = document.querySelector('.mismatch-message');
let elStrongPasswordMessage = document.querySelector('.strongPassword-message');

function idLength(value) {
    return value.length >= 5 && value.length <= 15;
}

function onlyNumberAndEnglish(str) {
    return /^[A-Za-z0-9]+$/.test(str);
}

function strongPassword(str) {
    return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(str);
}

function isMatch(password1, password2) {
    return password1 === password2;
}

elInputUsername.onkeyup = function () {
    if (elInputUsername.value.length !== 0) {
        // If you enter a value other than English or numbers
        if (!onlyNumberAndEnglish(elInputUsername.value)) {
            elSuccessMessage.classList.add('hide');
            elFailureMessage.classList.add('hide');
            elFailureMessageTwo.classList.remove('hide'); // Only English or numbers are possible
        }
        // If the number of letters is not 5 ~ 15
        else if (!idLength(elInputUsername.value)) {
            elSuccessMessage.classList.add('hide'); // Success message must be hidden
            elFailureMessage.classList.remove('hide'); // ID must be 5 ~ 15 letters
            elFailureMessageTwo.classList.add('hide'); // Failure Message 2 must be hidden
        }
        // If all the conditions are satisfied
        else {
            elSuccessMessage.classList.remove('hide'); // ID that can be used
            elFailureMessage.classList.add('hide'); // Fail message must be hidden
            elFailureMessageTwo.classList.add('hide'); // Failure Message 2 must be hidden
        }
    } else {
        // If you do not enter a value (when you erase it)
        // Hide all the messages
        elSuccessMessage.classList.add('hide');
        elFailureMessage.classList.add('hide');
        elFailureMessageTwo.classList.add('hide');
    }
};

elInputPassword.onkeyup = function () {
    if (elInputPassword.value.length !== 0) {
        if (strongPassword(elInputPassword.value)) {
            elStrongPasswordMessage.classList.add('hide'); // Failure message should be hidden
        } else {
            elStrongPasswordMessage.classList.remove('hide'); // Failure message should be visible
        }
    } else {
        // If you do not enter a value (when you erase it)
        // Hide the message
        elStrongPasswordMessage.classList.add('hide');
    }
};

elInputPasswordRetype.onkeyup = function () {
    if (elInputPasswordRetype.value.length !== 0) {
        if (isMatch(elInputPassword.value, elInputPasswordRetype.value)) {
            elMismatchMessage.classList.add('hide'); // Failure message should be hidden
        } else {
            elMismatchMessage.classList.remove('hide'); // Failure message should be visible
        }
    } else {
        // If you do not enter a value (when you erase it)
        // Hide the message
        elMismatchMessage.classList.add('hide');
    }
};