#!/usr/bin/env python

import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA

df = pd.read_csv( sys.argv[1], index_col = 0)

n, p = df.shape
pca = PCA()
fit = pca.fit(df)
x = pca.transform(df)
plt.figure()
plt.plot(fit.components_.T)
plt.xticks(range(len(df.columns)), df.columns, rotation = 45)
plt.subplots_adjust(bottom=0.2)
plt.legend()
plt.show()


