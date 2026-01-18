# Replication Research: Labor Market Discrimination
This project replicates and extends the analysis from “Are Emily and Greg More Employable Than Lakisha and Jamal? A Field Experiment on Labor Market Discrimination” using labor market data. The goal is to reproduce key empirical findings from the original study and compare results using replicated models conducted in Stata

Group project repository for the replication exercise by Vo / Hoang / Nguyen.

This repository contains the Stata code, data, and outputs needed to reproduce the results reported in the group's replication write-up.

## Repository contents (high level)
- `Analysis/`  
  - `Analysis.do` — main Stata do-file that runs the full analysis  
  - `Analysis.log` — example Stata log produced when the do-file was run  
  - `Figure1.gph` — main figure produced by the analysis  
  - `table1.xls`, `table2.xls`, `table3.xls` and modified versions — regression output tables  
- `Data/`  
  - `Names.dta` — primary dataset used for all results (no additional preprocessing required)  
- `finalpaper.docx`, finalpaper.pdf — project write-up  
- `readme.pdf` — original project readme (PDF)

## Requirements
- Stata 16 or later is recommended. The do-file was developed/tested with Stata 16.  
- Internet connection may be required the first time to install packages (e.g., `outreg2`) via SSC.  
- No other data files are required — everything is produced from `Data/Names.dta`.

## How to reproduce
1. Open Stata.
2. Set the working directory to the project root folder (Vo-Hoang-Nguyen-298Replication).
3. Run the main do-file: do "Analysis/Analysis.do"

## Outputs
Running `Analysis/Analysis.do` reproduces the project outputs, including:
- `Analysis/Analysis.log` (complete Stata log file)
- `Analysis/Figure1.gph` (main figure)
- `Analysis/table1.xls`, `Analysis/table2.xls`, `Analysis/table3.xls` and modified versions (formatted regression tables)
All results reported in the replication paper are reproducible by executing the single do-file above.
