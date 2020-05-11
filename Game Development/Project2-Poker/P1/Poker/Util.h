//
// Created by Alperen on 4/11/20.
//

#ifndef POKER_UTIL_H
#define POKER_UTIL_H

#include "Card.h"
#include <vector>
#include <algorithm>
#include <random>

using namespace std;

class Util {

private:

public:

    const int initialChips = 1000;
    const int numHands = 20;
    const int buyInChips = 10;
    const int EXIT = -1;
    const int maxBet = 10;


    // Creates a vector of cards of a standard deck, shuffles and returns it
    vector<Card> createDeck(){

        vector<Card> deck;

        vector<string> suit;

        vector<string> rank;

        // Card types
        suit.push_back("Clubs");
        suit.push_back("Diamonds");
        suit.push_back("Hearts");
        suit.push_back("Spades");


        rank.push_back("Two");
        rank.push_back("Three");
        rank.push_back("Four");
        rank.push_back("Five");
        rank.push_back("Six");
        rank.push_back("Seven");
        rank.push_back("Eight");
        rank.push_back("Nine");


        int cardValue = 2;

        for(string i: rank){
            for(string s: suit){
                string cardName = i + " of " + s;
                deck.push_back(Card(cardName, cardValue));
            }
            cardValue++;
        }

        for(string s: suit){
            string ace = "Ace of " + s;
            string jack = "Jack of " + s;
            string queen = "Queen of " + s;
            string king = "King of " + s;

            deck.push_back(Card(ace, 1));
            deck.push_back(Card(jack, 10));
            deck.push_back(Card(queen, 10));
            deck.push_back(Card(king, 10));

        }

        return deck;
    }

};


#endif //POKER_UTIL_H
