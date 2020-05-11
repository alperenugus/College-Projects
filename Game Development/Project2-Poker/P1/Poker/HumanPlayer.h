//
// Created by Alperen on 4/7/20.
//

#ifndef POKER_HUMANPLAYER_H
#define POKER_HUMANPLAYER_H


#include "Player.h"

using namespace std;

class HumanPlayer: public Player {

private:
    Util util;

public:
    HumanPlayer(int id, int chips) : Player(id, chips) {

    }

    int getBet(Hand opponent, BetHistory bh, int bet2player, bool canRaise, int pot) override{

        cout << "The pot has " << pot << " chips." << endl;
        cout << "Your hand:" << endl;

        for(Card card : getHand().getHand()){
            cout << "\t" <<card.getName();
            if(!card.isFaceup()) cout << " (card is facedown)" << endl;
            else cout << endl;
        }

        cout << "Opponent hand showing:" << endl;

        for(Card card : opponent.getHand()){
            cout << "\t" <<card.getName() << endl;
        }

        if(!bh.isEmpty()){
            cout << "Bet History:" << endl;
            for(Bet bet : bh.getHistory()){
                cout << "\t" << "Player: " << bet.getPlayer() << " Bet: " << bet.getAmount() << endl;
            }
        }

        cout << endl << "The bet to you is " << bet2player << endl;

        if(!canRaise){
            cout << "Since there has been 3 raise, your bet is a call or fold!" << endl;
            return 0;
        }

//        if(bet2player > 0) cout << "Bet 0 to fold or bet up to 10 to raise. Bet -1 to  quit." << endl;
//        else cout << "Bet 0 to call or bet up to 10 to raise. Bet -1 to  quit." << endl;

        cout << "What is your bet?  Bet -1 to  quit." << endl;

        int bet = 0;

        while(true){
            cin >> bet;
            // Valid bet conditions
            if(bet < -1 || bet > util.maxBet){
                cout << "You have entered an invalid bet! Please enter a valid bet:" << endl;
            }

            else break;
        }

        return bet;
    }
};


#endif //POKER_HUMANPLAYER_H
