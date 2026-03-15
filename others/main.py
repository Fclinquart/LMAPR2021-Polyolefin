import plots

polyolefin_uses = {
    'Packaging': 55,
    'Building & construction': 12,
    'Consumer & household': 11,
    'Automotive': 8,
    'Agriculture': 5,
    'Other industrial/medical': 9
}

crude_fractions = {
    'Liquefied gases (C1-C4)': 2,      # Methane to butane - LPG fuel
    'Light naphtha': 8,                # C5-C6 - **Ethylene cracker feed**
    'Heavy naphtha': 12,               # C7-C12 - **Main polyolefin source**
    'Gasoline': 20,                    # C5-C12 - Car fuel  
    'Kerosene': 12,                    # C10-C16 - Jet fuel
    'Diesel/Gas oil': 25,              # C15-C25 - Truck fuel, cracker feed
    'Residuum (heavy)': 21             # >C25 - Asphalt, fuel oil
}



# Version verticale
plots.barchart(
    data      = crude_fractions,
    ylabel    = 'Crude oil fractions (%)',
    value_fmt = '{:.0f}%',
    filename  = 'Figures/4_crude_oil.pdf',
)
