package runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {
                "pretty",
                "html:target/cucumber-reports/cucumber-html-reports.html",
                "html:target/default-cucumber-reports.html",
                "json:target/json-reports/cucumber.json",
                "junit:target/xml-report/cucumber.xml",
                "rerun:target/failedRerun.txt"


        },
        features = {"src/test/resources/features/api"},
        glue = {"stepdefinitions","hooks/api","utilities/api"},
        tags = "@smoke",
        dryRun =false



)
public class apiRunner {
}
