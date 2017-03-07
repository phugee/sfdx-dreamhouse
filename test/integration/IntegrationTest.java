package test.integration;

import java.util.List;
import org.junit.*;
import org.openqa.selenium.*;
import java.io.File;
import java.io.IOException;
import org.apache.commons.io.FileUtils;

import org.junit.runner.JUnitCore;

/**
 * Property Explorer UI test.
 */
public class IntegrationTest extends BaseSalesforceTest {
    @Test
    public void testIntegration() throws Exception {
        try {
            // this.login("/one/one.app#/sObject/Property__c/home");
            this.login("/one/one.app");
            // this.login("/a02/o");

            System.out.println("AFTER login");

            // driver.navigate().to(driver.getCurrentUrl() + "#/sObject/Property__c/home");

            // Salesforce retUrl will strip the hash. Selenium driver.get() will hang on a hash. SO set the hash manually.
            // ((JavascriptExecutor) driver).executeScript("setTimeout(function() { window.location.hash='#/sObject/Property__c/home'; }, 5000)");

            System.out.println("CURRENT_URL=" + driver.getCurrentUrl());

            // Close the "Welcome to Salesforce" modal if it is displayed
            this.fluentWait(By.className("slds-modal__close")).click();

            System.out.println("AFTER modal close");

            this.fluentWait(By.xpath("//a[contains(text(), 'Contemporary Luxury')]")).click();

            System.out.println("AFTER clicking on Contemporary Luxury link");

            Assert.assertTrue(this.fluentWait(By.xpath("//span[contains(text(), 'Contemporary Luxury')]")).isDisplayed());

        } catch(Exception e) {
            File scrFile = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
            // Now you can do whatever you need to do with it, for example copy somewhere
            FileUtils.copyFile(scrFile, new File(getProperty("OUTPUT_DIR") + "/screenshot.png"));
            // System.out.println("CURRENT_URL=" + driver.getCurrentUrl());
            System.out.println(driver.getPageSource());
            throw e;
        }
    }

	public static void main(String[] args) {
		// Instantiate a JUniteCore object
		JUnitCore core = new JUnitCore();

		// Add TAP Reporter Listener to the core object executor
		core.addListener(new TapReporter());

		// Run the test suite
		core.run(IntegrationTest.class);
	}
}
