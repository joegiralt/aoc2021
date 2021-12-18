# Aoc2021

Advent of  code 

# Benchmarks
```txt
CPU Information: Apple M1 Max
Number of Available Cores: 10
Available memory: 64 GB
Elixir 1.13.1
Erlang 24.2

Benchmark suite executing with the following configuration:
warmup: 200 ms
time: 200 ms
memory time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 12.80 s

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
Benchmarking Day 14, Part 1...
Benchmarking Day 14, Part 2...
Benchmarking Day 15, Part 1...
Benchmarking Day 15, Part 2...
#Graph<type: directed, num_vertices: 249993, num_edges: 997944>
#Graph<type: directed, num_vertices: 249993, num_edges: 997944>
Benchmarking Day 16, Part 1...
Benchmarking Day 16, Part 2...
Benchmarking Day 2, Part 1...
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

Name                     ips        average  deviation         median         99th %
Day 6, Part 1        6376.12       0.157 ms    ±16.53%       0.152 ms        0.31 ms
Day 16, Part 2       3490.41        0.29 ms    ±13.75%        0.28 ms        0.34 ms
Day 16, Part 1       3483.64        0.29 ms    ±10.58%        0.28 ms        0.35 ms
Day 6, Part 2        3385.26        0.30 ms     ±4.56%        0.30 ms        0.33 ms
Day 1, Part 1        2430.29        0.41 ms     ±4.89%        0.41 ms        0.45 ms
Day 8, Part 1        2301.65        0.43 ms    ±21.11%        0.42 ms        1.04 ms
Day 14, Part 1       1697.63        0.59 ms    ±29.45%        0.57 ms        0.83 ms
Day 1, Part 2        1473.33        0.68 ms     ±2.55%        0.67 ms        0.72 ms
Day 10, Part 1       1321.04        0.76 ms     ±8.88%        0.76 ms        0.95 ms
Day 10, Part 2       1257.92        0.79 ms     ±7.51%        0.79 ms        0.94 ms
Day 13, Part 1        886.12        1.13 ms     ±2.11%        1.13 ms        1.26 ms
Day 13, Part 2        573.58        1.74 ms     ±2.40%        1.73 ms        1.94 ms
Day 14, Part 2        464.75        2.15 ms     ±2.57%        2.14 ms        2.44 ms
Day 3, Part 1         421.85        2.37 ms    ±10.66%        2.24 ms        4.04 ms
Day 3, Part 2         347.56        2.88 ms     ±6.60%        2.81 ms        3.29 ms
Day 9, Part 1         236.54        4.23 ms     ±7.33%        4.16 ms        5.52 ms
Day 8, Part 2         227.26        4.40 ms     ±8.16%        4.39 ms        5.07 ms
Day 2, Part 1         179.58        5.57 ms     ±1.21%        5.60 ms        5.64 ms
Day 2, Part 2         179.29        5.58 ms     ±2.97%        5.53 ms        6.53 ms
Day 4, Part 1         163.67        6.11 ms     ±4.16%        6.08 ms        7.46 ms
Day 11, Part 1        142.14        7.04 ms     ±2.70%        7.00 ms        7.61 ms
Day 12, Part 1        117.91        8.48 ms     ±1.61%        8.50 ms        8.83 ms
Day 4, Part 2         108.22        9.24 ms     ±3.39%        9.15 ms       10.04 ms
Day 11, Part 2         35.64       28.06 ms     ±2.11%       27.88 ms       29.46 ms
Day 9, Part 2          17.94       55.75 ms     ±4.08%       55.94 ms       57.74 ms
Day 5, Part 1          16.44       60.82 ms     ±3.96%       61.40 ms       63.00 ms
Day 7, Part 2          11.56       86.51 ms     ±0.38%       86.36 ms       86.88 ms
Day 5, Part 2          10.91       91.64 ms     ±4.25%       91.78 ms       95.46 ms
Day 7, Part 1           8.13      123.05 ms    ±16.48%      123.05 ms      137.39 ms
Day 15, Part 1          6.08      164.43 ms     ±5.80%      164.43 ms      171.18 ms
Day 12, Part 2          3.99      250.34 ms     ±0.00%      250.34 ms      250.34 ms
Day 15, Part 2         0.117     8519.41 ms     ±0.00%     8519.41 ms     8519.41 ms

Comparison: 
Day 6, Part 1        6376.12
Day 16, Part 2       3490.41 - 1.83x slower +0.130 ms
Day 16, Part 1       3483.64 - 1.83x slower +0.130 ms
Day 6, Part 2        3385.26 - 1.88x slower +0.139 ms
Day 1, Part 1        2430.29 - 2.62x slower +0.25 ms
Day 8, Part 1        2301.65 - 2.77x slower +0.28 ms
Day 14, Part 1       1697.63 - 3.76x slower +0.43 ms
Day 1, Part 2        1473.33 - 4.33x slower +0.52 ms
Day 10, Part 1       1321.04 - 4.83x slower +0.60 ms
Day 10, Part 2       1257.92 - 5.07x slower +0.64 ms
Day 13, Part 1        886.12 - 7.20x slower +0.97 ms
Day 13, Part 2        573.58 - 11.12x slower +1.59 ms
Day 14, Part 2        464.75 - 13.72x slower +1.99 ms
Day 3, Part 1         421.85 - 15.11x slower +2.21 ms
Day 3, Part 2         347.56 - 18.35x slower +2.72 ms
Day 9, Part 1         236.54 - 26.96x slower +4.07 ms
Day 8, Part 2         227.26 - 28.06x slower +4.24 ms
Day 2, Part 1         179.58 - 35.51x slower +5.41 ms
Day 2, Part 2         179.29 - 35.56x slower +5.42 ms
Day 4, Part 1         163.67 - 38.96x slower +5.95 ms
Day 11, Part 1        142.14 - 44.86x slower +6.88 ms
Day 12, Part 1        117.91 - 54.08x slower +8.32 ms
Day 4, Part 2         108.22 - 58.92x slower +9.08 ms
Day 11, Part 2         35.64 - 178.89x slower +27.90 ms
Day 9, Part 2          17.94 - 355.49x slower +55.60 ms
Day 5, Part 1          16.44 - 387.81x slower +60.67 ms
Day 7, Part 2          11.56 - 551.57x slower +86.35 ms
Day 5, Part 2          10.91 - 584.30x slower +91.48 ms
Day 7, Part 1           8.13 - 784.58x slower +122.89 ms
Day 15, Part 1          6.08 - 1048.44x slower +164.28 ms
Day 12, Part 2          3.99 - 1596.22x slower +250.19 ms
Day 15, Part 2         0.117 - 54320.80x slower +8519.25 ms
```