------------------------
GENERAL INFORMATION
-------------------

1. In this README file, we describe the cleaned species-specific aboveground biomass data, as well as the final data set used for the analysis for the following paper: Mayr et al. ([date]) [Title].

2. Author Information

   Corresponding Author Contact Information:
   
      Name: Julia Mayr
      Institution: Ecology and Biodiversity Group, Utrecht University  
      Address: [Your Address]  
      Email: j.mayr@uu.nl 

   Principal Investigator Contact Information:

      Name: Kathryn E. Barry
      Institution: Ecology and Biodiversity Group, Utrecht University  
      Address: [Your Address]  
      Email: k.e.barry@uu.nl  

      Name: Yann Hautier
      Institution: Ecology and Biodiversity Group, Utrecht University  
      Address: [Your Address]  
      Email: y.hautier@uu.nl 

3. Date of data collection:  
   - For `sp_AGBiomass_2018_2022.csv`: June–September from 2018 to 2022  
   - For `scaling_data.csv`: Simulation-generated (no physical collection date)

4. Geographic location of data collection:  
   - `sp_AGBiomass_2018_2022.csv`: UU BioCliVE platform  
   - `scaling_data.csv`: Simulated data (no physical location)

---------------------------------------------------------------------------
DATA-SPECIFIC INFORMATION FOR: sp_AGBiomass_2018_2022.csv
------------------------------------------------------------

1. Number of variables: 9  
2. Number of cases/rows: [Insert number of rows]  

3. Description:  
   Above-ground biomass data collected annually during the summer months (June–September) in the BioCliVE experiment. Sampling occurred during peak standing biomass and involved clipping, sorting by species, and drying.

4. Variable List

   A. Name: plot  
      Description: The plot number (1 to 88) where biomass was collected  
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
      Type: character (DD.MM.YYYY)  

   F. Name: div  
      Description: Sown species richness  
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
      Method: Clipping middle 50×50 cm subplot (25×50 in 2021), sorting to species, oven-drying at 70°C for 48 hours

----------------------------------------------------
DATA-SPECIFIC INFORMATION FOR: scaling_data.csv
----------------------------------------------------

1. Number of variables: 9  
2. Number of cases/rows: [Insert number of rows]

3. Description:  
   Simulation-based dataset generated to explore how biodiversity–stability relationships scale from the subplot to the landscape level. Landscapes are constructed by aggregating subplots with varying richness and species compositions (beta diversity).

4. Variable List

   A. Name: Area  
      Description: Number of aggregated subplots representing the spatial extent  
      Type: integer (1 to 8)  

   B. Name: div  
      Description: Sown species richness  
      Type: integer  

   C. Name: Intended_BetaDiv  
      Description: Number of unique species compositions per landscape (intended beta diversity)  
      Type: integer  

   D. Name: Alpha_stab  
      Description: Mean temporal stability at the subplot (community) level  
      Type: numeric  
      Calculation: Sum of subplot SDs / mean  

   E. Name: Gamma_stab  
      Description: Temporal stability of total biomass at the landscape level  
      Type: numeric  
      Calculation: Landscape-wide SD / mean  

   F. Name: Spatial_AS  
      Description: Spatial asynchrony across subplots  
      Type: numeric  
      Calculation: Gamma_stab / Alpha_stab  

   G. Name: avg_richness  
      Description: Realized average species richness at subplot level  
      Type: numeric  

   H. Name: Beta_div  
      Description: Realized beta diversity  
      Type: numeric  
      Calculation: Gamma_div / avg_richness  

   I. Name: Gamma_div  
      Description: Realized total species richness at the landscape scale  
      Type: numeric  
      Calculation: avg_richness × Beta_div

[...]
