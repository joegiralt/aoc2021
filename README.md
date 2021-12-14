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
Estimated total run time: 11.20 s

Benchmarking Day 1, Part 1...
Benchmarking Day 1, Part 2...
Benchmarking Day 10, Part 1...
Benchmarking Day 10, Part 2...
Benchmarking Day 11, Part 1...
Benchmarking Day 11, Part 2...
Benchmarking Day 12, Part 1...
Benchmarking Day 12, Part 2...
Benchmarking Day 13, Part 1...
Benchmarking Day 13, Part 2...
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
Day 6, Part 2                      3649.20        0.27 ms     ±6.96%        0.27 ms        0.34 ms
Day 8, Part 1                      2296.29        0.44 ms    ±17.19%        0.42 ms        0.91 ms
Day 1, Part 1                      2166.52        0.46 ms    ±10.91%        0.46 ms        0.51 ms
Day 1, Part 2                      1435.26        0.70 ms     ±5.04%        0.69 ms        0.87 ms
Day 10, Part 1                     1253.63        0.80 ms    ±20.56%        0.77 ms        1.60 ms
Day 10, Part 2                     1182.85        0.85 ms    ±18.11%        0.82 ms        1.63 ms
Day 13, Part 1                      841.19        1.19 ms     ±4.24%        1.18 ms        1.37 ms
Day 13, Part 2                      536.02        1.87 ms     ±3.71%        1.85 ms        2.19 ms
Day 3, Part 1                       399.96        2.50 ms    ±20.12%        2.34 ms        5.95 ms
Day 3, Part 2                       331.14        3.02 ms    ±15.81%        2.87 ms        6.07 ms
Day 9, Part 1                       239.55        4.17 ms     ±4.30%        4.14 ms        4.73 ms
Day 8, Part 2                       219.39        4.56 ms    ±11.33%        4.52 ms        6.72 ms
Day 2, Part 1                       182.41        5.48 ms     ±4.25%        5.44 ms        6.67 ms
Day 2, Part 2                       180.61        5.54 ms     ±4.09%        5.50 ms        6.83 ms
Day 2, Part 1 (with Nx)             179.25        5.58 ms     ±0.95%        5.57 ms        5.78 ms
Day 4, Part 1                       163.09        6.13 ms     ±1.28%        6.13 ms        6.29 ms
Day 11, Part 1                      135.79        7.36 ms     ±2.90%        7.33 ms        7.96 ms
Day 12, Part 1                      119.52        8.37 ms     ±2.07%        8.33 ms        8.84 ms
Day 4, Part 2                       109.82        9.11 ms     ±2.07%        9.10 ms        9.39 ms
Day 2, Part 1 (with Nx.Defn)         80.23       12.46 ms     ±0.80%       12.48 ms       12.66 ms
Day 11, Part 2                       34.89       28.66 ms     ±0.71%       28.55 ms       29.01 ms
Day 9, Part 2                        17.38       57.55 ms     ±4.90%       57.56 ms       60.99 ms
Day 5, Part 1                        16.18       61.82 ms     ±7.48%       61.82 ms       66.18 ms
Day 7, Part 2                        11.50       86.95 ms     ±0.41%       86.80 ms       87.36 ms
Day 5, Part 2                        11.33       88.23 ms     ±3.81%       87.37 ms       91.93 ms
Day 6, Part 1                        10.74       93.07 ms     ±2.88%       93.78 ms       95.33 ms
Day 7, Part 1                         8.10      123.47 ms    ±14.76%      123.47 ms      136.36 ms
Day 12, Part 2                        2.77      360.72 ms     ±0.00%      360.72 ms      360.72 ms

Comparison: 
Day 6, Part 2                      3649.20
Day 8, Part 1                      2296.29 - 1.59x slower +0.161 ms
Day 1, Part 1                      2166.52 - 1.68x slower +0.188 ms
Day 1, Part 2                      1435.26 - 2.54x slower +0.42 ms
Day 10, Part 1                     1253.63 - 2.91x slower +0.52 ms
Day 10, Part 2                     1182.85 - 3.09x slower +0.57 ms
Day 13, Part 1                      841.19 - 4.34x slower +0.91 ms
Day 13, Part 2                      536.02 - 6.81x slower +1.59 ms
Day 3, Part 1                       399.96 - 9.12x slower +2.23 ms
Day 3, Part 2                       331.14 - 11.02x slower +2.75 ms
Day 9, Part 1                       239.55 - 15.23x slower +3.90 ms
Day 8, Part 2                       219.39 - 16.63x slower +4.28 ms
Day 2, Part 1                       182.41 - 20.01x slower +5.21 ms
Day 2, Part 2                       180.61 - 20.20x slower +5.26 ms
Day 2, Part 1 (with Nx)             179.25 - 20.36x slower +5.30 ms
Day 4, Part 1                       163.09 - 22.38x slower +5.86 ms
Day 11, Part 1                      135.79 - 26.87x slower +7.09 ms
Day 12, Part 1                      119.52 - 30.53x slower +8.09 ms
Day 4, Part 2                       109.82 - 33.23x slower +8.83 ms
Day 2, Part 1 (with Nx.Defn)         80.23 - 45.49x slower +12.19 ms
Day 11, Part 2                       34.89 - 104.58x slower +28.38 ms
Day 9, Part 2                        17.38 - 210.02x slower +57.28 ms
Day 5, Part 1                        16.18 - 225.60x slower +61.55 ms
Day 7, Part 2                        11.50 - 317.31x slower +86.68 ms
Day 5, Part 2                        11.33 - 321.95x slower +87.95 ms
Day 6, Part 1                        10.74 - 339.65x slower +92.80 ms
Day 7, Part 1                         8.10 - 450.57x slower +123.20 ms
Day 12, Part 2                        2.77 - 1316.33x slower +360.44 ms
```