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


inFile = open("/Users/cmdb/qbb2016-answers/week11/hema_data.txt")
colHeaders = inFile.next().strip().split()[1:]
rowHeaders = []
dataMatrix = []

for line in inFile:
    data = line.strip().split('\t')
    rowHeaders.append(data[0])
    dataMatrix.append([float(x) for x in data[1:]])
dataMatrix = np.array(dataMatrix)


#dataMatrix = dist.pdist(dataMatrix)
#dataMatrix = dist.pdist(dataMatrix,'euclidean')



linkageMatrix_t = hac.linkage(dataMatrix)
linkageMatrix_s = hac.linkage(np.transpose(dataMatrix))

heatmapOrder = hac.leaves_list(linkageMatrix_t)
orderedDataMatrix = dataMatrix[heatmapOrder,:]
# rowHeaders = np.array(rowHeaders)
# orderedRowHeaders = rowHeaders[heatmapOrder,]

heatmap_array = orderedDataMatrix
top_dendrogram = linkageMatrix_s
side_dendrogram = linkageMatrix_t
heatmap = pdh.DendroHeatMap(heat_map_data=heatmap_array, left_dendrogram=side_dendrogram, top_dendrogram=top_dendrogram)
heatmap.title = 'This is an example'
#heatmap.show()
heatmap.colormap = heatmap.yellowBlackBlue
heatmap.export('awesome_heatmap_plot.png')

