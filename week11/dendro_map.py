#!/usr/bin/env python
import sys
import scipy.cluster.hierarchy as hac
import numpy as np
import pandas as pd
import scipy.spatial.distance as dist
import matplotlib.pyplot as plt
import pylab
import scipy
import pydendroheatmap as pdh
try: import cPickle as pickle
except: import pickle


import pydendroheatmap as pdh
try: import cPickle as pickle
except: import pickle

heatmap_array = pickle.load(open('/Users/cmdb/qbb2016-answers/week11/data.npy'))#a numpy.ndarray or numpy.matrix, for this example, let's say mxn array
top_dendrogram = pickle.load(open('/Users/cmdb/qbb2016-answers/week11/link_t.npy'))#a (n-1) x 4 array
side_dendrogram = pickle.load(open('/Users/cmdb/qbb2016-answers/week11/link_s.npy'))#a (m-1) x 4 array

heatmap = pdh.DendroHeatMap(heat_map_data=heatmap_array, left_dendrogram=side_dendrogram, top_dendrogram=top_dendrogram)
heatmap.title = 'This is an example'
heatmap.show()

heatmap.colormap = heatmap.yellowBlackBlue

heatmap.show()

heatmap.row_labels = ['some', 'row','labels'] #must have the same number of rows in heat_map_data

heatmap.reset_plot()
heatmap.show()

#excellent, let's export it

heatmap.export('awesome_heatmap_plot.png')