import igraph
import pandas as pd


def build_network_object(matrix_df, label):
    # select only connections that are relevant
    matrix_df_connections = matrix_df.loc[matrix_df[label] != 1]
    matrix_df_connections_no_noise = matrix_df_connections.loc[matrix_df_connections[label] > 0]

    tuples = [tuple(x) for x in matrix_df_connections_no_noise[['StartIndst', 'FinalIndst', label]].values]

    network = igraph.Graph.TupleList(tuples, directed=False, edge_attrs=['weight'])
    network.vs['label'] = network.vs["name"]

    network_simple = network.simplify(combine_edges="mean")

    label_subactivity_df = matrix_df[
        ['StartIndst', 'FinalIndst', 'SubActivity_StartIndst', 'MainActivity_StartIndst', 'MainIndustry_StartIndst',
         'SubActivity_FinalIndst', 'MainActivity_FinalIndst', 'MainIndustry_FinalIndst']]
    label_subactivity_df = label_subactivity_df.drop_duplicates()

    names = network_simple.vs['name']

    subactivity = []
    mainactivity = []
    mainindustry = []

    for i in names:
        try:
            subactivity.append(
                label_subactivity_df[label_subactivity_df['StartIndst'] == i]['SubActivity_StartIndst'].values[0])
        except:
            subactivity.append(
                label_subactivity_df[label_subactivity_df['FinalIndst'] == i]['SubActivity_FinalIndst'].values[0])

        try:
            mainactivity.append(
                label_subactivity_df[label_subactivity_df['StartIndst'] == i]['MainActivity_StartIndst'].values[0])
        except:
            mainactivity.append(
                label_subactivity_df[label_subactivity_df['FinalIndst'] == i]['MainActivity_FinalIndst'].values[0])

        try:
            mainindustry.append(
                label_subactivity_df[label_subactivity_df['StartIndst'] == i]['MainIndustry_StartIndst'].values[0])
        except:
            mainindustry.append(
                label_subactivity_df[label_subactivity_df['FinalIndst'] == i]['MainIndustry_FinalIndst'].values[0])

    subactivity = ["missing" if (float(pd.isnull(x))) else x for x in subactivity]
    mainactivity = ["missing" if (float(pd.isnull(x))) else x for x in mainactivity]
    mainindustry = ["missing" if (float(pd.isnull(x))) else x for x in mainindustry]

    network_simple.vs['subactivity'] = subactivity
    network_simple.vs['mainactivity'] = mainactivity
    network_simple.vs['mainindustry'] = mainindustry

    return network_simple
