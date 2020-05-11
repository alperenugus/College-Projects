#include <iostream>
#include "Graph.h"

using namespace std;


int main() {

    Graph graph = Graph();

    while(true){
        cout << "Enter a command: ";

        // Getting the command from the user
        string command;

        cin >> command;

        if(command == "INIT"){
            graph.MakeEmpty();
        }

        else if(command == "ADDV"){
            string vertex;
            cout << "Enter a name for the vertex: ";
            cin >> vertex;
            graph.AddVertex(vertex);
        }

        else if(command == "ADDE"){
            string vertex1;
            cout << "Enter the name of the vertex1: ";
            cin >> vertex1;

            string vertex2;
            cout << "Enter the name of the vertex2: ";
            cin >> vertex2;

            int weight;
            cout << "Enter the weight: ";
            cin >> weight;

            bool result = graph.AddEdge(vertex1, vertex2, weight);
            if(result) cout << "Successfully added!" << endl;
            else cout << "There was an error! (Either vertex not found.)" << endl;

        }

        else if(command == "GETE"){
            string vertex1;
            cout << "Enter the name of the vertex1: ";
            cin >> vertex1;

            string vertex2;
            cout << "Enter the name of the vertex2: ";
            cin >> vertex2;

            int result = graph.GetWeight(vertex1, vertex2);
            if(result == -1) cout << "There was an error! (Either vertex not found.)" << endl;
            else cout << result << endl;
        }

        else if(command == "PRINT"){
            if(graph.vertexList.size() == 0) cout << "Graph is empty!" << endl;
            else graph.Print();
        }

        else if(command == "TEST1"){

            graph.MakeEmpty();

            graph.AddVertex("Austin");
            graph.AddVertex("Dallas");
            graph.AddVertex("Washington");
            graph.AddVertex("Atlanta");
            graph.AddVertex("Houston");
            graph.AddVertex("Denver");
            graph.AddVertex("Chicago");

            graph.AddEdge("Atlanta", "Washington", 600);
            graph.AddEdge("Atlanta", "Houston", 800);
            graph.AddEdge("Austin", "Dallas", 200);
            graph.AddEdge("Austin", "Houston", 160);
            graph.AddEdge("Chicago", "Denver", 1000);
            graph.AddEdge("Dallas", "Austin", 200);
            graph.AddEdge("Dallas", "Denver", 780);
            graph.AddEdge("Dallas", "Chicago", 900);
            graph.AddEdge("Denver", "Atlanta", 1400);
            graph.AddEdge("Denver", "Chicago", 1000);
            graph.AddEdge("Houston", "Atlanta", 800);
            graph.AddEdge("Washington", "Dallas", 1300);
            graph.AddEdge("Washington", "Atlanta", 600);

            graph.Print();
        }

        else if(command == "TEST2"){
            cout << "This test is not implemented!" << endl;
        }

        else if(command == "QUIT"){
            break;
        } else{
            cout << "You entered a wrong command!" << endl;
        }




    }


}
