/* wiregauge.sql
 * Creates and fills a table of standard wire gauges and properties.
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

-- Creates the wire gauges table.
CREATE TABLE `wiregauge`
(
    `gauge`         VARCHAR(11) NOT NULL, -- The name of the wire gauge.
    `diameter`      DOUBLE NOT NULL,      -- The diameter of the conductor in millimeters.
    `resistance_Cu` DOUBLE NOT NULL,      -- The resistance of a copper conductor of the specified gauge in ohms per kilometer (ohm/km).
    `maxcurrent`    DOUBLE NOT NULL       -- The maximum current of a conductor of the specified gauge of an arbitrary conductor.
);

-- Fills the wire gauges table with relevant values.
-- References:
--   https://www.solaris-shop.com/content/American%20Wire%20Gauge%20Conductor%20Size%20Table.pdf
--   http://www.tedpella.com/company_html/wire-gauge-vs-dia.htm
INSERT INTO `wiregauge`
VALUES (`gauge`, `diameter`, `resistance_Cu`, `maxcurrent`)
    (       "0000",  11.68400,     0.160720,  302.0000),
    (        "000",  10.40384,     0.202704,  239.0000),
    (         "00",   9.26592,     0.255512,  190.0000),
    (          "0",   8.25246,     0.322424,  150.0000),
    (          "1",   7.34822,     0.406392,  119.0000),
    (          "2",   6.54304,     0.512664,   94.0000),
    (          "3",   5.82676,     0.646160,   75.0000),
    (          "4",   5.18922,     0.815080,   60.0000),
    (          "5",   4.62026,     1.027624,   47.0000),
    (          "6",   4.11480,     1.295928,   37.0000),
    (          "7",   3.66522,     1.634096,   30.0000),
    (          "8",   3.26390,     2.060496,   24.0000),
    (          "9",   2.90576,     2.598088,   19.0000),
    (         "10",   2.58826,     3.276392,   15.0000),
    (         "11",   2.30378,     4.132800,   12.0000),
    (         "12",   2.05232,     5.208640,    9.3000),
    (         "13",   1.82880,     6.569840,    7.4000),
    (         "14",   1.62814,     8.282000,    5.9000),
    (         "15",   1.45034,    10.443520,    4.7000),
    (         "16",   1.29032,    13.172480,    3.7000),
    (         "17",   1.15062,    16.609920,    2.9000),
    (         "18",   1.02362,    20.942800,    2.3000),
    (         "19",   0.91186,    26.407280,    1.8000),
    (         "20",   0.81280,    33.292000,    1.5000),
    (         "21",   0.72390,    41.984000,    1.2000),
    (         "22",   0.64516,    52.939200,    0.9200),
    (         "23",   0.57404,    66.780800,    0.7290),
    (         "24",   0.51054,    84.197600,    0.5770),
    (         "25",   0.45466,   106.173600,    0.4570),
    (         "26",   0.40386,   133.856800,    0.3610),
    (         "27",   0.36068,   168.821600,    0.2880),
    (         "28",   0.32004,   212.872000,    0.2260),
    (         "29",   0.28702,   268.402400,    0.1820),
    (         "30",   0.25400,   338.496000,    0.1420),
    (         "31",   0.22606,   426.728000,    0.1130),
    (         "32",   0.20320,   538.248000,    0.0910),
    ("Metric 2.00",   0.20000,   555.610000,    0.0880),
    (         "33",   0.18034,   678.632000,    0.0720),
    ("Metric 1.80",   0.18000,   680.550000,    0.0720),
    (         "34",   0.16002,   855.752000,    0.0560),
    ("Metric 1.60",   0.16002,   855.752000,    0.0560),
    (         "35",   0.14224,  1079.120000,    0.0440),
    ("Metric 1.40",   0.14000,  1114.000000,    0.0430),
    (         "36",   0.12700,  1360.000000,    0.0350),
    ("Metric 1.25",   0.12500,  1404.000000,    0.0340),
    (         "37",   0.11430,  1715.000000,    0.0289),
    ("Metric 1.12",   0.11200,  1750.000000,    0.0278),
    (         "38",   0.10160,  2163.000000,    0.0228),
    ("Metric 1.00",   0.10000,  2198.000000,    0.0221),
    (         "39",   0.08890,  2728.000000,    0.0175),
    (         "40",   0.07874,  3440.000000,    0.0137);