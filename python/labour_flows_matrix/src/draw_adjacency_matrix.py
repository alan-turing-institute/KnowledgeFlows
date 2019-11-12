import matplotlib.patches as mpatches
import matplotlib.pyplot as plt
import numpy as np
import igraph
import pandas as pd


def draw_adjacency_matrix(reduced_matrix, columns_to_be_sorted, label,axis_label='MainActivity',sic07=True):


    '''Given an edge list, draw a adjacency matrix


        Args:
           reduced_matrix (dataframe): An edge list
           columns_to_be_sorted (list str): The ordered column list that will sort the adjacency matrix

           label (str): The name of the weight variable to use (Counts or weight)

           axis_label (str): The industry classification agregation level
           sic07 (bool): Is a sic07 classification

       Returns:
           A figure.
    '''


    if sic07 == True:
        label_matrix = pd.read_csv('../data/sic-industry-structure.csv')

        label_matrix['SIC2007'] = pd.to_numeric(label_matrix['SIC2007'])
    else:
        label_matrix = pd.read_csv('../data/sic03-industry-structure.csv')
        label_matrix['SIC2007'] = pd.to_numeric(label_matrix['sic_code'])



    selected_reduced_matrix = reduced_matrix[['StartIndst', 'FinalIndst', 'MainIndustry_StartIndst', 'weight','MainActivity_StartIndst','SubActivity_StartIndst','Counts']]

    reduced_matrix_sorted = selected_reduced_matrix.sort_values(by=columns_to_be_sorted, ascending=True)

    sorted_inds = np.unique(reduced_matrix_sorted[columns_to_be_sorted[0]].values)

    list_industry = []
    list_row = []
    for startInd in sorted_inds:

        if (startInd == 0):
            continue

        start_df = reduced_matrix_sorted[reduced_matrix_sorted[columns_to_be_sorted[0]] == startInd]
        column_row = []
        for finalInd in sorted_inds:
            if (finalInd == 0):
                continue

            final_df = start_df[start_df[columns_to_be_sorted[1]] == finalInd]
            if final_df.shape[0] == 0:
                count = -1
            else:
                count = start_df[start_df[columns_to_be_sorted[1]] == finalInd][label].values[0]

            column_row.append(count)

        list_row.append(column_row)

        try:
            name = str(label_matrix[label_matrix['SIC2007'] == startInd][axis_label].values[0])
        except:
            name = ''

        list_industry.append(name)

    y_axis = sorted_inds
    x_axis = sorted_inds

    fig, ax = plt.subplots(figsize=(130, 130))
    im = ax.imshow(list_row,cmap='RdBu')

    cb = fig.colorbar(im, ax=ax)
    cb.set_ticklabels([0, 0.2, 0.4, 0.6, 0.8, 1.0])

    # We want to show all ticks...
    ax.set_xticks(np.arange(len(x_axis)))
    ax.set_yticks(np.arange(len(y_axis)))
    # ... and label them with the respective list entries
    ax.set_xticklabels(list_industry)
    ax.set_yticklabels(list_industry)

    plt.xticks(fontsize=5, rotation=90)
    plt.yticks(fontsize=5, rotation=0)

    plt.show()

    return (0)


def draw_adjacency_matrix_nolabel(reduced_matrix, columns_to_be_sorted, label,min_value=0):

    '''Given an edge list, draw a adjacency matrix


        Args:
           reduced_matrix (dataframe): An edge list
           columns_to_be_sorted (list str): The ordered column list that will sort the adjacency matrix

           label (str): The name of the weight variable to use (Counts or weight)

           min_value z(int): Min value to be shown in the adjacency matrix

       Returns:
           A figure.
    '''


    selected_reduced_matrix = reduced_matrix[['StartIndst', 'FinalIndst', 'MainIndustry_StartIndst', 'weight','MainActivity_StartIndst','SubActivity_StartIndst','Counts']]

    reduced_matrix_sorted = selected_reduced_matrix.sort_values(by=columns_to_be_sorted, ascending=True)

    sorted_inds = np.unique(reduced_matrix_sorted[columns_to_be_sorted[0]].values)

    list_row = []
    for startInd in sorted_inds:

        if (startInd == 0):
            continue

        start_df = reduced_matrix_sorted[reduced_matrix_sorted[columns_to_be_sorted[0]] == startInd]
        column_row = []
        for finalInd in sorted_inds:
            final_df = start_df[start_df[columns_to_be_sorted[1]] == finalInd]
            if final_df.shape[0] == 0:
                count = min_value
            else:
                count = start_df[start_df[columns_to_be_sorted[1]] == finalInd][label].values[0]

            column_row.append(count)

        list_row.append(column_row)

    y_axis = sorted_inds
    x_axis = sorted_inds

    fig, ax = plt.subplots(figsize=(30, 30))

    im = ax.imshow(list_row,cmap='BuPu')

    cb = fig.colorbar(im, ax=ax)
    cb.ax.tick_params(labelsize=20, width=2)
    ax.set(ylabel='Industries',xlabel='Industries')
    plt.setp(ax.get_xticklabels(), visible=False)
    plt.setp(ax.get_yticklabels(), visible=False)
    ax.tick_params(axis='both', which='both', length=0)
    cb.set_ticklabels([0,0.2,0.4,0.6,0.8,1.0])

    ax.xaxis.label.set_size(20)
    ax.yaxis.label.set_size(20)

    # We want to show all ticks...
    plt.show()

