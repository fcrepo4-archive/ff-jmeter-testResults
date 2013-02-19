Modeshape Test Results
=====================
Modeshape version: 3.1.1 (http://www.jboss.org/modeshape/downloads/downloads3-1-1-final.html) with a fedora rest api implementation (https://github.com/futures/ff-modeshape-prototype)

Test code: https://github.com/futures/ff-jmeter-madness/blob/14e9184dd023be002c5ff187002a8f1617e518f7/plans/fedora.jmx

The file [systemInfo.txt](/2013-02-ModeshapeTests/systemInfo.txt/) contains information of the system where the tests were run


Test results
-----------------------
The results of the test run are in the [log](/2013-02-ModeshapeTests/run1/log/) directory  

The various plots analyzing the test reults are in the [results](/2013-02-ModeshapeTests/run1/results/) directory  
 * [StatusOfResponse.png](/2013-02-ModeshapeTests/run1/results/StatusOfResponse.png) shows a stacked bar chart with the count of the different response codes received for an operation, grouped for each thread count
 * [ThreadCountVsElapsedTime.png](/2013-02-ModeshapeTests/run1/results/ThreadCountVsElapsedTime.png) shows a box plot of time taken to complete each response for each thread count
 * [ThreadCountVsElapsedTimebyOperation.png](/2013-02-ModeshapeTests/run1/results/ThreadCountVsElapsedTimebyOperation.png) shows a box plot of time taken to complete each response for each thread count, grouped by type of operation
   * [What is a box plot?](http://en.wikipedia.org/wiki/Box_plot)


About the test
--------------
 * Test code: https://github.com/futures/ff-jmeter-madness/blob/14e9184dd023be002c5ff187002a8f1617e518f7/plans/fedora.jmx
 * These initial jmeter tests were wriiten to perform create, read and delete operations on Modeshape using the fedora rest api implementation for modeshape (https://github.com/futures/ff-modeshape-prototype)
 * The test was repeated for 
    * a range of file sizes with mean 1kB, 8kB, 0.1MB, 1MB, 8MB used as data for the datastreams 
    * for different thread counts (concurrent requests performed by Jmeter) - 1 and 5 threads
 * The test script [modeshapeTest.sh](/2013-02-ModeshapeTests/modeshapeTest.sh) was used to execute the test code with the different test parameters - file size and thread count

Analysing the test results
-----------------------
The stats visualizations were done using R (http://www.r-project.org/). 

The code used to produce the graphs is available in [fedora-jmx.r](/2013-02-ModeshapeTests/fedora-jmx.r)
 * To execute the code, from within R
    $ R
    > source('/path/to/the/file/fedora-jmx.r')
 * The program will ask you to choose the directory which contains the test results (csv format)
 * It will run through all the files, gather the data and produce 3 graphs and a summary of the data. These will be saved in your current working directory.



