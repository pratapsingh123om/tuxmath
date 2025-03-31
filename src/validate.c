/*
   validate.c:

   Contains functions to validate answers for math questions.

   Copyright 2005, 2006, 2007, 2008, 2009, 2010.
Authors: David Bruce, Tim Holy
Project email: <tuxmath-devel@lists.sourceforge.net>
Project website: http://tux4kids.alioth.debian.org


validate.c is part of "Tux, of Math Command", a.k.a. "tuxmath".

Tuxmath is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

Tuxmath is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/

#include "validate.h"
#include "game.h"
#include "display.h"

void validate_fraction_answer(int num, int denom) {
    // Simplify the fraction and compare with the correct answer
    int gcd = find_gcd(num, denom);
    num /= gcd;
    denom /= gcd;

    char correct_answer[32];
    snprintf(correct_answer, sizeof(correct_answer), "%d/%d", num, denom);

    if (strcmp(correct_answer, current_game->answer) == 0) {
        display_message("Correct!");
    } else {
        display_message("Incorrect!");
    }
}

// Helper function to find GCD
int find_gcd(int a, int b) {
    return b == 0 ? a : find_gcd(b, a % b);
}