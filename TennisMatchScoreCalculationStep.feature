Feature: Tennis set score calculation
  
  As a member of the tennis championship committee
  I want to calculate the score of match
  In order to determine the winner of the match

  Scenario Outline: Score calculation of tennis match
    Given I have a match won sets number of the first player <won_sets_number_player_1>
    And I have a match won sets number of the second player <won_sets_number_player_2>
    Then the score of the match should be <score>

    Examples: 
      | won_sets_number_player_1 | won_sets_number_player_2 | score          |
      | 2                        | 0                        | "player_1_won" |
      | 2                        | 1                        | "player_1_won" |
      | 0                        | 2                        | "player_2_won" |
      | 1                        | 2                        | "player_2_won" |
