using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace Test.Pages
{
    public class BasePageObject
    {
        public static IWebDriver Driver { get; set; }

        public static void CreateDriver()
        {
            Driver = new ChromeDriver();
            Driver.Manage().Timeouts().ImplicitlyWait(new TimeSpan(0, 0, 5));
        }

        public static void CloseDriver()
        {
            Driver.Close();
        }

        public static void QuitDriver()
        {
            Driver.Quit();
        }
    }
}
