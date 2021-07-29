static const char norm_fg[] = "#a6c1b8";
static const char norm_bg[] = "#0b1118";
static const char norm_border[] = "#748780";

static const char sel_fg[] = "#a6c1b8";
static const char sel_bg[] = "#962A30";
static const char sel_border[] = "#a6c1b8";

static const char urg_fg[] = "#a6c1b8";
static const char urg_bg[] = "#554B41";
static const char urg_border[] = "#554B41";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
