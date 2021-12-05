# Aoc2021

Advent of  code 

# Becnhmarks
```txt
Operating System: macOS
CPU Information: Apple M1 Max
Number of Available Cores: 10
Available memory: 64 GB
Elixir 1.13.0-dev
Erlang 24.1.3

Benchmark suite executing with the following configuration:
warmup: 5 s
time: 10 s
memory time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 30 s

Benchmarking Day 4, Part 1...
Benchmarking Day 4, Part 2...

Name                    ips        average  deviation         median         99th %
Day 4, Part 1        155.66        6.42 ms     ±8.66%        6.37 ms        8.09 ms
Day 4, Part 2         31.69       31.56 ms     ±1.47%       31.50 ms       33.60 ms

Comparison: 
Day 4, Part 1        155.66
Day 4, Part 2         31.69 - 4.91x slower +25.13 ms
---------------------------------------------------------------------------------------------------
~/dev/aoc2021(main*) » mix run lib/benchmark.exs                        josephgiralt@MBP14inch2021
Operating System: macOS
CPU Information: Apple M1 Max
Number of Available Cores: 10
Available memory: 64 GB
Elixir 1.13.0-dev
Erlang 24.1.3

Benchmark suite executing with the following configuration:
warmup: 5 s
time: 10 s
memory time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 1.75 min

Benchmarking Day 1, Part 1...
Benchmarking Day 1, Part 2...
Benchmarking Day 2, Part 1...
Benchmarking Day 2, Part 2...
Benchmarking Day 3, Part 1...
Benchmarking Day 4, Part 1...
Benchmarking Day 4, Part 2...

Name                    ips        average  deviation         median         99th %
Day 1, Part 1       2407.23        0.42 ms    ±33.48%        0.39 ms        0.76 ms
Day 1, Part 2       1469.57        0.68 ms    ±17.74%        0.66 ms        0.88 ms
Day 3, Part 1        431.82        2.32 ms     ±9.26%        2.23 ms        2.69 ms
Day 2, Part 1        184.40        5.42 ms     ±4.11%        5.36 ms        6.66 ms
Day 2, Part 2        181.66        5.50 ms     ±6.10%        5.42 ms        6.75 ms
Day 4, Part 1        168.00        5.95 ms     ±2.68%        5.96 ms        6.61 ms
Day 4, Part 2         31.22       32.03 ms     ±2.05%       31.85 ms       34.11 ms

Comparison: 
Day 1, Part 1       2407.23
Day 1, Part 2       1469.57 - 1.64x slower +0.27 ms
Day 3, Part 1        431.82 - 5.57x slower +1.90 ms
Day 2, Part 1        184.40 - 13.05x slower +5.01 ms
Day 2, Part 2        181.66 - 13.25x slower +5.09 ms
Day 4, Part 1        168.00 - 14.33x slower +5.54 ms
Day 4, Part 2         31.22 - 77.10x slower +31.61 ms
```

