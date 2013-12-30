using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.PageObjects;

namespace Test.Pages
{
    public class LoginPage : BasePageObject
    {
        public bool HasErrors { get { return error.Displayed; } }
        public string ErrorMessage { get { return error.Text; } }
        public string SuccessMessage { get { return success.Text; } }

        #region Elements

        [FindsBy(How = How.Id, Using = "email")]
        private IWebElement email;

        [FindsBy(How = How.Id, Using = "password")]
        private IWebElement password;

        [FindsBy(How = How.Id, Using = "submit")]
        private IWebElement submit;

        [FindsBy(How = How.Id, Using = "success")]
        private IWebElement success;

        [FindsBy(How = How.Id, Using = "error")]
        private IWebElement error;

        #endregion

        public LoginPage(IWebDriver driver) { }

        public LoginPage LoginAs(string email, string password)
        {
            this.email.SendKeys(email);
            this.password.SendKeys(password);

            this.submit.Click();

            return this;
        }
    }
}
