import numpy as np
import matplotlib.pyplot as plt
import csv
n_train=10000

data= np.loadtxt('train.csv',delimiter=',',skiprows=1)

X = np.c_[np.ones(data.shape[0]),data[:,0]]
Y = np.c_[data[:,1]]

w = np.random.rand(2,1)

plt.plot(X[:,1],Y,'ro')

mul= w.T.dot(X.T)
plt.scatter(X[:,1], Y , c='r', marker='.', linewidths=1)
plt.plot(X[:,1],mul.T,'-o')
w_direct = np.linalg.inv(X.T.dot(X)).dot(X.T.dot(Y))

mul2= w_direct.T.dot(X.T)
plt.scatter(X[:,1], Y , c='r', marker='.', linewidths=1)
plt.plot(X[:,1],mul2.T,'-o')
plt.plot()

for i in xrange(1,2):
    for j in xrange(1,n_train):
        X1=X[j,:]
        Y1=Y[j]
        X1t=X1.T
        eta=0.00000001
        w= w- eta*(w.T.dot(X1t)-Y1)*(X1t)
        if j%100 ==0:
            plt.scatter(X[:,1], Y , c='r', marker='.', linewidths=1)
	    plt.plot(X[:,1],(w.T.dot(X.T)).T,'-o')

plt.scatter(X[:,1], Y , c='r', marker='.', linewidths=1)
plt.plot(X[:,1],(w.T.dot(X.T)).T,'-o')
plt.plot()


testnpath = raw_input("testing data set location-->")
raw_data2 = open(testnpath, 'rt')
data2 = np.loadtxt(raw_data2, delimiter=",",skiprows=1)
xtest = np.c_[np.ones(data2.shape[0]),data2[:,0]]
ytest = np.c_[data2[:,1]]
n_test = 1000	
ypred1 = xtest.dot(w)
ypred2 = xtest.dot(w_direct) 
O1 = 1/(2*n_test)*np.sum(np.square(ypred1-ytest))
O2 = 1/(2*n_test)*np.sum(np.square(ypred2-ytest))
print O1,
print O2
        





