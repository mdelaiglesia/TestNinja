<%@ Page Title="Hello Ninja!" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Web._Default" EnableViewState="true" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="Scripts/Default.js" type="text/javascript"></script>
    <script type="text/javascript">
        function submitLogin() {
            $(document).ready(function () {

                $("#success").hide();
                $("#error").hide();

                var email = $("#email").val();
                var password = $("#password").val();
                var error = {};

                var isValidLogin = validateLogin(email, password, error);
                $("#errorMessage").text(error.message);

                if (isValidLogin) {
                    $("#success").fadeIn(300);

                    $("#email").val("");
                    $("#password").val("");
                }
                else {
                    $("#error").fadeIn(300);
                }
            });
        }

        function validateLogin(email, password, error) {

            if (!email || email === "") {
                error.message = "You forgot to enter your email.";
                return false;
            }

            if (!isEmail(email)) {
                error.message = "Format your email and try again.";
                return false;
            }

            if (!password || password === "") {
                error.message = "You forgot to enter your password.";
                return false;
            }

            var result = {};
            validateCredentials(email, password, result);

            if (result.emailFound && result.passwordMatches) {
                return true;
            }
            else {
                if (!result.emailFound) {
                    error.message = "I don't know who you are any more.";
                    return false;
                }
                if (!result.passwordMatches) {
                    error.message = "Did you forgot your password?";
                    return false;
                }
            }
        }

        function validateCredentials(email, password, result) {
            var emailPasswordArray = [
                                        { 'email': 'matiasdelaiglesia@gmail.com', 'password': '12345678' }
                                     ];
            var resultAux = $.grep(emailPasswordArray, function (e) { return e.email == email; });

            result.emailFound = resultAux.length === 1;
            result.passwordMatches = resultAux[0] && resultAux[0].password === password;
        }

        function isEmail(email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h1>
        Hello Ninja!</h1>
    <div class="form-signin">
        <div class="highlighted-section">
            <h2 class="form-signin-heading">
                Please sign in
            </h2>
            <input id="email" type="text" class="form-control" placeholder="Email address" autofocus />
            <input id="password" type="password" class="form-control" placeholder="Password" />
            <label class="checkbox">
                <input type="checkbox" value="remember-me" />
                Remember me
            </label>
            <button id="submit" class="btn btn-lg btn-primary btn-block" onclick="javascript:submitLogin(); return false;"
                type="submit">
                Sign in
            </button>
        </div>
        <br />
        <div id="success" class="alert alert-success" style="display: none">
            <strong>Well done!</strong> You're in!
        </div>
        <div id="error" class="alert alert-danger" style="display: none">
            <strong>Oh snap! </strong>
            <p id="errorMessage" style="display: inline" />
        </div>
    </div>
</asp:Content>
