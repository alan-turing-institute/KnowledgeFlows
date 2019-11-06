# Knowledge Flows

Welcome to the repository for the Knowledge Flows project.

## About the project


This project aims to deploy a novel data modelling approach to shed light on some key economic 
policy issues facing UK cities, taking a skills-based perspective on industrial diversification and resilience. 

The project uses data from the Office of National Statistics on worker mobility to build skill-relatedness matrices for
the Uk. More info about thre project can be found [here](https://www.turing.ac.uk/research/research-projects/network-modelling-uks-urban-skill-base)

## Structure of the repository

This repo contains a couple different packages to process, analyse and report on the skill relatadenes matrices exported from the 
secure facilities from the UK data service. The repo should contain all necessary data, scripts to run the analysis. 
The existing directories are the following.

### securelab_data_outputs

Contains the data exported from the secure lab, these are the matrices reflecting labour flows matrices between industries for
different time periods and industrial classifications.

### R 

This repo contains the *rkf* that processes the labour flows matrices exported from the secure lab (found in the **Securelab_data_outputs** 
directory) to build the skill relatedness matrices relevant to this project.

### python

This repo contains jupyter notebooks that processes the skill relatedness matrices and runs some
 preliminary network analysis.
 
### report

This repo contains a report on the data.

### gephi

This repo contains any gephi environment used to process or analyse the matrices. 
