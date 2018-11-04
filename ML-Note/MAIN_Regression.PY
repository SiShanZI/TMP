# Boston in scikit-learn
#
# Common libs
import numpy as np
from sklearn import datasets
from sklearn.cross_validation import train_test_split
from sklearn.preprocessing import StandardScaler
# Common data preprocessing
Data_boston = datasets.load_boston()
Data_boston_X = Data_boston.data
Data_boston_Y = Data_boston.target
X_train, X_test, Y_train, Y_test = train_test_split(Data_boston_X, Data_boston_Y, test_size = 0.2, random_state = None)
#
#
#
# SVR of SVM
from sklearn import svm
# Standardized
Scaler = StandardScaler()
Scaler.fit(X_train)
X_train_std = Scaler.transform(X_train)
X_test_std = Scaler.transform(X_test)
# Model fit
Model_svr = svm.SVR(kernel = 'rbf')
Model_svr.fit(X_train_std, Y_train)
# Accuracy rate
Y_predict = Model_svr.predict(X_test_std)
print(np.corrcoef(Y_test, Y_predict))
print(sum(Y_predict - Y_test) / Y_test.shape[0])

