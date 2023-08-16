using Pkg
Pkg.add("FileIO")
Pkg.add("Plots")

using LinearAlgebra, Statistics
using FileIO, Plots

# Flag settings:
is_sound_soft = true;      # Set to false for sound-hard scatterers
is_low_volfrac = false;     # Set to false for particles occupying 25% of the plate
is_low_freq = false;        # Set to false for frequencies ka = 0.36 and ka = 0.62
is_two_wavenumbers = false; # Set to false to load the case of the three wavenzumbers

MC_data = nothing;

flags = [is_sound_soft, is_low_volfrac, is_low_freq, is_two_wavenumbers]

if all([isa(f, Bool) for f in flags])

    # Handling different scenarios based on flags
    if is_sound_soft 

        if is_low_volfrac

            if is_low_freq

                ka = 0.04;
                ϕ = 0.05;
                filename = "1kp_low_frequency_low_volfrac.jld2"
                MC_data = load(filename)
                println("Loaded data to extract one wavenumber: ka = $ka and φ = $ϕ")

            else 

                println("Dataset for low volume fraction and high frequency is not available.")

            end

        else

            if is_two_wavenumbers

                ka = 0.36;
                ϕ = 0.25;
                filename = "two_wavenumbers.jld2"
                MC_data = load(filename)
                println("Loaded data to exctract two wavenumbers: ka = $ka and φ = $ϕ")

            else

                ka = 0.62;
                ϕ = 0.25;
                filename = "three_wavenumbers.jld2"
                MC_data = load(filename)
                println("Loaded data for three wavenumbers: ka = $ka and φ = $ϕ")

            end

        end

    else
        
        ka = 0.36;
        ϕ = 0.25;
        filename = "1kp_hard_scatterers.jld2"
        MC_data = load(filename)
        println("Loaded data for hard scatterers: ka = $ka and φ = $ϕ")

    end

else

    error("Input for flags must be boolean.")

end

# Extract necessary data from the loaded dictionary
dict = MC_data

x_pos = dict["x_positions"]
average_wave = dict["average_wave"]

plot(x_pos, abs.(average_wave))
