//
// Created by Alperen on 4/7/20.
//

#ifndef POKER_HAND_H
#define POKER_HAND_H


#include "Card.h"
#include <vector>

using namespace std;

class Hand {

private:
    vector<Card> hand;

public:
    void clear(){
        hand.clear();
    }

    void addCard (Card card){
        hand.push_back(card);
    }

    int getCount(){
        return hand.size();
    }

    Card getCard(int n){
        return hand[n];
    }

    vector<Card> getHand(){
        return hand;
    }

    Hand getVisible(){
        Hand visible;
        for(Card card: hand){
            if(card.isFaceup()){
                visible.addCard(card);
            }
        }
        return visible;
    }

    int evaluate(){
        int sum = 0;
        for(Card card: hand){
            sum += card.getValue();
        }

        return sum;
    }
};


#endif //POKER_HAND_H
