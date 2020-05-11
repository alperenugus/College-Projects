//
// Created by ms2 on 3/17/2019.
//

#include "BetaPlayer.h"
#include <chrono>


//------------------------------------------------------------------------
// Name:  BetaPlayer::getBet()
//
// Description: Get's a bet from the beta AI player.
//
// Arguments:
//	Hand opponent - visible portion of hand of the opponent
//  BetHistory bh - History of current betting round
//  int bet2player - current bet to the player
//  bool canraise - if true, the player may raise, if false he may only call
//  int pot - current size of the pot
//
// Modifies:  none
//
// Returns: the bet amount including the amount to to the player (i.e. the amount
//  to be put in the pot.
//  -1 is a command to quit (only comes from the human player)
//  0 is a fold IF there is a bet to the player (otherwise, it's just a call)
//
//--------------------------------------------------------------------
int BetaPlayer::getBet(Hand opponent, BetHistory bh, int bet2player, bool canraise, int pot)
{
    int bet = 0 ;   // the bet we develop

    // number of bets in round
    int nbets = bh.getCount() ;

    // number of cards in hand (to find out if this is the last round)
    int ncards = m_hand.getCount() ;

    srand(chrono::system_clock::now().time_since_epoch().count());
    int hiddenGuess = rand() % 5 + 1 ;

    // compare the hands
    int delta = m_hand.evaluate() - opponent.evaluate();
    delta -= hiddenGuess;

    // There are still cards to withdraw
    if( ncards < 5 )
    {
        // There are still cards to withdraw - There have been no prior bets
        if( nbets == 0 )
        {
            if(delta > 5)
            {
                // Random number between 6-10
                bet = rand() % 6 + ( std::rand() % ( 10 - 6 + 1 ) );
            }

            else if(delta > 3)
            {
                // Random number between 4-8
                bet = rand() % 4 + ( std::rand() % ( 8 - 4 + 1 ) );
            }

            else if(delta > 1)
            {
                // Random number between 1-4
                bet = rand() % 1 + ( std::rand() % ( 4 - 1 + 1 ) );
            }

            else
            {
                bet = 0;
            }
        }
        //  There are still cards to withdraw - There have been prior bets
        else
        {
            // There are still cards to withdraw - There have been prior bets - Prior bet was a call
            if( bet2player == 0 )
            {
                if( delta > 5 && pot > 30 )
                {
                    bet = 10 ;
                }
                else if( pot < 25 )
                {
                    bet = 1 ;
                }
                else
                {
                    bet = 0 ;  // this is a call because the bet to the player was a call
                } // endif
            }

            // There are still cards to withdraw - There have been prior bets - Prior bet was a raise - bet2player < delta * 2
            else if(bet2player < delta * 2)
            {
                if(delta > 5)
                {
                    bet = bet2player + rand() % 6 + ( std::rand() % ( 10 - 6 + 1 ) );
                }
                else if(delta > 3)
                {
                    bet = bet2player + rand() % 4 + ( std::rand() % ( 8 - 4 + 1 ) );
                }
                else if(delta > 2)
                {
                    bet = bet2player + rand() % 1 + ( std::rand() % ( 4 - 1 + 1 ) );
                }
                else
                {
                    bet = 0; // this is a fold
                }
            }
            // There are still cards to withdraw - There have been prior bets - Prior bet was a raise - bet2player > delta * 2
            else{
                if(delta > 3)
                {
                    bet = bet2player + rand() % 4 + ( std::rand() % ( 8 - 4 + 1 ) );
                }
                else if(delta > 2)
                {
                    bet = bet2player + rand() % 1 + ( std::rand() % ( 4 - 1 + 1 ) );
                }
                else
                {
                    bet = 0; // this is a fold
                }
            }

        } // endif
    }
        // Last betting round
    else
    {
        // Last betting round - There have been no prior bets
        if( nbets == 0 )
        {
            if(delta > 5)
            {
                bet = rand() % 6 + ( std::rand() % ( 10 - 6 + 1 ) );
            }

            else if(delta > 3)
            {
                bet = rand() % 4 + ( std::rand() % ( 8 - 4 + 1 ) );
            }

            else if(delta > 1)
            {
                bet = rand() % 1 + ( std::rand() % ( 4 - 1 + 1 ) );
            }

            else
            {
                bet = 0;
            }
        }
        // Last betting round - There have been prior bets
        else
        {
            // Last betting round - There have been prior bets - Prior bet was a call
            if( bet2player == 0 )
            {
                if(pot > 50)
                {
                    bet = 10;
                }
                else if(pot > 30)
                {
                    bet = 5;
                }
                else
                {
                    bet = 0;
                }
            }
            // Last betting round - There have been prior bets - Prior bet was a raise
            else
            {
                if(delta > 5)
                {
                    bet = bet2player + 10 ;  // this is a raise of 10
                }
                else if(delta > 1)
                {
                    bet = bet2player ; // this is a call
                }
                else
                {
                    bet = 0;
                }
            }

        } // endif
    } // endif

    // if we cannot raise, the bet cannot be greater than bet2player
    if( canraise == false &&
        bet > bet2player )
    {
        bet = bet2player ;
    }  // endif

    return bet ;

}  // end BetaGetBet
