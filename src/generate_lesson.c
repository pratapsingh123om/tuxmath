/* generate_lesson.c

   A simple standalone program to help test the creation of valid 
   question lists by mathcards.

   Copyright 2008, 2009,2010, 2011.
Author: Tim Holy.
Project email: <tuxmath-devel@lists.sourceforge.net>
Project website: http://tux4kids.alioth.debian.org


generate_lesson.c is part of "Tux, of Math Command", a.k.a. "tuxmath".

Tuxmath is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

Tuxmath is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.  */



#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h> // For isdigit()

#include "globals.h"
#include "options.h"
#include "mathcards.h"
#include "fileops.h"

/* Compile this with the following statement:

   gcc -lm -o generate_lesson -DDATA_PREFIX=\"/usr/local/share/tuxmath\" generate_lesson.c mathcards.c options.c fileops.c lesson.c

Usage: generate_lesson configfile1 configfile2 ...

*/

/* Declarations needed for the auxillary functions */
char **lesson_list_titles = NULL;
char **lesson_list_filenames = NULL;
int num_lessons = 0;

int read_high_scores_fp(FILE* fp)
{
    /* This is a stub to let things compile */
    return 1;
}

void initialize_scores(void)
{
    /* This is a stub to let things compile */
}  

// Function to parse fractional answers
int parse_fraction(const char* input, double* result) {
    char* slash_pos = strchr(input, '/');
    if (slash_pos) {
        int numerator = atoi(input);
        int denominator = atoi(slash_pos + 1);
        if (denominator == 0) {
            fprintf(stderr, "Error: Division by zero in fraction %s\n", input);
            return 0;
        }
        *result = (double)numerator / denominator;
        return 1;
    }
    return 0; // Not a fraction
}

// Modify MC_PrintQuestionList to display fractional questions
void MC_PrintQuestionList(MC_MathGame* game, FILE* output) {
    for (int i = 0; i < game->num_questions; i++) {
        if (game->questions[i].is_fraction) {
            fprintf(output, "Question %d: %d/%d\n", i + 1, 
                    game->questions[i].numerator, 
                    game->questions[i].denominator);
        } else {
            // ...existing code for non-fractional questions...
        }
    }
}

// Modify MC_StartGame to generate fractional questions
void MC_StartGame(MC_MathGame* game) {
    for (int i = 0; i < game->num_questions; i++) {
        if (rand() % 2 == 0) { // Randomly decide if the question is fractional
            game->questions[i].is_fraction = 1;
            game->questions[i].numerator = rand() % 10 + 1;
            game->questions[i].denominator = rand() % 10 + 1;
        } else {
            // ...existing code for non-fractional questions...
        }
    }
}

// Modify answer validation to support fractions
int validate_answer(const char* input, MC_Question* question) {
    double answer;
    if (question->is_fraction) {
        if (!parse_fraction(input, &answer)) {
            fprintf(stderr, "Invalid fractional answer: %s\n", input);
            return 0;
        }
        return fabs(answer - ((double)question->numerator / question->denominator)) < 1e-6;
    } else {
        // ...existing code for non-fractional answers...
    }
}

int main(int argc,char *argv[])
{
    int i;
    MC_MathGame game;

    /* Initialize MathCards backend for math questions: */
    if (!MC_Initialize(&game))
    {
        fprintf(stderr, "\nUnable to initialize MathCards\n");
        fprintf(stderr, "\nUnable to initialize MathCards\n");
        exit(1);
    }

    /* initialize game_options struct with defaults DSB */
    if (!Opts_Initialize())
    {
        fprintf(stderr, "\nUnable to initialize game_options\n");
        exit(1);
    }

    /* This next bit allows multiple config files to be read in sequence, since
       this is something that happens in the ordinary course of events
       in tuxmath itself. */
    for (i = 1; i < argc; i++) {
        fprintf(stderr, "Reading %s\n",argv[i]);
        read_named_config_file(&game, argv[i]);
    }
    fprintf(stderr, "All done reading!\n");

    MC_StartGame(&game);
    MC_PrintQuestionList(&game, stdout);
    return 0;
}
