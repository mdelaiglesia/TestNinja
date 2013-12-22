using System;
using TechTalk.SpecFlow;

namespace Test.Steps
{
    [Binding]
    public class LoginSteps
    {
        [Given(@"I am on the log in page")]
        public void GivenIAmOnTheLogInPage()
        {
            ScenarioContext.Current.Pending();
        }

        [When(@"I fill email field with '(.*)'")]
        public void WhenIFillEmailFieldWith(string p0)
        {
            ScenarioContext.Current.Pending();
        }

        [Then(@"I should see ""(.*)""")]
        public void ThenIShouldSee(string p0)
        {
            ScenarioContext.Current.Pending();
        }

    }
}
