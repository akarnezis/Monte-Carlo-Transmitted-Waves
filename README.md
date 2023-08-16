# Monte-Carlo-Transmitted-Waves

*A Julia repo designed to replicate and validate wave scattering from a plate filled with randomly distributed particles. The code allows you to explore the effects of different parameters such as scatterer type, volume fraction, and frequency on wave scattering behavior.*

## Instructions

1. Clone or download this repository to your local machine.

2. Make sure you have Julia v1.6.7 or later, installed on your system.

3. Open your preferred Julia environment (REPL or Jupyter Notebook).

4. Navigate to the downloaded code directory within Julia.

5. Import the necessary packages provided by packages.jl.

6. To load the data, modify the code's parameters using the provided flags:

    - `is_sound_soft`: Set to `true` for sound-soft scatterers, and `false` for hard scatterers.
    - `is_low_volfrac`: Set to `true` for 5% volume fraction, and `false` for 25% volume fraction.
    - `is_low_freq`: Set to `true` for low frequency ka = 0.04, and `false` for frequenc ka = 0.36 or ka = 0.62.
    - `is_two_wavenumbers`: Set to `true` for two wavenumbers, and `false` for three wavenumbers.

8. Run the code. The simulation will load the appropriate dataset based on your selected parameters and display the results.

## Code Explanation

- The code starts by setting several flags that control the simulation parameters: `is_sound_soft`, `is_low_volfrac`, `is_low_freq`, and `is_two_wavenumbers`.

- Based on the flag values, the code loads pre-generated simulation data. For example, if `is_sound_soft` is `true`, the code checks all the other flags to determine the appropriate dataset to load based on different scenarios.
