#include <iostream>

#include "Game.h"
#include "PlayerType.h"
#include <string>

int main() {

    Game game;
    Util util;
    int chips0 = util.initialChips;
    int chips1 = util.initialChips;

    string command;

    cout << "Command (HH (Human vs Human), HA (Human vs Alpha), AA (Alpha vs Alpha), QUIT)" << endl;

    cin >> command;

    while(!(command == "HH" || command == "HA" ||command == "AA" ||command == "QUIT")){
        cout << "You have entered a wrong command." << endl;

        cout << "Command (HH (Human vs Human), HA (Human vs Alpha), AA (Alpha vs Alpha), QUIT):" << endl;
        cin >> command;
    }

    bool result = false;

    if(command == "HH"){
        result = game.playGame(HUMAN, HUMAN, chips0, chips1, true);
        if(result) return 0;
    }
    else if(command == "HA"){
        result = game.playGame(HUMAN, ALPHA, chips0, chips1, true);
        if(result) return 0;
    }
    else if(command == "AA"){
        result = game.playGame(ALPHA, ALPHA, chips0, chips1, false);
        if(result) return 0;
    }
    else return 0;

    return 0;
}
