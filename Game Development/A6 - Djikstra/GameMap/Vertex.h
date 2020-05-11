//
// Created by Alperen on 3/11/20.
//

#ifndef GAMEMAP_VERTEX_H
#define GAMEMAP_VERTEX_H

#include <string>
#include <map>


using namespace std;

class Vertex {

public:
    string name;
    map<Vertex*, int> adjList;
    Vertex* parent = NULL;
    int d;
};

#endif //GAMEMAP_VERTEX_H
