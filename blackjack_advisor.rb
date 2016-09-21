hard_array = [
  { 'hit.' => {
    5 => [*2..11],
    6 => [*2..11],
    7 => [*2..11],
    8 => [*2..4, *7..11],
    9 => [*7..11],
    10 => [10, 11],
    12 => [2, 3, *7..11],
    13 => [*7..11],
    14 => [*7..11],
    15 => [*7..11],
    16 => [*7..11]
  } },
  { 'double down.' => {
    8 => [5, 6],
    9 => [*2..6],
    10 => [*2..9],
    11 => [*2..11]
  } },
  { 'stand.' => {
    12 => [4, 5, 6],
    13 => [*2..6],
    14 => [*2..6],
    15 => [*2..6],
    16 => [*2..6],
    17 => [*2..11],
    18 => [*2..11],
    19 => [*2..11],
    20 => [*2..11],
    21 => [*2..11]
  } }
]
soft_array = [
  'hit.' => {
    13 => [2, 3, *7..11],
    14 => [2, 3, *7..11],
    15 => [2, 3, *7..11],
    16 => [2, 3, *7..11],
    17 => [*7..11],
    18 => [9, 10]
  },
  "double down." => {
    13 => [4, 5, 6],
    14 => [4, 5, 6],
    15 => [4, 5, 6],
    16 => [4, 5, 6],
    17 => [*2..6]
  },
  'stand unless you can double down.' => {
    18 => [*3..6],
    19 => [6]
  },
  'stand.' => {
    18 => [2, 7, 8, 11],
    19 => [*2..5, *7..11],
    20 => [*2..11],
    21 => [*2..11]
  }
]
pair_array = [
  { 'hit.' => {
    2 => [*8..11],
    3 => [9, 10, 11],
    4 => [2, 3, *7..11],
    5 => [10, 11],
    6 => [*8..11],
    7 => [9, 11]
  }},
  {'double down.' => {
    5 => [*2..9]
  }},
  {'stand'. => {
    7 => [10],
    9 => [7, 10, 11],
    10 => [*2..11]
  } },
  {'split.' => {
    2 => [*2..7],
    3 => [*2..8],
    4 => [4, 5, 6],
    6 => [*2..7],
    7 => [*2..8],
    8 => [*2..11],
    9 => [*2..6, 8, 9],
    11 => [*2..11]
  }}
]