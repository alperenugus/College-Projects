//C Programming Assignment 4
//Alperen ÜGÜŞ
//Computer Engineering 2nd grade
//150160158
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define MAX_LINE 10000
#define MAX_CHAR 200
#define MAX_INSTRUCTIONS 10000

struct instruction_s
{
     int step;
     int index;

};

char* get_word(char *s , int n);
void get_sentence(char **lines, struct instruction_s* instructions, int n_instructions , char *sentence);


int main()
{
    char *sentence;
    int line_counter=0;
    int inst_counter=0;
    int i=0;
    char line[200];

    //Memory alocation for the deciphered sentence
    sentence = (char*)malloc(sizeof(char) * MAX_LINE);

    //Open the book
    FILE *p = fopen("alice.txt" , "r");

    //Memory alocation for double pointer and the strings in it

    char **book = (char*)malloc(sizeof(char*) * MAX_LINE);

    for(i=0;i<MAX_LINE;i++)
    {
        book[i]=(char *)malloc(MAX_CHAR * sizeof(char));
    }

    //Reading book into the double pointer
    for(i=0; i<MAX_LINE ; i++)
    {
        fgets(line , 200 , p);
        strcpy(book[i] , line);
        line_counter++;
        //if(fgets(line , 200 , p)=='\0') break;
    }

    //printf("Line Counter: %d\n" , line_counter);
    //printf("Book[0]: %s\n" , book[1868]);

    struct instruction_s instructions[MAX_INSTRUCTIONS];

    FILE *inst = fopen("instructions.txt" , "r");

    //Getting the instructions
    for(i=0; i<MAX_LINE ; i++)
    {
        fscanf(inst , "%d", &instructions[i].step);
        fscanf(inst , "%d", &instructions[i].index);
        if(instructions[i].step == '\0') break;
        inst_counter++;
    }

    //printf("Instructions[0].step: %d\n" , instructions[0].step);

    get_sentence(book, instructions, inst_counter ,sentence);

    //Find how to extract the word in the wanted index
    //printf("**%c**" , book[0][0]);

    //get_word(book[2171] , 14);

    fclose(p);
    fclose(inst);

    free(p);
    free(inst);
    free(sentence);

    p = NULL;
    inst = NULL;
    sentence = NULL;


    return 0;
}

//Gets the line and takes the word
char* get_word(char *s , int n)
{
    int i=0;
    int index_counter=0;
    char word[200];
    int word_pos=0;
    int pos=0;

    //Find the index of the wanted word
    for(i=0; i<MAX_CHAR; i++)
    {
       if(s[i]==' ')
       {
           index_counter++;
       }
       if(index_counter == n-1)
       {
           pos = i+1;
           break;
       }
    }
    //If the word is at the beginning of the line
    if(index_counter==0 && pos==1) pos=0;


    //printf("\nindex counter = **%d**" , index_counter);
    //printf("pos = %d", pos);

    //Take the word into a char array
    for(i=pos; i<MAX_CHAR ; i++)
    {
        if(s[i] == ' ' || s[i] == '\n')
        {
            word[word_pos] = '\0';
            break;
        }
        word[word_pos] = s[i];
        word_pos++;
    }

    //printf("---%s---" , word);
    return word;

}


void get_sentence(char **lines, struct instruction_s* instructions, int n_instructions , char *sentence)
{
    int i=0;

    //Correct the instruction steps
    for(i=1; i<n_instructions; i++)
    {
        instructions[i].step += instructions[i-1].step;

    }

    //Get the word from each line

    strcpy(sentence , "");

    for(i=0; i<n_instructions; i++)
    {
        strcat(sentence, get_word(lines[instructions[i].step-1] , instructions[i].index));
        strcat(sentence, " ");
    }
    //printf("%s" , sentence);

    i=0;

    for(i=0; i<MAX_LINE; i++)
    {
        if(sentence[i]!='\0' && !(ispunct(sentence[i])))
        {
            putchar(tolower(sentence[i]));
        }
        if(sentence[i]=='\0') break;
    }

}
