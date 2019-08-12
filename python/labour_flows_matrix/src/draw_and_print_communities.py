import igraph




def draw_and_print_communities(network, net_community, output):
    layout = network.layout("fr")
    pal = igraph.drawing.colors.ClusterColoringPalette(len(net_community))
    network.vs['color'] = pal.get_many(net_community.membership)

    weights_ = [(2 * l) for l in network.es["weight"]]

    figur_graph = igraph.plot(network, output, vertex_label=network.vs['subactivity'], edge_width=weights_,
                              vertex_size=22, vertex_label_size=15, layout=layout, bbox=(2200, 1200))

    figur_graph.show()

    count = 1
    for c in net_community:
        print('Community :', count)
        print(network.vs[c]['subactivity'])
        print()
        count = count + 1