#ifndef LAN_DEFS_H
#define LAN_DEFS_H

#include <stdint.h>
#include "transtruct.h"  // For MAX_CLIENTS and NAME_SIZE definitions

// Player type definition
typedef struct {
    char name[NAME_SIZE];
    int score;
    int active;
    uint32_t last_update;
} lan_player_type;

// Function declarations for LAN-related functions
int LAN_PlayerScore(int index);
int LAN_PlayerMine(int index);
int LAN_PlayerConnected(int index);
const char* LAN_PlayerName(int index);

#endif /* LAN_DEFS_H */ 