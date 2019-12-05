//C Programming Assignment 1
//Alperen ÜGÜŞ
//Computer Engineering 2nd grade
//150160158


#include <stdio.h>
#include <stdlib.h>

int main()
{

    int j=0;
    int k=0;
    int j_end=0;
    int k_end=0;
    int m=0;
    int q=0;
    int year=0;
    int end_year;
    int key=1;
    int day = 0;
    int days=0;
    int counter = 0;

    printf("Enter date [year month day]: ");

    scanf("%d %d %d" , &year, &m , &q);
    int next_year = year+1;
    int year_unmodified = year;

   while(key==1){
    if((m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) && (q>31 || q<=0))
    {
        printf("Invalid date.\n");
        return 1;
    }

    else if((m == 4 || m == 6 || m == 9 || m == 11) && (q>30 || q<=0))
    {
        printf("Invalid date.\n");
        return 1;
    }

    else if((m == 2) && (q>28 || q<=0))
    {
        printf("Invalid date.\n");
        return 1;
    }
	else if(year<0 || m<0 || q<0 || m>12)
	{
		printf("Invalid date.\n");
        return 1;
	}


    else
    {

        if(m == 1 || m == 2)
        {
            m = m + 12;
            year = year - 1;
        }

        k = year % 100;
        j = year  / 100;

        printf("Enter end year: ");
        scanf("%d" , &end_year);

        if(end_year<=next_year)
        {
            printf("Invalid date.\n");
            return 1;
        }

        day = q + (13*(m+1))/5 + k + k/4 + j/4 + 5*j;
        day = day%7;

        if(day == 0){
            printf("It's a Saturday.");
        }
        else if(day == 1){
            printf("It's a Sunday.");
        }
        else if(day == 2){
            printf("It's a Monday.");
        }
        else if(day == 3){
            printf("It's a Tuesday.");
        }
        else if(day == 4){
            printf("It's a Wednesday.");
        }
        else if(day == 5){
            printf("It's a Thursday.");
        }
        else if(day == 6){
            printf("It's a Friday.");
        }

        while(next_year<=end_year)
        {

            k_end = (next_year % 100);
            j_end = (next_year  / 100);

            days = q + (13*(m+1))/5 + k_end + k_end/4 + j_end/4 + 5*j_end;
            days = days%7;

            if(days == day)
                {
                    counter++;
                }

            next_year++;

        }

        printf("\nSame day-and-month on same weekday between %d and %d: %d\n" , year_unmodified+1, end_year, counter);
        break;

    }
}

    return EXIT_SUCCESS;
}
