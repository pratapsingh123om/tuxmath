#ifndef MISSING_DEFS_H
#define MISSING_DEFS_H

#include <SDL2/SDL.h>
#include "t4k_common.h"
#include "network.h"  // Added for lan_player_type definition

// LAN score comparison
#ifdef HAVE_LIBSDL_NET
static inline int compare_scores(const void* a, const void* b) {
    const lan_player_type* player_a = (const lan_player_type*)a;
    const lan_player_type* player_b = (const lan_player_type*)b;
    return player_b->score - player_a->score;  // Sort in descending order
}
#endif

// SDL keypad constants
#define SDLK_KP0 SDLK_KP_0
#define SDLK_KP9 SDLK_KP_9

#endif /* MISSING_DEFS_H */ 