﻿@childOf:CustomizationthroughTags @notImplemented @ignore @augurk @documentation
Feature: Not (yet) implemented features
In order to indicate that a feature has not been implemented yet, it can be decorated with a notImplemented tag.

**The not implemented warning is only displayed for demo purposes, the fact that it is shown indicates, in fact, that this feature has been implemented.**

Scenario: Decorating this feature with a notImplemented tag
Decorating a feature with a notImplemented tag will result in a warning being displayed,
indicating that this feature has not yet been implemented.
	Given the tag "notImplemented" is placed on this feature
	When I open this feature in Augurk
	Then "notImplemented" is not displayed as part of the tags on the feature
	And a yellow box containing a warning is dispayed below the title of this feature 

Scenario: Decorating this feature with a notImplemented and an ignore tag
Decorating a feature with a notImplemented tag in addition to a ignore tag will result in the ignore tag being disregarded.
	Given the tag "notImplemented" is placed on this feature
	And the tag "ignore" is placed on this feature
	When I open this feature in Augurk
	Then "notImplemented" is not displayed as part of the tags on the feature
	And "ignore" is not displayed as part of the tags on the feature
	And a yellow box containing a warning is dispayed below the title of this feature 
	And no red box is dispayed below the title of this feature 

@notImplemented
Scenario: Decorating this scenario with a notImplemented tag
Decorating a scenario with a notImplemented tag does nothing whatsoever.
	Given the tag "notImplemented" is placed on this scenario
	When I find this scenario in Augurk
	Then "notImplemented" is displayed as part of the tags on the scenario