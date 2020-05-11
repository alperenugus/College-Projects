//
// Created by Alperen on 3/11/20.
//

#ifndef GAMEMAP_GRAPH_H
#define GAMEMAP_GRAPH_H

#include <string>
#include <vector>
#include "Vertex.h"
#include <iostream>

using namespace std;

class Graph {
public:
    vector<Vertex> vertexList;

    // Clears the vertexList
    void MakeEmpty() {
        vertexList.clear();
    }

    // Adds a new vertex to the vertexList
    void AddVertex(string vertexname) {
        Vertex newVertex;// = Vertex();
        newVertex.name = vertexname;
        vertexList.push_back(newVertex);
    }

    // Adds a new between two vertices in the vertexList
    bool AddEdge(string fromVertex, string toVertex, int cost) {
        for (auto &vertex1 : vertexList) {
            if (vertex1.name == fromVertex) {
                for (auto &vertex2 : vertexList) {
                    if (vertex2.name == toVertex) {
                        vertex1.adjList.insert(pair<string, int>(toVertex, cost));
                        return true;
                    }
                }
            }
        }
        return false;
    }

    // Returns the weight from one vertex to another
    int GetWeight(string fromVertex, string toVertex) {
        for (auto &vertex1 : vertexList) {
            if (vertex1.name == fromVertex) {

                map<string, int>::iterator itr;

                for (itr = vertex1.adjList.begin(); itr != vertex1.adjList.end(); ++itr) {
                    if (itr->first == toVertex) return itr->second;
                }

            }
        }
        return -1;
    }

    // Fills the vVertex with the adjacents of fromVertex
    bool GetAdjacent(string fromVertex, vector<string> &vVertex) {
        for (auto &vertex1 : vertexList) {
            if (vertex1.name == fromVertex) {
                map<string, int>::iterator itr;
                for (itr = vertex1.adjList.begin(); itr != vertex1.adjList.end(); ++itr) {
                    vVertex.push_back(itr->first);
                }
            }
        }
    }

    // Prints out the vertices in the verticeList and their adjacents
    void Print() {
        for (auto &vertex : vertexList) {
            cout << vertex.name << "; Adjacent: ";
            map<string, int>::iterator itr;
            for (itr = vertex.adjList.begin(); itr != vertex.adjList.end();) {
                cout  << itr->first << "(" << itr->second << ")";
                if(!(++itr == vertex.adjList.end())) cout << ", ";
            }

            if(vertex.adjList.size() == 0) cout << "No Adjacent Vertices";

            cout << endl;
        }
    }
};


#endif //GAMEMAP_GRAPH_H
