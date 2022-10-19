import pandas as pd
import io

# remove bad chraraters
str = open('hse_2019_eul_20211006.csv', 'rt').read()
str = bytes(str, 'utf-8').decode('utf-8', 'ignore')
data = io.StringIO(str)
df = pd.read_csv(data, sep=",")

# convert to float as much as possible
for c in df.columns:
    df[c] = pd.to_numeric(df[c], errors='coerce')

# drop categorical columns and save all
df = df.dropna(axis=1, how='all', )

# a fast look to levels
numeric_levels = {c:len(set(df[c].dropna())) for c in df.columns}
numeric_levels = dict(sorted(numeric_levels.items(), key=lambda item: item[1]))

# columns choosen
group_a = ['SYS1OM', 'DIAS1OM', 'PULS1OM', 'MAP1OM', 'SYS2OM', 'DIAS2OM', 'PULS2OM', 'MAP2OM', 'SYS3OM', 'DIAS3OM', 'PULS3OM', 'MAP3OM', ]
group_b = ['Height', 'HtM17', 'Weight', 'WtM17', 'HtSR', 'WtSR', 'EstHt2', 'EstWt2', 'HtVal', 'WtVal', 'WtVal2', 'BMI', 'BMIVal', 'BMIVal2', 'BMIsr', 'waist1', 'hip1', 'waist2', 'hip2', 'waist3', 'hip3', 'wstval', 'hipval', 'whval', ]

small_a = ['SYS3OM', 'DIAS3OM', 'PULS3OM', 'MAP3OM', ]
small_b = ['HtVal', 'WtVal', 'wstval', 'hipval', 'whval', ]

# drop columns with too mani NaNs
how_many_not_nans = {c:len(df[c].dropna()) for c in df.columns}

for k, v in how_many_not_nans.items():
    if v < 5000:
        try:
            group_a.remove(k)
        except:
            pass
        try:
            group_b.remove(k)
        except:
            pass
# save
dt = df[group_a + group_b].dropna()
dt.to_csv('hse-clean.csv', index=False)