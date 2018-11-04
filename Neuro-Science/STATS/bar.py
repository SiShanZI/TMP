import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt

Data_F = pd.read_csv('task_3_8.csv').dropna()
Mean = []; Std = []
for i in ['aMCI', 'Ctrl', 'Rgd']:
    Mean.append(Data_F['bl_ge'][Data_F.group==i].mean()); Mean.append(Data_F['fp_ge'][Data_F.group==i].mean())
    Std.append(Data_F['bl_ge'][Data_F.group==i].std()); Std.append(Data_F['fp_ge'][Data_F.group==i].std())

with plt.style.context('MY'):
    mpl.rcParams['xtick.major.bottom'], mpl.rcParams['figure.subplot.hspace'] = 'False', 0.8
    fig = plt.figure(); # fig.add_subplot(221)
    bar_1 = plt.bar([0, 2.5, 5], [Mean[0], Mean[2], Mean[4]], color='b', yerr=[Std[0], Std[2], Std[4]], ecolor='k')
    bar_2 = plt.bar([1, 3.5, 6], [Mean[1], Mean[3], Mean[5]], color='r', yerr=[Std[1], Std[3], Std[5]], ecolor='k')
    plt.legend([bar_1, bar_2], ['bl', 'fp'], fontsize=15)
    ##
    plt.ylim([0, 60]); # plt.xlim([])
    plt.xticks([0.5, 3, 5.5], ['aMCI', 'Ctrl', 'Rgd'], fontsize=20); # plt.yticks([])
    plt.xlabel(''); plt.ylabel('Eff_glob', fontsize=30)
    # plt.title('Eff_glob', fontsize=30)
    plt.show()

