# Import libs
import numpy as np
import tensorflow as tf

C = tf.constant([6], dtype=tf.float32)
W = tf.Variable([6], dtype=tf.float32)
B = tf.Variable([6], dtype=tf.float32)
X = tf.placeholder(dtype=tf.float32)
Y = tf.placeholder(dtype=tf.float32)

# Init
Sess = tf.Session()
Init = tf.global_variables_initializer()
Sess.run(Init)

# For example, linear model
X_train = [1, 2, 3, 4, 5]
Y_train = [0, -1, -2, -3, -4]
Model = W*X + B # print(Sess.run(Model, {X: X_train}))
# FixW = tf.assign(W, [-1])
# FixB = tf.assign(B, [1])
# Sess.run([FixW, FixB])

# Loss function to be minimized
Delta = tf.square(Model - Y)
LossF = tf.reduce_sum(Delta) # print(Sess.run(LossF, {X: X_train, Y: Y_train}))
Optimizer = tf.train.GradientDescentOptimizer(0.01)
Train = Optimizer.minimize(LossF)
for i in range(1000):
    Sess.run(Train, {X: X_train, Y: Y_train})

print(Sess.run([W, B]))

# Accuracy
Curr_W, Curr_B, Curr_LossF = Sess.run([W, B, LossF], {X: X_train, Y: Y_train})
print('W: %s B: %s LossF: %s' % (Curr_W, Curr_B, Curr_LossF))

# tf.estimator
Feature = [tf.feature_column.numeric_column('X', shape=[1])]
Estimator = tf.estimator.LinearRegressor(feature_columns=Feature)
X_train = np.array([1., 2., 3., 4., 5.])
Y_train = np.array([0., -1., -2., -3., -4.])
X_test = np.array([2., 5., 8., 1.])
Y_test = np.array([-1.01, -4.1, -7, 0.])
Input_fn = tf.estimator.inputs.numpy_input_fn(
    {'X': X_train}, Y_train, batch_size=4, num_epochs=None, shuffle=True)
Train_input_fn = tf.estimator.inputs.numpy_input_fn(
    {'X': X_train}, Y_train, batch_size=4, num_epochs=1000, shuffle=False)
Test_input_fn = tf.estimator.inputs.numpy_input_fn(
    {'X': X_test}, Y_test, batch_size=4, num_epochs=1000, shuffle=False)
Estimator.train(input_fn=Input_fn, steps=1000)
Train_metrics = Estimator.evaluate(input_fn=Train_input_fn)
Test_metrics = Estimator.evaluate(input_fn=Test_input_fn)
print('Train metrics: %r' % Train_metrics)
print('Test metrics: %r' % Test_metrics)
