### Session 2-3 (Data Management)

**Data dictionaries:** Documentation included with datasets that give data scientists information on the variable category (categorical or numeric), measurements used (grams, lbs, Kelvin), or context that's specific to the dataset.

**Importing data in R:** `read.csv('data')` To import a package, `library() & install.packages(' ')` are typically used.

**Slicing data:** To slice row 1, column 3, the syntax is `df[1,3]`. To slice rows it's `df[1, ]` where the space after the comma means slice row 1 with no restrictions on columns. This notation is used for training and test datasets too. For example, `df[trainingCases, ]`. 

**Type casting:** This is used to reassign one data type to another. R's syntax for type casting is similar to Python. To cast a variable as a boolean: `df$var = as.logical(df$var)`. Methods like `as.factor` and `as.numeric` are also used. Each of these reassign the casted variable back to itself. 
[Github repo with Data Management HW](https://github.com/zaynpatel/learning-r/blob/main/day_two/HW_DM.R)

### Session 4 (Data Visualization)

There are four types of visualization charts: comparison, distribution, relationship, and composition. 

Comparison charts include line charts, which compare across time and bar charts, which compare by value or by total. 

Distribution charts include histograms, box plots, and heatmaps which show a distribution of a range over a given X. Most commonly, that X is time. 

Relationship charts show a relationship between two numeric variables. Scatterplots are most commonly used in this category. 

Composition charts include stacked bar charts which break a variable down by category. 

Fundamentally, visualizations share an insight with a viewer that might be unobvious or hard to see while reading a description about it. 

### Session 5-7 (Linear Regression)
Linear regression is used in classical statistics to *predict* a given output value based on a linear equation (y = mx + b). I used it in [a lab](https://github.com/zaynpatel/isim/blob/main/lab3/lab3.ipynb) to predict the value of a new washer value and calculate the % error of my model. 

Sum of the squared error (SSE) regression has become popular to reduce the total error over all predictions. 

In *predictive statistics* the fundamentals of linear regression in the form of a y = mx+b equation remain the same but there are multiple coefficients with x values and the product of them equal the target (y-variable). 

Overfitting and underfitting are used to measure the quality of a model. Overfitting means the the model gives accurate predictions for training data but not test data. In other words, the model is so fit to the training data it's unable to predict new inputs correctly. In underfitting, the model doesn't have enough datapoints to accurately predict input and output variables. 

There are two ways to build a model in linear regression: forwards and backwards. 

Forward building includes adding variables one-by-one to test their impact on the error rate of the model. Backward building includes putting all the variables into the model and removing the predictor variables that negatively impact the model. Backward building is also called stepwise regression. 

I mentioned the "error rate" above. Usually this is measured by AIC. AIC iteratively runs a stepwise regression on the model until its value is "optimized enough" such that the next variable it tries to remove increases its score. *Obviously, a lower AIC score is better and this method is usually best for smaller datasets.* 

Benchmarking in ML includes testing how a model performs after training a dataset versus without its training. In other words, data scientists want to see if a model made an impact on prediction or if the data output would've been the same without the model. 

There are two measures of performance used in the benchmarking phase/to evaulate a model: RMSE and MAPE. 

RMSE is root mean squared error and is `sqrt(mean(erorrs^2)`. *It measures the average difference between values predicted by a model and the actual values.*

MAPE is mean absolute percentage error and is `mean(abs(errors/observations))`. It measures a forecasts accuracy independent of its time scale/other data. 

Lastly, there are 4 linear regression assumptions in classical statistics that follow the multiply by zero model: if any one of these regression assumptions is violated, the model is not a good one. They are: linearity (is it clear that there is a linear pattern we can observe), independence (are the variables independent of each other), normality (they follow a normal dist for any value of x, y), equal variance (variances are the approximately the same for each sample).

### Session 8 (Imputation)
Imputation is the process of filling missing values. Some ways to do this are:
* central tendency imputation: filling values with the mode (categorical vals, especially) or the mean (numeric vals, especially). This imputation method changes the shape of a variable because it might fill one column more than the other, introducing a skew to the distribution. 
* bootstrap imputation: filling missing values by randomly sampling from known column values. 
* predictive imputation: build a predictive model to fill missing values, using known values as the target and other columns as inputs. This is the *gold standard* but is difficult to build and requires high volumes of data.

### Session 9-10 (KNN Regression/Classification)
K-nearest-neighbors predicts a value based on a mean of the k values around it. For example, an input is placed on a 2D plot but its value is unknown. To figure out its value, we can use KNN to average k=3 of its nearest neighbors and assign that input a value. 

KNN is a distance based algorithm because it's measuring the distance between each of the neighbors to figure out the value of the input, as mentioned in the example above. Mathematically, KNN uses Euclidean distance, which works in N-dimensional spaces. 

The k-value in KNN is chosen based on cross-validation, choosing different samples of training and test data, and evaluating the test model to see what value of k produces the lowest error %. 

In order to prevent outlier prone outputs, KNN uses common ML methods: normalization and standardization. Normalization works by creating a range where all values fall into the values 0-1. Standardization puts values on the same scale so no one value dominates the computation. Running both of these methods is the best way to choose if normalization or standardization is better for a model. 

### Session 11-12 (Logistic Regression)
Logistic Regression is a variant of Linear Regression (Session 5-7) that is used for binary classification (yes/no for a given observation). Spam filtering is an example, although Naïve Bayes is traditionally used for that problem. 

We begin by looking at the probability of an event occuring. Specifically, we want to look at it in terms of odds. Mathematically, we get odds by dividing the probability (p) of an event by the probability it doesn't happen (1-p). If we plot the number of something occuring (ex: number of spelling errors) by the odds of something happening (ex: odds of spam), we'll see an exponential curve where as the number of errors increases and approaches a higher number, the probability that the email is spam will shoot up (theoretically to 1 because we're still binary classifying). To reverse the exponential, logistic regression plots the logarithm of the odds. 

The formula for logistic regression is the log of the odds = the y-int + the slope multiplied by s (spelling errors or any other quantity we're measuring). 

Note that when we define the formula and remove the logarithm, the function becomes multiplicative meaning the odds that a message is spam increase by an exponential factor. 

Defined in the lecture was the word monotonic relationship which means a) as the value of one variable increases, the other does too or b) as one variable increases the other decreases. 

To build the logistic regression model, we write `model = glm(ISHIGHVAL ~ ., data=training, family=binomial)` noting that the family is binomial. A binomial probability distribution is one that predicts the models the probability of achieving one outcome (0, 1; yes, no). The equation isfun to look at and I've included a picture with logic of how I obtained it from first principles. 

To evaluate the performance of a logistic regression curve, we use sensitivity (number of observed true values we predict correctly) and specificity (# of observed false's we predict correctly). We compute this by dividing the # of observed trues by all trues, usually by looking at a misclassification table (a.k.a confusion matrix). Sensitivity and specificity values can change based on the probability value we choose. If we increase the probability value to 0.95, for example, the number of observed trues will likely reduce, reducing our sensitivity. Similar to choosing a confidence level, this value is context-based. 

We can also use error rate (the number of times we predicted wrong) as a metric too. These metrics appear in the R global environment and the data scientist should be monitoring these values to ensure they appear within similar range of each other. 

Algorithmically, this looks like `predictionsTF != observations / nrow(test)`. Our error rate is equal to the predictions in the true/false variable that don't equal the observations (test) divided by the total rows in test. 

Visually, we use ROC Charts and Lift Charts to plot the error. In ROC Charts, the goal is to view the area under the curve to see how close our curve is to the ideal variable we're measuring. More area under the curve typically means we're closer to the corner of our ideal value (false positive rate 0, true positive rate 1). In Lift Charts, the initial data table is separated into the probability of something occurring and the observation (was it true or false). The predictions are sorted in descending order. Visually, as the lift chart moves along the x-axis (where the index is), the lift gets smaller, meaning the distance between predictions and ideals reduces. In the example, there is a higher 'cost' to being False at index zero than there is at index 50 because if you're wrong at index 0, the probability is 0.99 and  your observed value is True. 

### Session 15-16 (Classification and Regression Trees)
Decision trees can work with any number of variables. They're composed of nodes (data of the tree. In R, this represents the current prediction, percent target value, percent of the total dataset) and edges (relationships between nodes). 

Random forests are *ensembles* of trees and train multiple decision trees on different subsets of data to get a final, accurate result. These structures help mitigate overfitting by aggregating the predictions of multiple trees. 

Gini impurity is mathematically calculated via `p(1-p)` and conceptually means how often a randomly chosen data point from one node is incorrectly classified if it were randomly labelled according to class variables. 

The decision to stop splitting based based on the minimum size the data can be split into before overfitting. If the data is split into too many branches (in R this method is `minbucket`), it's not general enough to fit new data. The minimum number of samples (in R this method is `minsplit`) needed is another criterion because if there aren't enough samples the model will be underfit. 

Pruning, removing branches from a tree, happens after the model is built whereby branches that don't meaningfully contribute are omitted. 

K-fold cross-validation is a technique for evaluating the performance of a model by dividing the data into K subsets and training the model on K-1 subsets while testing it on the remaining subset. This process is repeated K times, with each subset serving as the test set once. The results are averaged to obtain an estimate of the model's performance. It is not used to decide how to split the tree or when to stop splitting. The model is chosen based on which subset produced the minimum amount of error. 

Just as in neural networks where backpropogation is used to reduce the loss function, ML models have methods to do this too. As I mentioned in line 92, the gini impurity is a method to minimize the error rate of the model by deciding what's a good split versus not a good split. 

Trees are a computationally expensive model because they have an exponential runtime. As the tree grows, the nodes and branches increase exponentially. 
