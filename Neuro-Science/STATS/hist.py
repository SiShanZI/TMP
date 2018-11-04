import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt

Data_F = pd.read_csv('task_3_8.csv').dropna()
Dots = []
for i in ['aMCI', 'Ctrl', 'Rgd']:
    Dots.append(Data_F['age'][Data_F.group==i])

with plt.style.context('MY'):
    mpl.rcParams['xtick.major.bottom'], mpl.rcParams['figure.subplot.hspace'] = 'False', 0.8
    fig = plt.figure()
    for j in range(3):
        fig.add_subplot('31' + str(j+1))
        plt.hist(Dots[j], bins=5)
        ##
        plt.xlim([55, 85]); # plt.ylim([])
        plt.yticks([0, 5, 10, 15]); # plt.xticks([])
        plt.ylabel('Counts', fontsize=20)
        ##
        if j==0: plt.title('Age distribution', fontsize=30); plt.xlabel('aMCI', fontsize=20)
        if j==1: plt.xlabel('Ctrl', fontsize=20)
        if j==2: plt.xlabel('Rgd', fontsize=20)
    
    plt.show()

