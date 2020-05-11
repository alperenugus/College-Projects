//
// Created by Alperen on 3/11/20.
//

#ifndef GAMEMAP_GRAPH_H
#define GAMEMAP_GRAPH_H

#include <string>
#include <vector>
#include <stack>
#include "Vertex.h"
#include <iostream>
#include <queue>

const int INFINITY = std::numeric_limits<int>::max();

using namespace std;

// Comparator Function for Priority Queue
bool Compare(const Vertex* lhs, const Vertex* rhs){
    return lhs->d > rhs->d;
}

class Graph {
public:
    vector<Vertex> vertexList;

    // Clears the vertexList
    void MakeEmpty() {
        vertexList.clear();
    }

    // Adds a new vertex to the vertexList
    void AddVertex(string vertexname) {
        Vertex newVertex;
        newVertex.name = vertexname;
        vertexList.push_back(newVertex);
    }

    // Adds a new between two vertices in the vertexList
    bool AddEdge(string fromVertex, string toVertex, int cost) {
        for (auto &vertex1 : vertexList) {
            if (vertex1.name == fromVertex) {
                for (auto &vertex2 : vertexList) {
                    if (vertex2.name == toVertex) {
                        vertex1.adjList.insert(pair<Vertex*, int>(&vertex2, cost));
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
                map<Vertex*, int>::iterator itr;

                for (itr = vertex1.adjList.begin(); itr != vertex1.adjList.end(); ++itr) {
                    if (itr->first->name == toVertex) return itr->second;
                }
            }
        }
        return -1;
    }

    // Fills the vVertex with the adjacents of fromVertex
    bool GetAdjacent(string fromVertex, vector<string> &vVertex) {
        for (auto &vertex1 : vertexList) {
            if (vertex1.name == fromVertex) {
                map<Vertex*, int>::iterator itr;
                for (itr = vertex1.adjList.begin(); itr != vertex1.adjList.end(); ++itr) {
                    vVertex.push_back(itr->first->name);
                }
            }
        }
    }

    // Prints out the vertices in the verticeList and their adjacents
    void Print() {
        for (auto &vertex : vertexList) {
            cout << vertex.name << "; Adjacent: ";
            map<Vertex*, int>::iterator itr;
            for (itr = vertex.adjList.begin(); itr != vertex.adjList.end();) {
                cout  << itr->first->name << "(" << itr->second << ")";
                if(!(++itr == vertex.adjList.end())) cout << ", ";
            }

            if(vertex.adjList.size() == 0) cout << "No Adjacent Vertices";

            cout << endl;
        }
    }

    // Returns a reference to the actual object in vertexList
    Vertex* getVertex(string name){
        for(auto &vertex : vertexList){
            if(vertex.name == name) return &vertex;
        }
        return NULL;
    }

    int Dijkstra( string startVertex, string endVertex, vector<string> &vVertex ){

        if(startVertex == endVertex) return 0;

        // Flags to check if the vertices exist
        bool flag1 = false;
        bool flag2 = false;

        // Priority Queue with the comparator function defined above
        vector<Vertex*> Q;

        // Push each vertex to the priority queue, set their distance value to infinity except from the starting vertex
        for(auto &vertex : vertexList){

            if(vertex.name == startVertex){
                vertex.d = 0;
                flag1 = true;
            }
            else{
                if(vertex.name == endVertex) flag2 = true;
                vertex.d = INFINITY;
            }
            vertex.parent = NULL;
            Q.push_back(&vertex);
        }

        // Check if the vertices exist in the graph
        if(!(flag1 && flag2)) return -1;

        // Sort the Queue with respect to the Compare function which compares the d values in vertices
        sort(Q.begin(), Q.end(), Compare);

        // For each vertex in the priority queue Q
        while(!Q.empty()){

            // Get the vertex which has the lowest distance value
            Vertex* u = Q.back();
            Q.pop_back();

            // If there is a low distance path to the adjacent vertices, update their distance value and set their parents
            for(auto &v : u->adjList){
                if(v.first->d > u->d  + v.second){
                    v.first->d = u->d  + v.second;
                    v.first->parent = u;
                    // Re-sort the priority queue since d value of v has changed. (Decrease-Key Operation)
                    sort(Q.begin(), Q.end(), Compare);
                }
            }
        }

        // Stack to reverse the order of the path
        stack<string> path;

        // Get the end vertex reference from the graph
        Vertex* end_ref = getVertex(endVertex);

        // Push the final destination to the path
        path.push(end_ref->name);

        // Variable to store the sum of distances through the path
        int totalDistance = 0;

        // Back-propagation to find out the path
        while(end_ref->parent){
            if(end_ref->parent->name != startVertex) path.push(end_ref->parent->name);

            // Add each distance to the total. Note that difference will change if the order of the parameters changes
            totalDistance += GetWeight(end_ref->parent->name, end_ref->name);

            end_ref = end_ref->parent;

            // If startVertex is reached, stop
            if(end_ref->name == startVertex) break;
        }

        // Put reversed ordered stack to vVertex
        while(!path.empty()){
            string s = path.top();
            path.pop();
            vVertex.push_back(s);
        }

        return totalDistance;
    }

};


#endif //GAMEMAP_GRAPH_H
