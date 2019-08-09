import matplotlib.patches as mpatches
import matplotlib.pyplot as plt
import numpy as np
import igraph
import pandas as pd


def draw_adjacency_matrix(reduced_matrix, columns_to_be_sorted, label):
    label_matrix = pd.read_csv('../data/sic-industry-structure.csv')

    label_matrix['SIC2007'] = pd.to_numeric(label_matrix['SIC2007'])

    selected_reduced_matrix = reduced_matrix[['StartIndst', 'FinalIndst', 'MainIndustry_StartIndst', 'Counts']]

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
            final_df = start_df[start_df[columns_to_be_sorted[1]] == finalInd]
            if final_df.shape[0] == 0:
                count = -1
            else:
                count = start_df[start_df[columns_to_be_sorted[1]] == finalInd][label].values[0]

            column_row.append(count)

        list_row.append(column_row)
        list_industry.append(str(label_matrix[label_matrix['SIC2007'] == startInd]['MainActivity'].values[0]))

    y_axis = sorted_inds
    x_axis = sorted_inds

    fig, ax = plt.subplots(figsize=(300, 300))
    im = ax.imshow(list_row)

    # We want to show all ticks...
    ax.set_xticks(np.arange(len(x_axis)))
    ax.set_yticks(np.arange(len(y_axis)))
    # ... and label them with the respective list entries
    ax.set_xticklabels(list_industry)
    ax.set_yticklabels(list_industry)

    ax.xaxis.set_major_locator(plt.MaxNLocator(150))
    ax.yaxis.set_major_locator(plt.MaxNLocator(150))

    plt.xticks(fontsize=100, rotation=90)
    plt.yticks(fontsize=100, rotation=0)

    plt.show()

