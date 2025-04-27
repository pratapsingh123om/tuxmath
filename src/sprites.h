#ifndef SPRITES_H
#define SPRITES_H

#include <SDL2/SDL.h>

typedef struct {
    SDL_Surface* surface;
    int num_frames;
    int frame_w;
    int frame_h;
} sprite;

// Sprite indices
enum {
    IMG_COMET_EXPL,
    // Add other sprite indices here
};

extern sprite* sprites[];

#endif /* SPRITES_H */ 