# %%
1 + 1

# %%
# import numpy and pandas and create 3 dataframes
import numpy as np
import pandas as pd

df1 = pd.DataFrame(np.random.randn(10, 5))
df2 = pd.DataFrame(np.random.randn(10, 5))
df3 = pd.DataFrame(np.random.randn(10, 5))

# %%
# display the first dataframe
df1

# %%
# import matplotlib and plot the first dataframe
import matplotlib.pyplot as plt

df1.plot()
# %%
