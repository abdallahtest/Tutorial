Feature: Tennis game score calculation
  
  As a member of the tennis championship committee
  I want to calculate the score of each game
  In order to determine the winner of the game

  Scenario Outline: Score calculation of tennis game without deuce
    Given I have a game result of the first player <results_sequence_player_1>
    And I have a game result of the second player <results_sequence_player_2>
    And I have a game result of the first player <results_sequence_player_1> <> 40
    And I have a game result of the second player <results_sequence_player_2> <> 40
    When the <player_number> score a goal
    Then the score of the game should be <score>
    And the Winner is <winner>

    Examples: 
      | results_sequence_player_1 | results_sequence_player_2 | player_number | score          | winner    |
      | "0"                       | "0"                       | 1             | "15 - 0"       | ""        |
      | "15"                      | "15"                      | 1             | "30 - 15"      | ""        |
      | "30"                      | "15"                      | 1             | "40 - 15"      | ""        |
      | "30"                      | "40"                      | 1             | "40 - 40"      | ""        |
      | "40"                      | "30"                      | 1             | "player_1_won" | "player1" |
      | "0"                       | "0"                       | 2             | "0 - 15"       | ""        |
      | "15"                      | "15"                      | 2             | "15 - 30"      | ""        |
      | "30"                      | "30"                      | 2             | "30 - 40"      | ""        |
      | "40"                      | "30"                      | 2             | "40 - 40"      | ""        |
      | "30"                      | "40"                      | 2             | "player_2_won" | "player2" |

  Scenario Outline: Score calculation of tennis game with deuce
    Given I have a game result of the first player <results_sequence_player_1>
    And I have a game result of the second player <results_sequence_player_2>
    When the <player_number> score a goal with the last <statut>
    Then the score of the game should be <score>

    Examples: 
      | results_sequence_player_1 | results_sequence_player_2 | player_number | Statut               | Score                |
      | "40"                      | "30"                      | 2             | ""                   | "deuce"              |
      | "30"                      | "40"                      | 1             | ""                   | "deuce"              |
      | "40"                      | "40"                      | 1             | "deuce"              | "advantage_player_1" |
      | "40"                      | "40"                      | 2             | "deuce"              | "advantage_player_2" |
      | "40"                      | "40"                      | 2             | "advantage_player_1" | "deuce"              |
      | "40"                      | "40"                      | 1             | "advantage_player_2" | "deuce"              |
      | "40"                      | "40"                      | 2             | "advantage_player_2" | "player_2_won"       |
      | "40"                      | "40"                      | 1             | "advantage_player_1" | "player_1_won"       |
