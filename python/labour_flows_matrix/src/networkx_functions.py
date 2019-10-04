import networkx as netx
import igraph
from build_network_object import build_network_object


def convert_igraph_to_networkx(network_igraph):


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

    # build a network in igraph (because im lazy)
    network_igraph = build_network_object(input_dataframe,label)

    # turn the igraph to network_x
    return convert_igraph_to_networkx(network_igraph)


