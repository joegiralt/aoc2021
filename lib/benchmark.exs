Benchee.run(
  %{
    "Day 1, Part 1" => fn -> Aoc2021.Day1.Solution.part(1) end,
    "Day 1, Part 2" => fn -> Aoc2021.Day1.Solution.part(2) end,
    "Day 2, Part 1" => fn -> Aoc2021.Day2.Solution.part(1) end,
    "Day 2, Part 2" => fn -> Aoc2021.Day2.Solution.part(2) end,
    "Day 2, Part 1 (with Nx)" => fn -> Aoc2021.Day2.Solution.part(1, :nx) end,
    "Day 2, Part 1 (with Nx.Defn)" => fn -> Aoc2021.Day2.Solution.part(1, :defn) end,
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
  warmup: 0.01,
  time: 0.1,
  memory_time: 0.1,
  parallel: 1
)
