//
// Created by Alperen on 4/7/20.
//

#ifndef POKER_ALPHAPLAYER_H
#define POKER_ALPHAPLAYER_H

#include "Hand.h"
#include "BetHistory.h"
#include "Player.h"

using namespace std;

class AlphaPlayer: public Player {

private:

public:
    AlphaPlayer(int id, int chips) : Player(id, chips) {

    }

    int getBet(Hand opponent, BetHistory bh, int bet2player, bool canRaise, int pot) override{
        // 1. Calculate the delta
        int delta = 0;
        int value = 0;
        int opponentValue = 0;

        for(Card card : hand.getHand()){
            value += card.getValue();
        }

        for(Card card : opponent.getHand()){
            opponentValue += card.getValue();
        }

        delta = value - opponentValue;

        //cout << "Delta: " << delta << endl;

        // 2. There are still cards to draw
        if(hand.getHand().size() < 5){

            // 2. a. If there have been no bets prior
            if(bh.isEmpty()){
                if(delta > 10) return 10;
                else if(delta > 5) return 5;
                else if(delta > 0) return 1;
                else return bet2player; // Call
            }
            // 2. b. There have been prior bets
            else{
                // 2. b. i. Calculate the pot_factor
                int pot_factor = pot / 10;

                //  2. b. ii. If the prior bet is a call
                if(!bh.isEmpty() && bet2player == 0){
                    if(delta > 5 - pot_factor) return 10;
                    else if(delta > 0 - pot_factor) return 1;
                    else return bet2player; // Call
                }
                // 2. b. iii. If the prior bet is a raise and is less than 1 + pot_factor * 2
                else if(!bh.isEmpty() && bh.priorRaise(bet2player) && bet2player < 1 + pot_factor * 2){
                    if(delta > 8 - pot_factor) return 10;
                    else if(delta > -2 - pot_factor) return 1;
                    else if(delta > -4 - pot_factor) return bet2player; // Call
                    else return 0; // Fold if bet2player > 0
                }
                // 2. b. iv.
                else{
                    if(delta > 10 - pot_factor) return 10;
                    else if(delta > 0 - pot_factor) return 1;
                    else if(delta > -2 - pot_factor) return bet2player; // Call
                    else return 0;
                }
            }

        }
        // Last betting round
        else{
            // 3. a. If there have been no bets prior
            if(bh.isEmpty()){
                if(delta > 10) return 10;
                else if(delta > 5) return 5;
                else return bet2player; // Call
            }
            // 3. b. If there have been prior bets
            else{
                // 3. b. i
                int pot_factor = pot / 10;

                // 3. b. ii if the prior bet is a call
                if(!bh.isEmpty() && bet2player == 0){
                    if(delta > 10 - pot_factor) return 10;
                    else return bet2player; // Call
                }
                // 3. b. iii if the prior bet is a raise and is less than 1 + pot_factor * 2
                else if(!bh.isEmpty() && bh.priorRaise(bet2player) && bet2player < 1 + pot_factor * 2){
                    if(delta > 6 - pot_factor) return 10;
                    else if(delta > 2) return bet2player; // Call
                    else return 0; // Fold if bet2player > 0
                }

                else{
                    if(delta > 8 - pot_factor) return 10;
                    else if(delta > 4) return bet2player; // Call
                    else return 0; // Fold if bet2player > 0
                }

            }

        }

    }
};


#endif //POKER_ALPHAPLAYER_H
