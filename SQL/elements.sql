/* elements.sql
 * A SQL file (originally written for SQLite) that creates and fills the
 * periodic table of elements.
 *
 * Gary Hammock
 * 2017-02-22
 *
 * LICENSE (MIT/X11):
 * ------------------
 * Copyright 2017 Gary Hammock
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
*/

-- The periodic table of the elements
CREATE TABLE `elements` (
  `atomic_num`        INT UNSIGNED NOT NULL,      -- Atomic number (number of protons).
  `name`              VARCHAR(64) NOT NULL,       -- The name of the element.
  `symbol`            VARCHAR(2) NOT NULL,        -- The chemical symbol of the atom.
  `group`             TINYINT DEFAULT NULL,       -- The group/column of the atom.
  `period`            TINYINT DEFAULT NULL,       -- The period/row of the atom.
  `mass`              DOUBLE NOT NULL,            -- The relative atomic mass of the atom.
  `category`          VARCHAR(10) DEFAULT NULL,   -- Major category of the atom in (metal, nonmetal, metalloid).
  `subcategory`       VARCHAR(32) DEFAULT NULL,   -- The subcategory of the atom.
  `atomic_radius`     INT UNSIGNED DEFAULT NULL,  -- Emperically measured atomic radius in picometers (+/- 5 pm).
  `vanderwaals_rad`   INT DEFAULT NULL,           -- Van Der Waals radius of the atom in picometers.
  `melt_temp`         DOUBLE DEFAULT NULL,        -- Melting point temperature in Kelvin.
  `boil_temp`         DOUBLE DEFAULT NULL,        -- Boiling point temperature in Kelvin.
  `density`           DOUBLE DEFAULT NULL,        -- Density in kilograms per cubic meter (kg/m^3).
  `thermal_cond`      DOUBLE DEFAULT NULL,        -- Thermal conductivity in Watts per meter per Kelvin (W/[m-K]).
  `specific_heat`     DOUBLE DEFAULT NULL,        -- Specific heat capacity in Joules per kilogram per Kelvin (J/[kg-K]).
  `electronegativity` DOUBLE DEFAULT NULL,        -- Electronegativity of the atom on the Pauling scale.
  `block`             CHAR(1) NOT NULL,           -- The block (s, p, d, f) of the element.
  `electron_conf`     VARCHAR(32) NOT NULL,       -- Electron configuration of the atom in its ground state.
  `discovery_year`    VARCHAR(16) NOT NULL,       -- Year of discovery.
  `radioactive`       TINYINT(1) DEFAULT NULL,    -- A flag to identify radioactive elements, 0=nonradioactive, 1=radioactive.
  `half_life`         DOUBLE DEFAULT NULL,        -- Half-life of the atom in seconds (NULL values imply stable elements).
  
  PRIMARY KEY (`atomic_num`)
);

/* Recommed turning off word-wrapping. */

INSERT INTO `elements` (`atomic_num`, `name`, `symbol`, `group`, `period`, `mass`, `category`, `subcategory`, `atomic_radius`, `vanderwaals_rad`, `melt_temp`, `boil_temp`, `density`, `thermal_cond`, `specific_heat`, `electronegativity`, `block`, `electron_conf`, `discovery_year`, `radioactive`, `half_life`)
VALUES (  1, "Hydrogen",      "H",   1, 1, 1.008,        "nonmetal",  "diatomic nonmetal",     25,   120,  14.01,    20.28,  0.08988, 0.1805,  14304, 2.20, "s", "1s^1",                       "1766",     0, NULL     ),  /*   1 - Hydrogen      */
       (  2, "Helium",        "He", 18, 1, 4.002602,     "nonmetal",  "noble gas",             NULL, 140,  0.95,     4.22,   0.1785,  0.1513,  5193,  NULL, "s", "1s^2",                       "1868",     0, NULL     ),  /*   2 - Helium        */
       (  3, "Lithium",       "Li",  1, 2, 6.94,         "metal",     "alkali metal",          145,  182,  453.69,   1560,   534,     84.8,    3582,  0.98, "s", "[He] 2s^1",                  "1817",     0, NULL     ),  /*   3 - Lithium       */
       (  4, "Beryllium",     "Be",  2, 2, 9.0121831,    "metal",     "alkaline earth metal",  105,  NULL, 1560,     2742,   1850,    200,     1825,  1.57, "s", "[He] 2s^2",                  "1798",     0, NULL     ),  /*   4 - Beryllium     */
       (  5, "Boron",         "B",  13, 2, 10.81,        "metalloid", "metalloid",             85,   NULL, 2349,     4200,   2340,    27.4,    1026,  2.04, "p", "[He] 2s^2 2p^1",             "1808",     0, NULL     ),  /*   5 - Boron         */
       (  6, "Carbon",        "C",  14, 2, 12.011,       "nonmetal",  "polyatomic nonmetal",   70,   170,  3800,     4300,   2267,    142,     709,   2.55, "p", "[He] 2s^2 2p^2",             "3750 BCE", 0, NULL     ),  /*   6 - Carbon        */
       (  7, "Nitrogen",      "N",  15, 2, 14.007,       "nonmetal",  "diatomic nonmetal",     65,   155,  63.15,    77.36,  1.2506,  0.02583, 1040,  3.04, "p", "[He] 2s^2 2p^3",             "1772",     0, NULL     ),  /*   7 - Nitrogen      */
       (  8, "Oxygen",        "O",  16, 2, 15.999,       "nonmetal",  "diatomic nonmetal",     60,   152,  54.36,    90.20,  1.429,   0.02658, 918,   3.44, "p", "[He] 2s^2 2p^4",             "1771",     0, NULL     ),  /*   8 - Oxygen        */
       (  9, "Fluorine",      "F",  17, 2, 18.998403163, "nonmetal",  "diatomic nonmetal",     50,   147,  53.53,    85.03,  1.696,   0.0277,  824,   3.98, "p", "[He] 2s^2 2p^5",             "1810",     0, NULL     ),  /*   9 - Fluorine      */
       ( 10, "Neon",          "Ne", 18, 2, 20.1797,      "nonmetal",  "noble gas",             NULL, 154,  24.56,    27.07,  0.8999,  0.0491,  1030,  NULL, "p", "[He] 2s^2 2p^6",             "1898",     0, NULL     ),  /*  10 - Neon          */
       ( 11, "Sodium",        "Na",  1, 3, 22.98976928,  "metal",     "alkali metal",          180,  227,  370.87,   1156,   971,     142,     1228,  0.93, "s", "[Ne] 3s^1",                  "1807",     0, NULL     ),  /*  11 - Sodium        */
       ( 12, "Magnesium",     "Mg",  2, 3, 24.305,       "metal",     "alkaline earth metal",  150,  173,  923,      1363,   1738,    156,     1023,  1.31, "s", "[Ne] 3s^2",                  "1755",     0, NULL     ),  /*  12 - Magnesium     */
       ( 13, "Aluminium",     "Al", 13, 3, 26.9815385,   "metal",     "post-transition metal", 125,  NULL, 933.47,   2792,   2698,    237,     897,   1.61, "p", "[Ne] 3s^2 3p^1",             "1825",     0, NULL     ),  /*  13 - Aluminium     */
       ( 14, "Silicon",       "Si", 14, 3, 28.085,       "metalloid", "metalloid",             110,  210,  1687,     3538,   2329.6,  149,     705,   1.9,  "p", "[Ne] 3s^2 3p^2",             "1823",     0, NULL     ),  /*  14 - Silicon       */
       ( 15, "Phosphorus",    "P",  15, 3, 30.973761998, "nonmetal",  "polyatomic nonmetal",   100,  180,  317.30,   550,    1820,    0.23617, 769,   2.19, "p", "[Ne] 3s^2 3p^3",             "1669",     0, NULL     ),  /*  15 - Phosphorus    */
       ( 16, "Sulfur",        "S",  16, 3, 32.06,        "nonmetal",  "polyatomic nonmetal",   100,  180,  388.36,   717.87, 2067,    0.205,   710,   2.58, "p", "[Ne] 3s^2 3p^4",             "2000 BCE", 0, NULL     ),  /*  16 - Sulfur        */
       ( 17, "Chlorine",      "Cl", 17, 3, 35.45,        "nonmetal",  "diatomic nonmetal",     100,  175,  171.6,    239.11, 3.214,   0.0089,  479,   3.16, "p", "[Ne] 3s^2 3p^5",             "1774",     0, NULL     ),  /*  17 - Chlorine      */
       ( 18, "Argon",         "Ar", 18, 3, 39.948,       "nonmetal",  "noble gas",             NULL, 188,  83.80,    87.30,  1.7837,  0.01772, 520,   NULL, "p", "[Ne] 3s^2 3p^6",             "1894",     0, NULL     ),  /*  18 - Argon         */
       ( 19, "Potassium",     "K",   1, 4, 39.0983,      "metal",     "alkali metal",          220,  275,  336.53,   1032,   862,     102.5,   757,   0.82, "s", "[Ar] 4s^1",                  "1807",     0, NULL     ),  /*  19 - Potassium     */
       ( 20, "Calcium",       "Ca",  2, 4, 40.078,       "metal",     "alkaline earth metal",  180,  NULL, 1115,     1757,   1540,    201,     647,   1,    "s", "[Ar] 4s^2",                  "1808",     0, NULL     ),  /*  20 - Calcium       */
       ( 21, "Scandium",      "Sc",  3, 4, 44.955908,    "metal",     "transition metal",      160,  NULL, 1814,     3109,   2989,    15.8,    568,   1.36, "d", "[Ar] 3d^1 4s^2",             "1879",     0, NULL     ),  /*  21 - Scandium      */
       ( 22, "Titanium",      "Ti",  4, 4, 47.867,       "metal",     "transition metal",      140,  NULL, 1941,     3560,   4540,    21.9,    523,   1.54, "d", "[Ar] 3d^2 4s^2",             "1791",     0, NULL     ),  /*  22 - Titanium      */
       ( 23, "Vanadium",      "V",   5, 4, 50.9415,      "metal",     "transition metal",      135,  NULL, 2183,     3680,   6110,    30.7,    489,   1.63, "d", "[Ar] 3d^3 4s^2",             "1801",     0, NULL     ),  /*  23 - Vanadium      */
       ( 24, "Chromium",      "Cr",  6, 4, 51.9961,      "metal",     "transition metal",      140,  NULL, 2180,     2944,   7150,    93.9,    449,   1.66, "d", "[Ar] 3d^5 4s^1",             "1797",     0, NULL     ),  /*  24 - Chromium      */
       ( 25, "Manganese",     "Mn",  7, 4, 54.938044,    "metal",     "transition metal",      140,  NULL, 1519,     2334,   7440,    7.81,    479,   1.55, "d", "[Ar] 3d^5 4s^2",             "1774",     0, NULL     ),  /*  25 - Manganese     */
       ( 26, "Iron",          "Fe",  8, 4, 55.845,       "metal",     "transition metal",      140,  NULL, 1811,     3134,   7874,    80.4,    449,   1.83, "d", "[Ar] 3d^6 4s^2",             "5000 BCE", 0, NULL     ),  /*  26 - Iron          */
       ( 27, "Cobalt",        "Co",  9, 4, 58.933194,    "metal",     "transition metal",      135,  NULL, 1768,     3200,   8860,    100,     421,   1.88, "d", "[Ar] 3d^7 4s^2",             "1732",     0, NULL     ),  /*  27 - Cobalt        */
       ( 28, "Nickel",        "Ni", 10, 4, 58.6934,      "metal",     "transition metal",      135,  163,  1728,     3186,   8912,    90.9,    444,   1.91, "d", "[Ar] 3d^8 4s^2",             "1751",     0, NULL     ),  /*  28 - Nickel        */
       ( 29, "Copper",        "Cu", 11, 4, 63.546,       "metal",     "transition metal",      135,  140,  1357.77,  2835,   8960,    401,     385,   1.9,  "d", "[Ar] 3d^10 4s^1",            "9000 BCE", 0, NULL     ),  /*  29 - Copper        */
       ( 30, "Zinc",          "Zn", 12, 4, 65.38,        "metal",     "transition metal",      135,  139,  692.88,   1180,   7134,    116,     388,   1.65, "d", "[Ar] 3d^10 4s^2",            "1000 BCE", 0, NULL     ),  /*  30 - Zinc          */
       ( 31, "Gallium",       "Ga", 13, 4, 69.723,       "metal",     "post-transition metal", 130,  187,  302.9146, 2673,   5907,    40.6,    371,   1.81, "p", "[Ar] 3d^10 4s^2 4p^1",       "1875",     0, NULL     ),  /*  31 - Gallium       */
       ( 32, "Germanium",     "Ge", 14, 4, 72.630,       "metalloid", "metalloid",             125,  NULL, 1211.40,  3106,   5323,    60.2,    320,   2.01, "p", "[Ar] 3d^10 4s^2 4p^2",       "1886",     0, NULL     ),  /*  32 - Germanium     */
       ( 33, "Arsenic",       "As", 15, 4, 74.921595,    "metalloid", "metalloid",             115,  185,  1090,     887,    5776,    50.2,    329,   2.18, "p", "[Ar] 3d^10 4s^2 4p^3",       "800",      0, NULL     ),  /*  33 - Arsenic       */
       ( 34, "Selenium",      "Se", 16, 4, 78.971,       "nonmetal",  "polyatomic nonmetal",   115,  190,  453,      958,    4809,    0.519,   321,   2.55, "p", "[Ar] 3d^10 4s^2 4p^4",       "1817",     0, NULL     ),  /*  34 - Selenium      */
       ( 35, "Bromine",       "Br", 17, 4, 79.904,       "nonmetal",  "diatomic nonmetal",     115,  185,  265.8,    332.0,  3122,    0.122,   474,   2.96, "p", "[Ar] 3d^10 4s^2 4p^5",       "1825",     0, NULL     ),  /*  35 - Bromine       */
       ( 36, "Krypton",       "Kr", 18, 4, 83.798,       "nonmetal",  "noble gas",             NULL, 202,  115.79,   119.93, 3.733,   9.43,    248,   3,    "p", "[Ar] 3d^10 4s^2 4p^6",       "1898",     0, NULL     ),  /*  36 - Krypton       */
       ( 37, "Rubidium",      "Rb",  1, 5, 85.4678,      "metal",     "alkali metal",          235,  NULL, 312.46,   961,    1532,    58.2,    363,   0.82, "s", "[Kr] 5s^1",                  "1861",     0, NULL     ),  /*  37 - Rubidium      */
       ( 38, "Strontium",     "Sr",  2, 5, 87.62,        "metal",     "alkaline earth metal",  200,  NULL, 1050,     1655,   2640,    35.4,    301,   0.95, "s", "[Kr] 5s^2",                  "1787",     0, NULL     ),  /*  38 - Strontium     */
       ( 39, "Yttrium",       "Y",   3, 5, 88.90584,     "metal",     "transition metal",      180,  NULL, 1799,     3609,   4469,    17.2,    298,   1.22, "d", "[Kr] 4d^1 5s^2",             "1794",     0, NULL     ),  /*  39 - Yttrium       */
       ( 40, "Zirconium",     "Zr",  4, 5, 91.224,       "metal",     "transition metal",      155,  NULL, 2128,     4682,   6506,    22.6,    278,   1.33, "d", "[Kr] 4d^2 5s^2",             "1789",     0, NULL     ),  /*  40 - Zirconium     */
       ( 41, "Niobium",       "Nb",  5, 5, 92.90637,     "metal",     "transition metal",      145,  NULL, 2750,     5017,   8570,    53.7,    265,   1.6,  "d", "[Kr] 4d^4 5s^1",             "1801",     0, NULL     ),  /*  41 - Niobium       */
       ( 42, "Molybdenum",    "Mo",  6, 5, 95.95,        "metal",     "transition metal",      145,  NULL, 2896,     4912,   10220,   138,     251,   2.16, "d", "[Kr] 4d^5 5s^1",             "1778",     0, NULL     ),  /*  42 - Molybdenum    */
       ( 43, "Technetium",    "Tc",  7, 5, 98,           "metal",     "transition metal",      135,  NULL, 2430,     4538,   11500,   50.6,    NULL,  1.9,  "d", "[Kr] 4d^5 5s^2",             "1937",     1, 1.30e14  ),  /*  43 - Technetium    */
       ( 44, "Ruthenium",     "Ru",  8, 5, 101.07,       "metal",     "transition metal",      130,  NULL, 2607,     4423,   12370,   117,     238,   2.2,  "d", "[Kr] 4d^7 5s^1",             "1844",     0, NULL     ),  /*  44 - Ruthenium     */
       ( 45, "Rhodium",       "Rh",  9, 5, 102.90550,    "metal",     "transition metal",      135,  NULL, 2237,     3968,   12410,   150,     243,   2.28, "d", "[Kr] 4d^8 5s^1",             "1804",     0, NULL     ),  /*  45 - Rhodium       */
       ( 46, "Palladium",     "Pd", 10, 5, 106.42,       "metal",     "transition metal",      140,  163,  1828.05,  3236,   12020,   71.8,    244,   2.2,  "d", "[Kr] 4d^10",                 "1803",     0, NULL     ),  /*  46 - Palladium     */
       ( 47, "Silver",        "Ag", 11, 5, 107.8682,     "metal",     "transition metal",      160,  172,  1234.93,  2435,   10501,   429,     235,   1.93, "d", "[Kr] 4d^10 5s^1",            "5000 BCE", 0, NULL     ),  /*  47 - Silver        */
       ( 48, "Cadmium",       "Cd", 12, 5, 112.414,      "metal",     "transition metal",      155,  158,  594.22,   1040,   8690,    96.6,    232,   1.69, "d", "[Kr] 4d^10 5s^2",            "1817",     0, NULL     ),  /*  48 - Cadmium       */
       ( 49, "Indium",        "In", 13, 5, 114.818,      "metal",     "post-transition metal", 155,  193,  429.75,   2345,   7310,    81.8,    233,   1.78, "p", "[Kr] 4d^10 5s^2 5p^1",       "1863",     0, NULL     ),  /*  49 - Indium        */
       ( 50, "Tin",           "Sn", 14, 5, 118.710,      "metal",     "post-transition metal", 145,  217,  505.08,   2875,   7287,    66.8,    228,   1.96, "p", "[Kr] 4d^10 5s^2 5p^2",       "3500 BCE", 0, NULL     ),  /*  50 - Tin           */
       ( 51, "Antimony",      "Sb", 15, 5, 121.760,      "metalloid", "metalloid",             145,  NULL, 903.78,   1860,   6685,    24.4,    207,   2.05, "p", "[Kr] 4d^10 5s^2 5p^3",       "800",      0, NULL     ),  /*  51 - Antimony      */
       ( 52, "Tellurium",     "Te", 16, 5, 127.60,       "metalloid", "metalloid",             140,  206,  722.66,   1261,   6232,    2.675,   202,   2.1,  "p", "[Kr] 4d^10 5s^2 5p^4",       "1782",     0, NULL     ),  /*  52 - Tellurium     */
       ( 53, "Iodine",        "I",  17, 5, 126.90447,    "nonmetal",  "diatomic nonmetal",     140,  198,  386.85,   457.4,  4930,    0.449,   214,   2.66, "p", "[Kr] 4d^10 5s^2 5p^5",       "1811",     0, NULL     ),  /*  53 - Iodine        */
       ( 54, "Xenon",         "Xe", 18, 5, 131.293,      "nonmetal",  "noble gas",             NULL, 216,  161.4,    165.03, 5.887,   0.00565, 158,   2.6,  "p", "[Kr] 4d^10 5s^2 5p^6",       "1898",     0, NULL     ),  /*  54 - Xenon         */
       ( 55, "Caesium",       "Cs",  1, 6, 132.90545196, "metal",     "alkali metal",          260,  NULL, 301.59,   944,    1873,    35.9,    242,   0.79, "s", "[Xe] 6s^1",                  "1860",     0, NULL     ),  /*  55 - Caesium       */
       ( 56, "Barium",        "Ba",  2, 6, 137.327,      "metal",     "alkaline earth metal",  215,  NULL, 1000,     2170,   3594,    18.4,    204,   0.89, "s", "[Xe] 6s^2",                  "1772",     0, NULL     ),  /*  56 - Barium        */
       ( 57, "Lanthanum",     "La",  3, 6, 138.90547,    "metal",     "lanthanide",            195,  NULL, 1193,     3737,   6145,    13.4,    195,   1.1,  "d", "[Xe] 5d^1 6s^2",             "1838",     0, NULL     ),  /*  57 - Lanthanum     */
       ( 58, "Cerium",        "Ce",  4, 6, 140.116,      "metal",     "lanthanide",            185,  NULL, 1068,     3716,   6770,    11.3,    192,   1.12, "f", "[Xe] 4f^1 5d^1 6s^2",        "1803",     0, NULL     ),  /*  58 - Cerium        */
       ( 59, "Praseodymium",  "Pr",  5, 6, 140.90766,    "metal",     "lanthanide",            185,  NULL, 1208,     3793,   6773,    12.5,    193,   1.13, "f", "[Xe] 4f^3 6s^2",             "1885",     0, NULL     ),  /*  59 - Praseodymium  */
       ( 60, "Neodymium",     "Nd",  6, 6, 144.242,      "metal",     "lanthanide",            185,  NULL, 1297,     3347,   7007,    16.5,    190,   1.14, "f", "[Xe] 4f^4 6s^2",             "1885",     0, NULL     ),  /*  60 - Neodymium     */
       ( 61, "Promethium",    "Pm",  7, 6, 145,          "metal",     "lanthanide",            185,  NULL, 1315,     3273,   7260,    17.9,    NULL,  1.13, "f", "[Xe] 4f^5 6s^2",             "1942",     1, 5.605e8  ),  /*  61 - Promethium    */
       ( 62, "Samarium",      "Sm",  8, 6, 150.36,       "metal",     "lanthanide",            185,  NULL, 1345,     2067,   7520,    13.3,    197,   1.17, "f", "[Xe] 4f^6 6s^2",             "1879",     0, NULL     ),  /*  62 - Samarium      */
       ( 63, "Europium",      "Eu",  9, 6, 151.964,      "metal",     "lanthanide",            185,  NULL, 1099,     1802,   5243,    13.9,    182,   1.2,  "f", "[Xe] 4f^7 6s^2",             "1896",     0, NULL     ),  /*  63 - Europium      */
       ( 64, "Gadolinium",    "Gd", 10, 6, 157.25,       "metal",     "lanthanide",            180,  NULL, 1585,     3546,   7895,    10.6,    236,   1.2,  "f", "[Xe] 4f^7 5d^1 6s^2",        "1880",     0, NULL     ),  /*  64 - Gadolinium    */
       ( 65, "Terbium",       "Tb", 11, 6, 158.92535,    "metal",     "lanthanide",            175,  NULL, 1629,     3503,   8229,    11.1,    182,   1.2,  "f", "[Xe] 4f^9 6s^2",             "1842",     0, NULL     ),  /*  65 - Terbium       */
       ( 66, "Dysprosium",    "Dy", 12, 6, 162.500,      "metal",     "lanthanide",            175,  NULL, 1680,     2840,   8550,    10.7,    170,   1.22, "f", "[Xe] 4f^10 6s^2",            "1886",     0, NULL     ),  /*  66 - Dysprosium    */
       ( 67, "Holmium",       "Ho", 13, 6, 164.93033,    "metal",     "lanthanide",            175,  NULL, 1734,     2993,   8795,    16.2,    165,   1.23, "f", "[Xe] 4f^11 6s^2",            "1878",     0, NULL     ),  /*  67 - Holmium       */
       ( 68, "Erbium",        "Er", 14, 6, 167.259,      "metal",     "lanthanide",            175,  NULL, 1802,     3141,   9066,    14.5,    168,   1.24, "f", "[Xe] 4f^12 6s^2",            "1842",     0, NULL     ),  /*  68 - Erbium        */
       ( 69, "Thulium",       "Tm", 15, 6, 168.93422,    "metal",     "lanthanide",            175,  NULL, 1818,     3141,   9321,    16.9,    160,   1.25, "f", "[Xe] 4f^13 6s^2",            "1879",     0, NULL     ),  /*  69 - Thulium       */
       ( 70, "Ytterbium",     "Yb", 16, 6, 173.045,      "metal",     "lanthanide",            175,  NULL, 1097,     1469,   6965,    38.5,    155,   1.1,  "f", "[Xe] 4f^14 6s^2",            "1878",     0, NULL     ),  /*  70 - Ytterbium     */
       ( 71, "Lutetium",      "Lu", 17, 6, 174.9668,     "metal",     "lanthanide",            175,  NULL, 1925,     3675,   9840,    16.4,    154,   1.27, "f", "[Xe] 4f^14 5d^1 6s^2",       "1906",     0, NULL     ),  /*  71 - Lutetium      */
       ( 72, "Hafnium",       "Hf",  4, 6, 178.49,       "metal",     "transition metal",      155,  NULL, 2506,     4876,   13310,   23.0,    144,   1.3,  "d", "[Xe] 4f^14 5d^2 6s^2",       "1922",     0, NULL     ),  /*  72 - Hafnium       */
       ( 73, "Tantalum",      "Ta",  5, 6, 180.94788,    "metal",     "transition metal",      145,  NULL, 3290,     5731,   16654,   57.5,    140,   1.5,  "d", "[Xe] 4f^14 5d^3 6s^2",       "1802",     0, NULL     ),  /*  73 - Tantalum      */
       ( 74, "Tungsten",      "W",   6, 6, 183.84,       "metal",     "transition metal",      135,  NULL, 3695,     5828,   19250,   173,     132,   2.36, "d", "[Xe] 4f^14 5d^4 6s^2",       "1781",     0, NULL     ),  /*  74 - Tungsten      */
       ( 75, "Rhenium",       "Re",  7, 6, 186.207,      "metal",     "transition metal",      135,  NULL, 3459,     5869,   21020,   48.0,    137,   1.9,  "d", "[Xe] 4f^14 5d^5 6s^2",       "1908",     0, NULL     ),  /*  75 - Rhenium       */
       ( 76, "Osmium",        "Os",  8, 6, 190.23,       "metal",     "transition metal",      130,  NULL, 3306,     5285,   22610,   87.6,    130,   2.2,  "d", "[Xe] 4f^14 5d^6 6s^2",       "1803",     0, NULL     ),  /*  76 - Osmium        */
       ( 77, "Iridium",       "Ir",  9, 6, 192.217,      "metal",     "transition metal",      135,  NULL, 2719,     4701,   22560,   147,     131,   2.2,  "d", "[Xe] 4f^14 5d^7 6s^2",       "1803",     0, NULL     ),  /*  77 - Iridium       */
       ( 78, "Platinum",      "Pt", 10, 6, 195.084,      "metal",     "transition metal",      135,  175,  2041.4,   4098,   21460,   71.6,    133,   2.28, "d", "[Xe] 4f^14 5d^9 6s^1",       "1748",     0, NULL     ),  /*  78 - Platinum      */
       ( 79, "Gold",          "Au", 11, 6, 196.966569,   "metal",     "transition metal",      135,  166,  1337.33,  3129,   19282,   318,     129,   2.54, "d", "[Xe] 4f^14 5d^10 6s^1",      "6000 BCE", 0, NULL     ),  /*  79 - Gold          */
       ( 80, "Mercury",       "Hg", 12, 6, 200.592,      "metal",     "transition metal",      150,  155,  234.43,   629.88, 13533.6, 8.30,    140,   2,    "d", "[Xe] 4f^14 5d^10 6s^2",      "2000 BCE", 0, NULL     ),  /*  80 - Mercury       */
       ( 81, "Thallium",      "Tl", 13, 6, 204.38,       "metal",     "post-transition metal", 190,  196,  577,      1746,   11850,   46.1,    129,   1.62, "p", "[Xe] 4f^14 5d^10 6s^2 6p^1", "1861",     0, NULL     ),  /*  81 - Thallium      */
       ( 82, "Lead",          "Pb", 14, 6, 207.2,        "metal",     "post-transition metal", 180,  202,  600.61,   2022,   11342,   35.3,    129,   1.87, "p", "[Xe] 4f^14 5d^10 6s^2 6p^2", "7000 BCE", 0, NULL     ),  /*  82 - Lead          */
       ( 83, "Bismuth",       "Bi", 15, 6, 208.98040,    "metal",     "post-transition metal", 160,  NULL, 544.7,    1837,   9807,    7.97,    122,   2.02, "p", "[Xe] 4f^14 5d^10 6s^2 6p^3", "1753",     0, 5.996e26 ),  /*  83 - Bismuth       */
       ( 84, "Polonium",      "Po", 16, 6, 209,          "metal",     "post-transition metal", 190,  NULL, 527,      1235,   9320,    20,      NULL,  2.0,  "p", "[Xe] 4f^14 5d^10 6s^2 6p^4", "1898",     1, 3.222e9  ),  /*  84 - Polonium      */
       ( 85, "Astatine",      "At", 17, 6, 210,          "metalloid", "metalloid",             NULL, NULL, 575,      610,    7000,    1.7,     NULL,  2.2,  "p", "[Xe] 4f^14 5d^10 6s^2 6p^5", "1940",     1, 29000    ),  /*  85 - Astatine      */
       ( 86, "Radon",         "Rn", 18, 6, 222,          "nonmetal",  "noble gas",             NULL, NULL, 202,      211.3,  9.73,    0.00361, 94,    2.2,  "p", "[Xe] 4f^14 5d^10 6s^2 6p^6", "1899",     1, 330350   ),  /*  86 - Radon         */
       ( 87, "Francium",      "Fr",  1, 7, 223,          "metal",     "alkali metal",          NULL, NULL, 300,      950,    1870,    15,      NULL,  0.7,  "s", "[Rn] 7s^1",                  "1939",     1, 1300     ),  /*  87 - Francium      */
       ( 88, "Radium",        "Ra",  2, 7, 226,          "metal",     "alkaline earth metal",  215,  NULL, 973,      2010,   5500,    18.6,    94,    0.9,  "s", "[Rn] 7s^2",                  "1898",     1, 5.02e10  ),  /*  88 - Radium        */
       ( 89, "Actinium",      "Ac",  3, 7, 227,          "metal",     "actinide",              195,  NULL, 1323,     3471,   10070,   12,      120,   1.1,  "d", "[Rn] 6d^1 7s^2",             "1902",     1, 6.8752e8 ),  /*  89 - Actinium      */
       ( 90, "Thorium",       "Th",  4, 7, 232.0377,     "metal",     "actinide",              180,  NULL, 2115,     5061,   11720,   54.0,    113,   1.3,  "f", "[Rn] 6d^2 7s^2",             "1829",     1, 4.437e17 ),  /*  90 - Thorium       */
       ( 91, "Protactium",    "Pa",  5, 7, 231.03588,    "metal",     "actinide",              180,  NULL, 1841,     4300,   15370,   47,      NULL,  1.5,  "f", "[Rn] 5f^2 6d^1 7s^2",        "1913",     1, 1.035e12 ),  /*  91 - Protactium    */
       ( 92, "Uranium",       "U",   6, 7, 238.02891,    "metal",     "actinide",              175,  186,  1405.3,   4404,   18950,   27.5,    116,   1.38, "f", "[Rn] 5f^3 6d^1 7s^2",        "1789",     1, 1.411e17 ),  /*  92 - Uranium       */
       ( 93, "Neptunium",     "Np",  7, 7, 237,          "metal",     "actinide",              175,  NULL, 917,      4273,   20450,   6.3,     NULL,  1.36, "f", "[Rn] 5f^4 6d^1 7s^2",        "1940",     1, 6.771e13 ),  /*  93 - Neptunium     */
       ( 94, "Plutonium",     "Pu",  8, 7, 244,          "metal",     "actinide",              175,  NULL, 912.5,    3501,   19840,   6.74,    NULL,  1.28, "f", "[Rn] 5f^6 7s^2",             "1940",     1, 2.502e15 ),  /*  94 - Plutonium     */
       ( 95, "Americium",     "Am",  9, 7, 243,          "metal",     "actinide",              175,  NULL, 1449,     2880,   13690,   10,      NULL,  1.13, "f", "[Rn] 5f^7 7s^2",             "1944",     1, 2.331e11 ),  /*  95 - Americium     */
       ( 96, "Curium",        "Cm", 10, 7, 247,          "metal",     "actinide",              NULL, NULL, 1613,     3383,   13510,   NULL,    NULL,  1.28, "f", "[Rn] 5f^7 6d^1 7s^2",        "1944",     1, 4.923e14 ),  /*  96 - Curium        */
       ( 97, "Berkelium",     "Bk", 11, 7, 247,          "metal",     "actinide",              NULL, NULL, 1259,     2900,   14790,   10,      NULL,  1.3,  "f", "[Rn] 5f^9 7s^2",             "1949",     1, 4.352e10 ),  /*  97 - Berkelium     */
       ( 98, "Californium",   "Cf", 12, 7, 251,          "metal",     "actinide",              NULL, NULL, 1173,     1743,   15100,   NULL,    NULL,  1.3,  "f", "[Rn] 5f^10 7s^2",            "1950",     1, 2.842e10 ),  /*  98 - Californium   */
       ( 99, "Einsteinium",   "Es", 13, 7, 252,          "metal",     "actinide",              NULL, NULL, 1133,     1269,   8840,    NULL,    NULL,  1.3,  "f", "[Rn] 5f^11 7s^2",            "1952",     1, 4.078e7  ),  /*  99 - Einsteinium   */
       (100, "Fermium",       "Fm", 14, 7, 257,          "metal",     "actinide",              NULL, NULL, 1125,     NULL,   9700,    NULL,    NULL,  1.3,  "f", "[Rn] 5f^12 7s^2",            "1952",     1, 8.683e6  ),  /* 100 - Fermium       */
       (101, "Mendelevium",   "Md", 15, 7, 258,          "metal",     "actinide",              NULL, NULL, 1100,     NULL,   10300,   NULL,    NULL,  1.3,  "f", "[Rn] 5f^13 7s^2",            "1955",     1, 4.450e6  ),  /* 101 - Mendelevium   */
       (102, "Nobelium",      "No", 16, 7, 259,          "metal",     "actinide",              NULL, NULL, 1100,     NULL,   9900,    NULL,    NULL,  1.3,  "f", "[Rn] 5f^14 7s^2",            "1966",     1, 10000    ),  /* 102 - Nobelium      */
       (103, "Lawrencium",    "Lr", 17, 7, 266,          "metal",     "actinide",              NULL, NULL, 1900,     NULL,   15600,   NULL,    NULL,  1.3,  "f", "[Rn] 5f^14 7s^2 7p^1",       "1961",     1, 36000    ),  /* 103 - Lawrencium    */
       (104, "Rutherfordium", "Rf",  4, 7, 267,          "metal",     "transition metal",      NULL, NULL, 2400,     5800,   23200,   NULL,    NULL,  NULL, "d", "[Rn] 5f^14 6d^2 7s^2",       "1969",     1, 47200    ),  /* 104 - Rutherfordium */
       (105, "Dubnium",       "Db",  5, 7, 268,          "metal",     "transition metal",      NULL, NULL, NULL,     NULL,   29300,   NULL,    NULL,  NULL, "d", "[Rn] 5f^14 6d^3 7s^2",       "1970",     1, 20020    ),  /* 105 - Dubnium       */
       (106, "Seaborgium",    "Sg",  6, 7, 269,          "metal",     "transition metal",      NULL, NULL, NULL,     NULL,   35000,   NULL,    NULL,  NULL, "d", "[Rn] 5f^14 6d^4 7s^2",       "1974",     1, 6980     ),  /* 106 - Seaborgium    */
       (107, "Bohrium",       "Bh",  7, 7, 270,          "metal",     "transition metal",      NULL, NULL, NULL,     NULL,   37100,   NULL,    NULL,  NULL, "d", "[Rn] 5f^14 6d^5 7s^2",       "1981",     1, 5400     ),  /* 107 - Bohrium       */
       (108, "Hassium",       "Hs",  8, 7, 277,          "metal",     "transition metal",      NULL, NULL, NULL,     NULL,   40700,   NULL,    NULL,  NULL, "d", "[Rn] 5f^14 6d^6 7s^2",       "1984",     1, 4000     ),  /* 108 - Hassium       */
       (109, "Meitnerium",    "Mt",  9, 7, 278,          "unknown",   "unknown",               NULL, NULL, NULL,     NULL,   37400,   NULL,    NULL,  NULL, "d", "[Rn] 5f^14 6d^7 7s^2",       "1982",     1, 1800     ),  /* 109 - Meitnerium    */
       (110, "Darmstadtium",  "Ds", 10, 7, 281,          "unknown",   "unknown",               NULL, NULL, NULL,     NULL,   34800,   NULL,    NULL,  NULL, "d", "[Rn] 5f^14 6d^8 7s^2",       "1994",     1, 240      ),  /* 110 - Darmstadtium  */
       (111, "Roentgenium",   "Rg", 11, 7, 282,          "unknown",   "unknown",               NULL, NULL, NULL,     NULL,   28700,   NULL,    NULL,  NULL, "d", "[Rn] 5f^14 6d^9 7s^2",       "1994",     1, 600      ),  /* 111 - Roentgenium   */
       (112, "Copernicium",   "Cn", 12, 7, 285,          "metal",     "transition metal",      NULL, NULL, NULL,     357,    23700,   NULL,    NULL,  NULL, "d", "[Rn] 5f^14 6d^10 7s^2",      "1996",     1, 2400     ),  /* 112 - Copernicium   */
       (113, "Nihonium",      "Nh", 13, 7, 286,          "unknown",   "unknown",               NULL, NULL, 700,      1400,   16000,   NULL,    NULL,  NULL, "p", "[Rn] 5f^14 6d^10 7s^2 7p^1", "2004",     1, 1200     ),  /* 113 - Nihonium      */
       (114, "Flerovium",     "Fl", 14, 7, 289,          "metal",     "post-transition metal", NULL, NULL, 340,      420,    14000,   NULL,    NULL,  NULL, "p", "[Rn] 5f^14 6d^10 7s^2 7p^2", "2004",     1, 80       ),  /* 114 - Flerovium     */
       (115, "Moscovium",     "Mc", 15, 7, 290,          "unknown",   "unknown",               NULL, NULL, 700,      1400,   13500,   NULL,    NULL,  NULL, "p", "[Rn] 5f^14 6d^10 7s^2 7p^3", "2010",     1, 60       ),  /* 115 - Moscovium     */
       (116, "Livermorium",   "Lv", 16, 7, 293,          "unknown",   "unknown",               NULL, NULL, 709,      1085,   12900,   NULL,    NULL,  NULL, "p", "[Rn] 5f^14 6d^10 7s^2 7p^4", "2004",     1, 0.120    ),  /* 116 - Livermorium   */
       (117, "Tennessine",    "Ts", 17, 7, 294,          "unknown",   "unknown",               NULL, NULL, 723,      883,    7200,    NULL,    NULL,  NULL, "p", "[Rn] 5f^14 6d^10 7s^2 7p^5", "2010",     1, 0.050    ),  /* 117 - Tennessine    */
       (118, "Oganesson",     "Og", 18, 7, 294,          "unknown",   "unknown",               NULL, NULL, 258,      263,    5000,    NULL,    NULL,  NULL, "p", "[Rn] 5f^14 6d^10 7s^2 7p^6", "2006",     1, 0.005    );  /* 118 - Oganesson     */