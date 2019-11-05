# rkf package


The rkf package is used to process the raw transition counts data exported from the UK data service 
secure lab. 

The method explained in sections 3 and 4 of the report (found in the *KnowledgeFlows* repo) is applied, by 
normalising the matrices using a null model, symmetrising the transitions and adding information.

The resulting matrices are a edge table with all the transitions, their industry classification and raw counts.
These new matrices are then used to build networks and provide the results shown in section 5 of the report. 

## Building the package

* Open a terminal window
* Go to the directory that contains the 'rkf' package directory.
* Type

```
R CMD build rkf
```

now you should have  the rkf_0.1.1.tar.gz file. Now,

* Copy the  to the rkf_0.1.1.tar.gz file in the 'rkf/' directory (in order to have the path right).
* Type

```
* R CMD INSTALL rkf_0.1.1.tar.gz
```

## Processing the 10 year matrices from the secure lab

* Start R and type (assuming you are in the 'rkf/' directory )
```
library(rkf) 

create_all_normalised_transition_matrix(input_data_path, output_data_path)
```

this will run the processing of the 4 matrices (from 1997 to 2008 anf 2009 to 2018, connections and flows). 


## Processing a new matrix

* Start R and type (assuming you are in the 'rkf/' directory )
```
library(rkf) 

algorithm <- "FLOWS"  # or "CONN"

raw_matrix <- read.csv('path_to_raw_data/matrix_file.csv')

normalised_output <- create_normalised_transition_matrix_from_reduced(raw_matrix,-0.99,algorithm)
```









