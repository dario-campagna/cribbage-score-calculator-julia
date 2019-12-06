# Cribbage score calculator

Cribbage score calculator implemented with Julia programming language and TDD.

The program computes the score of a [Cribbage](https://en.wikipedia.org/wiki/Rules_of_cribbage) hand consisting of four hand cards and a starter card.

Use the ```runtests.jl``` file to run all tests in the ```test``` directory.

## Cribbage hand

We represent a card with two characters. The first character is the rank. The second character is the suite.

|Rank|Character|
|----|---------|
|Ace   |A|
|2|2|
|3|3|
|4|4|
|5|5|
|6|6|
|7|7|
|8|8|
|9|9|
|10|0|
|Jack|J|
|Queen|Q|
|King|K|

|Suite|Character|
|-----|--------|
|Clubs|C|
|Diamonds|D|
|Hearts|H|
|Spades|S|

As an example, "4H" is the four of Hearts.

A Cribbage hand is represented as a string of ten characters. The first eight characters the four hand cards. The last two characters represent the starter card
For example, the string "5H5D5SJC5C" represent a Cribbage hand with five of Hearts, five of Diamonds, five of Spades and Jack of Clubs as hand card and five of Clubs as starter card.
 
## Scoring

A Cribbage hand score is calculated with the following rules.
* fifteen-twos
  * two points for each separate combination of two or more cards totalling exactly fifteen (Jack, Queen and King count as 10, Ace count as 1)
* runs
  * three points for a run of three consecutive cards (regardless of suit)
  * four points for a run of four
  * five points for a run of five
* pairs
  * two points for a pair of cards of a kind
  * six points for three cards of a kind (known as a "pair royal", comprising three distinct pairs)
  * twelve points for four cards of a kind (a "double pair royal", comprising six distinct pairs)
* flush
  * four points for a flush, where all four cards in the hand are of the same suit, with an additional point if the starter card is also of that suit.
  * one point for holding the Jack of the same suit as the starter card

| Cribbage hand | Score |
|-------|--------|
|5H5D5SJC5C|29|
|0DJHQSAC9D|4|

For more information and scoring examples look [here](https://en.wikipedia.org/wiki/Rules_of_cribbage).
