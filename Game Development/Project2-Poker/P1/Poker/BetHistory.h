//
// Created by Alperen on 4/7/20.
//

#ifndef POKER_BETHISTORY_H
#define POKER_BETHISTORY_H

#include "Bet.h"
#include <vector>

using namespace std;

class BetHistory {

private:
    vector<Bet> history;
    int size;

public:

    BetHistory(){
        size = 0;
    }

    void clearHistory(){
        history.clear();
        size = 0;
    }

    void addBet(Bet bet){
        history.push_back(bet);
        size++;
    }

    int getCount(){
        return history.size();
    }

    Bet getBet(int n){
        return history[n];
    }

    bool isEmpty(){
        return history.empty();
    }

    Bet getLatestBet(){
        return history.back();
    }

    vector<Bet> getHistory(){
        return history;
    }

    bool priorRaise(int bet2Player){

        if(size > 1 && history[size - 2].getAmount() > bet2Player) return true;

        return false;
    }

};


#endif //POKER_BETHISTORY_H
