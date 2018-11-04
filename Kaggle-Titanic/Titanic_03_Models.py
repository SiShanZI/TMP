# Logistic Regression 
# KNN or k-Nearest Neighbors 
# Support Vector Machines 
# Naive Bayes classifier 
# Decision Tree 
# Random Forrest 
# Perceptron 
# Artificial neural network 
# RVM or Relevance Vector Machine 

X_train = train_df.drop('Survived', axis = 1) 
Y_train = train_df['Survived'] 
X_test  = test_df.drop('PassengerId', axis=1).copy() 
X_train.shape, Y_train.shape, X_test.shape 

# Logistic Regression

logreg = LogisticRegression() 
logreg.fit(X_train, Y_train) 
Y_pred = logreg.predict(X_test) 
acc_log = round(logreg.score(X_train, Y_train) * 100, 2) 
acc_log 

coeff_df = pd.DataFrame(train_df.columns.delete(0)) 
coeff_df.columns = ['Feature'] 
coeff_df["Correlation"] = pd.Series(logreg.coef_[0]) 

coeff_df.sort_values(by = 'Correlation', ascending = False) 

# Support Vector Machines

svc = SVC() 
svc.fit(X_train, Y_train) 
Y_pred = svc.predict(X_test) 
acc_svc = round(svc.score(X_train, Y_train) * 100, 2) 
acc_svc 

# KNN

knn = KNeighborsClassifier(n_neighbors = 3) 
knn.fit(X_train, Y_train) 
Y_pred = knn.predict(X_test) 
acc_knn = round(knn.score(X_train, Y_train) * 100, 2) 
acc_knn 

# Decision Tree

decision_tree = DecisionTreeClassifier() 
decision_tree.fit(X_train, Y_train) 
Y_pred = decision_tree.predict(X_test) 
acc_decision_tree = round(decision_tree.score(X_train, Y_train) * 100, 2) 
acc_decision_tree 

# Random Forest

random_forest = RandomForestClassifier(n_estimators = 100) 
random_forest.fit(X_train, Y_train) 
Y_pred = random_forest.predict(X_test) 
random_forest.score(X_train, Y_train) 
acc_random_forest = round(random_forest.score(X_train, Y_train) * 100, 2) 
acc_random_forest 

models = pd.DataFrame({
    'Model': ['Support Vector Machines', 'KNN', 'Logistic Regression', 
              'Random Forest', 'Decision Tree'],
    'Score': [acc_svc, acc_knn, acc_log, 
              acc_random_forest, acc_decision_tree]}) 
models.sort_values(by = 'Score', ascending = False) 

submission = pd.DataFrame({
        'PassengerId': test_df['PassengerId'],
        'Survived': Y_pred
    }) 
submission.to_csv('submission.csv', index = False) 
