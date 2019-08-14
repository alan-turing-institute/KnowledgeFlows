import pandas as pd
import seaborn as sns
import scipy.stats as stats
import matplotlib.pyplot as plt
import numpy as np


def correlation_industry_pairs(df_industry1, df_industry2, label = 'weights'):


    df_industry1['id'] = df_industry1.groupby(['StartIndst', 'FinalIndst']).ngroup()

    result = pd.merge(df_industry1, df_industry2, on=['StartIndst', 'FinalIndst'])

    if label == 'counts':
        j = sns.jointplot(x=result["Counts_x"], y=result["Counts_y"], kind='scatter', s=50, color='blue',edgecolor="skyblue",linewidth=2)
        j.annotate(stats.pearsonr)
        plt.show()

    else:
        j = sns.jointplot(x=result["weight_x"], y=result["weight_y"], kind='scatter', s=50, color='blue', edgecolor="skyblue",linewidth=2)
        j.annotate(stats.pearsonr)
        plt.show()


def correlation_network_degree(Gm_simple_1,Gm_simple_2,label):

    df_1 = pd.DataFrame([Gm_simple_1.vs['name'], Gm_simple_1.degree(),Gm_simple_1.strength(weights=Gm_simple_1.es['weight'])])
    df_1 = df_1.transpose()
    df_1.columns = ['sic07', 'degree', 'strenght']

    df_2 = pd.DataFrame([Gm_simple_2.vs['name'], Gm_simple_2.degree(),Gm_simple_2.strength(weights=Gm_simple_2.es['weight'])])
    df_2 = df_2.transpose()
    df_2.columns = ['sic07', 'degree', 'strenght']

    result = pd.merge(df_1, df_2, on=['sic07'])

    if label == 'degree':
        j = sns.jointplot(x=result["degree_x"], y=result["degree_y"], kind='scatter', s=50, color='blue',edgecolor="skyblue", linewidth=2)
        j.annotate(stats.pearsonr)


    else:
        j = sns.jointplot(x=result["strenght_x"], y=result["strenght_y"], kind='scatter', s=50, color='blue',edgecolor="skyblue", linewidth=2)
        j.annotate(stats.pearsonr)

    plt.show()

def correlation_adjacency_matrix(reduced_matrix1, reduced_matrix2,label):

    selected_reduced_matrix1 = reduced_matrix1[['StartIndst', 'FinalIndst', 'MainIndustry_StartIndst', 'weight']]
    reduced_matrix_sorted1 = selected_reduced_matrix1.sort_values(by=['StartIndst', 'FinalIndst'], ascending=True)

    selected_reduced_matrix2 = reduced_matrix2[['StartIndst', 'FinalIndst', 'MainIndustry_StartIndst', 'weight']]
    reduced_matrix_sorted2 = selected_reduced_matrix2.sort_values(by=['StartIndst', 'FinalIndst'], ascending=True)

    sorted_inds = np.unique(reduced_matrix_sorted1['StartIndst'].values)

    list_row1 = []
    list_row2 = []

    for startInd in sorted_inds:

        if (startInd == 0):
            continue

        start_df1 = reduced_matrix_sorted1[reduced_matrix_sorted1['StartIndst'] == startInd]
        start_df2 = reduced_matrix_sorted2[reduced_matrix_sorted2['StartIndst'] == startInd]

        for finalInd in sorted_inds:
            final_df1 = start_df1[start_df1['FinalIndst'] == finalInd]
            final_df2 = start_df2[start_df2['FinalIndst'] == finalInd]

            if final_df1.shape[0] == 0:
                count1 = -1
            else:
                count1 = start_df1[start_df1['FinalIndst'] == finalInd][label].values[0]

            if final_df2.shape[0] == 0:
                count2 = -1
            else:
                count2 = start_df2[start_df2['FinalIndst'] == finalInd][label].values[0]

            list_row1.append(count1)
            list_row2.append(count2)

    pearson_corr = stats.pearsonr(list_row1, list_row2)


    print (pearson_corr)




