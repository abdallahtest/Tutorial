Feature: Tennis set score calculation
  
  As a member of the tennis championship committee
  I want to calculate the score of each set
  In order to determine the winner of the set

  Scenario Outline: Score calculation of tennis set
    Given I have a set won games number of the first player <won_games_number_player_1>
    And I have a set won games number of the second player <won_games_number_player_2>
    And the last statut <statut>
    When the <game_winner> score a goal
    Then the score of the set should be <score>

    Examples: 
      | won_games_number_player_1 | won_games_number_player_2 | game_winner | statut              | score               |
      | 5                         | 0                         | 1           | ""                  | "player_1_won"      |
      | 2                         | 5                         | 2           | ""                  | "player_2_won"      |
      | 4                         | 4                         | 1           | ""                  | "5-4"               |
      | 4                         | 4                         | 2           | ""                  | "4-5"               |
      | 0                         | 0                         | 1           | ""                  | "1-0"               |
      | 4                         | 5                         | 1           | ""                  | "tie-break"         |
      | 5                         | 4                         | 2           | ""                  | "tie-break"         |
      | 5                         | 5                         | 1           | "tie-break"         | "avantage_player_1" |
      | 5                         | 4                         | 2           | "tie-break"         | "avantage_player_2" |
      | 5                         | 5                         | 2           | "avantage_player_1" | "tie-break"         |
      | 5                         | 4                         | 1           | "avantage_player_2" | "tie-break"         |
      | 5                         | 5                         | 1           | "avantage_player_1" | "player_1_won"      |
      | 5                         | 4                         | 2           | "avantage_player_2" | "player_2_won"      |
