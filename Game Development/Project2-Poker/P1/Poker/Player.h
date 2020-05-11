//
// Created by Alperen on 4/7/20.
//

#ifndef POKER_PLAYER_H
#define POKER_PLAYER_H


#include "Hand.h"
#include "BetHistory.h"

using namespace std;

class Player {

private:
    int id;
    int chips;

protected:
    Hand hand;

public:
    Player( int id, int chips ){
        this->id = id;
        this->chips = chips;
    }

    // To be implemented in AlphaPlayer and HumanPlayer individually
    virtual int getBet( Hand opponent, BetHistory bh, int bet2player, bool canRaise, int pot) = 0;

    int getID(){
        return id;
    }

    void clearHand(){
        hand.clear();
    }

    void dealCard(Card c){
        hand.addCard(c);
    }

    Hand getHand(){
        return hand;
    }

    void addChips(int chips){
        this->chips += chips;
    }

    void subtractChips(int chips){
        this->chips -= chips;
    }

    int getChips(){
        return chips;
    }

};


#endif //POKER_PLAYER_H
