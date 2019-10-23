---
author: Camila Rangel Smith and the Knowledge Flows team
title: Skill relatadeness matrices for the UK
date: Draft (not for distribution)

---

# Introduction 

This report describes the procedure of constructing skill-relatedness matrices for
the United Kingdom. Skill-relatedness aims to provide a quantitative estimate of similarities between two industries
 in terms of their human capital requirements [@GermanyMatricesReport].
 
The matrices are built over two periods of time (1997-2008 and 2009-2018), and two industrial classifications (SI2003 and 
 SIC2007).  For each period of time, a sample of employee jobs is taken from HM Revenue & Customs PAYE records, and
 their transitions between industries are recorded. These transitions are then used to build the skill-relatedness matrices.
 
The structure of this report is as follows. The dataset used to build the skill-relatedness matrices are described in 
section \ref{data}. Then, the method to measure the transitions between industries is described in section \ref{method}.
A statistical procedure is applied to convert the observed labor transitions to a metric that reflect the skill relatedness
between the industries, this is described in section \ref{SR}. Finally, in section \ref{results} the resulting matrices are
described and a preliminary network analysis is shown.


# Data
\label{data}

The skill-relatedness matrices are based on the Annual Survey of Hours and Earnings dataset, which is 
is the most comprehensive source of earnings information in the United Kingdom. This dataset contains 
anonymised demographic and employment information of 1% of the total employee jobs in the HM Revenue & Customs (HMRC) Pay
As You Earn (PAYE) records, covering the years between 1997 to 2018[@ASHE]. 

The sample is drawn in such a way that 
many of the same individuals are included from year to year, allowing longitudinal analysis of the data which is fundamental
for the construction of the skill-relatedness matrices.

Some of the available information in the dataset is the workers’s wage, occupation, 
employment status, industry classification (5-digit), location of their work establishment,etc. 
From 1997 to 2008 the data uses the Standard Industrial Classification from 2003 (SIC2003) whilst in the perdiod from 2009 to 2018 
the industrial classification has been updated to the 2007 version (SIC2007). As there is not a trivial concordance method 
for converting these codes,in the process of building the matrices the samples has to be treated separately into two parts, 
depending on the industrial classification avalaible at the year of collections.
   
## Data selection
 \label{dataselection}
As the size of the ASHE dataset is small (only 1%), the selection process of the workers that are going to be used in the 
measurement of job trasitions is kept to the minimum. The selection criteria are the following:

* Between 16 and 65 years of age;
* Without missing information on industry, occupation, region of work, gender or age.


# Method
 \label{method}
 
The job transitions are measured in a per-worker basis. 

For each worker found in the ASHE dataset that passes the selection
steps described in section \ref{dataselection}, a table of all the jobs recorded is extracted. This *job table* contains 
information of each job found for that individual: year of employment, the industry classification of each job and the 
post code of the work establishment associated to that job. 

 Table 1: An example of a *job table* for a particular individual with anonymised id=1.
        
    | Id | Year | Indsutrial     | Work        |
    |    |      | Classification | Post code   |
    |----|------|----------------|-------------|
    | 1  | 2009 | A              | A1          |
    | 1  | 2010 | A              | A1           |
    | 1  | 2010 | B              | B1           |
    | 1  | 2011 | C              | C1           |
    | 1  | 2013 | D              | D1           |
    | 1  | 2013 | D              | D2           |


Using this table, two approaches can be followed to measure the actual "job transition". These methods are explained next.

## Transitions as "flows" 

For a particular *job table* belonging to an individual, the table is sorted by time (the *Year* variable) and a **flow** is 
defined as any two consecutive job entries that comply with the following rules:

   * A valid **flow** can not be separated by more than 2 years.
   * A **flow** can not happen within the same job in 2 different years (if the **flow** industry code and the work postcode,
    it is assumed that it is the same job).

For Table 1, the **flows** are the following:

        | Id    | Flow | Year     |Work     |
        |       |      |Difference|Postcodes|
        |-------|------|----------|---------|
        | 1     | A-B  |2010-2010 | A1-B1   | 
        | 1     | B-C  |2010-2011 | B1-C1   | 
        | 1     | C-D  |2011-2013 | C1-D1   | 
        | 1     | D-D  |2013-2013 | D1-D2   | 


## Transitions as "connections"

Define a **connection** as all possible unique combinations found in the *job table* for that individual, that comply with the following rules
(these are the same as the ones described in the **flow** procedure ):

   * A valid **connection** can not be separated by more than 2 years.
   * A "**connection**" can not happen within the same job in 2 different years (if the industry code and the work postcode,
    it is assumed that it is the same job).

In the example case of Table 1, the **connections** will be the following:

        | Id    | Connection | Year     |Work     |
        |       |            |Difference|Postcodes|
        |-------|------------|----------|---------|
        | 1     | A-B        |2009-2010 | A1-B1   | 
        | 1     | A-C        |2009-2011 | A1-C1   | 
        | 1     | B-C        |2010-2011 | B1-C1   | 
        | 1     | C-D        |2011-2013 | C1-D1   | 
        | 1     | C-D        |2011-2013 | C1-D2   | 
        | 1     | D-D        |2013-2013 | D1-D2   | 
        

 The **flow** approach does not handle properly what happens when someone has more than one job at the same time, given that 
 it does not  considered all combination between the jobs. The **connection** algorithm addresses this multiple part-time 
 job issue. Furthermore, the **connection** approach creates an undirected network and increases the size of the sample.

## Transitions Count Matrix
\label{countmatrices}

For each time period (1997-2008 and 2009-2018) and observed worker, the transitions are obtained with the process explained above.
Then, industry classifications are agreggated into a 4-digit code and all transitions tables are added into a single matrix
(both **flows** and **conection** methods are applied separatedly).

Finally, four matrices are created (2 time periods times 2 methods to measure the transitions) reflecting the total values
of transitions between industries observed.  For statistical disclosure control reasons, only industries in which the
total transitions summed across the entire period exceeds 10 observations are kept. 

# Statistical method
\label{SR}



The resulting matrices described in section \ref{countmatrices} countain the raw counts of trasition observed between pairs
industries. In order to infer how related two industries are in terms of skill- relatedness, a statistical procedure is
applied to the matrices. The mathematical details of this method are found in [@GermanyMatricesReport], in this section
a high level general description of the method is presented.. 

First, the raw count matrices is
compared to a null model where the transitions occur at random. In particular, a ratio (**SR**) is calculated
between the observed transitions and the ones expected in the null model. 

[REWRITE]: Values of the **SR** ratio between 0 and 1 
show that the observed flows are below expected flows, whereas values from 1 to infinity indicate that observed 
flows are above expected flows. 

One disadvantage of the (**SR**) metric is that it has a highly skewed distribution to high values, to deal with this 
problem the **SR** is symmetrised around 0. 

[REWRITE]: As a consequence, a given
degree of overrepresentation of labor flows has the same, yet opposite value as the same
degree of underrepresentation of such flows~~.


# Results


## Descriptive tables

## Comparison between "flows" and "connections"

## Adjajency matrices

# Community detection

## Network figures 


