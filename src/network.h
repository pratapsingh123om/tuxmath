/*
   network.h:

   Provides routines for various networking functions to be used
   in the LAN multiplayer game.

   Copyright 2009, 2010, 2011.
Authors: David Bruce, Akash Gangil
Project email: <tuxmath-devel@lists.sourceforge.net>
Project website: http://tux4kids.alioth.debian.org


network.h is part of "Tux, of Math Command", a.k.a. "tuxmath".

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




#ifndef NETWORK_H
#define NETWORK_H

#include "config.h"
#include <SDL2/SDL.h>

#define NAME_SIZE 16

#ifdef HAVE_LIBSDL_NET

#include "transtruct.h"
#include "SDL_net.h"

typedef struct lan_player_type {
    bool connected;
    char name[NAME_SIZE];
    bool mine;  
    bool ready; 
    int score;  
} lan_player_type;

// Function declarations
int LAN_DetectServers(void);
int LAN_AutoSetup(int i);
const char* LAN_ServerName(int i);
const char* LAN_ConnectedServerName(void);
const char* LAN_ConnectedServerLesson(void);
void print_server_list(void);
void LAN_Cleanup(void);
int LAN_SetName(char* name);
int LAN_SetReady(bool ready);
int LAN_RequestIndex(void);
int LAN_AnsweredCorrectly(int id, float t);
int LAN_NotAnsweredCorrectly(int id);
int LAN_LeaveGame(void);
int LAN_NumPlayers(void);
const char* LAN_PlayerName(int i);
bool LAN_PlayerMine(int i);
bool LAN_PlayerReady(int i);
bool LAN_PlayerConnected(int i);
int LAN_PlayerScore(int i);
int LAN_MyIndex(void);
int LAN_NextMsg(char* buf);

// Comparison function for sorting players
int compare_scores(const void* a, const void* b);

#endif // HAVE_LIBSDL_NET

#endif // NETWORK_H
