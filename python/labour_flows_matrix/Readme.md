# Network analysis of labour flows matrices

This sub-repo contains notebooks running general network analysis on the labour flows matrices created 
with the raw data exported from the UK data service secure lab and the 'rkf' package also present in 
this repository. 

There are a descrition of the notebooks present:

* Notebook that creates the figures and tables shown in the report: 

   ``notebook/analyse_matrix-1997-2008-reportFigures.ipynb``
    ``notebook/analyse_matrix-2009-2018-reportFigures.ipynb``
    
* Notebook that creates the data provided to M. Landman for community detection

    ``notebook/UK_network_processing_for_Community_Detection.ipynb``

* Notebook that creates the data for Gephi visualisation

    ``notebook/UK_network_processing_for_Gephi.ipynb``
    
* Notebooks analysing the Manchester case study (these are just preliminary exploratory checks):

    ``notebook/Manchester_case_study.ipynb``
    ``notebook/Manchester_case_study-connections.ipynb``

* Notebooks with exploratory analysis of the UK matrices:
    
   ``notebook/analyse_matrix-1997-2008-Flows-Conn.ipynb``
   ``notebook/analyse_matrix-2009-2018-Flows-Conn.ipynb``
   ``notebook/analyse_matrix-2009-2018-Flows-Conn.ipynb``
   ``notebook/analyse_matrix-Conn.ipynb``
   ``notebook/analyse_matrix-Flows.ipynb``
  
The src/ directory has helper functions to create the figures in the notebooks (these funtions are
not a the best documentation/comment standard).
  
  
## Run the notebooks
  
  To run the notebooks you need to create an anaconda environment using the 
  environment.yml file in this directory. Concretely:

    conda update conda
    conda env create -f environment.yml  
    source activate kflows


   You need to have the processed data files in the data/ directory.
   The existing files are the ones used to create all figures in the report.


    
