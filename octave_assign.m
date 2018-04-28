data = dlmread("train.csv",",",1,0);
X_train = data(:,1);
Y_train = data(:,2);
n = 10000;
a = ones(n,1);
nX_train = [a,X_train];
w = rand(2,1);
hold on;
scatter(X_train,Y_train,"filled");
plot(w'* nX_train', X_train);

close

w_direct = (nX_train' * nX_train)^(-1) * (nX_train' * Y_train);
hold on;

scatter(X_train,Y_train,"filled");
plot(w_direct'* nX_train', X_train);

close

for i= 1:2,
	for j= 1:n,
		X = data(j,:);
	    Xt = [1,X(:,1)]';
	    w = w - (0.00000001 * (w'*Xt - X(:,2)) * Xt);
        if(mod(j,100)==0),
        	hold on;
            scatter(X_train,Y_train,"filled");
            plot(w'* nX_train', X_train);
            
            
        end,
    end,
end,

hold on;
scatter(X_train,Y_train,"filled");
plot(w'* nX_train', X_train);

close




data_test = dlmread("test.csv",",",1,0);
X_test = data_test(:,1);
Y_test = data_test(:,2);
n_test = 10500;
a = ones(n_test,1);
nX_test = [a,X_test];

Y_pred1 = nX_test*w;
S1 = sqrt(meansq(Y_pred1 - Y_test))
Y_pred2 = nX_test*w_direct;
S2 = sqrt(meansq(Y_pred2 - Y_test))

disp(sprintf("%i is root mean squared error between y_pred1 and y_test.",S1));
disp(sprintf("%i is root mean squared error between y_pred2 and y_test.",S2));

