const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0b1118", /* black   */
  [1] = "#554B41", /* red     */
  [2] = "#962A30", /* green   */
  [3] = "#F21B2B", /* yellow  */
  [4] = "#DF4D49", /* blue    */
  [5] = "#2EA564", /* magenta */
  [6] = "#F6934A", /* cyan    */
  [7] = "#a6c1b8", /* white   */

  /* 8 bright colors */
  [8]  = "#748780",  /* black   */
  [9]  = "#554B41",  /* red     */
  [10] = "#962A30", /* green   */
  [11] = "#F21B2B", /* yellow  */
  [12] = "#DF4D49", /* blue    */
  [13] = "#2EA564", /* magenta */
  [14] = "#F6934A", /* cyan    */
  [15] = "#a6c1b8", /* white   */

  /* special colors */
  [256] = "#0b1118", /* background */
  [257] = "#a6c1b8", /* foreground */
  [258] = "#a6c1b8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
