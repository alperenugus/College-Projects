//
// Created by Alperen on 4/7/20.
//

#ifndef POKER_BETAPLAYER_H
#define POKER_BETAPLAYER_H

#include "Player.h"

using namespace std;

class BetaPlayer: public Player {

private:

public:

    BetaPlayer(int id, int chips) : Player(id, chips) {

    }

    int getBet(Hand opponent, BetHistory bh, int bet2player, bool canRaise, int pot) override{
        return 0;
    }
};


#endif //POKER_BETAPLAYER_H
