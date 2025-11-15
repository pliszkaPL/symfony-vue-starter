<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

/**
 * Defines application features from the specific context.
 */
class FeatureContext implements Context
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }

    /**
     * @Given I have a working setup
     */
    public function iHaveAWorkingSetup()
    {
        // This is just an example step
    }

    /**
     * @Then everything should work
     */
    public function everythingShouldWork()
    {
        // This is just an example assertion
        assert(true);
    }
}
