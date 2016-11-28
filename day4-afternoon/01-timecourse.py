#!/usr/bin/env python
import sys
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
ctab_dir = sys.argv[2]
df_metadata = pd.read_csv(sys.argv[1])
df_dots = pd.read_csv(sys.argv[3])

"""
fem_sxl = []
mal_sxl = []
df_meta_fem = df_metadata[df_metadata["sex"] == "female"]
df_meta_mal = df_metadata[df_metadata["sex"] == "male"]
for sample in df_meta_fem["sample"]:
    filename = ctab_dir + sample + "/t_data.ctab"
    df = pd.read_table( filename )
    df_trans = df[df["t_name"] == "FBtr0331261"]
    fem_sxl.append(df_trans["FPKM"].values)
for sample in df_meta_mal["sample"]:
    filename = ctab_dir + sample + "/t_data.ctab"
    df = pd.read_table( filename )
    df_trans = df[df["t_name"] == "FBtr0331261"]
    mal_sxl.append(df_trans["FPKM"].values)

fem_sxl_dots = []
mal_sxl_dots = []
df_dots_mal = df_dots[df_dots["sex"] == "male"]
df_dots_fem = df_dots[df_dots["sex"] == "female"]

for sample in df_dots_mal["sample"]:
    filename = ctab_dir + sample + "/t_data.ctab"
    df = pd.read_table( filename )
    df_trans = df[df["t_name"] == "FBtr0331261"]
    mal_sxl_dots.append(df_trans["FPKM"].values)
for sample in df_dots_fem["sample"]:
    filename = ctab_dir + sample + "/t_data.ctab"
    df = pd.read_table( filename )
    df_trans = df[df["t_name"] == "FBtr0331261"]
    fem_sxl_dots.append(df_trans["FPKM"].values)
    

df_meta_stage = df_meta_fem["stage"]

plt.figure()
plt.plot( fem_sxl, 'r-')
plt.plot( mal_sxl, 'g-')
plt.plot([4, 5, 6, 7], fem_sxl_dots, 'ro')
plt.plot([4, 5, 6, 7], mal_sxl_dots, 'go')
plt.legend(["females", "males", "female-reps", "male-reps"], loc = "upper left")
plt.xlabel("Developmental Stage")
plt.ylabel("FPKM")
plt.title("Sxl")
plt.xticks(range(0, len(df_meta_stage)), df_meta_stage)
plt.savefig("plot.png")
plt.close()


df = pd.read_table(sys.argv[4])
df_no_zero = df[df["FPKM"] > 0]
log_value = np.log10(df_no_zero["FPKM"])

plt.figure()
plt.hist( log_value, bins = 100 )
plt.xlabel("log(FPKM)")
plt.ylabel("Number")

plt.title("histo")
plt.savefig("hist.png")
plt.close()



df1 = pd.read_table(sys.argv[5])
df2 = pd.read_table(sys.argv[6])

df1_log = np.log2(df1["FPKM"] + 1)
df2_log = np.log2(df2["FPKM"] + 1)

fold_change = df1_log - df2_log
mean_expression = (df1_log + df2_log) / 2

plt.figure()
plt.scatter( mean_expression, fold_change, alpha = 0.1 )
plt.xlabel("mean expression")
plt.ylabel("fold change")
plt.title("MA plot")
plt.savefig("ma.png")
plt.close()

def quad(x):
    return X**2
quad = lambda x: x**2




import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import gaussian_kde
data = [1.5]*7 + [2.5]*2 + [3.5]*8 + [4.5]*3 + [5.5]*1 + [6.5]*8
density = gaussian_kde(data)
xs = np.linspace(0,8,200)
density.covariance_factor = lambda : .25
density._compute_covariance()
plt.plot(xs,density(xs))
plt.show()



"""

# import matplotlib.pyplot as plt
# import numpy
# from scipy import stats
# data = [1.5]*7 + [2.5]*2 + [3.5]*8 + [4.5]*3 + [5.5]*1 + [6.5]*8
# density = stats.kde.gaussian_kde(data)
# x = numpy.arange(0., 8, .1)
# plt.plot(x, density(x))
# plt.show()


from scipy import stats
df = pd.read_table(sys.argv[7])
df_log = df["FPKM"]
#df_raw_zero = df[df["FPKM"] > 0]
#df_log = np.log10(df["FPKM"] + 1)

#density_raw = stats.kde.gaussian_kde(df_raw)
#density_raw_zero = stats.kde.gaussian_kde(df_raw_zero)
density_log = stats.kde.gaussian_kde(df_log)
density_log.covariance_factor = lambda : .1
density_log._compute_covariance()
x = np.linspace(-50, 50, 500)
plt.figure()
plt.plot(x, density_log(x))
plt.savefig("dens.png")
plt.close()