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
employment status, industry classification, location of their work establishment,etc. 
From 1997 to 2008 the data uses the Standard Industrial Classification from 2003 (SIC2003) whilst in the perdiod from 2009 to 2018 
the industrial classification has been updated to the 2007 version (SIC2007). As there is not a trivial concordance method 
for converting these codes,in the process of building the matrices the samples has to be treated separately into two parts, 
depending on the industrial classification avalaible at the year of collections.
   
## Data selection

As the size of the ASHE dataset is small (only 1%), the selection process of the workers that are going to be used in the 
measurement of job trasitions is kept to the minimum. The selection criteria are the following:

* Between 16 and 65 years of age;
* Without missing information on industry, occupation, region of work, gender or age.


# Method
 \label{method}
 
Description of the definition of flows

## Algorithms

Description of the "flows" and "connection" algorithms.

## Selection of a valid "flow" or "connection"

# Statistical method
\label{SR}

Frank Neffke method of symmetrisation.  

# Results

## Descriptive tables

## Comparison between "flows" and "connections"

## Adjajency matrices

## Network figures 


