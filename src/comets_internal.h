#ifndef COMETS_INTERNAL_H
#define COMETS_INTERNAL_H

#include <SDL2/SDL.h>
#include "t4k_common.h"
#include "mathcards.h"
#include <wchar.h>

// Function declarations
static void comets_recalc_positions(int xres, int yres);
void game_set_start_message(const wchar_t* m1, const wchar_t* m2, const wchar_t* m3, const wchar_t* m4);
void comets_key_event(SDL_Event* key_event);
int comets_game(MC_MathGame* game);

// Internal functions
static void comets_initialize(void);
static void comets_cleanup(void);
static void comets_handle_help(void);
static void comets_handle_user_events(void);
static void comets_handle_demo(void);
static void comets_handle_answer(int answer);
static void comets_countdown(void);
static void comets_handle_tux(void);
static void comets_handle_comets(void);
static void comets_handle_cities(void);
static void comets_handle_penguins(void);
static void comets_handle_steam(void);
static void comets_handle_extra_life(void);
static void comets_draw(void);
static void comets_handle_game_over(int comets_status);

#endif /* COMETS_INTERNAL_H */ 