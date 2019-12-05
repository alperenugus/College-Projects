
//C Programming Assignment 2
//Alperen ÜGÜŞ
//Computer Engineering 2nd grade
//150160158
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int size=0;
    int car_num=0;
    int loc_x=0;
    int loc_y=0;
    int grid[50][50] = {0};
    int distance[50][50] ={0};
    int pos_x[50] = {0}; int pos_y[50] = {0};
    int i=0; int j=0; int k=0;
    int x_dist = 0; int y_dist = 0; int total_xy = 0;
    int biggest = 0;
    int flag = 0; int x_flag = 0; int min_y = 0; int last_pos = 0;
    int x_last = 0; int y_last = 0;
    int same_x[50] = {0}; int same_y[50] = {0};

    printf("Size: ");
    scanf("%d" , &size);
    while(size>50 || size<1)
    {
        printf("Size must be between 50 and 1\n");
        printf("Size: ");
        scanf("%d" , &size);

    }

    printf("Cars: ");
    scanf("%d" , &car_num);

    while(car_num<0)
    {
        printf("min car num must be 0\n");
        printf("Cars: ");
        scanf("%d" , &car_num);
    }

    if(car_num > size * size) return EXIT_SUCCESS;

    if(car_num == size * size)
    {
        printf("Best Slot Found In: 0 0\n");
        return EXIT_SUCCESS;
    }
    for(i=0; i<car_num; i++)
    {
        printf("Locations: ");
        scanf("%d %d", &loc_x , &loc_y);
        if(loc_x==0 || loc_y == 0) return EXIT_SUCCESS;
        if(grid[loc_x-1][loc_y-1] != 1 && loc_x<=size && loc_y<=size)
        {
            grid[loc_x-1][loc_y-1] = 1;
            pos_x[i] = loc_x-1;
            pos_y[i] = loc_y-1;
        }


    }
    i = grid[0][1];
    //Find the distances between all empty slots and cars
     for(i=0; i<size; i++)
    {
        for(j=0; j<size; j++){
            distance[j][i] = 100;
        }
    }

    for(i=0; i<car_num; i++)
    {
        for(j=0; j<size; j++)
        {
            for(k=0; k<size; k++)
            {
                x_dist = pos_x[i] - k;
                if(x_dist<0) x_dist*=-1;
                y_dist = pos_y[i] - j;
                if(y_dist<0) y_dist*=-1;
                total_xy = x_dist + y_dist;
                if(distance[k][j]>total_xy)
                {
                    distance[k][j] = total_xy;
                }

            }
        }
    }

/*  for(i=0; i<size; i++)
    {
        for(j=0; j<size; j++)
        {
            printf("%d\n" , distance[j][i]);
        }
    }
*/

    biggest = distance[0][0];
    for(i=0; i<size; i++)
    {
        for(j=0; j<size; j++)
        {
            //Find the biggest distance
            if(distance[i][j]>biggest)
            {
                biggest = distance[i][j];
                x_last = i;
                y_last = j;
                //printf("biggest: %d\n" , biggest);
            }
        }
    }
    for(i=0; i<size; i++)
    {
        for(j=0; j<size; j++)
        {
            if(distance[j][i] == biggest)
            {

                same_x[flag] = j+1;
                same_y[flag] = i+1;
                flag++;
            }
        }
    }

    //All have different distances
    if(flag == 1) printf("Best Slot Found In: %d %d\n" , x_last+1 , y_last+1);
    //Some have same distances
    if(flag>1)
    {
        for(i=0; i<flag; i++)
        {
            for(j=i+1; j<flag; j++)
            {
                if(same_x[i] == same_x[j]) x_flag++;
            }

        }

        if(x_flag == 0) printf("Best Slot Found In: %d %d\n" , x_last+1 , y_last+1);

        if(x_flag!=0)
        {
            min_y = same_y[0];
            for(i=0; i<flag; i++)
            {
                if(min_y>same_y[i])
                {
                    last_pos = i;
                }
            }
            printf("Best Slot Found In: %d %d\n" , same_x[last_pos] , same_y[last_pos]);
        }
    }

    return 0;

}
