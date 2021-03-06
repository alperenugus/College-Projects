//========================================================
//
//  File Name:   main.cpp
//
//  Author:  Mark Baldwin
//
//  Course and Assignment:   CSCI477 Project 2 
//
//  Description:  This code is the driver for the class project
//
//=========================================================

//----- Includes and Namesapce ----------

#include <string>
#include <iostream>
#include <stdlib.h>
#include <time.h>
#include "Game.h"

using namespace std;


//----------------------------------------------------------------------
//
// Name:  main()
//
// Description: Test driver for game
//
// Inputs:
//    none
//
// Outputs:
//    returns 0
//
// Assumptions:
//    none
//
//----------------------------------------------------------------------
int main()
{
    string cmd ;  // command string

    // loop through a command loop to run varios hardwired test
    while( true ) // basically, an infinite loop
    {
        // get the comand
        cout << "Command (HH (human vs human), HA (human vs alpha), HB (human vs beta), AA (alpha vs alpha), AB (alpha vs beta), MC (Monte Carlo), QUIT): " ;
        getline( cin, cmd ) ;

        // flush the cin buffer
        cin.clear() ;
        fflush(stdin);

        // human vs human
        if( cmd == "HH" ||
            cmd == "hh" )
        {
            Game g1 ;   // create the game
            int result1, result2 ;  // results of the game

            if(g1.playGame(HUMAN, HUMAN, result1, result2, true) == true )
            {
                cout << "Game aborted." << endl ;
            }
        }
            // human vs alpha
        else if( cmd == "HA" ||
                 cmd == "ha"  )
        {
            Game g1 ;   // create the game
            int result1, result2 ;  // results of the game

            if(g1.playGame(HUMAN, ALPHA, result1, result2, true) == true )
            {
                cout << "Game aborted." << endl ;
            }
        }
            // human vs beta
        else if( cmd == "HB" ||
                 cmd == "hb"  )
        {
            Game g1 ;   // create the game
            int result1, result2 ;  // results of the game

            if(g1.playGame(HUMAN, BETA, result1, result2, true) == true )
            {
                cout << "Game aborted." << endl ;
            }
        }
            // alpha vs alpha
        else if( cmd == "AA" ||
                 cmd == "aa"  )
        {
            Game g1 ;   // create the game
            int result1, result2 ;  // results of the game

            if(g1.playGame(ALPHA, ALPHA, result1, result2, true) == true )
            {
                // note, since AI's never quit, this should never happen but kept for consistency
                cout << "Game aborted." << endl ;
            }
        }
            // alpha vs beta
        else if( cmd == "AB" ||
                 cmd == "ab"  )
        {
            Game g1 ;   // create the game
            int result1, result2 ;  // results of the game

            if(g1.playGame(ALPHA, BETA, result1, result2, true) == true )
            {
                // note, since AI's never quit, this should never happen but kept for consistency
                cout << "Game aborted." << endl ;
            }
        }
            // alpha vs beta Monte Carlo
        else if( cmd == "MC" ||
                 cmd == "mc"  )
        {
            Game g1 ;   // create the game
            int result1, result2 ;  // results of the game
            int p1_count = 0;
            int p2_count = 0;

            for(int i=0; i < 100; i ++){
                g1.playGame(ALPHA, BETA, result1, result2, false);
                if(result1 > result2) p1_count++;
                if(result2 > result1) p2_count++;
            }

            cout << "Monte Carlo simulation completed. Alpha won " << p1_count << " games and Beta won " << p2_count << " games." << endl ;

        }

            // quit the program
        else if( cmd == "quit" ||
                 cmd == "QUIT" )
        {
            break ;  // exit the loop
        }
            // command not understood
        else
        {
            cout << "Command " << cmd << " not understood." << endl ;
        } // end else
    }  // end do

    return 0;
} // end main

