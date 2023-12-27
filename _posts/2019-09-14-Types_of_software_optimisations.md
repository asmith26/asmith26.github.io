---
title: "Types of software optimisations"
date: 2019-09-14T11:56:41.960+0000
#last_modified_at: 2020-01-19T20:51:50.943+0000
categories: [Computer Science,Optimisation]
tags: ["programming","computer-science","optimisation","software-development","performance"]
---

### **CPU Bound**
- Better data structures (searching) and algorithms (sorting)
- Minimisation of in-loop tasks, parallelisation
- Better compilation/low-level optimisations
  - Move closer to hardware (NumPy/C, Numba, Cython)
  - Faster hardware (GPU, TPU)

### **I/O Bound**
- I/O (disk, network, etc. ) access optimisation
  - File formats ( .parquet for tabular, .zarr for arrays)
- Compression (when over network)
- Parallelisation

### **Memory Bound**
- Memory access optimisations, caches
  - [`functools.lru_cache`](https://docs.python.org/3/library/functools.html#functools.lru_cache) (Least Recently Used; more generally: [https://en.wikipedia.org/wiki/Cache_replacement_policies](https://en.wikipedia.org/wiki/Cache_replacement_policies) )
  - [`functools.cached_property`](https://docs.python.org/3/library/functools.html#functools.cached_property)
- Compression
  - dtypes, removing irrelevant columns in tabular data

### **Programmer Bound**
- Code readability, styles, etc.
- Use of libraries
- Parallelisation (teamwork)

Profiling: For an accurate measurement, the benchmark should be designed to have a long enough execution time (in the order of seconds) so that the setup and tear-down of the process is small compared to the execution time of the application.

Jeff Dean Tips: [https://static.googleusercontent.com/media/research.google.com/en/us/people/jeff/stanford-295-talk.pdf](https://static.googleusercontent.com/media/research.google.com/en/us/people/jeff/stanford-295-talk.pdf)
