------------------------
GENERAL INFORMATION
-------------------

1. In this README file, we describe the cleaned species-specific aboveground biomass data, as well as the final data set used for the analysis for the following paper: Mayr et al. ([date]) [Title].

2. Author Information

   Corresponding Author Contact Information:
   
      Name: Julia Mayr
      Institution: Ecology and Biodiversity Group, Utrecht University  
      Address: Padualaan 8, 3584 CH Utrecht, The Netherlands
      Email: j.mayr@uu.nl 

   Principal Investigator Contact Information:

      Name: Kathryn E. Barry
      Institution: Ecology and Biodiversity Group, Utrecht University  
      Address: Padualaan 8, 3584 CH Utrecht, The Netherlands
      Email: k.e.barry@uu.nl  

      Name: Yann Hautier
      Institution: Ecology and Biodiversity Group, Utrecht University  
      Address: Padualaan 8, 3584 CH Utrecht, The Netherlands 
      Email: y.hautier@uu.nl 

3. Date of data collection:  
   - For `sp_AGBiomass_2018_2022.csv`: June–September from 2018 to 2022  
   - For `scaling_data.csv`: Simulation-generated (no physical collection date)

4. Geographic location of data collection:  
   - `sp_AGBiomass_2018_2022.csv`: UU BioCliVE platform  
   - `scaling_data.csv`: Simulated data (no physical location)

---------------------------------------------------------------------------
DATA-SPECIFIC INFORMATION FOR: sp_AGBiomass_2018_2022.csv
---------------------------------------------------------------------------

1. Number of variables: 9  
2. Number of rows: 9912 

3. Description:  
   Above-ground biomass data collected annually during the summer months (June–September) in the BioCliVE experiment. Sampling occurred during peak standing biomass and involved clipping, sorting by species, and drying.

4. Variable List

   A. Name: plot  
      Description: Plot number where biomass was collected (1 to 88)  
      Type: integer  

   B. Name: subplot  
      Description: Subplot within each plot (A, B, C, or D)  
      Type: character  

   C. Name: block  
      Description: Experimental block (1 or 2); each block contains 44 plots  
      Type: integer  

   D. Name: year  
      Description: Year of data collection (2018–2022)  
      Type: integer  

   E. Name: date  
      Description: Exact clipping date  
      Type: character (format: DD.MM.YYYY)  

   F. Name: div  
      Description: Planted species richness  
      Type: integer  

   G. Name: species  
      Description: Species code  
      Type: character  

   H. Name: species name  
      Description: Scientific name of the species  
      Type: character  

   I. Name: Ag_biomass  
      Description: Dried above-ground biomass per species  
      Type: numeric  
      Units: grams per square meter (g/m²)  
      Method: Clipping middle 50×50 cm subplot (25×50 cm in 2021 and 2022), sorting by species, oven-drying at 70°C for 48 hours

--------------------------------------------------------------
DATA-SPECIFIC INFORMATION FOR: scaling_data.RData
--------------------------------------------------

**Important Note:**  
Because this dataset is based on simulated data, the exact values may vary slightly from those presented in the manuscript. These differences are due to variation in simulation outputs across runs.
Note also that the number of rows in the final analysis is reduced due to the removal of outliers.

1. Number of variables: 16 (the 7 variables relevant for the analysis are described below)  
2. Number of rows: 12694

3. Description:  
   Simulation-based dataset generated to explore how biodiversity–stability relationships scale across spatial extents. Landscapes are constructed by aggregating subplots with varying species compositions.  
   This dataset includes 16 variables, of which 7 were central to the analyses presented in the manuscript. Additional variables are retained for transparency and reproducibility of calculations during simulation.  
   *Note: Exact values may differ slightly from those in the manuscript due to simulation variability. The number of rows was further reduced during analysis by removing outliers.*

4. Variable List

   A. Name: Area  
      Description: Number of aggregated subplots representing the spatial extent  
      Type: integer (1 to 8)  

   B. Name: div  
      Description: planted species richness  
      Type: integer  

   C. Name: Alpha_stab  
      Description: Mean temporal stability at the subplot (community) level (alpha stability)
      Type: numeric  
      Calculation: average inverse temporal coefficient of variation (μ / σ) across all subplots within a landscape   
   
   D. Name: Gamma_stab  
      Description: Temporal stability of total biomass at the landscape level  
      Type: numeric  
      Calculation: Landscape-wide inverse temporal coefficient of variation (μ / σ)
      
   E. Name: Spatial_AS  
      Description: Spatial asynchrony across subplots  
      Type: numeric  
      Calculation: Alpha_stab / Gamma_stab (equivalent to the inverse of community-level spatial synchrony, 1 / φ_C_L2R; see `var.partition()` function, Wang et al. 2019, *Ecography*)
      
   F. Name: Beta_div  
      Description: Realized richness-based beta diversity  
      Type: numeric  
      Calculation: Gamma_div / avg_richness (see `var.partition()` function, Wang et al. 2019, *Ecography*)
   
   G. Name: Intended_BetaDiv  
      Description: Number of unique species compositions per landscape based on the planted species composition (intended beta diversity)  
      Type: integer (1 to 8)
