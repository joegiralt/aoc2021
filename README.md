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
Day 6, Part 2                      3617.91        0.28 ms    ±24.96%        0.27 ms        0.32 ms
Day 8, Part 1                      2439.10        0.41 ms     ±4.81%        0.41 ms        0.50 ms
Day 1, Part 1                      2209.29        0.45 ms     ±9.18%        0.45 ms        0.67 ms
Day 1, Part 2                      1382.38        0.72 ms     ±7.05%        0.71 ms        0.94 ms
Day 10, Part 1                     1277.13        0.78 ms    ±13.40%        0.77 ms        1.22 ms
Day 10, Part 2                     1124.85        0.89 ms    ±41.15%        0.82 ms        2.95 ms
Day 13, Part 1                      846.50        1.18 ms     ±3.24%        1.17 ms        1.35 ms
Day 13, Part 2                      536.84        1.86 ms     ±3.62%        1.85 ms        2.10 ms
Day 3, Part 1                       422.90        2.36 ms     ±7.17%        2.27 ms        2.69 ms
Day 3, Part 2                       350.48        2.85 ms     ±6.60%        2.74 ms        3.23 ms
Day 9, Part 1                       239.13        4.18 ms     ±4.82%        4.15 ms        5.19 ms
Day 8, Part 2                       222.38        4.50 ms    ±10.07%        4.49 ms        5.55 ms
Day 2, Part 2                       173.91        5.75 ms     ±2.59%        5.71 ms        6.22 ms
Day 2, Part 1 (with Nx)             173.76        5.76 ms     ±3.99%        5.66 ms        6.33 ms
Day 2, Part 1                       170.01        5.88 ms     ±6.36%        5.83 ms        7.69 ms
Day 4, Part 1                       154.39        6.48 ms     ±5.72%        6.53 ms        7.99 ms
Day 11, Part 1                      139.93        7.15 ms     ±2.18%        7.16 ms        7.43 ms
Day 12, Part 1                      118.06        8.47 ms     ±1.69%        8.53 ms        8.68 ms
Day 4, Part 2                       108.37        9.23 ms     ±2.49%        9.27 ms        9.69 ms
Day 2, Part 1 (with Nx.Defn)         78.17       12.79 ms     ±1.85%       12.80 ms       13.25 ms
Day 11, Part 2                       34.78       28.76 ms     ±2.31%       28.37 ms       29.65 ms
Day 9, Part 2                        17.74       56.37 ms     ±4.05%       56.71 ms       58.74 ms
Day 5, Part 1                        16.34       61.22 ms     ±1.92%       61.26 ms       62.61 ms
Day 7, Part 2                        11.56       86.50 ms     ±0.98%       86.06 ms       87.47 ms
Day 5, Part 2                        11.53       86.76 ms     ±5.60%       87.37 ms       91.28 ms
Day 6, Part 1                        10.43       95.92 ms     ±2.27%       96.60 ms       97.67 ms
Day 7, Part 1                         8.20      121.94 ms    ±16.07%      121.94 ms      135.79 ms
Day 12, Part 2                        3.98      251.47 ms     ±0.00%      251.47 ms      251.47 ms

Comparison: 
Day 6, Part 2                      3617.91
Day 8, Part 1                      2439.10 - 1.48x slower +0.134 ms
Day 1, Part 1                      2209.29 - 1.64x slower +0.176 ms
Day 1, Part 2                      1382.38 - 2.62x slower +0.45 ms
Day 10, Part 1                     1277.13 - 2.83x slower +0.51 ms
Day 10, Part 2                     1124.85 - 3.22x slower +0.61 ms
Day 13, Part 1                      846.50 - 4.27x slower +0.90 ms
Day 13, Part 2                      536.84 - 6.74x slower +1.59 ms
Day 3, Part 1                       422.90 - 8.56x slower +2.09 ms
Day 3, Part 2                       350.48 - 10.32x slower +2.58 ms
Day 9, Part 1                       239.13 - 15.13x slower +3.91 ms
Day 8, Part 2                       222.38 - 16.27x slower +4.22 ms
Day 2, Part 2                       173.91 - 20.80x slower +5.47 ms
Day 2, Part 1 (with Nx)             173.76 - 20.82x slower +5.48 ms
Day 2, Part 1                       170.01 - 21.28x slower +5.61 ms
Day 4, Part 1                       154.39 - 23.43x slower +6.20 ms
Day 11, Part 1                      139.93 - 25.85x slower +6.87 ms
Day 12, Part 1                      118.06 - 30.65x slower +8.19 ms
Day 4, Part 2                       108.37 - 33.38x slower +8.95 ms
Day 2, Part 1 (with Nx.Defn)         78.17 - 46.28x slower +12.52 ms
Day 11, Part 2                       34.78 - 104.04x slower +28.48 ms
Day 9, Part 2                        17.74 - 203.93x slower +56.09 ms
Day 5, Part 1                        16.34 - 221.48x slower +60.94 ms
Day 7, Part 2                        11.56 - 312.94x slower +86.22 ms
Day 5, Part 2                        11.53 - 313.88x slower +86.48 ms
Day 6, Part 1                        10.43 - 347.02x slower +95.64 ms
Day 7, Part 1                         8.20 - 441.16x slower +121.66 ms
Day 12, Part 2                        3.98 - 909.81x slower +251.20 ms
```