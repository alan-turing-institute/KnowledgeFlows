import matplotlib.patches as mpatches
import matplotlib.pyplot as plt
import numpy as np
import igraph



def draw_network_by_classification(network,classification):


    # get classes for drawing
    unique_classes = list(np.unique(network.vs[classification]))

    #assign color for each class
    cmap = plt.get_cmap("jet")
    colors = [cmap(i * 15) for i in range(0, len(unique_classes))]
    color_dict = dict(zip(unique_classes, colors))
    network.vs['color'] = [color_dict[industry] for industry in network.vs[classification]]

    #define layout
    layout = network.layout("fr")

    #define edge width
    edge_width = [(2 * l) for l in network.es["weight"]]

    #draw figure
    figur_graph = igraph.plot(network, "../img/network_industry.png", vertex_label=network.vs['subactivity'], edge_width=edge_width, vertex_size=20, vertex_label_size=12, layout=layout, bbox=(2200, 1200))
    figur_graph.show()

    # draw labels in a separate figure (this is a temporary solution)
    red_patch = []
    for i in range(0, len(unique_classes)):
        red_patch.append(mpatches.Patch(color=colors[i], label=unique_classes[i]))

    plt.legend(handles=red_patch)
    plt.show()


    return  0

def compare_degrees_strength(Gm_simple):
    # the histogram of the data
    plt.hist(Gm_simple.degree(),bins=30,label='degree')
    plt.hist(Gm_simple.strength(weights=Gm_simple.es['weight']),bins=30,label='weighted degree')

    mean_degree = np.mean(Gm_simple.degree())
    mean_strenght = np.mean(Gm_simple.strength(weights=Gm_simple.es['weight']))


    plt.xlabel('Degree')
    plt.ylabel('Frequency')
    plt.title('Network degree')
    plt.xlim(0, 40)
    plt.legend()
    plt.show()

    print ('mean degree',mean_degree)
    print ('mean strenght',mean_strenght)