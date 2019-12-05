//C Programming Assignment 4
//Alperen ÜGÜŞ
//Computer Engineering 2nd grade
//150160158
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


#define MAX_LINE 10000
#define MAX_CHAR 200
#define MAX_INSTRUCTIONS 10000

typedef struct instruction_s
{
     int step;
     int index;

}inst_struct;

char* get_word(char *s , int n);
void get_sentence(char **lines, struct instruction_s* instructions, int n_instructions , char *sentence);


int main(int argc, char *argv[])
{
    char *sentence;
    int line_counter=0;
    int inst_counter=0;
    int i=0;
    char line[200];

    //Memory alocation for the deciphered sentence
    sentence = (char*)malloc(sizeof(char) * MAX_LINE);

    //Open the book
    FILE *p = fopen(argv[1] , "r");

    //Memory alocation for double pointer and the strings in it

    char **book = (char**)malloc(sizeof(char*) * MAX_LINE);

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

	inst_struct *instructions = (inst_struct*)malloc(sizeof(inst_struct)*MAX_INSTRUCTIONS);

    FILE *inst = fopen(argv[2] , "r");

    //Getting the instructions
    for(i=0; i<MAX_LINE ; i++)
    {
        fscanf(inst , "%d", &instructions[i].step);
        fscanf(inst , "%d", &instructions[i].index);
        //BURAYA BAK
        if(instructions[i].step == '\0' && instructions[i].index == '\0') break;
        //printf("instructions[%d].step: %d\n" , i, instructions[i].step);
        inst_counter++;
    }

    //printf("Instructions[0].step: %d\n" , instructions[0].step);

    get_sentence(book, instructions, inst_counter ,sentence);

    //Find how to extract the word in the wanted index
    //printf("**%c**" , book[0][0]);

    //get_word(book[2171] , 14);

    fclose(p);
    fclose(inst);

    free(sentence);

    for(i=0;i<MAX_LINE;i++)
    {
        free(book[i]);
        book[i] = NULL;
    }
    free(book);
    book = NULL;
    free(instructions);
    instructions = NULL;


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
    char *word_p;
    word_p = (char*)malloc(sizeof(char) * MAX_CHAR);

    //Find the index of the wanted word
    for(i=0; i<MAX_CHAR; i++)
    {
       if(s[i]==' ')
       {
           if(s[i+1] != ' ')
           {
           index_counter++;
			}
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
        if(s[i] == ' ' || s[i] == '\n' || s[i] == '\0' || s[i] == '\v' || s[i] == '\f' || s[i] == '\r')
        {
            word[word_pos] = '\0';
            break;
        }
        word[word_pos] = s[i];
        word_pos++;
       

    }

    //printf("---%s---" , word);
    strcpy(word_p , word);
    //printf("\n*%s*\n" , word_p);
    return word_p;

}


void get_sentence(char **lines, struct instruction_s* instructions, int n_instructions , char *sentence)
{
    int i=0;
    char *pointer;

    //printf("instructions[0].step: %d\n" , instructions[i].step);
    //Correct the instruction steps
    for(i=1; i<n_instructions; i++)
    {
        instructions[i].step += instructions[i-1].step;
        //printf("instructions[%d].step: %d\n" , i, instructions[i].step);

    }
    

    //Get the word from each line


    //printf("instructions[9].step: %d\n" , instructions[9].step);
    //printf("instructions[0].step: %d\n" , instructions[0].step);

	strcpy(sentence , "");
    for(i=0; i<n_instructions; i++)
    {
        pointer = get_word(lines[instructions[i].step-1] , instructions[i].index);
        strcat(sentence, pointer);
        strcat(sentence, " ");
        free(pointer);
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
