import networkx as netx
import igraph
from build_network_object import build_network_object


def convert_igraph_to_networkx(network_igraph):
    '''

    Convert a igraph network to a NetworkX network

    :param network_igraph:  input network
    :return: a NetworkX network
    '''


    # In case you graph is undirected
    network_nx = netx.Graph()

    # loop over each node and add it to the graph, and include extra information
    for node in network_igraph.vs:
        network_nx.add_node(node['subactivity'], mainactivity=node['mainactivity'],
                        mainindustry=node['mainindustry'])


    # loop over each edge and add it to the graph, and include extra information
    for edge in network_igraph.es:
        v1 = network_igraph.vs[edge.tuple[0]]['subactivity']
        v2 = network_igraph.vs[edge.tuple[1]]['subactivity']

        network_nx.add_edge(v1, v2, weight=edge['weight'])


    return network_nx


def build_networx_network(input_dataframe,label):

    '''
    Build an igraph network from an input edge list and then turn it into a networkX network
    (this function is  stupid)

    :param  input_dataframe (dataframe): The input edge list data (with columns 'StartIndst', 'FinalIndst', 'SubActivity_StartIndst', 'MainActivity_StartIndst', 'MainIndustry_StartIndst',
         'SubActivity_FinalIndst', 'MainActivity_FinalIndst', 'MainIndustry_FinalIndst', 'Counts', weight' )

    :param  label (str): The name of the weight variable to use (Counts or weight):
    :return: a NetworkX network
    '''

    # build a network in igraph (because im lazy)
    network_igraph = build_network_object(input_dataframe,label)

    # turn the igraph to network_x
    return convert_igraph_to_networkx(network_igraph)


def build_networx_from_df(input_df):
    '''
        Build a networkX network from a input edge list


     :param  input_df (dataframe): The input edge list data (with columns 'StartIndst', 'FinalIndst', 'SubActivity_StartIndst', 'MainActivity_StartIndst', 'MainIndustry_StartIndst',
         'SubActivity_FinalIndst', 'MainActivity_FinalIndst', 'MainIndustry_FinalIndst', 'Counts', weight' )

    :param  label (str): The name of the weight variable to use (Counts or weight):
    :return: a NetworkX network
    '''


    # In case you graph is undirected
    network_nx = netx.Graph()

    # loop over each node and add it to the graph, and include extra information
    # loop over each edge and add it to the graph, and include extra information
    for edge in range(0,input_df.shape[0]):

        v1 = input_df.iloc[edge]['StartIndst']
        v2 = input_df.iloc[edge]['FinalIndst']
        weight = input_df.iloc[edge]['weight']
        counts = input_df.iloc[edge]['Counts']

        network_nx.add_edge(v1, v2, weight=weight,count=counts)


    return network_nx

def include_mstree_information(input_dataframe,edges_list,weight_threshold):
    '''

    Include the maximum spanning tree information in an edge list dataframe

    :param input_dataframe: Input edge list dataframe
    :param edges_list: edge list that has the MST
    :param weight_threshold: minimum weight to be included in the output edge list
    :return: an updated edge list
    '''

    is_mstree = []
    is_mtree_or_weight = []

    for i in range(0, input_dataframe.shape[0]):
        source = input_dataframe.iloc[i]['StartIndst']
        target = input_dataframe.iloc[i]['FinalIndst']
        weight = input_dataframe.iloc[i]['weight']

        mtree = 0
        if (source, target) in edges_list:
            mtree = 1

        elif (target, source) in edges_list:
            mtree = 1


        is_mstree.append(mtree)

        if (is_mstree == 1 or weight> weight_threshold):
            is_mtree_or_weight.append(weight)
        else:
            is_mtree_or_weight.append(0)


    input_dataframe['is_mstree'] = is_mstree
    input_dataframe['is_mtree_or_weight'] = is_mtree_or_weight


    return input_dataframe

def prepare_dataframe_for_gephi(input_dataframe, include_mst=False):
    '''

    Prepare an edge list for the Gephi format (relabel collums, cut on weights, etc)

    :param input_dataframe: Input edge list
    :param include_mst: Boolean to see if we in clude the MST
    :return: an updated edge list to be used in gephi
    '''
    input_dataframe['Source'] = input_dataframe['StartIndst']
    input_dataframe['Target'] = input_dataframe['FinalIndst']
    input_dataframe['Weight'] = input_dataframe['weight']
    input_dataframe['mst_Weight'] = input_dataframe['is_mstree'] * input_dataframe[
        'weight']

    input_dataframe = input_dataframe[input_dataframe['is_mtree_or_weight']!= 0.0]

    if include_mst:

        output = input_dataframe[['Source', 'Target', 'Weight', 'mst_Weight', 'is_mstree','is_mtree_or_weight','Counts']]

    else:
        output = input_dataframe[['Source', 'Target', 'Weight','Counts']]

    return output