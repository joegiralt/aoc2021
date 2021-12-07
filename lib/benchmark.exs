Benchee.run(
  %{
    "Day 1, Part 1" => fn -> Aoc2021.Day1.Solution.part(1) end,
    "Day 1, Part 2" => fn -> Aoc2021.Day1.Solution.part(2) end,
    "Day 2, Part 1" => fn -> Aoc2021.Day2.Solution.part(1) end,
    "Day 2, Part 2" => fn -> Aoc2021.Day2.Solution.part(2) end,
    "Day 3, Part 1" => fn -> Aoc2021.Day3.Solution.part(1) end,
    "Day 3, Part 2" => fn -> Aoc2021.Day3.Solution.part(2) end,
    "Day 4, Part 1" => fn -> Aoc2021.Day4.Solution.part(1) end,
    "Day 4, Part 2" => fn -> Aoc2021.Day4.Solution.part(2) end,
    "Day 5, Part 1" => fn -> Aoc2021.Day5.Solution.part(1) end,
    "Day 5, Part 2" => fn -> Aoc2021.Day5.Solution.part(2) end,
    "Day 6, Part 1" => fn -> Aoc2021.Day6.Solution.part(1) end,
    "Day 6, Part 2" => fn -> Aoc2021.Day6.Solution.part(2) end,
    "Day 7, Part 1" => fn -> Aoc2021.Day7.Solution.part(1) end,
    "Day 7, Part 2" => fn -> Aoc2021.Day7.Solution.part(2) end
  },
  warmup: 5,
  time: 10,
  parallel: 1
)
