#ifndef COMMON_H
#define COMMON_H

#include <SDL2/SDL.h>
#include <t4k_common.h>
#include <wchar.h>

// Constants
#define MAX_LINEWIDTH 256

/* Function declarations */
void game_set_start_message(const wchar_t* m1, const wchar_t* m2, const wchar_t* m3, const wchar_t* m4);

#endif /* COMMON_H */ 