#include "comets.h"
#include "tuxmath.h"
#include "t4k_common.h"

void comets_recalc_positions(void)
{
    int i;
    float scale_x = (float)screen->w / (float)orig_w;
    float scale_y = (float)screen->h / (float)orig_h;

    // Recalculate positions based on current screen dimensions
    for (i = 0; i < MAX_COMETS; i++) {
        if (comets[i].alive) {
            comets[i].x *= scale_x;
            comets[i].y *= scale_y;
            if (comets[i].formula_surf) {
                SDL_FreeSurface(comets[i].formula_surf);
                comets[i].formula_surf = T4K_BlackOutline(comets[i].flashcard.formula_string, comet_fontsize, &white);
            }
            if (comets[i].answer_surf) {
                SDL_FreeSurface(comets[i].answer_surf);
                comets[i].answer_surf = T4K_BlackOutline(comets[i].flashcard.answer_string, comet_fontsize, &white);
            }
        }
    }
} 