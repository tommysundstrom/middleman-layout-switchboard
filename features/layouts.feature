Feature: Layouts
  Background:
    Given the Server is running at "layouts-app"
  Scenario: With no layout set, the default layout should be used
    When I go to "article-in-normal-layout.html"
    Then I should see "Default Layout"
    And I should see "Article with no layout set content"
  Scenario: With layout set in tags:, it should be used
    When I go to "article-with-layout-in-tag.html"
    Then I should see "First Alternative Layout"
    And I should see "Article with layout in tags Content"
  Scenario: With layout set both in tags: and layout:, the layout: should be used
    When I go to "article-with-layout-in-layout-and-tag.html"
    Then I should see "Second Alternative Layout"
    And I should see "Article where layout overrides tags Content"
  Scenario: With an variable (country:) set in frontmatter, the corresponding layout should be used
    When I go to "article-with-layout-set-by-country.html"
    Then I should see "Albanian Alternative Layout"
    And I should see "Layout set in country variable Content"
  Scenario: Do not use a layout for the article if set to false in front matter.
    When I go to "article-without-layout.html"
    Then I should not see "Default Layout"
    And I should see "Article Content"
  Scenario: With an variable (section:) set to 'Användbarhetsboken' in frontmatter, the corresponding layout should be used
    When I go to "article-with-layout-set-by-section-anvandbarhetsboken.html"
    Then I should see "Användbarhetsboken Alternative Layout"
    And I should see "Layout set in section variable Content"
  Scenario: With an variable (section:) set to 'Strategisk design' in frontmatter, the corresponding layout should be used
    When I go to "article-with-layout-set-by-section-strategiskdesign.html"
    Then I should see "Strategisk design Alternative Layout"
    And I should see "Layout set in section variable Content"
