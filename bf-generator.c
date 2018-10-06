#include <stdio.h>
#include <string.h>
#define MAX 1000
int main(int argc,char **argv)
{
    int i = 0,j;
    char msg[MAX];
    int charcount = 1;
    char ch;
    if ( argc == 1 )
    {
        strcpy(msg,"Hello world\n");
    }
    else
    {
        strcpy(msg,argv[1]);
    }
    for(i = 0;i < strlen(msg);i++)
    {
        ch = msg[i];
        for(j = 0;j < (int)ch;j++)
        {
            printf("+");
            ++charcount;
            if ( charcount == 78 )
            {    
                printf("\n");
                charcount = 1;
            }
        }
        printf(".>");
        ++charcount;
        if( charcount == 78 )
        {
            printf("\n");
            charcount = 1;
        }
    }
}



