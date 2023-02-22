# COVID-19 Impacted Bullying Search Intensity, Asian Population Did Not

This repository contains code and data to produce a paper which is a reproduction of some aspects of Bacher-Hicks, Goodman, Green and Holt (2022)'s paper: [The COVID-19 Pandemic Disrupted Both School Bullying and Cyberbullying](https://www.aeaweb.org/articles?id=10.1257/aeri.20210456). Additionally, there is also code to perform a replication of Figure 1 in that paper.

The Inputs folder contains all the raw data downloaded from the paper's replication package found at: <https://www.openicpsr.org/openicpsr/project/156901/version/V1/view>

The Outputs folder contains two subfolders:

-   The Paper folder contains the quarto document and references used to generate the overall paper

-   The data folder contains all the cleaned csv files used to generate graphs in the quarto document.

The Scripts folder contains 4 scripts:

-   The simulate_data script creates a sample dataset with a reduced number of states.

-   The download_data script has documentation on how to download the raw data.

-   The data_cleaning script cleans the data by selecting the states used in the analysis, and renaming columns and values for readability.

-   The test_data script tests the validity of the cleaned datasets.

Abstract: The COVID-19 pandemic incited a wave of anti-Asian hate crimes across the United States including derogatory language in the media, random bullying, and violent, senseless murders. This paper analyzes how high school closures and the shift to online learning by schools throughout the pandemic, impacted incidents of bullying of Asian students compared to non Asian students when compared to pre-pandemic trends and in-person learning. Results suggest that while the overall trend in bullying of high school students has been in decline across all states between 2016-2021, with a larger drop during COVID-19, the states with high Asian populations saw greater incidents of bullying when compared to states with low Asian populations over the six year period. These findings tell both a good news story of declining bullying trends in the US school system and a highly concerning narrative that anti-Asian bullying is not a result of COVID-19, but rather an intensified awareness of pre-existing racism.

The replication on the SSRP can be found at : <https://doi.org/10.48152/ssrp-54f4-p919>
