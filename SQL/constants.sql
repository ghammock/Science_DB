/* constants.sql
 * Creates and fills a table of fundamental physical constants.  All dimensions
 * are in SI units.
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

-- A table of fundamental physical constants.
CREATE TABLE `constants` (
  `id`      INT UNSIGNED NOT NULL,
  `name`    VARCHAR(64) NOT NULL, -- A searchable name for the constant.
  `symbol`  VARCHAR(8) NOT NULL,  -- The typical symbol for the constant.
  `value`   DOUBLE NOT NULL,      -- The value of the constant in SI units.
  `units`   TEXT DEFAULT NULL,    -- The SI units of the constant.
  `comment` TEXT DEFAULT NULL,    -- Any relevant comment used to describe the constant.
  
  PRIMARY KEY (`id`)
);

INSERT INTO `constants` (`id`, `name`, `symbol`, `value`, `units`, `comment`)
VALUES ( 1, "Archimedes' constant, pi",                  "pi",         3.141592653589793238, NULL,           NULL              ),
       ( 2, "tau circle constant",                       "tau",        6.283185307179586,    NULL,           "tau = 2*pi"      ),
       ( 3, "Euler's number",                            "e",          2.7182818284,         NULL,           NULL              ),
       ( 4, "Golden ratio",                              "phi",        1.6180339887498948,   NULL,           NULL              ),
       ( 5, "speed of light in vacuum",                  "c",          299792458,            "m/s",          "Defined"         ),
       ( 6, "Newtonian constant of gravitation (big-G)", "G",          6.67408e-11,          "m^3/(kg-s^2)", NULL              ),
       ( 7, "Planck constant",                           "h",          6.626070040e-34,      "J-s",          NULL              ),
       ( 8, "reduced Plank constant",                    "h_bar",      1.054571800e-34,      "J-s",          "h_bar = h/(2*pi)"),
       ( 9, "magnetic constant (vacuum permeability)",   "mu_0",       1.256637061e-6,       "N/A^2",        "Defined"         ),
       (10, "electric constant (vacuum permittivity)",   "epsilon_0",  8.854187817e-12,      "F/m",          "Defined"         ),
       (11, "characteristic impedance of vacuum",        "Z_0",        376.730313461,        "ohm",          "Defined"         ),
       (12, "Coulomb's constant",                        "k_e",        8.9875517873681764e9, "N-m^2/C^2",    "Defined"         ),
       (13, "elementary charge",                         "e_0",        1.6021766208e-19,     "C",            NULL              ),
       (14, "mass of electron",                          "m_e",        9.10938356e-31,       "kg",           NULL              ),
       (15, "mass of proton",                            "m_p",        1.672621898e-27,      "kg",           NULL              ),
       (16, "mass of neutron",                           "m_n",        1.674927471e-27,      "kg",           NULL              ),
       (17, "fine structure constant",                   "alpha",      0.0072973525664,      NULL,           NULL              ),
       (18, "Rydberg constant",                          "R_infinity", 10973731.568508,      "1/m",          NULL              ),
       (19, "Avogadro's number",                         "N_A",        6.022140857e23,       "1/mol",        NULL              ),
       (20, "Boltzmann constant",                        "k",          1.38064852e-23,       "J/K",          "k = R / N_A"     ),
       (21, "Faraday constant",                          "F",          96485.33289,          "C/mol",        "F = N_A * e"     ),
       (22, "first radiation constant",                  "c1",         3.741771790e-16,      "W-m^2",        "c1 = 2*pi*h*c^2" ),
       (23, "second radiation constant",                 "c2",         1.43877736e-2,        "m-K",          "c2 = h*c/k"      ),
       (24, "gas constant",                              "R",          8.3144598,            "J/(K-mol)",    NULL              ),
       (25, "Stefan-Boltzmann constant",                 "sigma",      5.670367e-8,          "W/(m^2-K^4)",  NULL              );