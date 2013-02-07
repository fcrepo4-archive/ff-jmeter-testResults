Modeshape Test Results
=====================
Modeshape version: 3.1.1 (http://www.jboss.org/modeshape/downloads/downloads3-1-1-final.html) with a fedora rest api implementation (https://github.com/futures/ff-modeshape-prototype)

Test code: https://github.com/futures/ff-jmeter-madness/blob/14e9184dd023be002c5ff187002a8f1617e518f7/plans/fedora.jmx  

The results of the test run in the log directory  

The various plots analyzing the test reults are in the results directory  

The stats visualizations were done using R (http://www.r-project.org/) 
  * The code used to produce the graphs is available in fedora-jmx.r.  
  * To run the code
    $ R
    > source(fedora-jmx.r)

The file systemInfo.txt contains information of the system where the tests were run  

TODO
----
* Add box plots for create, read and delete actions 
