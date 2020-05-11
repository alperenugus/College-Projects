//
// Created by Alperen on 4/7/20.
//

#ifndef POKER_CARD_H
#define POKER_CARD_H

#include <string>

using namespace std;

class Card {

private:
    string cardName;
    int cardValue;
    bool faceUp;

public:
    Card( string cardName, int cardValue ){
        this->cardName = cardName;
        this->cardValue = cardValue;
    }

    string getName(){
        return this->cardName;
    }


    int getValue() {
        return cardValue;
    }

    bool isFaceup(){
        return faceUp;
    }

    void setFaceUp(bool faceUp){
        this->faceUp = faceUp;
    }

};




#endif //POKER_CARD_H
