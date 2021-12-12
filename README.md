# Aoc2021

Advent of  code 

# Benchmarks
```txt
Operating System: macOS
CPU Information: Apple M1 Max
Number of Available Cores: 10
Available memory: 64 GB
Elixir 1.13.0
Erlang 24.1.7

Benchmark suite executing with the following configuration:
warmup: 200 ms
time: 200 ms
memory time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 8.80 s

Benchmarking Day 1, Part 1...
Benchmarking Day 1, Part 2...
Benchmarking Day 10, Part 1...
Benchmarking Day 11, Part 1...
Benchmarking Day 2, Part 1...
Benchmarking Day 2, Part 1 (with Nx)...
Benchmarking Day 2, Part 1 (with Nx.Defn)...
Benchmarking Day 2, Part 2...
Benchmarking Day 3, Part 1...
Benchmarking Day 3, Part 2...
Benchmarking Day 4, Part 1...
Benchmarking Day 4, Part 2...
Benchmarking Day 5, Part 1...
Benchmarking Day 5, Part 2...
Benchmarking Day 6, Part 1...
Benchmarking Day 6, Part 2...
Benchmarking Day 7, Part 1...
Benchmarking Day 7, Part 2...
Benchmarking Day 8, Part 1...
Benchmarking Day 8, Part 2...
Benchmarking Day 9, Part 1...
Benchmarking Day 9, Part 2...

Name                                   ips        average  deviation         median         99th %
Day 6, Part 2                      3566.61        0.28 ms    ±17.47%        0.27 ms        0.35 ms
Day 8, Part 1                      2419.93        0.41 ms     ±4.89%        0.41 ms        0.47 ms
Day 1, Part 1                      2392.04        0.42 ms     ±5.36%        0.41 ms        0.47 ms
Day 1, Part 2                      1453.46        0.69 ms     ±3.75%        0.68 ms        0.83 ms
Day 10, Part 1                     1325.16        0.75 ms     ±8.72%        0.76 ms        0.93 ms
Day 3, Part 1                       384.62        2.60 ms    ±14.57%        2.53 ms        4.79 ms
Day 3, Part 2                       326.08        3.07 ms     ±9.15%        2.97 ms        3.79 ms
Day 9, Part 1                       239.97        4.17 ms     ±3.80%        4.17 ms        4.47 ms
Day 8, Part 2                       227.06        4.40 ms     ±7.29%        4.45 ms        4.92 ms
Day 2, Part 1                       180.59        5.54 ms     ±1.42%        5.53 ms        5.73 ms
Day 2, Part 2                       180.53        5.54 ms     ±1.33%        5.53 ms        5.79 ms
Day 2, Part 1 (with Nx)             176.76        5.66 ms     ±5.92%        5.56 ms        6.80 ms
Day 4, Part 1                       160.58        6.23 ms     ±2.64%        6.21 ms        6.53 ms
Day 11, Part 1                      139.21        7.18 ms     ±3.72%        7.15 ms        8.32 ms
Day 4, Part 2                       107.41        9.31 ms     ±3.43%        9.31 ms        9.99 ms
Day 2, Part 1 (with Nx.Defn)         79.56       12.57 ms     ±0.86%       12.56 ms       12.72 ms
Day 9, Part 2                        17.63       56.71 ms     ±4.36%       57.38 ms       58.64 ms
Day 5, Part 1                        16.02       62.40 ms     ±6.63%       61.25 ms       68.06 ms
Day 7, Part 2                        11.61       86.15 ms     ±0.08%       86.16 ms       86.20 ms
Day 5, Part 2                        11.53       86.76 ms     ±3.19%       87.14 ms       89.33 ms
Day 6, Part 1                         9.70      103.09 ms    ±12.68%      103.09 ms      112.34 ms
Day 7, Part 1                         8.24      121.41 ms    ±15.56%      121.41 ms      134.77 ms

Comparison: 
Day 6, Part 2                      3566.61
Day 8, Part 1                      2419.93 - 1.47x slower +0.133 ms
Day 1, Part 1                      2392.04 - 1.49x slower +0.138 ms
Day 1, Part 2                      1453.46 - 2.45x slower +0.41 ms
Day 10, Part 1                     1325.16 - 2.69x slower +0.47 ms
Day 3, Part 1                       384.62 - 9.27x slower +2.32 ms
Day 3, Part 2                       326.08 - 10.94x slower +2.79 ms
Day 9, Part 1                       239.97 - 14.86x slower +3.89 ms
Day 8, Part 2                       227.06 - 15.71x slower +4.12 ms
Day 2, Part 1                       180.59 - 19.75x slower +5.26 ms
Day 2, Part 2                       180.53 - 19.76x slower +5.26 ms
Day 2, Part 1 (with Nx)             176.76 - 20.18x slower +5.38 ms
Day 4, Part 1                       160.58 - 22.21x slower +5.95 ms
Day 11, Part 1                      139.21 - 25.62x slower +6.90 ms
Day 4, Part 2                       107.41 - 33.21x slower +9.03 ms
Day 2, Part 1 (with Nx.Defn)         79.56 - 44.83x slower +12.29 ms
Day 9, Part 2                        17.63 - 202.25x slower +56.43 ms
Day 5, Part 1                        16.02 - 222.57x slower +62.12 ms
Day 7, Part 2                        11.61 - 307.25x slower +85.87 ms
Day 5, Part 2                        11.53 - 309.45x slower +86.48 ms
Day 6, Part 1                         9.70 - 367.70x slower +102.81 ms
Day 7, Part 1                         8.24 - 433.01x slower +121.13 ms
```