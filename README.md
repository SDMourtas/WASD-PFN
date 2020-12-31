# WASD based PFN
Implementation of a speedy weights and structure determination (WASD) algorithm for the power-activation feed-forward neuronet (PFN) for solving time-series modeling and forecasting problems.\
The purpose of this package is to solve multi-interval-ahead forecasting problems. By considering this problem's approach through PFN and by using the weight direct determination (WDD) process, WASD can find the optimal weights directly from the hidden layer to the output layer. In this way, by searching for the structure with the best performance of testing, WASD can define the PFN’s optimal structure, which leads to a good modeling performance. More precisely, the main articles used are the followings:
*	T.E. Simos, S.D.Mourtas, V.N.Katsikis, "Time-Varying Black-Litterman Portfolio Optimization under Nonlinear Constraints via Neuronets and BAS Algorithm," (submitted)
*	Y. Zhang, W. Lao, L. Jin, T. Chen, and J. Liu, "Growing-type WASD for power-activation neuronet to model and forecast monthly time series," in Proc. 10th IEEE Int. Conf. Control and Automation (ICCA), pp. 1312-1317, 2013.

# M-files Description
*	Main_WASD_PFN.m: the main function and parameters declaration
*	OHLW.m: function for finding the optimal hidden-layer neurons weights of the PFN
*	WASD.m: function for finding the optimal input-layers number of the PFN
*	Qmatrix.m: function for calculating the matrix Q
*	problem.m: input data and parameters of the WASD based PFN setup
*	predictPFN.m: function for forecasting future prices
*	testPFN.m: function for testing the optimal hidden-layer neurons weights of the PFN
*	detrendd.m: function for removing the time-series trend
*	Normalization.m: function for normalization
*	Postprocessing.m: function for denormalization and for adding the time-series trend

# Installation
*	Unzip the file you just downloaded and copy the WASD-PFN directory to a location,e.g.,/my-directory/
*	Run Matlab/ Octave, Go to /my-directory/WASD-PFN/ at the command prompt
*	run 'Main_WASD_PFN (Matlab/Octave)

# Results
After running the Main_WASD_PFN.m file, the package outputs are the following:
*	The optimal input-layers number of the PFN.
*	The optimal hidden-layer neurons weights of the PFN.
*	Forcast of the future prices.
* The time consumptions of the WASD based PFN.
*	The graphic illustration of the testing and forecasting prices performance.

# Environment
The WASD-PFN package has been tested in Matlab 2018b on OS: Windows 10 64-bit.
