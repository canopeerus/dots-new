#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <string.h>
#include <cstdio>

#define PROGNAME "bfc"
#define MAXLINE 80
#define PROMPT "[<>] "

#define INTERPRETER 1
#define COMPILER 0

// define the infinite array/std::vector
std::vector<int> main_vector(MAXLINE);

// global data pointer variable
int vector_pointer = 0;

void print_usage()
{
    std::cout <<  "Usage: " << std::endl;
    std::cout << "\tbfc               :   interpreter mode" << std::endl;
    std::cout << "\tbfc path/to/file  :   compile code from file" << std::endl;
    std::cout << "\tbfc -h            :   display help" << std::endl;
    return;
}
char *strrev(char *str)
{
      char *p1, *p2;

      if (! str || ! *str)
            return str;
      for (p1 = str, p2 = str + strlen(str) - 1; p2 > p1; ++p1, --p2)
      {
            *p1 ^= *p2;
            *p2 ^= *p1;
            *p1 ^= *p2;
      }
      return str;
}
std::string toString(char *cstr)
{
    std::string str(cstr);
    return str;
}

int lexical_check(std::string str)
{
    int i = 0,ret_code;
    for(i = 0;i < str.length();i++)
    {
        if ( str.at(i) == '+' || str.at(i) == '-' ||
                str.at(i) == '>' || str.at(i) == '<' ||
                str.at(i) == '[' || str.at(i) == ']' ||
                str.at(i) == '.' || str.at(i) == ',' )
            ret_code = 0;
        else
        {
            ret_code = str.at(i);
            break;
        }
    }
    return ret_code;
}

void jump_loop_end(int *iptr,std::string linestr)
{
    int len = linestr.length();
    int i = 0;
    for(i = *iptr;i < len;i++)
        if ( linestr.at(*iptr) == ']' )
            break;
    (*iptr)++;
}

void jump_loop_back(int *iptr,std::string linestr)
{
    int i = 0;
    for(i = *iptr;i >= 0;i--)
    {
        if ( linestr.at(*iptr) == '[' )
            break;
    }
    if ( *iptr == linestr.length() -1 )

    (*iptr)++;
}
void parse_line(std::string linestr,int mode)
{
    int i = 0;
    int i_ptr= 0;
    int loop_flag = 0;
    for(i_ptr = 0;i_ptr < linestr.length();i_ptr++)
    {
        switch(linestr.at(i_ptr))
        {
            case '+':
                main_vector[vector_pointer]++;
                break;
            case '-':
                main_vector[vector_pointer]--;
                break;
            case '>':
                ++vector_pointer;
                break;
            case '<':
                if ( vector_pointer > 0 )
                    --vector_pointer;
                else
                    vector_pointer = 0;
                break;
            case ',':
                std::cin >> main_vector[vector_pointer];
		        std::cin.ignore(std::numeric_limits<std::streamsize>::max(),'\n');
		        std::cin.clear();
                break;
            case '.':
                if ( mode == INTERPRETER )
                    std::cout << main_vector[vector_pointer] << std::endl;
                else if ( mode == COMPILER )
                    std::cout << main_vector[vector_pointer];
                break;
            case '[':
                if ( main_vector[vector_pointer] == 0 )
                    jump_loop_end(&i_ptr,linestr);
                break;
            case ']':
                if ( main_vector[vector_pointer] != 0 )
                    jump_loop_back(&i_ptr,linestr);
                break;
        }
    }
}

void brainfuck_init()
{
    vector_pointer = 0;
    int i;
    for(i = 0;i < MAXLINE;i++)
        main_vector[i] = 0;
    return;
}

int main(int argc,char **argv)
{
    std::ifstream sfile_f;
    std::string line_str;
    char c_str[MAXLINE];
    int i = 0,l_check = 0;
    int line_count = 1;
    brainfuck_init();
    if ( argc == 1 )
    {
        std::cout << PROMPT;
        while ( std::cin.getline(c_str,MAXLINE) )
        {
            line_str = toString(c_str);
            l_check = lexical_check(line_str);
            if ( l_check != 0 )
                std::cout << "Error : Symbol not recognized : "<< char(l_check) << std::endl;
            else
                parse_line(line_str,1);
            std::cout << PROMPT;
            line_str.clear();
            std::cin.clear();
        }
    }
    else
    {
        if ( ! strcmp(argv[1],"-h") )
            print_usage();
        else
        {
            sfile_f.open(argv[1]);      // open brainfuck source file
            if ( ! sfile_f.good() )     // check if file is opened correctly
                std::cout << PROGNAME << " : file not found : " << argv[1] << std::endl;
            else
            {
                while(sfile_f.getline(c_str,MAXLINE) )
                {
                    line_str = toString(c_str);
                    l_check = lexical_check(line_str);
                    if ( l_check != 0)
                    {
                        std::cout << "Error at line " << line_count << " ,Incorrect symbol found : "<<(char)l_check << std::endl;
                        break;
                    }
                    else
                        parse_line(line_str,0);
                    line_str.clear();
                    sfile_f.clear();
                }
            }
            sfile_f.close();
        }
    }
    return 0;
}
