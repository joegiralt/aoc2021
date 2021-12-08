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
Estimated total run time: 3.78 s

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
Benchmarking Day 8, Part 1...
Benchmarking Day 8, Part 2...

Name                                   ips        average  deviation         median         99th %
Day 6, Part 2                      3363.04        0.30 ms    ±10.37%        0.29 ms        0.41 ms
Day 1, Part 1                      2348.62        0.43 ms    ±26.80%        0.41 ms        0.80 ms
Day 1, Part 2                      1401.29        0.71 ms    ±25.47%        0.68 ms        2.08 ms
Day 3, Part 1                       401.03        2.49 ms     ±8.45%        2.40 ms        3.06 ms
Day 3, Part 2                       339.09        2.95 ms     ±7.79%        2.84 ms        3.41 ms
Day 2, Part 1                       184.81        5.41 ms     ±1.03%        5.39 ms        5.58 ms
Day 2, Part 2                       182.56        5.48 ms     ±5.03%        5.42 ms        6.60 ms
Day 2, Part 1 (with Nx)             179.21        5.58 ms     ±5.36%        5.51 ms        6.77 ms
Day 4, Part 1                       162.52        6.15 ms     ±1.16%        6.15 ms        6.27 ms
Day 4, Part 2                       105.36        9.49 ms     ±2.53%        9.58 ms        9.82 ms
Day 2, Part 1 (with Nx.Defn)         80.70       12.39 ms     ±0.65%       12.42 ms       12.50 ms
Day 5, Part 1                        15.17       65.92 ms     ±1.12%       65.92 ms       66.44 ms
Day 8, Part 2                        11.23       89.05 ms     ±0.89%       89.05 ms       89.61 ms
Day 7, Part 2                        11.02       90.75 ms     ±0.24%       90.75 ms       90.90 ms
Day 5, Part 2                        11.01       90.83 ms     ±1.48%       90.83 ms       91.78 ms
Day 6, Part 1                        10.52       95.03 ms     ±1.14%       95.03 ms       95.79 ms
Day 7, Part 1                         9.04      110.57 ms     ±0.00%      110.57 ms      110.57 ms
Day 8, Part 1                         8.98      111.39 ms     ±0.00%      111.39 ms      111.39 ms

Comparison: 
Day 6, Part 2                      3363.04
Day 1, Part 1                      2348.62 - 1.43x slower +0.128 ms
Day 1, Part 2                      1401.29 - 2.40x slower +0.42 ms
Day 3, Part 1                       401.03 - 8.39x slower +2.20 ms
Day 3, Part 2                       339.09 - 9.92x slower +2.65 ms
Day 2, Part 1                       184.81 - 18.20x slower +5.11 ms
Day 2, Part 2                       182.56 - 18.42x slower +5.18 ms
Day 2, Part 1 (with Nx)             179.21 - 18.77x slower +5.28 ms
Day 4, Part 1                       162.52 - 20.69x slower +5.86 ms
Day 4, Part 2                       105.36 - 31.92x slower +9.19 ms
Day 2, Part 1 (with Nx.Defn)         80.70 - 41.67x slower +12.09 ms
Day 5, Part 1                        15.17 - 221.68x slower +65.62 ms
Day 8, Part 2                        11.23 - 299.48x slower +88.75 ms
Day 7, Part 2                        11.02 - 305.19x slower +90.45 ms
Day 5, Part 2                        11.01 - 305.47x slower +90.53 ms
Day 6, Part 1                        10.52 - 319.58x slower +94.73 ms
Day 7, Part 1                         9.04 - 371.87x slower +110.28 ms
Day 8, Part 1                         8.98 - 374.60x slower +111.09 ms

Memory usage statistics:

Name                                 average  deviation         median         99th %
Day 6, Part 2                        0.46 MB     ±0.00%        0.46 MB        0.46 MB
Day 1, Part 1                        0.42 MB     ±0.00%        0.42 MB        0.42 MB
Day 1, Part 2                        0.91 MB     ±0.00%        0.91 MB        0.91 MB
Day 3, Part 1                        3.17 MB     ±0.00%        3.17 MB        3.17 MB
Day 3, Part 2                        6.46 MB     ±0.00%        6.46 MB        6.46 MB
Day 2, Part 1                        0.36 MB     ±0.00%        0.36 MB        0.36 MB
Day 2, Part 2                        0.45 MB     ±0.00%        0.45 MB        0.45 MB
Day 2, Part 1 (with Nx)              0.63 MB     ±0.00%        0.63 MB        0.63 MB
Day 4, Part 1                        7.55 MB     ±0.00%        7.55 MB        7.55 MB
Day 4, Part 2                        1.59 MB     ±0.57%        1.59 MB        1.61 MB
Day 2, Part 1 (with Nx.Defn)        13.33 MB     ±0.00%       13.33 MB       13.33 MB
Day 5, Part 1                       57.63 MB     ±1.11%       57.63 MB       58.08 MB
Day 8, Part 2                      163.63 MB     ±0.00%      163.63 MB      163.63 MB
Day 7, Part 2                      163.63 MB     ±0.00%      163.63 MB      163.63 MB
Day 5, Part 2                       95.45 MB     ±2.41%       95.45 MB       97.07 MB
Day 6, Part 1                       66.15 MB     ±0.00%       66.15 MB       66.15 MB
Day 7, Part 1                      236.70 MB     ±0.00%      236.70 MB      236.70 MB
Day 8, Part 1                      236.70 MB     ±0.00%      236.70 MB      236.70 MB

Comparison: 
Day 6, Part 2                        0.46 MB
Day 1, Part 1                        0.42 MB - 0.91x memory usage -0.04100 MB
Day 1, Part 2                        0.91 MB - 1.99x memory usage +0.45 MB
Day 3, Part 1                        3.17 MB - 6.94x memory usage +2.71 MB
Day 3, Part 2                        6.46 MB - 14.14x memory usage +6.01 MB
Day 2, Part 1                        0.36 MB - 0.78x memory usage -0.09866 MB
Day 2, Part 2                        0.45 MB - 0.98x memory usage -0.01096 MB
Day 2, Part 1 (with Nx)              0.63 MB - 1.37x memory usage +0.169 MB
Day 4, Part 1                        7.55 MB - 16.52x memory usage +7.09 MB
Day 4, Part 2                        1.59 MB - 3.49x memory usage +1.14 MB
Day 2, Part 1 (with Nx.Defn)        13.33 MB - 29.15x memory usage +12.87 MB
Day 5, Part 1                       57.63 MB - 126.03x memory usage +57.17 MB
Day 8, Part 2                      163.63 MB - 357.83x memory usage +163.17 MB
Day 7, Part 2                      163.63 MB - 357.82x memory usage +163.17 MB
Day 5, Part 2                       95.45 MB - 208.73x memory usage +94.99 MB
Day 6, Part 1                       66.15 MB - 144.66x memory usage +65.70 MB
Day 7, Part 1                      236.70 MB - 517.63x memory usage +236.25 MB
Day 8, Part 1                      236.70 MB - 517.63x memory usage +236.25 MB
```