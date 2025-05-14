# Scale-dependent Role of Beta Diversity for Ecosystem Stability

Dear reader,

[...short description...]


## Installation Instructions

To get started with this project, you can either download the folder directly or clone the repository using Git. The project is set up to work with the R programming language and requires certain packages to be installed. Please follow the instructions below to set up your environment:

### 1. Download or Clone the Repository

You can either download the project files directly from GitHub or clone the repository to your local machine.

- **To download**: [Click here to download the ZIP file](<INSERT LINK TO ZIP>)
- **To clone**: use `git clone <https://github.com/JulesMayr/BetaDiv_x_Scale.git>`

To open the project, double click on the BetaDivXScale_Code.Rproj file. This will open the project in RStudio and automatically set the working directory to the correct location, with relative paths properly configured.

### 2. Install Required Packages

This project uses {renv} for package management, ensuring that all dependencies and their specific versions are automatically handled.
Once the project is open in RStudio, install the `renv` package using the `install.packages("renv")` command and then run the following code to install the required packages:

```{r}
# Activate the renv environment
renv::activate()

# Install required packages
renv::restore()
```

This will install all the necessary packages from the renv.lock file and set up the environment with the appropriate versions.

### 3. Install CmdStaR 

This project uses the cmdstanr package for Bayesian modeling via Stan. To install cmdstanr and CmdStan itself, you can follow the instructions available at the official website: <https://mc-stan.org/cmdstanr/articles/cmdstanr.html>.
If you do not have a windows computer, the following commands are often enough:

``` {r}
# Install cmdstanr from CRAN
install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))

# Install CmdStan (this can take several minutes)
cmdstanr::install_cmdstan()
```

## 2. Project Structure

The project directory this Readme is associated with, contains the workflow from the cleaned data, all the way to  the final analyses.
The project structure distinguishes three kinds of folders:
- read-only (RO): not edited by either code or researcher
- human-writeable (HW): edited by the user.
- project-generated (PG): folders generated when running the code; these folders can be deleted or emptied and will be completely reconstituted as the project is run.

```
├── 01_data                        <- all project data
│   ├──01_raw                      <- the original but already cleaned data (RO)
│   ├──02_temporary                <- intermediate data that has been transformed or simulated (PG)
│   └──03_derived                  <- the final data set for the statistical analysis (PG)
├── 02_functions                   <- scripts with custom functions that are called on during the simulations or data analysis (HW)
├── 03_simulations                 <- .Rmd files with the code that simulates the data that is strored in the temporary or derived data folders (HW)
├── 04_bayesian_analysis           <- documentation of the analysis reported in the manuscript (HW/PG)
│   ├── figures                    <- figures for the manuscript (PG)
│   └── models                     <- the final bayesian models produced (PG)
├── 05_Supplementary_Information   <- documnetation producing the supplementary material (HW)
├── BetaDivXScale_Code.Rproj       <- R Project file (open this to work in the correct environment)
├── README.md                      <- project overview and usage guide
├── renv                           <- folder for package management with {renv}
└── renv.lock                      <- lockfile for exact package versions

```

### Detailed Folder Description

#### 01_data

The data folder stores all project data. 

##### 01_raw

This sub-folder contains the two files `species_name.txt` and `species_code.txt` which, together, represent the design of the UU BioCliVE and contain information on the species used in general as well as for each plot. Furthermore, it contains the file `sp_AGBiomass_2018_2022.csv`, which is the cleaned data associated with the BioCliVE platform. 

`sp_AGBiomass_2018_2022.csv`has been collected in the BioCliVE on above-ground biomass for each species since 2018. 
Data was collected every year by students and volunteers in the summer months (June-September), when the plots were estimated to have reached peak standing biomass. 

Variable Information for the data set `sp_AGBiomass_2018_2022.csv`:
| Variable Name  | Description | Method of Collection | Units of Measurement | 
|----------------|-------------|----------------------|----------------------|
| `plot`         | The plot number where the biomass was collected, an integer from 1 to 88 | Study variable         | NA                    | 
| `subplot`      | The subplot where the biomass was collected. There are four subplots per plot, values A, B, C, or D | Study variable         | NA                    |
| `block`        | The block where the plot is located; BioCliVE has two blocks (1 and 2), each with 44 plots | Study variable         | NA                    |
| `year`         | Year in which the data were collected (2018–2021) | Study variable         | NA                    | 
| `date`         | Exact date that biomass was clipped        | NA                    | DD.MM.YYYY             | 
| `div`          | Sown species richness                      | Study variable         | NA                    |
| `species`      | Species code                               | Study variable         | NA                    | 
| `species name` | Scientific species name                    | Study variable         | NA                    | 
| `Ag_biomass`   | Dried above-ground biomass per species     | Clipping middle 50×50 m plot (25×50 in 2021), sorting to species, oven drying at 70°C for 48h | Grams per m² (g/m²) | NA |


##### 02_temporary

This sub-folder contains most project-generated data, which is generated in a stepwise manner by the simulation. From the multiple PG files, we want to highlight one data set in particular, called `sim_data_11sp`. This is the data set that was used as a starting point for the simulations. It is essentially a subset of the cleaned data in wide format, so that the biomass for each species is clearly recognizable for every plot, subplot and year. In addition, it contains a column with a species composition code for every subplot, for which the sown species were used. This variable was integral to how the simulations were run, as the species composition code was used to aggregate the subplots.

##### 03_derived

This sub-folder contains the final data set used for the statistical analysis, which we call `scaling_data`. It was stored in a separate sub-folder to clearly separate it from any other data that was generated.

Variable Information for data set `scaling_data`:
| Variable Name     | Description | Method of Collection | Calculation |
|-------------------|-------------|----------------------|-------------|
| `Area`            | The spatial extent of the simulated landscape | Simulation | A numeric integer between 1 and 8, representing the sum of aggregated subplots |
| `div`             | Sown species richness | Study variable | NA |
| `Intended_BetaDiv`| Conceptual measure of Beta Diversity | Simulation | Number of different species compositions used for a given landscape |
| `Alpha_stab`      | Average temporal stability at the subplot/community level of a given landscape | Simulation | (Sum of all community SDs in the landscape) / (Overall temporal mean) |
| `Gamma_stab`      | Temporal stability at the landscape scale | Simulation | Overall σ / μ per simulated landscape | 
| `Spatial_AS`      | Spatial asynchrony | Simulation | Gamma_stab / Alpha_stab |
| `avg_richness`    | Realized average alpha diversity | Simulation | Mean number of species at the community level |
| `Beta_div`        | Realized richness-based Beta Diversity of a given landscape. May differ from intended beta diversity because plots may share species even if sown compositions differ | Simulation | mean(Gamma_div / avg_richness) | 
| `Gamma_div`       | Realized species richness at the landscape scale | Computed within `var.partition` (not output directly) | avg_richness × Beta_div |

**There are more!!!*** [...]


#### 02_functions

This folder contains two custom functions. 
1. The **CustomFunctions.R** file includes itself two functions used for data preprocessing:

    A. `remove_outliers`: Removes rows from a dataframe where any specified variable exceeds a given quantile threshold (default is the 99.7th percentile), helping to filter out extreme values.

    B. `normalize_min_max`: Normalizes a specified column in a dataframe to a range between 0 and 1 (exclusive). We use it to normalize our Spatial Asynchrony variable.
   
2. The **Wang_et_al_2019_VariancePartitioning.R** file contains the function which was written for and published with the paper in the Journal Ecography by Wang et al. (2019; https://doi.org/10.1111/ecog.04290). This function was used to calculate our stability and asynchrony metrics.

#### 03_simulations

This folder contains all the .Rmd files needed to generate the final derived dataset from the initial raw data. These files must be run in chronological order (from 01 to 06) to function correctly.

- **01_prepare_data_for_simulation.Rmd**: Demonstrates how the cleaned data (`'sp_AGBiomass_2018_2022.csv'`) is transformed into the dataset (`'sim_data_11sp'`) used for simulations.
- **02_simulation_part1.Rmd**, **03_simulation_part2.Rmd**, **04_simulation_part3.Rmd**, and **05_simulation_part4.Rmd**: Each of these files represents different steps of the simulation procedure.
- **06_data_collation.Rmd**: Combines all the temporary datasets produced during the simulation process into the final dataset (`'scaling_data'`).

#### 04_bayesian_analysis

This folder contains the analysis scripts and documentation for the Bayesian analysis reported in the manuscript. It includes three .Rmd files and two sub-folders. The .Rmd files are best run in chronological order, although it is not necessary to run file **02** in order to run file **03**.

- **`models/`**: This sub-folder stores the final Bayesian models produced by running file **01_bayesian_models.Rmd**. 
- **`figures/`**: This sub-folder contains the figures reported in the manuscript. They are generated by running the files **02_plotting_SA.Rmd**, and **03_plotting_GS.Rmd**

#### 05_Supplementary_Information
[...]




