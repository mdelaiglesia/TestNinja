using System;
using TechTalk.SpecFlow;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using Test.Pages;
using OpenQA.Selenium.Support.PageObjects;
using NUnit.Framework;

namespace Test.Steps
{
    [Binding]
    public class LoginSteps
    {
        private LoginPage loginPage;

        [BeforeFeature]
        public static void BeforeFeature()
        {
            BasePageObject.CreateDriver();
        }

        [AfterFeature]
        public static void AfterFeature()
        {
            BasePageObject.QuitDriver();
        }

        public LoginSteps()
        {
            loginPage = PageFactory.InitElements<LoginPage>(BasePageObject.Driver);
        }

        [Given(@"I am on the log in page")]
        public void GivenIAmOnTheLogInPage()
        {
            BasePageObject.Driver.Navigate().GoToUrl("http://localhost:59210/");
        }

        [When(@"I submit the log in with email '(.*)' and password '(.*)'")]
        public void WhenISubmitTheLogInWithEmailAndPassword(string username, string password)
        {
            loginPage.LoginAs(username, password);
        }

        [Then(@"I should see ""(.*)""")]
        public void ThenIShouldSee(string loginResult)
        {
            if (loginPage.HasErrors)
            {
                Assert.AreEqual(loginResult, loginPage.ErrorMessage);
            }
            else
            {
                Assert.AreEqual(loginResult, loginPage.SuccessMessage);
            }
        }

    }
}
