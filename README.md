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
warmup: 10 ms
time: 100 ms
memory time: 100 ms
parallel: 1
inputs: none specified
Estimated total run time: 3.36 s

Benchmarking Day 1, Part 1...
Benchmarking Day 1, Part 2...
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

Name                                   ips        average  deviation         median         99th %
Day 6, Part 2                      3293.37        0.30 ms    ±28.45%        0.29 ms        0.85 ms
Day 1, Part 1                      2142.60        0.47 ms    ±58.35%        0.41 ms        2.24 ms
Day 1, Part 2                      1421.56        0.70 ms    ±13.95%        0.68 ms        1.34 ms
Day 3, Part 1                       417.25        2.40 ms     ±8.81%        2.30 ms        3.19 ms
Day 3, Part 2                       348.10        2.87 ms     ±7.16%        2.77 ms        3.34 ms
Day 2, Part 2                       184.46        5.42 ms     ±1.05%        5.41 ms        5.54 ms
Day 2, Part 1                       180.41        5.54 ms     ±5.65%        5.45 ms        6.74 ms
Day 2, Part 1 (with Nx)             178.76        5.59 ms     ±3.27%        5.51 ms        6.11 ms
Day 4, Part 1                       161.11        6.21 ms     ±4.49%        6.15 ms        7.24 ms
Day 4, Part 2                       105.01        9.52 ms     ±3.04%        9.50 ms       10.06 ms
Day 2, Part 1 (with Nx.Defn)         79.99       12.50 ms     ±0.72%       12.48 ms       12.62 ms
Day 5, Part 1                        15.71       63.66 ms     ±0.60%       63.66 ms       63.92 ms
Day 7, Part 2                        11.51       86.91 ms     ±1.06%       86.91 ms       87.57 ms
Day 5, Part 2                        11.07       90.31 ms     ±2.98%       90.31 ms       92.21 ms
Day 6, Part 1                         9.92      100.85 ms     ±4.80%      100.85 ms      104.28 ms
Day 7, Part 1                         9.15      109.33 ms     ±0.00%      109.33 ms      109.33 ms

Comparison: 
Day 6, Part 2                      3293.37
Day 1, Part 1                      2142.60 - 1.54x slower +0.163 ms
Day 1, Part 2                      1421.56 - 2.32x slower +0.40 ms
Day 3, Part 1                       417.25 - 7.89x slower +2.09 ms
Day 3, Part 2                       348.10 - 9.46x slower +2.57 ms
Day 2, Part 2                       184.46 - 17.85x slower +5.12 ms
Day 2, Part 1                       180.41 - 18.26x slower +5.24 ms
Day 2, Part 1 (with Nx)             178.76 - 18.42x slower +5.29 ms
Day 4, Part 1                       161.11 - 20.44x slower +5.90 ms
Day 4, Part 2                       105.01 - 31.36x slower +9.22 ms
Day 2, Part 1 (with Nx.Defn)         79.99 - 41.17x slower +12.20 ms
Day 5, Part 1                        15.71 - 209.64x slower +63.35 ms
Day 7, Part 2                        11.51 - 286.24x slower +86.61 ms
Day 5, Part 2                        11.07 - 297.42x slower +90.00 ms
Day 6, Part 1                         9.92 - 332.15x slower +100.55 ms
Day 7, Part 1                         9.15 - 360.05x slower +109.02 ms

Memory usage statistics:

Name                                 average  deviation         median         99th %
Day 6, Part 2                        0.46 MB     ±0.00%        0.46 MB        0.46 MB
Day 1, Part 1                        0.42 MB     ±0.00%        0.42 MB        0.42 MB
Day 1, Part 2                        0.91 MB     ±0.00%        0.91 MB        0.91 MB
Day 3, Part 1                        3.17 MB     ±0.00%        3.17 MB        3.17 MB
Day 3, Part 2                        6.46 MB     ±0.00%        6.46 MB        6.46 MB
Day 2, Part 2                        0.45 MB     ±0.00%        0.45 MB        0.45 MB
Day 2, Part 1                        0.36 MB     ±0.00%        0.36 MB        0.36 MB
Day 2, Part 1 (with Nx)              0.63 MB     ±0.00%        0.63 MB        0.63 MB
Day 4, Part 1                        7.55 MB     ±0.00%        7.55 MB        7.55 MB
Day 4, Part 2                        1.59 MB     ±0.69%        1.59 MB        1.60 MB
Day 2, Part 1 (with Nx.Defn)        13.33 MB     ±0.00%       13.33 MB       13.33 MB
Day 5, Part 1                       56.32 MB     ±0.64%       56.32 MB       56.58 MB
Day 7, Part 2                      163.63 MB     ±0.00%      163.63 MB      163.63 MB
Day 5, Part 2                       94.09 MB     ±2.04%       94.09 MB       95.45 MB
Day 6, Part 1                       66.15 MB     ±0.00%       66.15 MB       66.15 MB
Day 7, Part 1                      236.70 MB     ±0.00%      236.70 MB      236.70 MB

Comparison: 
Day 6, Part 2                        0.46 MB
Day 1, Part 1                        0.42 MB - 0.91x memory usage -0.04100 MB
Day 1, Part 2                        0.91 MB - 1.99x memory usage +0.45 MB
Day 3, Part 1                        3.17 MB - 6.94x memory usage +2.71 MB
Day 3, Part 2                        6.46 MB - 14.14x memory usage +6.01 MB
Day 2, Part 2                        0.45 MB - 0.98x memory usage -0.01096 MB
Day 2, Part 1                        0.36 MB - 0.78x memory usage -0.09866 MB
Day 2, Part 1 (with Nx)              0.63 MB - 1.37x memory usage +0.169 MB
Day 4, Part 1                        7.55 MB - 16.52x memory usage +7.09 MB
Day 4, Part 2                        1.59 MB - 3.48x memory usage +1.13 MB
Day 2, Part 1 (with Nx.Defn)        13.33 MB - 29.15x memory usage +12.87 MB
Day 5, Part 1                       56.32 MB - 123.17x memory usage +55.87 MB
Day 7, Part 2                      163.63 MB - 357.82x memory usage +163.17 MB
Day 5, Part 2                       94.09 MB - 205.75x memory usage +93.63 MB
Day 6, Part 1                       66.15 MB - 144.66x memory usage +65.70 MB
Day 7, Part 1                      236.70 MB - 517.63x memory usage +236.25 MB
```