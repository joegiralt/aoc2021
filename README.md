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
Estimated total run time: 10.40 s

Benchmarking Day 1, Part 1...
Benchmarking Day 1, Part 2...
Benchmarking Day 10, Part 1...
Benchmarking Day 10, Part 2...
Benchmarking Day 11, Part 1...
Benchmarking Day 11, Part 2...
Benchmarking Day 12, Part 1...
Benchmarking Day 12, Part 2...
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
Day 6, Part 2                      3578.55        0.28 ms     ±8.34%        0.27 ms        0.38 ms
Day 1, Part 1                      2250.96        0.44 ms    ±26.88%        0.42 ms        1.06 ms
Day 8, Part 1                      2072.49        0.48 ms    ±19.82%        0.46 ms        1.12 ms
Day 1, Part 2                      1382.19        0.72 ms    ±12.79%        0.70 ms        1.12 ms
Day 10, Part 1                     1270.00        0.79 ms    ±12.96%        0.78 ms        1.21 ms
Day 10, Part 2                     1207.32        0.83 ms    ±11.42%        0.81 ms        1.25 ms
Day 3, Part 1                       398.61        2.51 ms    ±13.74%        2.35 ms        3.92 ms
Day 3, Part 2                       344.84        2.90 ms     ±7.17%        2.81 ms        3.29 ms
Day 9, Part 1                       235.77        4.24 ms     ±4.84%        4.27 ms        4.71 ms
Day 8, Part 2                       223.70        4.47 ms     ±8.43%        4.50 ms        5.55 ms
Day 2, Part 1                       180.94        5.53 ms     ±5.20%        5.46 ms        6.98 ms
Day 2, Part 2                       179.47        5.57 ms     ±4.20%        5.48 ms        6.73 ms
Day 2, Part 1 (with Nx)             178.87        5.59 ms     ±1.48%        5.58 ms        5.76 ms
Day 4, Part 1                       160.26        6.24 ms     ±1.64%        6.24 ms        6.51 ms
Day 11, Part 1                      141.86        7.05 ms     ±2.16%        7.05 ms        7.41 ms
Day 12, Part 1                      117.62        8.50 ms     ±1.82%        8.49 ms        8.76 ms
Day 4, Part 2                       107.68        9.29 ms     ±4.57%        9.14 ms       10.43 ms
Day 2, Part 1 (with Nx.Defn)         73.81       13.55 ms     ±3.06%       13.47 ms       14.64 ms
Day 11, Part 2                       35.31       28.32 ms     ±0.31%       28.32 ms       28.46 ms
Day 9, Part 2                        17.63       56.72 ms     ±4.03%       56.97 ms       58.75 ms
Day 5, Part 1                        15.82       63.21 ms     ±5.60%       63.62 ms       66.73 ms
Day 7, Part 2                        11.27       88.70 ms     ±1.11%       88.71 ms       89.67 ms
Day 5, Part 2                        10.61       94.26 ms    ±11.65%       90.15 ms      106.70 ms
Day 6, Part 1                        10.09       99.06 ms     ±3.10%       98.11 ms      102.49 ms
Day 7, Part 1                         8.02      124.72 ms    ±16.23%      124.72 ms      139.03 ms
Day 12, Part 2                        2.85      350.75 ms     ±0.00%      350.75 ms      350.75 ms

Comparison: 
Day 6, Part 2                      3578.55
Day 1, Part 1                      2250.96 - 1.59x slower +0.165 ms
Day 8, Part 1                      2072.49 - 1.73x slower +0.20 ms
Day 1, Part 2                      1382.19 - 2.59x slower +0.44 ms
Day 10, Part 1                     1270.00 - 2.82x slower +0.51 ms
Day 10, Part 2                     1207.32 - 2.96x slower +0.55 ms
Day 3, Part 1                       398.61 - 8.98x slower +2.23 ms
Day 3, Part 2                       344.84 - 10.38x slower +2.62 ms
Day 9, Part 1                       235.77 - 15.18x slower +3.96 ms
Day 8, Part 2                       223.70 - 16.00x slower +4.19 ms
Day 2, Part 1                       180.94 - 19.78x slower +5.25 ms
Day 2, Part 2                       179.47 - 19.94x slower +5.29 ms
Day 2, Part 1 (with Nx)             178.87 - 20.01x slower +5.31 ms
Day 4, Part 1                       160.26 - 22.33x slower +5.96 ms
Day 11, Part 1                      141.86 - 25.23x slower +6.77 ms
Day 12, Part 1                      117.62 - 30.42x slower +8.22 ms
Day 4, Part 2                       107.68 - 33.23x slower +9.01 ms
Day 2, Part 1 (with Nx.Defn)         73.81 - 48.48x slower +13.27 ms
Day 11, Part 2                       35.31 - 101.34x slower +28.04 ms
Day 9, Part 2                        17.63 - 202.97x slower +56.44 ms
Day 5, Part 1                        15.82 - 226.21x slower +62.93 ms
Day 7, Part 2                        11.27 - 317.40x slower +88.42 ms
Day 5, Part 2                        10.61 - 337.31x slower +93.98 ms
Day 6, Part 1                        10.09 - 354.49x slower +98.78 ms
Day 7, Part 1                         8.02 - 446.31x slower +124.44 ms
Day 12, Part 2                        2.85 - 1255.19x slower +350.47 ms
```