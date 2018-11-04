# Iris in scikit-learn
# Common libs
import numpy as np
from sklearn import datasets
from sklearn.cross_validation import train_test_split
from sklearn.preprocessing import StandardScaler
# Common data preprocessing
Data_iris = datasets.load_iris()
Data_iris_X = Data_iris.data
Data_iris_Y = Data_iris.target
#
#
#
# SVC of SVM
from sklearn import svm
# Model fit
Model_svc = svm.SVC(kernel = 'rbf', random_state = None)
#
# Accuracy rate 1
#
X_train, X_test, Y_train, Y_test = train_test_split(Data_iris_X, Data_iris_Y, test_size = 0.2, random_state = None)
Model_svc.fit(X_train, Y_train)
Y_predict = Model_svc.predict(X_test)
print('%f%%' % (sum(Y_predict == Y_test) * 100.0 / Y_predict.shape[0]))
#
# Accuracy rate 2
#
from sklearn.cross_validation import KFold
from sklearn.cross_validation import cross_val_score
Score = cross_val_score(Model_svc, Data_iris_X, Data_iris_Y, cv = KFold(n = Data_iris_Y.shape[0], n_folds = 10), scoring = 'accuracy')
print(Score.mean())
#
#
#
# Logistic regression
from sklearn import linear_model
# Standardized
Scaler = StandardScaler()
Scaler.fit(X_train)
X_train_std = Scaler.transform(X_train)
X_test_std = Scaler.transform(X_test)
# Model fit
Model_lr = linear_model.LogisticRegression(C = 1000, random_state = None)
Model_lr.fit(X_train_std, Y_train)
# Accuracy rate
# Model_lr.predict_proba(X_test_std)
Y_predict = Model_lr.predict(X_test_std)
print('%f%%' % (sum(Y_predict == Y_test) * 100.0 / Y_predict.shape[0]))

