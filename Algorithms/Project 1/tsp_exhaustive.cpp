//
//  main.cpp
//  TSP
//
//  Created by Alperen on 9/8/19.
//  Copyright © 2019 Alperen. All rights reserved.
//

#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <stdio.h>
#include <vector>
#include <cstdlib>
#include <algorithm>


using namespace std;
using namespace std::chrono;

int factorial(int n)
{
    if(n > 1)
        return n * factorial(n - 1);
    else
        return 1;
}


int main(int argc, const char * argv[]) {
    
    auto start = high_resolution_clock::now();
    
    int pointNum;
    ifstream in;
    in.open("/Users/alpi/Desktop/C++/TSP/TSP/4.txt");
    in >> pointNum;
    //    cout << pointNum << endl;
    
    //    Dynamic array for coordinate points
    int **unvisited = new int *[pointNum];
    for (int i = 0; i < pointNum; i++) {
        unvisited[i] = new int[2];
    }
    
    //    Read coordinates from the file and insert into the array
    for(int i = 0; i < pointNum; i++){
        in >> unvisited[i][0];
        in >> unvisited[i][1];
    }
    
    //    Printing the coordinates in order to check them
//    for(int i = 0; i < pointNum; i++){
//        cout << unvisited[i][0] << ' ' << unvisited[i][1] << endl;
//    }
    
    //    Initializing 2D dynamic distances array
    int **distances = new int *[pointNum];
    
    for (int i = 0; i < pointNum; i++) {
        distances[i] = new int[1];
    }
    
    //    Find out all distances
    for(int i = 0; i < pointNum; i++){
        for(int j = 0; j < pointNum; j++){
            distances[i][j] = abs(unvisited[i][0] - unvisited[j][0]) + abs(unvisited[i][1] - unvisited[j][1]);
        }
    }
    
    //    Printing all distances
//    for(int i = 0; i < pointNum; i++){
//        for(int j = 0; j < pointNum; j++){
//            cout << distances[i][j] << ' ';
//        }
//        cout << endl;
//    }
    
    //    Generation of natural numbers up to n - 1 that we use for different paths
    int *numbers = new int[pointNum - 1];
    for(int i = 0; i < pointNum - 1; i ++){
        numbers[i] = i + 1;
        //        cout << numbers[i];
    }
    
    
    //    Number of all possible paths
    int permutations = factorial(pointNum - 1);
    
    int **paths = new int *[permutations];
    for (int i = 0; i < permutations; i++) {
        paths[i] = new int[pointNum + 1];
    }
    
    //    Start and End points would be the initial one
    for(int i = 0; i < permutations; i++){
        paths[i][0] = 0;
        paths[i][pointNum] = 0;
    }
    
    
    int counter = 0;
    
    //    Generation of all possible permutations
    sort (numbers, numbers + pointNum - 1);
//    cout << "The 3! possible permutations with 3 elements:\n";
    do {
        for(int i = 0; i < pointNum - 1; i++){
            paths[counter][i+1] = numbers[i];
        }
        counter++;
    } while ( std::next_permutation(numbers,numbers + pointNum - 1) );
    
//    for(int i = 0; i < permutations; i++){
//        for(int j = 0; j < pointNum + 1; j++){
//            cout << paths[i][j];
//        }
//        cout << endl;
//    }
    
    
    int *perm_dist = new int[permutations];
    
    for (int i = 0; i < permutations; i++) {
        perm_dist[i] = 0;
    }
    //    Calculate all the distances of all permutations
    for(int i = 0; i < permutations; i++){
        
        for(int j = 0; j < pointNum; j++){
            perm_dist[i] += distances[paths[i][j]][paths[i][j + 1]];
        }
    }
    
    
    
//    for(int j = 0; j < permutations; j++){
//        cout << perm_dist[j] << endl;
//    }
    
    int min = perm_dist[0];
    int min_path_index = 0;
    
    for(int i = 0; i < permutations; i++){
        if(perm_dist[i] < min){
            min = perm_dist[i];
            min_path_index = i;
        }
    }
    
//    cout << min_path_index << endl;
    cout << "Result : " << perm_dist[min_path_index] << endl;
    
    auto stop = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stop - start);
    
    for (int i = 0; i < pointNum; i++) {
        delete unvisited[i];
    }
    
    delete[] unvisited;
    
    for (int i = 0; i < pointNum; i++) {
        delete distances[i];
    }
    
    delete[] distances;
    delete[] numbers;
    
    for (int i = 0; i < permutations; i++) {
        delete paths[i];
    }
    
    delete[] paths;
    delete[] perm_dist;
    
    cout << "Time taken by function: "
    << duration.count() << " microseconds" << endl;
    
    
    
    return 0;
}

