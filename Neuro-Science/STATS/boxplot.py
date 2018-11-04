import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt

Data_F = pd.read_csv('task_3_8.csv').dropna()
Dots = []
for i in ['aMCI', 'Ctrl', 'Rgd']:
    Dots.append(Data_F['bl_ge'][Data_F.group==i]); Dots.append(Data_F['fp_ge'][Data_F.group==i])

with plt.style.context('MY'):
    mpl.rcParams['xtick.major.bottom'], mpl.rcParams['figure.subplot.hspace'] = 'False', 0.8
    fig = plt.figure(); # fig.add_subplot(221)
    plt.boxplot(Dots, showmeans='True', meanline='True', positions=[0, 1, 3, 4, 6, 7], sym='r', boxprops={'color':'k'})
    ##
    plt.ylim([0, 100]); # plt.xlim([])
    plt.xticks([0.5, 3.5, 6.5], ['aMCI_bl_fp', 'Ctrl_bl_fp', 'Rgd_bl_fp'], fontsize=15); # plt.yticks([])
    plt.xlabel(''); plt.ylabel('Eff_glob', fontsize=30)
    # plt.title('Eff_glob', fontsize=30)
    plt.show()

