
//C Programming Assignment 2
//Alperen ÜGÜŞ
//Computer Engineering 2nd grade
//150160158
#include <stdio.h>
#include <stdlib.h>

int point(int segment, char ring);
int game(int cur_point , int segment , char ring);

int init_point = 0;

int main()
{
    int segment = 0;
    char ring;

    printf("Target: ");
    scanf("%d" , &init_point);
    printf("\n");

    int cur_point = init_point;



    while (init_point != 0)
    {
        printf("Throw: ");
        scanf("%d %c" , &segment , &ring);
        printf("Points: %d\n", game(cur_point, segment, ring));

    }

    return 0;
}


int game(int cur_point , int segment , char ring)
{
    int prev_init_point = init_point;
    if(cur_point == init_point)
    {
        if(ring == 'D')
        {
            init_point -= point(segment , ring);
        }

        else
        {
            init_point = init_point;
        }
    }
    else
    {
        init_point -= point(segment , ring);
    }


    if(init_point < 0 || init_point == 1)
    {
        init_point = prev_init_point;
    }

    if(init_point == 0 && ring != 'D')
    {
        init_point = prev_init_point;
    }

    if(init_point == 0 && ring == 'D')
    {
        init_point = 0;
    }

    return init_point;
}



int point(int segment , char ring)
{
    int score = 0;

    if(ring == 'T')
    {
        score += segment * 3;
    }

    if(ring == 'D')
    {
        score += segment * 2;
    }

    if(ring == 'S')
    {
        score += segment;
    }

    if(ring == 'O')
    {
        score += 25;
    }

    if(ring == 'I')
    {
        score += 50;
    }

    return score;
}
