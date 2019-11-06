import igraph
import numpy as np
import matplotlib.pyplot as plt



def draw_and_print_communities(network, net_community, output, activity = 'subactivity'):

    '''

    Visualise a network and its comunities

    :param network: input network
    :param net_community: A community list
    :param output: input network edges (? not sure)
    :param activity:  The aggregation level on the classification
    :return: A figure and a list of communities

    '''
    layout = network.layout("fr")
    pal = igraph.drawing.colors.ClusterColoringPalette(len(net_community))
    network.vs['color'] = pal.get_many(net_community.membership)

    weights_ = [(2 * l) for l in network.es["weight"]]

    figur_graph = igraph.plot(network, output, vertex_label=network.vs['subactivity'], edge_width=weights_,
                              vertex_size=22, vertex_label_size=15, layout=layout, bbox=(2200, 1200))

    figur_graph.show()

    count = 1
    list_communities = []
    for c in net_community:
        print('Community :', count)
        print(np.unique(network.vs[c][activity]))
        list_communities.append(np.unique(network.vs[c][activity]))
        print()
        count = count + 1


    return list_communities


def compare_comunity_intersection(community_set1, community_set2, titley='', titlex=''):
    '''
    Given the two community classification of a network check communalities

    :param community_set1: list of communities

    :param community_set2: list of communities

    :param titley: Title for the x axis

    :param titlex: Title for the y axis

    :return: A figure
    '''
    ratio_sets = []

    for community in community_set1:
        lst3 = [list(filter(lambda x: x in community, sublist)) for sublist in community_set2]

        ratio_list = []
        for i in lst3:
            ratio_list.append(len(i) / len(community))

        ratio_sets.append(ratio_list)

    fig, ax = plt.subplots(figsize=(180, 180))

    im = ax.imshow(ratio_sets)
    # We want to show all ticks...
    ax.set_xticks(np.arange(len(community_set2)))
    ax.set_yticks(np.arange(len(community_set1)))
    # ... and label them with the respective list entries
    ax.set_xticklabels(np.arange(len(community_set2)))
    ax.set_yticklabels(np.arange(len(community_set1)))

    # Rotate the tick labels and set their alignment.
    plt.setp(ax.get_xticklabels(), rotation=0, ha="right",
             rotation_mode="anchor", color="black", fontsize=132)

    # Rotate the tick labels and set their alignment.
    plt.setp(ax.get_yticklabels(), rotation=0, ha="right",
             rotation_mode="anchor", color="black", fontsize=132)

    # Loop over data dimensions and create text annotations.
    for i in range(len(community_set1)):
        for j in range(len(community_set2)):
            text = ax.text(j, i, round(ratio_sets[i][j], 2), ha="center", va="center", color="w", fontsize=132)

    ax.set_title("Test")
    fig.tight_layout()

    s = 200
    plt.ylabel("Communities from network: " + titley, size=s)
    plt.xlabel("Communities from network: " + titlex, size=s)

    plt.show()

