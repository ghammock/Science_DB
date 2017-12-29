$elements = @()

# Data from SQL file.
$sourceData = @(
    (  1, "Hydrogen",      "H",     1, 1, 1.008,        "nonmetal",  "diatomic nonmetal",     25,   120,  14.01,    20.28,  0.08988, 0.1805,  14304, 2.20, 32.97,  1.293e6, $null,    $null,  $null,   $null,   "s", "1s^1",                       "1766",     0, $null     ),
    (  2, "Helium",        "He",   18, 1, 4.002602,     "nonmetal",  "noble gas",             $null, 140,  0.95,     4.22,   0.1785,  0.1513,  5193,  $null, 5.19,   2.27e5,  $null,    $null,  $null,   $null,   "s", "1s^2",                       "1868",     0, $null     ),
    (  3, "Lithium",       "Li",    1, 2, 6.94,         "metal",     "alkali metal",          145,  182,  453.69,   1560,   534,     84.8,    3582,  0.98, 3223,   6.7e8,   4.9e9,   0.426, 11e9,   4.2e9,  "s", "[He] 2s^1",                  "1817",     0, $null     ),
    (  4, "Beryllium",     "Be",    2, 2, 9.0121831,    "metal",     "alkaline earth metal",  105,  $null, 1560,     2742,   1850,    200,     1825,  1.57, $null,   $null,    287e9,   0.032, 130e9,  132e9,  "s", "[He] 2s^2",                  "1798",     0, $null     ),
    (  5, "Boron",         "B",    13, 2, 10.81,        "metalloid", "metalloid",             85,   $null, 2349,     4200,   2340,    27.4,    1026,  2.04, $null,   $null,    $null,    $null,  185e9,  $null,   "p", "[He] 2s^2 2p^1",             "1808",     0, $null     ),
    (  6, "Carbon",        "C",    14, 2, 12.011,       "nonmetal",  "polyatomic nonmetal",   70,   170,  3800,     4300,   2267,    142,     709,   2.55, $null,   $null,    $null,    $null,  33e9,   $null,   "p", "[He] 2s^2 2p^2",             "3750 BCE", 0, $null     ),
    (  7, "Nitrogen",      "N",    15, 2, 14.007,       "nonmetal",  "diatomic nonmetal",     65,   155,  63.15,    77.36,  1.2506,  0.02583, 1040,  3.04, 126.21, 3.39e6,  $null,    $null,  $null,   $null,   "p", "[He] 2s^2 2p^3",             "1772",     0, $null     ),
    (  8, "Oxygen",        "O",    16, 2, 15.999,       "nonmetal",  "diatomic nonmetal",     60,   152,  54.36,    90.20,  1.429,   0.02658, 918,   3.44, 154.59, 5.043e6, $null,    $null,  $null,   $null,   "p", "[He] 2s^2 2p^4",             "1771",     0, $null     ),
    (  9, "Fluorine",      "F",    17, 2, 18.998403163, "nonmetal",  "diatomic nonmetal",     50,   147,  53.53,    85.03,  1.696,   0.0277,  824,   3.98, 144.13, 5.172e6, $null,    $null,  $null,   $null,   "p", "[He] 2s^2 2p^5",             "1810",     0, $null     ),
    ( 10, "Neon",          "Ne",   18, 2, 20.1797,      "nonmetal",  "noble gas",             $null, 154,  24.56,    27.07,  0.8999,  0.0491,  1030,  $null, 44.4,   2.76e6,  $null,    $null,  $null,   $null,   "p", "[He] 2s^2 2p^6",             "1898",     0, $null     ),
    ( 11, "Sodium",        "Na",    1, 3, 22.98976928,  "metal",     "alkali metal",          180,  227,  370.87,   1156,   971,     142,     1228,  0.93, 2573,   3.5e7,   10e9,    0.235, 6.3e9,  3.3e9,  "s", "[Ne] 3s^1",                  "1807",     0, $null     ),
    ( 12, "Magnesium",     "Mg",    2, 3, 24.305,       "metal",     "alkaline earth metal",  150,  173,  923,      1363,   1738,    156,     1023,  1.31, $null,   $null,    45e9,    0.29,  45e9,   17e9,   "s", "[Ne] 3s^2",                  "1755",     0, $null     ),
    ( 13, "Aluminium",     "Al",   13, 3, 26.9815385,   "metal",     "post-transition metal", 125,  $null, 933.47,   2792,   2698,    237,     897,   1.61, $null,   $null,    70e9,    0.35,  76e9,   26e9,   "p", "[Ne] 3s^2 3p^1",             "1825",     0, $null     ),
    ( 14, "Silicon",       "Si",   14, 3, 28.085,       "metalloid", "metalloid",             110,  210,  1687,     3538,   2329.6,  149,     705,   1.9,  $null,   $null,    47e9,    0.422, 100e9,  16.5e9, "p", "[Ne] 3s^2 3p^2",             "1823",     0, $null     ),
    ( 15, "Phosphorus",    "P",    15, 3, 30.973761998, "nonmetal",  "polyatomic nonmetal",   100,  180,  317.30,   550,    1820,    0.23617, 769,   2.19, 994,    $null,    $null,    $null,  11e9,   $null,   "p", "[Ne] 3s^2 3p^3",             "1669",     0, $null     ),
    ( 16, "Sulfur",        "S",    16, 3, 32.06,        "nonmetal",  "polyatomic nonmetal",   100,  180,  388.36,   717.87, 2067,    0.205,   710,   2.58, 1314,   2.07e7,  $null,    $null,  7.7e9,  $null,   "p", "[Ne] 3s^2 3p^4",             "2000 BCE", 0, $null     ),
    ( 17, "Chlorine",      "Cl",   17, 3, 35.45,        "nonmetal",  "diatomic nonmetal",     100,  175,  171.6,    239.11, 3.214,   0.0089,  479,   3.16, 416.9,  7.991e6, $null,    $null,  $null,   $null,   "p", "[Ne] 3s^2 3p^5",             "1774",     0, $null     ),
    ( 18, "Argon",         "Ar",   18, 3, 39.948,       "nonmetal",  "noble gas",             $null, 188,  83.80,    87.30,  1.7837,  0.01772, 520,   $null, 150.87, 4.898e6, $null,    $null,  $null,   $null,   "p", "[Ne] 3s^2 3p^6",             "1894",     0, $null     ),
    ( 19, "Potassium",     "K",     1, 4, 39.0983,      "metal",     "alkali metal",          220,  275,  336.53,   1032,   862,     102.5,   757,   0.82, 2223,   1.6e7,   3.42e9,  0.316, 3.1e9,  1.3e9,  "s", "[Ar] 4s^1",                  "1807",     0, $null     ),
    ( 20, "Calcium",       "Ca",    2, 4, 40.078,       "metal",     "alkaline earth metal",  180,  $null, 1115,     1757,   1540,    201,     647,   1,    $null,   $null,    20e9,    0.31,  17e9,   7.4e9,  "s", "[Ar] 4s^2",                  "1808",     0, $null     ),
    ( 21, "Scandium",      "Sc",    3, 4, 44.955908,    "metal",     "transition metal",      160,  $null, 1814,     3109,   2989,    15.8,    568,   1.36, $null,   $null,    74.4e9,  0.279, 56.6e9, 29.1e9, "d", "[Ar] 3d^1 4s^2",             "1879",     0, $null     ),
    ( 22, "Titanium",      "Ti",    4, 4, 47.867,       "metal",     "transition metal",      140,  $null, 1941,     3560,   4540,    21.9,    523,   1.54, $null,   $null,    116e9,   0.32,  110e9,  44e9,   "d", "[Ar] 3d^2 4s^2",             "1791",     0, $null     ),
    ( 23, "Vanadium",      "V",     5, 4, 50.9415,      "metal",     "transition metal",      135,  $null, 2183,     3680,   6110,    30.7,    489,   1.63, $null,   $null,    128e9,   0.37,  160e9,  47e9,   "d", "[Ar] 3d^3 4s^2",             "1801",     0, $null     ),
    ( 24, "Chromium",      "Cr",    6, 4, 51.9961,      "metal",     "transition metal",      140,  $null, 2180,     2944,   7150,    93.9,    449,   1.66, $null,   $null,    279e9,   0.21,  160e9,  115e9,  "d", "[Ar] 3d^5 4s^1",             "1797",     0, $null     ),
    ( 25, "Manganese",     "Mn",    7, 4, 54.938044,    "metal",     "transition metal",      140,  $null, 1519,     2334,   7440,    7.81,    479,   1.55, $null,   $null,    198e9,   0.225, 120e9,  80.8e9, "d", "[Ar] 3d^5 4s^2",             "1774",     0, $null     ),
    ( 26, "Iron",          "Fe",    8, 4, 55.845,       "metal",     "transition metal",      140,  $null, 1811,     3134,   7874,    80.4,    449,   1.83, $null,   $null,    211e9,   0.29,  170e9,  82e9,   "d", "[Ar] 3d^6 4s^2",             "5000 BCE", 0, $null     ),
    ( 27, "Cobalt",        "Co",    9, 4, 58.933194,    "metal",     "transition metal",      135,  $null, 1768,     3200,   8860,    100,     421,   1.88, $null,   $null,    209e9,   0.31,  180e9,  75e9,   "d", "[Ar] 3d^7 4s^2",             "1732",     0, $null     ),
    ( 28, "Nickel",        "Ni",   10, 4, 58.6934,      "metal",     "transition metal",      135,  163,  1728,     3186,   8912,    90.9,    444,   1.91, $null,   $null,    200e9,   0.31,  180e9,  76e9,   "d", "[Ar] 3d^8 4s^2",             "1751",     0, $null     ),
    ( 29, "Copper",        "Cu",   11, 4, 63.546,       "metal",     "transition metal",      135,  140,  1357.77,  2835,   8960,    401,     385,   1.9,  $null,   $null,    130e9,   0.34,  140e9,  48e9,   "d", "[Ar] 3d^10 4s^1",            "9000 BCE", 0, $null     ),
    ( 30, "Zinc",          "Zn",   12, 4, 65.38,        "metal",     "transition metal",      135,  139,  692.88,   1180,   7134,    116,     388,   1.65, $null,   $null,    108e9,   0.25,  70e9,   43e9,   "d", "[Ar] 3d^10 4s^2",            "1000 BCE", 0, $null     ),
    ( 31, "Gallium",       "Ga",   13, 4, 69.723,       "metal",     "post-transition metal", 130,  187,  302.9146, 2673,   5907,    40.6,    371,   1.81, $null,   $null,    $null,    $null,  $null,   $null,   "p", "[Ar] 3d^10 4s^2 4p^1",       "1875",     0, $null     ),
    ( 32, "Germanium",     "Ge",   14, 4, 72.630,       "metalloid", "metalloid",             125,  $null, 1211.40,  3106,   5323,    60.2,    320,   2.01, $null,   $null,    $null,    $null,  $null,   $null,   "p", "[Ar] 3d^10 4s^2 4p^2",       "1886",     0, $null     ),
    ( 33, "Arsenic",       "As",   15, 4, 74.921595,    "metalloid", "metalloid",             115,  185,  1090,     887,    5776,    50.2,    329,   2.18, 1673,   4.898e6, 8e9,     0.439, 22e9,   2.8e9,  "p", "[Ar] 3d^10 4s^2 4p^3",       "800",      0, $null     ),
    ( 34, "Selenium",      "Se",   16, 4, 78.971,       "nonmetal",  "polyatomic nonmetal",   115,  190,  453,      958,    4809,    0.519,   321,   2.55, 1766,   2.72e7,  10e9,    0.33,  8.3e9,  3.7e9,  "p", "[Ar] 3d^10 4s^2 4p^4",       "1817",     0, $null     ),
    ( 35, "Bromine",       "Br",   17, 4, 79.904,       "nonmetal",  "diatomic nonmetal",     115,  185,  265.8,    332.0,  3122,    0.122,   474,   2.96, 588,    1.034e7, $null,    $null,  $null,   $null,   "p", "[Ar] 3d^10 4s^2 4p^5",       "1825",     0, $null     ),
    ( 36, "Krypton",       "Kr",   18, 4, 83.798,       "nonmetal",  "noble gas",             $null, 202,  115.79,   119.93, 3.733,   9.43,    248,   3,    209.41, 5.50e6,  $null,    $null,  $null,   $null,   "p", "[Ar] 3d^10 4s^2 4p^6",       "1898",     0, $null     ),
    ( 37, "Rubidium",      "Rb",    1, 5, 85.4678,      "metal",     "alkali metal",          235,  $null, 312.46,   961,    1532,    58.2,    363,   0.82, 2093,   1.6e7,   2.4e9,   0.34,  2.5e9,  0.9e9,  "s", "[Kr] 5s^1",                  "1861",     0, $null     ),
    ( 38, "Strontium",     "Sr",    2, 5, 87.62,        "metal",     "alkaline earth metal",  200,  $null, 1050,     1655,   2640,    35.4,    301,   0.95, $null,   $null,    $null,    0.28,  $null,   $null,   "s", "[Kr] 5s^2",                  "1787",     0, $null     ),
    ( 39, "Yttrium",       "Y",     3, 5, 88.90584,     "metal",     "transition metal",      180,  $null, 1799,     3609,   4469,    17.2,    298,   1.22, $null,   $null,    63.5e9,  0.243, 41.2e9, 25.6e9, "d", "[Kr] 4d^1 5s^2",             "1794",     0, $null     ),
    ( 40, "Zirconium",     "Zr",    4, 5, 91.224,       "metal",     "transition metal",      155,  $null, 2128,     4682,   6506,    22.6,    278,   1.33, $null,   $null,    68e9,    0.34,  70.8e9, 33e9,   "d", "[Kr] 4d^2 5s^2",             "1789",     0, $null     ),
    ( 41, "Niobium",       "Nb",    5, 5, 92.90637,     "metal",     "transition metal",      145,  $null, 2750,     5017,   8570,    53.7,    265,   1.6,  $null,   $null,    105e9,   0.40,  170e9,  38e9,   "d", "[Kr] 4d^4 5s^1",             "1801",     0, $null     ),
    ( 42, "Molybdenum",    "Mo",    6, 5, 95.95,        "metal",     "transition metal",      145,  $null, 2896,     4912,   10220,   138,     251,   2.16, $null,   $null,    329e9,   0.31,  230e9,  120e9,  "d", "[Kr] 4d^5 5s^1",             "1778",     0, $null     ),
    ( 43, "Technetium",    "Tc",    7, 5, 98,           "metal",     "transition metal",      135,  $null, 2430,     4538,   11500,   50.6,    $null,  1.9,  $null,   $null,    $null,    $null,  $null,   $null,   "d", "[Kr] 4d^5 5s^2",             "1937",     1, 1.30e14  ),
    ( 44, "Ruthenium",     "Ru",    8, 5, 101.07,       "metal",     "transition metal",      130,  $null, 2607,     4423,   12370,   117,     238,   2.2,  $null,   $null,    447e9,   0.30,  220e9,  173e9,  "d", "[Kr] 4d^7 5s^1",             "1844",     0, $null     ),
    ( 45, "Rhodium",       "Rh",    9, 5, 102.90550,    "metal",     "transition metal",      135,  $null, 2237,     3968,   12410,   150,     243,   2.28, $null,   $null,    275e9,   0.26,  380e9,  150e9,  "d", "[Kr] 4d^8 5s^1",             "1804",     0, $null     ),
    ( 46, "Palladium",     "Pd",   10, 5, 106.42,       "metal",     "transition metal",      140,  163,  1828.05,  3236,   12020,   71.8,    244,   2.2,  $null,   $null,    121e9,   0.39,  180e9,  44e9,   "d", "[Kr] 4d^10",                 "1803",     0, $null     ),
    ( 47, "Silver",        "Ag",   11, 5, 107.8682,     "metal",     "transition metal",      160,  172,  1234.93,  2435,   10501,   429,     235,   1.93, $null,   $null,    83e9,    0.37,  100e9,  30e9,   "d", "[Kr] 4d^10 5s^1",            "5000 BCE", 0, $null     ),
    ( 48, "Cadmium",       "Cd",   12, 5, 112.414,      "metal",     "transition metal",      155,  158,  594.22,   1040,   8690,    96.6,    232,   1.69, $null,   $null,    50e9,    0.30,  42e9,   19e9,   "d", "[Kr] 4d^10 5s^2",            "1817",     0, $null     ),
    ( 49, "Indium",        "In",   13, 5, 114.818,      "metal",     "post-transition metal", 155,  193,  429.75,   2345,   7310,    81.8,    233,   1.78, $null,   $null,    11e9,    $null,  $null,   $null,   "p", "[Kr] 4d^10 5s^2 5p^1",       "1863",     0, $null     ),
    ( 50, "Tin",           "Sn",   14, 5, 118.710,      "metal",     "post-transition metal", 145,  217,  505.08,   2875,   7287,    66.8,    228,   1.96, $null,   $null,    50e9,    0.36,  58e9,   18e9,   "p", "[Kr] 4d^10 5s^2 5p^2",       "3500 BCE", 0, $null     ),
    ( 51, "Antimony",      "Sb",   15, 5, 121.760,      "metalloid", "metalloid",             145,  $null, 903.78,   1860,   6685,    24.4,    207,   2.05, $null,   $null,    55e9,    0.282, 42e9,   20e9,   "p", "[Kr] 4d^10 5s^2 5p^3",       "800",      0, $null     ),
    ( 52, "Tellurium",     "Te",   16, 5, 127.60,       "metalloid", "metalloid",             140,  206,  722.66,   1261,   6232,    2.675,   202,   2.1,  $null,   $null,    43e9,    0.39,  65e9,   16e9,   "p", "[Kr] 4d^10 5s^2 5p^4",       "1782",     0, $null     ),
    ( 53, "Iodine",        "I",    17, 5, 126.90447,    "nonmetal",  "diatomic nonmetal",     140,  198,  386.85,   457.4,  4930,    0.449,   214,   2.66, 819,    1.17e7,  $null,    $null,  7.7e9,  $null,   "p", "[Kr] 4d^10 5s^2 5p^5",       "1811",     0, $null     ),
    ( 54, "Xenon",         "Xe",   18, 5, 131.293,      "nonmetal",  "noble gas",             $null, 216,  161.4,    165.03, 5.887,   0.00565, 158,   2.6,  289.77, 5.841e6, $null,    $null,  $null,   $null,   "p", "[Kr] 4d^10 5s^2 5p^6",       "1898",     0, $null     ),
    ( 55, "Caesium",       "Cs",    1, 6, 132.90545196, "metal",     "alkali metal",          260,  $null, 301.59,   944,    1873,    35.9,    242,   0.79, 1938,   9.4e6,   1.7e9,   0.323, 1.6e9,  0.64e9, "s", "[Xe] 6s^1",                  "1860",     0, $null     ),
    ( 56, "Barium",        "Ba",    2, 6, 137.327,      "metal",     "alkaline earth metal",  215,  $null, 1000,     2170,   3594,    18.4,    204,   0.89, $null,   $null,    13e9,    0.274, 9.6e9,  4.9e9,  "s", "[Xe] 6s^2",                  "1772",     0, $null     ),
    ( 57, "Lanthanum",     "La",    3, 6, 138.90547,    "metal",     "lanthanide",            195,  $null, 1193,     3737,   6145,    13.4,    195,   1.1,  $null,   $null,    36.6e9,  0.280, 27.9e9, 14.3e9, "d", "[Xe] 5d^1 6s^2",             "1838",     0, $null     ),
    ( 58, "Cerium",        "Ce",    4, 6, 140.116,      "metal",     "lanthanide",            185,  $null, 1068,     3716,   6770,    11.3,    192,   1.12, $null,   $null,    33.6e9,  0.24,  21.5e9, 13.5e9, "f", "[Xe] 4f^1 5d^1 6s^2",        "1803",     0, $null     ),
    ( 59, "Praseodymium",  "Pr",    5, 6, 140.90766,    "metal",     "lanthanide",            185,  $null, 1208,     3793,   6773,    12.5,    193,   1.13, $null,   $null,    37.3e9,  0.281, 28.8e9, 14.8e9, "f", "[Xe] 4f^3 6s^2",             "1885",     0, $null     ),
    ( 60, "Neodymium",     "Nd",    6, 6, 144.242,      "metal",     "lanthanide",            185,  $null, 1297,     3347,   7007,    16.5,    190,   1.14, $null,   $null,    41.4e9,  0.281, 31.8e9, 16.3e9, "f", "[Xe] 4f^4 6s^2",             "1885",     0, $null     ),
    ( 61, "Promethium",    "Pm",    7, 6, 145,          "metal",     "lanthanide",            185,  $null, 1315,     3273,   7260,    17.9,    $null,  1.13, $null,   $null,    46e9,    0.28,  33e9,   18e9,   "f", "[Xe] 4f^5 6s^2",             "1942",     1, 5.605e8  ),
    ( 62, "Samarium",      "Sm",    8, 6, 150.36,       "metal",     "lanthanide",            185,  $null, 1345,     2067,   7520,    13.3,    197,   1.17, $null,   $null,    49.7e9,  0.274, 37.8e9, 19.5e9, "f", "[Xe] 4f^6 6s^2",             "1879",     0, $null     ),
    ( 63, "Europium",      "Eu",    9, 6, 151.964,      "metal",     "lanthanide",            185,  $null, 1099,     1802,   5243,    13.9,    182,   1.2,  $null,   $null,    18.2e9,  0.152, 8.3e9,  7.9e9,  "f", "[Xe] 4f^7 6s^2",             "1896",     0, $null     ),
    ( 64, "Gadolinium",    "Gd",   10, 6, 157.25,       "metal",     "lanthanide",            180,  $null, 1585,     3546,   7895,    10.6,    236,   1.2,  $null,   $null,    54.8e9,  0.259, 37.9e9, 21.8e9, "f", "[Xe] 4f^7 5d^1 6s^2",        "1880",     0, $null     ),
    ( 65, "Terbium",       "Tb",   11, 6, 158.92535,    "metal",     "lanthanide",            175,  $null, 1629,     3503,   8229,    11.1,    182,   1.2,  $null,   $null,    55.7e9,  0.261, 38.7e9, 22.1e9, "f", "[Xe] 4f^9 6s^2",             "1842",     0, $null     ),
    ( 66, "Dysprosium",    "Dy",   12, 6, 162.500,      "metal",     "lanthanide",            175,  $null, 1680,     2840,   8550,    10.7,    170,   1.22, $null,   $null,    61.4e9,  0.247, 40.5e9, 24.7e9, "f", "[Xe] 4f^10 6s^2",            "1886",     0, $null     ),
    ( 67, "Holmium",       "Ho",   13, 6, 164.93033,    "metal",     "lanthanide",            175,  $null, 1734,     2993,   8795,    16.2,    165,   1.23, $null,   $null,    64.8e9,  0.231, 40.2e9, 26.3e9, "f", "[Xe] 4f^11 6s^2",            "1878",     0, $null     ),
    ( 68, "Erbium",        "Er",   14, 6, 167.259,      "metal",     "lanthanide",            175,  $null, 1802,     3141,   9066,    14.5,    168,   1.24, $null,   $null,    69.9e9,  0.237, 44.4e9, 28.3e9, "f", "[Xe] 4f^12 6s^2",            "1842",     0, $null     ),
    ( 69, "Thulium",       "Tm",   15, 6, 168.93422,    "metal",     "lanthanide",            175,  $null, 1818,     3141,   9321,    16.9,    160,   1.25, $null,   $null,    74e9,    0.213, 44.5e9, 30.5e9, "f", "[Xe] 4f^13 6s^2",            "1879",     0, $null     ),
    ( 70, "Ytterbium",     "Yb",   16, 6, 173.045,      "metal",     "lanthanide",            175,  $null, 1097,     1469,   6965,    38.5,    155,   1.1,  $null,   $null,    23.9e9,  0.207, 30.5e9, 9.9e9,  "f", "[Xe] 4f^14 6s^2",            "1878",     0, $null     ),
    ( 71, "Lutetium",      "Lu",   17, 6, 174.9668,     "metal",     "lanthanide",            175,  $null, 1925,     3675,   9840,    16.4,    154,   1.27, $null,   $null,    68.6e9,  0.261, 47.6e9, 27.2e9, "f", "[Xe] 4f^14 5d^1 6s^2",       "1906",     0, $null     ),
    ( 72, "Hafnium",       "Hf",    4, 6, 178.49,       "metal",     "transition metal",      155,  $null, 2506,     4876,   13310,   23.0,    144,   1.3,  $null,   $null,    78e9,    0.37,  110e9,  30e9,   "d", "[Xe] 4f^14 5d^2 6s^2",       "1922",     0, $null     ),
    ( 73, "Tantalum",      "Ta",    5, 6, 180.94788,    "metal",     "transition metal",      145,  $null, 3290,     5731,   16654,   57.5,    140,   1.5,  $null,   $null,    186e9,   0.34,  200e9,  69e9,   "d", "[Xe] 4f^14 5d^3 6s^2",       "1802",     0, $null     ),
    ( 74, "Tungsten",      "W",     6, 6, 183.84,       "metal",     "transition metal",      135,  $null, 3695,     5828,   19250,   173,     132,   2.36, $null,   $null,    411e9,   0.28,  310e9,  161e9,  "d", "[Xe] 4f^14 5d^4 6s^2",       "1781",     0, $null     ),
    ( 75, "Rhenium",       "Re",    7, 6, 186.207,      "metal",     "transition metal",      135,  $null, 3459,     5869,   21020,   48.0,    137,   1.9,  $null,   $null,    463e9,   0.30,  370e9,  178e9,  "d", "[Xe] 4f^14 5d^5 6s^2",       "1908",     0, $null     ),
    ( 76, "Osmium",        "Os",    8, 6, 190.23,       "metal",     "transition metal",      130,  $null, 3306,     5285,   22610,   87.6,    130,   2.2,  $null,   $null,    574e9,   0.25,  462e9,  222e9,  "d", "[Xe] 4f^14 5d^6 6s^2",       "1803",     0, $null     ),
    ( 77, "Iridium",       "Ir",    9, 6, 192.217,      "metal",     "transition metal",      135,  $null, 2719,     4701,   22560,   147,     131,   2.2,  $null,   $null,    528e9,   0.26,  320e9,  210e9,  "d", "[Xe] 4f^14 5d^7 6s^2",       "1803",     0, $null     ),
    ( 78, "Platinum",      "Pt",   10, 6, 195.084,      "metal",     "transition metal",      135,  175,  2041.4,   4098,   21460,   71.6,    133,   2.28, $null,   $null,    168e9,   0.38,  230e9,  61e9,   "d", "[Xe] 4f^14 5d^9 6s^1",       "1748",     0, $null     ),
    ( 79, "Gold",          "Au",   11, 6, 196.966569,   "metal",     "transition metal",      135,  166,  1337.33,  3129,   19282,   318,     129,   2.54, $null,   $null,    78e9,    0.44,  180e9,  27e9,   "d", "[Xe] 4f^14 5d^10 6s^1",      "6000 BCE", 0, $null     ),
    ( 80, "Mercury",       "Hg",   12, 6, 200.592,      "metal",     "transition metal",      150,  155,  234.43,   629.88, 13533.6, 8.30,    140,   2,    1750,   1.72e8,  $null,    $null,  $null,   $null,   "d", "[Xe] 4f^14 5d^10 6s^2",      "2000 BCE", 0, $null     ),
    ( 81, "Thallium",      "Tl",   13, 6, 204.38,       "metal",     "post-transition metal", 190,  196,  577,      1746,   11850,   46.1,    129,   1.62, $null,   $null,    8e9,     0.45,  43e9,   2.8e9,  "p", "[Xe] 4f^14 5d^10 6s^2 6p^1", "1861",     0, $null     ),
    ( 82, "Lead",          "Pb",   14, 6, 207.2,        "metal",     "post-transition metal", 180,  202,  600.61,   2022,   11342,   35.3,    129,   1.87, $null,   $null,    16e9,    0.44,  46e9,   5.6e9,  "p", "[Xe] 4f^14 5d^10 6s^2 6p^2", "7000 BCE", 0, $null     ),
    ( 83, "Bismuth",       "Bi",   15, 6, 208.98040,    "metal",     "post-transition metal", 160,  $null, 544.7,    1837,   9807,    7.97,    122,   2.02, $null,   $null,    32e9,    0.33,  31e9,   12e9,   "p", "[Xe] 4f^14 5d^10 6s^2 6p^3", "1753",     0, 5.996e26 ),
    ( 84, "Polonium",      "Po",   16, 6, 209,          "metal",     "post-transition metal", 190,  $null, 527,      1235,   9320,    20,      $null,  2.0,  $null,   $null,    $null,    $null,  $null,   $null,   "p", "[Xe] 4f^14 5d^10 6s^2 6p^4", "1898",     1, 3.222e9  ),
    ( 85, "Astatine",      "At",   17, 6, 210,          "metalloid", "metalloid",             $null, $null, 575,      610,    7000,    1.7,     $null,  2.2,  $null,   $null,    $null,    $null,  $null,   $null,   "p", "[Xe] 4f^14 5d^10 6s^2 6p^5", "1940",     1, 29000    ),
    ( 86, "Radon",         "Rn",   18, 6, 222,          "nonmetal",  "noble gas",             $null, $null, 202,      211.3,  9.73,    0.00361, 94,    2.2,  377,    6.28e6,  $null,    $null,  $null,   $null,   "p", "[Xe] 4f^14 5d^10 6s^2 6p^6", "1899",     1, 330350   ),
    ( 87, "Francium",      "Fr",    1, 7, 223,          "metal",     "alkali metal",          $null, $null, 300,      950,    1870,    15,      $null,  0.7,  $null,   $null,    $null,    $null,  $null,   $null,   "s", "[Rn] 7s^1",                  "1939",     1, 1300     ),
    ( 88, "Radium",        "Ra",    2, 7, 226,          "metal",     "alkaline earth metal",  215,  $null, 973,      2010,   5500,    18.6,    94,    0.9,  $null,   $null,    $null,    $null,  $null,   $null,   "s", "[Rn] 7s^2",                  "1898",     1, 5.02e10  ),
    ( 89, "Actinium",      "Ac",    3, 7, 227,          "metal",     "actinide",              195,  $null, 1323,     3471,   10070,   12,      120,   1.1,  $null,   $null,    $null,    $null,  $null,   $null,   "d", "[Rn] 6d^1 7s^2",             "1902",     1, 6.8752e8 ),
    ( 90, "Thorium",       "Th",    4, 7, 232.0377,     "metal",     "actinide",              180,  $null, 2115,     5061,   11720,   54.0,    113,   1.3,  $null,   $null,    79e9,    0.27,  54e9,   31e9,   "f", "[Rn] 6d^2 7s^2",             "1829",     1, 4.437e17 ),
    ( 91, "Protactium",    "Pa",    5, 7, 231.03588,    "metal",     "actinide",              180,  $null, 1841,     4300,   15370,   47,      $null,  1.5,  $null,   $null,    $null,    $null,  $null,   $null,   "f", "[Rn] 5f^2 6d^1 7s^2",        "1913",     1, 1.035e12 ),
    ( 92, "Uranium",       "U",     6, 7, 238.02891,    "metal",     "actinide",              175,  186,  1405.3,   4404,   18950,   27.5,    116,   1.38, $null,   $null,    208e9,   0.23,  100e9,  111e9,  "f", "[Rn] 5f^3 6d^1 7s^2",        "1789",     1, 1.411e17 ),
    ( 93, "Neptunium",     "Np",    7, 7, 237,          "metal",     "actinide",              175,  $null, 917,      4273,   20450,   6.3,     $null,  1.36, $null,   $null,    $null,    $null,  $null,   $null,   "f", "[Rn] 5f^4 6d^1 7s^2",        "1940",     1, 6.771e13 ),
    ( 94, "Plutonium",     "Pu",    8, 7, 244,          "metal",     "actinide",              175,  $null, 912.5,    3501,   19840,   6.74,    $null,  1.28, $null,   $null,    96e9,    0.21,  55.2e9, 43e9,   "f", "[Rn] 5f^6 7s^2",             "1940",     1, 2.502e15 ),
    ( 95, "Americium",     "Am",    9, 7, 243,          "metal",     "actinide",              175,  $null, 1449,     2880,   13690,   10,      $null,  1.13, $null,   $null,    $null,    $null,  $null,   $null,   "f", "[Rn] 5f^7 7s^2",             "1944",     1, 2.331e11 ),
    ( 96, "Curium",        "Cm",   10, 7, 247,          "metal",     "actinide",              $null, $null, 1613,     3383,   13510,   $null,    $null,  1.28, $null,   $null,    $null,    $null,  $null,   $null,   "f", "[Rn] 5f^7 6d^1 7s^2",        "1944",     1, 4.923e14 ),
    ( 97, "Berkelium",     "Bk",   11, 7, 247,          "metal",     "actinide",              $null, $null, 1259,     2900,   14790,   10,      $null,  1.3,  $null,   $null,    $null,    $null,  $null,   $null,   "f", "[Rn] 5f^9 7s^2",             "1949",     1, 4.352e10 ),
    ( 98, "Californium",   "Cf",   12, 7, 251,          "metal",     "actinide",              $null, $null, 1173,     1743,   15100,   $null,    $null,  1.3,  $null,   $null,    $null,    $null,  $null,   $null,   "f", "[Rn] 5f^10 7s^2",            "1950",     1, 2.842e10 ),
    ( 99, "Einsteinium",   "Es",   13, 7, 252,          "metal",     "actinide",              $null, $null, 1133,     1269,   8840,    $null,    $null,  1.3,  $null,   $null,    $null,    $null,  $null,   $null,   "f", "[Rn] 5f^11 7s^2",            "1952",     1, 4.078e7  ),
    (100, "Fermium",       "Fm",   14, 7, 257,          "metal",     "actinide",              $null, $null, 1125,     $null,   9700,    $null,    $null,  1.3,  $null,   $null,    $null,    $null,  $null,   $null,   "f", "[Rn] 5f^12 7s^2",            "1952",     1, 8.683e6  ),
    (101, "Mendelevium",   "Md",   15, 7, 258,          "metal",     "actinide",              $null, $null, 1100,     $null,   10300,   $null,    $null,  1.3,  $null,   $null,    $null,    $null,  $null,   $null,   "f", "[Rn] 5f^13 7s^2",            "1955",     1, 4.450e6  ),
    (102, "Nobelium",      "No",   16, 7, 259,          "metal",     "actinide",              $null, $null, 1100,     $null,   9900,    $null,    $null,  1.3,  $null,   $null,    $null,    $null,  $null,   $null,   "f", "[Rn] 5f^14 7s^2",            "1966",     1, 10000    ),
    (103, "Lawrencium",    "Lr",   17, 7, 266,          "metal",     "actinide",              $null, $null, 1900,     $null,   15600,   $null,    $null,  1.3,  $null,   $null,    $null,    $null,  $null,   $null,   "f", "[Rn] 5f^14 7s^2 7p^1",       "1961",     1, 36000    ),
    (104, "Rutherfordium", "Rf",    4, 7, 267,          "metal",     "transition metal",      $null, $null, 2400,     5800,   23200,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "d", "[Rn] 5f^14 6d^2 7s^2",       "1969",     1, 47200    ),
    (105, "Dubnium",       "Db",    5, 7, 268,          "metal",     "transition metal",      $null, $null, $null,     $null,   29300,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "d", "[Rn] 5f^14 6d^3 7s^2",       "1970",     1, 20020    ),
    (106, "Seaborgium",    "Sg",    6, 7, 269,          "metal",     "transition metal",      $null, $null, $null,     $null,   35000,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "d", "[Rn] 5f^14 6d^4 7s^2",       "1974",     1, 6980     ),
    (107, "Bohrium",       "Bh",    7, 7, 270,          "metal",     "transition metal",      $null, $null, $null,     $null,   37100,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "d", "[Rn] 5f^14 6d^5 7s^2",       "1981",     1, 5400     ),
    (108, "Hassium",       "Hs",    8, 7, 277,          "metal",     "transition metal",      $null, $null, $null,     $null,   40700,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "d", "[Rn] 5f^14 6d^6 7s^2",       "1984",     1, 4000     ),
    (109, "Meitnerium",    "Mt",    9, 7, 278,          "unknown",   "unknown",               $null, $null, $null,     $null,   37400,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "d", "[Rn] 5f^14 6d^7 7s^2",       "1982",     1, 1800     ),
    (110, "Darmstadtium",  "Ds",   10, 7, 281,          "unknown",   "unknown",               $null, $null, $null,     $null,   34800,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "d", "[Rn] 5f^14 6d^8 7s^2",       "1994",     1, 240      ),
    (111, "Roentgenium",   "Rg",   11, 7, 282,          "unknown",   "unknown",               $null, $null, $null,     $null,   28700,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "d", "[Rn] 5f^14 6d^9 7s^2",       "1994",     1, 600      ),
    (112, "Copernicium",   "Cn",   12, 7, 285,          "metal",     "transition metal",      $null, $null, $null,     357,    23700,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "d", "[Rn] 5f^14 6d^10 7s^2",      "1996",     1, 2400     ),
    (113, "Nihonium",      "Nh",   13, 7, 286,          "unknown",   "unknown",               $null, $null, 700,      1400,   16000,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "p", "[Rn] 5f^14 6d^10 7s^2 7p^1", "2004",     1, 1200     ),
    (114, "Flerovium",     "Fl",   14, 7, 289,          "metal",     "post-transition metal", $null, $null, 340,      420,    14000,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "p", "[Rn] 5f^14 6d^10 7s^2 7p^2", "2004",     1, 80       ),
    (115, "Moscovium",     "Mc",   15, 7, 290,          "unknown",   "unknown",               $null, $null, 700,      1400,   13500,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "p", "[Rn] 5f^14 6d^10 7s^2 7p^3", "2010",     1, 60       ),
    (116, "Livermorium",   "Lv",   16, 7, 293,          "unknown",   "unknown",               $null, $null, 709,      1085,   12900,   $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "p", "[Rn] 5f^14 6d^10 7s^2 7p^4", "2004",     1, 0.120    ),
    (117, "Tennessine",    "Ts",   17, 7, 294,          "unknown",   "unknown",               $null, $null, 723,      883,    7200,    $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "p", "[Rn] 5f^14 6d^10 7s^2 7p^5", "2010",     1, 0.050    ),
    (118, "Oganesson",     "Og",   18, 7, 294,          "unknown",   "unknown",               $null, $null, 258,      263,    5000,    $null,    $null,  $null, $null,   $null,    $null,    $null,  $null,   $null,   "p", "[Rn] 5f^14 6d^10 7s^2 7p^6", "2006",     1, 0.005    )
)

foreach ($record in $sourceData)
{
  $element = New-Object -TypeName PSObject
  $radius  = New-Object -TypeName PSObject
  $criticalValues = New-Object -TypeName PSObject

  $element | Add-Member -Type NoteProperty -Name atomicNumber -Value $record[0]
  $element | Add-Member -Type NoteProperty -Name name -Value $record[1]
  $element | Add-Member -Type NoteProperty -Name symbol -Value $record[2]
  $element | Add-Member -Type NoteProperty -Name group -Value $record[3]
  $element | Add-Member -Type NoteProperty -Name period -Value $record[4]
  $element | Add-Member -Type NoteProperty -Name mass -Value $record[5]
  $element | Add-Member -Type NoteProperty -Name category -Value $record[6]
  $element | Add-Member -Type NoteProperty -Name subcategory -Value $record[7]

  $radius  | Add-Member -Type NoteProperty -Name atomic -Value $record[8]
  $radius  | Add-Member -Type NoteProperty -Name vanDerWaals -Value $record[9]

  $element | Add-Member -Type NoteProperty -Name radius -Value $radius

  $element | Add-Member -Type NoteProperty -Name meltingTemperature -Value $record[10]
  $element | Add-Member -Type NoteProperty -Name boilingTemperature -Value $record[11]
  $element | Add-Member -Type NoteProperty -Name density -Value $record[12]
  $element | Add-Member -Type NoteProperty -Name thermalConductivity -Value $record[13]
  $element | Add-Member -Type NoteProperty -Name specificHeat -Value $record[14]
  $element | Add-Member -Type NoteProperty -Name electronegativity -Value $record[15]

  $criticalValues | Add-Member -Type NoteProperty -Name temperature -Value $record[16]
  $criticalValues | Add-Member -Type NoteProperty -Name pressure -Value $record[17]

  $element | Add-Member -Type NoteProperty -Name criticalValues -Value $criticalValues

  $element | Add-Member -Type NoteProperty -Name youngsModulus -Value $record[18]
  $element | Add-Member -Type NoteProperty -Name poissonsRatio -Value $record[19]
  $element | Add-Member -Type NoteProperty -Name bulkModulus -Value $record[20]
  $element | Add-Member -Type NoteProperty -Name shearModulus -Value $record[21]
  $element | Add-Member -Type NoteProperty -Name block -Value $record[22]
  $element | Add-Member -Type NoteProperty -Name electronConfiguration -Value $record[23]
  $element | Add-Member -Type NoteProperty -Name discoveryYear -Value $record[24]

  if ($record[25] -eq 1)
  {
      $radFlag = $true;
  }
  else
  {
      $radFlag = $false;
  }

  $element | Add-Member -Type NoteProperty -Name radioactive -Value $radFlag

  $element | Add-Member -Type NoteProperty -Name halfLife -Value $record[26]

  $elements += $element
}

$jsonData = ConvertTo-Json $elements

$jsonData = ($jsonData -split '\r\n' |
% {
  $line = $_
  if ($_ -match '^ +')
  {
    $length = $Matches[0].Length / 2
    $line = ' ' * $length + $line.TrimStart()
  }
  $line
}) -join "`r`n"

$jsonData = [System.Text.Encoding]::UTF8.GetBytes($jsonData)

[IO.File]::WriteAllBytes("elements.json", $jsonData)
