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


using namespace std;
using namespace std::chrono;


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
    
//        Printing the coordinates in order to check them
//        for(int i = 0; i < pointNum; i++){
//            cout << unvisited[i][0] << ' ' << unvisited[i][1] << endl;
//        }
    
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
    
    //    Boolean array to hold visited flags
    bool *gone = new bool[pointNum];
    
        for(int i = 0; i< pointNum ; i++){
            gone[i] = false;
//            cout << gone[i];
        }
//        cout << endl;
    
    int result = 0;
    int current = 0;
    int counter = 1;
    
    while (true) {
        gone[current] = true;
        int min = 99999;
        int min_index = 0;
        
        //        Search for the nearest neighbor
        for(int j = 0; j < pointNum; j++){
            if (distances[current][j] < min && gone[j] == false) {
                min = distances[current][j];
                min_index = j;
            }
        }
        
        //        Add to the result and change the current point to the arrived one
        result += min;
        current = min_index;
        
        //        cout << min << endl;
        //        cout << current << endl;
        counter++;
        //        If all points are done, return to the beginning
        if(counter == pointNum){
            result += distances[current][0];
            break;
        }
        
    }
    
    
    cout << "Result : " << result << endl;
    
    auto stop = high_resolution_clock::now();
    
    auto duration = duration_cast<microseconds>(stop - start);
    
    cout << "Time taken by function: " << duration.count() << " microseconds" << endl;
    
    
    return 0;
}
