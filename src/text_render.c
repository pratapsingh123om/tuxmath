#include "t4k_common.h"
#include "string_utils.h"
#include <SDL_ttf.h>

SDL_Surface* T4K_BlackOutline(const wchar_t* t, int size, const SDL_Color* c)
{
    if (!t || !c) return NULL;

    // Convert wide string to UTF-8 for TTF_RenderUTF8_Blended
    char* utf8_text = to_char(t);
    if (!utf8_text) return NULL;

    SDL_Surface* surf = NULL;
    SDL_Surface* black_surf = NULL;
    SDL_Surface* temp_surf = NULL;
    TTF_Font* font = TTF_OpenFont(T4K_AskFontName(), size);
    
    if (!font) {
        free_str(utf8_text);
        return NULL;
    }

    // Create black outline by rendering text multiple times with slight offsets
    SDL_Color black = {0, 0, 0, 255};
    black_surf = TTF_RenderUTF8_Blended(font, utf8_text, black);
    if (!black_surf) {
        TTF_CloseFont(font);
        free_str(utf8_text);
        return NULL;
    }

    // Create final surface with alpha channel
    surf = SDL_CreateRGBSurface(SDL_SWSURFACE | SDL_SRCALPHA,
                               black_surf->w + 2, black_surf->h + 2,
                               32, rmask, gmask, bmask, amask);
    if (!surf) {
        SDL_FreeSurface(black_surf);
        TTF_CloseFont(font);
        free_str(utf8_text);
        return NULL;
    }

    // Set alpha blending mode
    SDL_SetSurfaceBlendMode(surf, SDL_BLENDMODE_BLEND);
    SDL_SetSurfaceBlendMode(black_surf, SDL_BLENDMODE_BLEND);

    // Blit black outline copies
    SDL_Rect dest = {0, 0, black_surf->w, black_surf->h};
    for (int dx = 0; dx <= 2; dx++) {
        for (int dy = 0; dy <= 2; dy++) {
            if (dx == 1 && dy == 1) continue; // Skip center
            dest.x = dx;
            dest.y = dy;
            SDL_BlitSurface(black_surf, NULL, surf, &dest);
        }
    }

    // Render colored text
    temp_surf = TTF_RenderUTF8_Blended(font, utf8_text, *c);
    if (temp_surf) {
        dest.x = 1;
        dest.y = 1;
        SDL_BlitSurface(temp_surf, NULL, surf, &dest);
        SDL_FreeSurface(temp_surf);
    }

    // Clean up
    SDL_FreeSurface(black_surf);
    TTF_CloseFont(font);
    free_str(utf8_text);

    return surf;
}

SDL_Surface* T4K_BlackOutline_Compat(const char* t, int size, const SDL_Color* c)
{
    if (!t || !c) return NULL;
    
    wchar_t* wtext = to_wchar(t);
    if (!wtext) return NULL;
    
    SDL_Surface* surf = T4K_BlackOutline(wtext, size, c);
    free_str(wtext);
    
    return surf;
} 