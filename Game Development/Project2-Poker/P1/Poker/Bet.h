//
// Created by Alperen on 4/7/20.
//

#ifndef POKER_BET_H
#define POKER_BET_H

using namespace std;

class Bet {

private:
    int amount;
    int player;

public:
    Bet(int amount, int player){
        this->amount = amount;
        this->player = player;
    }

    int getPlayer(){
        return player;
    }

    int getAmount(){
        return amount;
    }


};


#endif //POKER_BET_H
