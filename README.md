
# 基于小波变换的非平稳脉动风时变功率谱估计方法研究
# Wavelet Power Spectrum Analysis

<img width="700" height="525" alt="final2" src="https://github.com/user-attachments/assets/99953385-f057-42a8-b67e-28033583626a" />

本项目使用MATLAB实现论文中关于基于小波的非平稳信号功率谱密度估计（例如，来自结构监测的风压脉动数据）的理论框架。

MATLAB implementation of **non-stationary signal time-varying power spectrum estimation** using Continuous Wavelet Transform (CWT) with Morlet wavelet, compared against traditional FFT-based methods.

This project implements the theoretical framework from research papers on wavelet-based power spectral density estimation for non-stationary signals (e.g., wind pressure pulsation data from structural monitoring).

## Features

- **Continuous Wavelet Transform (CWT)** with Morlet wavelet (`morl`)
- **Custom Morlet wavelet integral** computation for normalization (`morlet_integral_correct.m`)
- **Wavelet power spectrum estimation** via scale-frequency mapping and edge correction (`Edge.m`)
- **FFT vs. Wavelet comparison** on log-log scale for power spectral density
- **3D time-frequency energy spectrum** visualization (evolution spectrum / scalogram)
- **Non-stationary signal analysis** on real measured wind pressure data

## Key Algorithms

| Module | Description |
|--------|-------------|
| `wavelet.m` | Main pipeline: CWT → power spectrum → FFT comparison plot |
| `signal_power_spectrum.m` | Integrate energy density across frequency at each scale |
| `abs_psi_squared.m` | Compute Morlet wavelet normalization factor |
| `morlet_integral_correct.m` | Full-frequency-domain Morlet integral for edge correction |
| `Edge.m` | Edge correction coefficient for power spectrum estimation |
| `FFT_power.m` | Traditional FFT power spectrum baseline |
| `org.m` | 3D evolution spectrum (time-frequency mesh plot) |

## Requirements

- MATLAB R2018b or later
- Wavelet Toolbox (`cwt`, `scal2frq`, `cmorwavf`)

## Usage

```matlab
% Place data.xlsx in the data/ folder, then from src/:
cd src
wavelet    % Run main CWT power spectrum analysis
org        % Run 3D evolution spectrum visualization
```

### Data Format

`data/data.xlsx` — single-column time series of measured signal samples (wind pressure pulsation), sampled at **10 Hz**.

## References

### Primary Reference

> 周广东, 丁幼亮, 李爱群, 孙鹏. 基于小波变换的非平稳脉动风时变功率谱估计方法研究[J]. 工程力学, 2013, 30(3): 89-97.

This project implements the theoretical framework proposed in the above paper, including Morlet wavelet normalization, scale-to-frequency mapping, and edge correction for non-stationary wind pressure pulsation power spectrum estimation.

BibTeX:

```bibtex
@article{周广东2013基于小波变换的非平稳脉动风时变功率谱估计方法研究,
  title={基于小波变换的非平稳脉动风时变功率谱估计方法研究},
  author={周广东 and 丁幼亮 and 李爱群 and 孙鹏},
  journal={工程力学},
  volume={30},
  number={3},
  pages={89--97},
  year={2013},
  publisher={《 工程力学》 杂志社}
}
```

### Additional References

PDF copies are included in `docs/references/`:

- 周广东等 — 基于小波变换的非平稳脉动风时变功率谱估计方法研究
- 结构健康监测相关实测强风演变功率谱文献

## Project Background

Freelance project — Signal processing / Structural engineering application. Implements a non-trivial theoretical framework involving Morlet wavelet normalization, scale-to-frequency mapping, and edge correction for accurate power spectrum estimation of non-stationary signals where FFT fails to capture time-varying spectral characteristics.
