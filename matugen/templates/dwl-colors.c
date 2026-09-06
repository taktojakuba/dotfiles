/* Matugen Theme for dwl
 * Generated automatically by Matugen
 */
#include "colors.h"

#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

/* colors */
float rootcolor[]                   = COLOR(0x{{colors.surface_dim.default.hex_stripped}}ff);
float bordercolor[]                 = COLOR(0x{{colors.outline_variant.default.hex_stripped}}ff);
float focuscolor[]                  = COLOR(0x{{colors.primary.default.hex_stripped}}ff);
float urgentcolor[]                 = COLOR(0x{{colors.error.default.hex_stripped}}ff);
const float fullscreen_bg[]         = {0.0f, 0.0f, 0.0f, 1.0f};