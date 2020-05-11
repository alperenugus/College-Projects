//
// Created by Alperen on 4/7/20.
//

#ifndef POKER_GAME_H
#define POKER_GAME_H

#include "PlayerType.h"
#include "Card.h"
#include "Util.h"
#include "BetHistory.h"
#include "Player.h"
#include "HumanPlayer.h"
#include "AlphaPlayer.h"
#include "BetaPlayer.h"


using namespace std;

class Game {

private:
    int pot;
    vector<Card> deck;
    bool reportFlag;
    BetHistory betHistory;
    int raiseCount;
    int bet2player;
    Util util;

    // Returns true if someone wants to exit the program
    bool playHand(Player &p1, Player &p2){

        // Initial setup for a hand
        raiseCount = 0;
        bet2player = 0;
        shuffleDeck();

        if(deck.size() < 13){
            deck = util.createDeck();
        }

        // Buy-in chips
        pot += 2 * util.buyInChips;
        p1.subtractChips(util.buyInChips);
        p2.subtractChips(util.buyInChips);

        // Deal 3 cards
        for(int i = 0; i < 3; i ++){
            Card p1_card = deck.back();
            deck.pop_back();
            if(i == 0) p1_card.setFaceUp(false);
            else p1_card.setFaceUp(true);
            p1.dealCard(p1_card);

            Card p2_card = deck.back();
            deck.pop_back();
            if(i == 0) p2_card.setFaceUp(false);
            else p2_card.setFaceUp(true);
            p2.dealCard(p2_card);
        }

        // BETTING ROUND STARTS
        // ROUND 1
        int round1 = betRound(p1, p2);

        if(round1 == -2) return true; // Someone wants to exit the game

        // Player 0 wins
        if(round1 == 0){

            p1.addChips(pot);
            pot = 0;

            if(reportFlag) cout << "Player 0 has won!" << endl;

            resetHand(p1, p2);

            return false; // Hand finished
        } // Player 1 wins
        else if(round1 == 1){

            p2.addChips(pot);
            pot = 0;

            if(reportFlag) cout << "Player 1 has won!" << endl;

            resetHand(p1, p2);

            return false; // Hand finished
        } // Player 1 wins
        else{ // Hand continues

            // DEAL CARDS
            Card p1_card = deck.back();
            deck.pop_back();
            p1_card.setFaceUp(true);
            p1.dealCard(p1_card);

            Card p2_card = deck.back();
            deck.pop_back();
            p2_card.setFaceUp(true);
            p2.dealCard(p2_card);

            // ROUND2
            int round2 = betRound(p1, p2);

            if(round2 == -2) return true; // Someone wants to exit the game

            if(round2 == 0){

                p1.addChips(pot);
                pot = 0;

                if(reportFlag) cout << "Player 0 has won!" << endl;

                resetHand(p1, p2);

                return false; // Hand finished
            }
            else if(round2 == 1){

                p2.addChips(pot);
                pot = 0;

                if(reportFlag) cout << "Player 1 has won!" << endl;

                resetHand(p1, p2);

                return false; // Hand finished
            }
            else{ // Hand continues

                // DEAL CARDS
                p1_card = deck.back();
                deck.pop_back();
                p1_card.setFaceUp(true);
                p1.dealCard(p1_card);

                p2_card = deck.back();
                deck.pop_back();
                p2_card.setFaceUp(true);
                p2.dealCard(p2_card);

                // ROUND 3
                int round3 = betRound(p1, p2);

                if(round3 == -2) return true; // Someone wants to exit the game

                if(round3 == 0){

                    p1.addChips(pot);
                    pot = 0;


                    if(reportFlag) cout << "Player 0 has won!" << endl;

                    resetHand(p1, p2);

                    return false; // Hand finished
                }
                else if(round3 == 1){

                    p2.addChips(pot);
                    pot = 0;

                    if(reportFlag) cout << "Player 1 has won!" << endl;

                    resetHand(p1, p2);

                    return false; // Hand finished
                }
                else{ // Tie

                    int p1_card_sum = 0;
                    int p2_card_sum = 0;

                    for(Card card : p1.getHand().getHand()){
                        p1_card_sum += card.getValue();
                    }

                    for(Card card : p2.getHand().getHand()){
                        p2_card_sum += card.getValue();
                    }

                    if(p1_card_sum > p2_card_sum){
                        p1.addChips(pot);
                        pot = 0;

                        if(reportFlag) cout << "Player 0 has won!" << endl;

                        resetHand(p1, p2);

                        return false; // Hand finished
                    }
                    else if(p2_card_sum > p1_card_sum){
                        p2.addChips(pot);
                        pot = 0;

                        if(reportFlag) cout << "Player 1 has won!" << endl;

                        resetHand(p1, p2);

                        return false; // Hand finished
                    }
                    else{
                        if(reportFlag) cout << "TIE" << endl;
                        // Pot is not assigned to zero since its a tie and pot should be carried to the next hand

                        resetHand(p1, p2);

                        return false;
                    }

                }

            }
        }
    }

    // Returns -2: someone wants to exit // -1: Players still in game but no winner // 0: Player 0 wins // 1: Player 1 wins
    int betRound(Player &p1, Player &p2){

        // Check if there has been more than 3 raise
        bool canRaise = true;
        if(raiseCount > 3) canRaise = false;

        if(reportFlag) cout << "*************   PLAYER0   *************" << endl;

        // Get first player's bet
        int p1_bet = p1.getBet(p2.getHand().getVisible(), betHistory, bet2player, canRaise, pot);

        // Add bet to history
        Bet bet1_1 = Bet(p1_bet, 0);
        betHistory.addBet(bet1_1);

        if(p1_bet == util.EXIT) return -2; // Exit the game

        // Player 1 check (First bidding)
        if(p1_bet == 0 && betHistory.getCount() == 1){
            if(reportFlag) cout << "Player 0 check" << endl;

            if(reportFlag) cout << "*************   PLAYER1   *************" << endl;

            int p2_bet = p2.getBet(p1.getHand().getVisible(), betHistory, bet2player, canRaise, pot);
            // (A player cannot call if the previous bet was a check)
            while(p2_bet == 0){
                if(reportFlag) cout << "A player cannot call if the previous bet was a check!" << endl;
                if(reportFlag) cout << "What is your bet?" << endl;
                cin >> p2_bet;
            }

            // Add bet to history
            Bet bet2_1 = Bet(p2_bet, 1);
            betHistory.addBet(bet2_1);

            if(p2_bet == util.EXIT) return -2; // Exit the game


            // Player 1 check - Player 2 raise
            if(p2_bet > 0){
                if(reportFlag) cout << "Player 1 raise" << endl;
                raiseCount++;
                // Put the raise to the pot
                pot += p2_bet;
                // Decrement player 2's chips
                p2.subtractChips(p2_bet);

                // Update bet2player
                bet2player = p2_bet;

                return -1;
            }
        }
        // Player 1 Call
        else if(p1_bet == bet2player && bet2player != 0){
            if(reportFlag) cout << "Player 0 call" << endl;
            // Put chips to the pot
            pot += p1_bet;
            // Decrement player 1's chips
            p1.subtractChips(p1_bet);

            if(reportFlag) cout << "*************   PLAYER1   *************" << endl;

            int p2_bet = p2.getBet(p1.getHand().getVisible(), betHistory, bet2player, canRaise, pot);

            // Add bet to history
            Bet bet2_1 = Bet(p2_bet, 1);
            betHistory.addBet(bet2_1);

            if(p2_bet == util.EXIT) return -2; // Exit the game

            // Player 1 Call - Player 2 Call: the round stops
            if(p2_bet == bet2player) {
                if(reportFlag) cout << "Player 1 call" << endl;

                // Put chips to the pot
                pot += p2_bet;
                // Decrement player 2's chips
                p2.subtractChips(p2_bet);

                if(reportFlag) cout << "Both players called" << endl;
                return -1;
            }

            // Player 1 Call - Player 2 Raise
            if(p2_bet > bet2player){
                if(reportFlag) cout << "Player 1 raise" << endl;

                raiseCount++;
                pot += bet2player;
                p2.subtractChips(p2_bet);
                bet2player = p2_bet;

                return -1;
            }

        }

        // Player 1 Fold
        else if(((p1_bet < bet2player && bet2player > 0) || (p1_bet < bet2player && bet2player > 0))){
            if(reportFlag) cout << " Player 0 Fold" << endl;
            return 1;
        }
        // Player 1 raise
        else{
            if(reportFlag) cout << "Player 0 raise" << endl;
            raiseCount++;
            // Update bet2player
            bet2player = p1_bet;
            // Add raise to pot and subtract from the first player, also add move to history
            p1.subtractChips(p1_bet);
            pot += p1_bet;

            if(reportFlag) cout << "*************   PLAYER1   *************" << endl;

            int p2_bet = p2.getBet(p1.getHand().getVisible(), betHistory, bet2player, canRaise, pot);

            // Add bet to history
            Bet bet2_1 = Bet(p2_bet, 1);
            betHistory.addBet(bet2_1);

            //  Player 1 raise - Player 2 fold, pot goes to player 1
            if(p2_bet < bet2player && bet2player > 0){
                if(reportFlag) cout << "Player 1 fold" << endl;
                return 0;
            }
            //  Player 1 raise - Player 2 call
            if(p2_bet == bet2player){
                if(reportFlag) cout << "Player 1 call" << endl;

                pot += bet2player;
                p2.subtractChips(p2_bet);

                return -1;
            }
            //  Player 1 raise - Player 2 raise
            if(p2_bet > bet2player){
                if(reportFlag) cout << "Player 1 raise" << endl;

                raiseCount++;
                pot += p2_bet;
                p2.subtractChips(p2_bet);
                bet2player = p2_bet;

                return -1;
            }
        }
        return -1;
    }

    // Randomly shuffles the deck
    void shuffleDeck(){
        int size = deck.size();
        srand(time(0));
        for (int i = 0; i < size - 1; i++) {
            int j = i + rand() % (size - i);
            swap(deck[i], deck[j]);
        }
    }


public:

    Game(){
        reportFlag = false;
        bet2player = 0;
        deck = util.createDeck();
    }

    // plays a game between two players
    bool playGame( PlayerType p0, PlayerType p1, int &chips0, int &chips1, bool reportFlag){

        // Initial setup
        chips0 = util.initialChips;
        chips1 = util.initialChips;
        shuffleDeck();
        pot = 0;
        this->reportFlag = reportFlag;

        if(reportFlag) cout << "New Hand, Player 0 starts first." << endl;

        // Player pointers
        Player *player0;
        Player *player1;

        // Assign pointers with respect to PlayerTypes
        if(p0 == ALPHA){
            player0 = new AlphaPlayer(0, chips0);
        } else if(p0 == BETA){
            player0 = new BetaPlayer(0, chips0);
        } else if (p0 == HUMAN){
            player0 = new HumanPlayer(0, chips0);
        }
        else return true;

        if(p1 == ALPHA){
            player1 = new AlphaPlayer(0, chips0);
        } else if(p1 == BETA){
            player1 = new BetaPlayer(0, chips0);
        } else if (p1 == HUMAN){
            player1 = new HumanPlayer(0, chips0);
        }
        else return true;


        // Play hand for 20 times
        for(int i = 0; i < util.numHands / 2 ; i++){
            // Play hands and check if anyone wants to exit the program
            if(playHand(*player0, *player1)) return true;
            if(playHand(*player1, *player0)) return true;

        }

        chips0 = player0->getChips();
        chips1 = player1->getChips();

        cout << "Player 0 Chip #: " << chips0 << endl;
        cout << "Player 1 Chip #: " << chips1 << endl;

        free(player0);
        free(player1);

        return true;
    }

    // Clears players' hands and betHistory
    void resetHand(Player &p1, Player &p2){
        //Empty the hands of the player and clear betHistory after each hand
        p1.clearHand();
        p2.clearHand();
        betHistory.clearHistory();
        shuffleDeck();
    }

};


#endif //POKER_GAME_H
