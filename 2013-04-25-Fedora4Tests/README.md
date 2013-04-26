# Fedora4 Test Results

Fedora 4 version: https://github.com/futures/fcrepo-kitchen-sink/tree/436d174b0e224a15b5c47709a9196c0a9af2ed3d

System info: The file [systemInfo.txt](/2013-04-25-Fedora4Tests/systemInfo.txt/) contains information of the system where the tests were run 

The results of the test run are in the [log](/2013-04-25-Fedora4Tests/log/) directory.

The various plots analyzing the test reults are in the [results](/2013-04-25-Fedora4Tests/results/) directory  
 * [StatusOfResponse.png](/2013-04-25-Fedora4Tests/results/StatusOfResponse.png) shows the count of the different response codes received for an operation, grouped for each thread count

 * [ThreadCountVsElapsedTime.png](/2013-04-25-Fedora4Tests/results/ThreadCountVsElapsedTime.png) shows a box plot of time taken to complete each response for each thread count

 * [ThreadCountVsElapsedTimebyOperation.png](/2013-04-25-Fedora4Tests/results/ThreadCountVsElapsedTimebyOperation.png) shows a box plot of time taken to complete each response for each thread count, grouped by type of operation
   * [What is a box plot?](http://en.wikipedia.org/wiki/Box_plot)


## About the test

 * Test code: https://github.com/futures/ff-jmeter-madness/blob/c023e03df540ae9aadba1d06c03e5de158e78680/plans/fedora.jmx
    * With the Fedora 3 tests disabled - Fedora 3 Describe, Delete Fedora 3 Existing Objects, Fedora 3 thread group (testing Fedora4 only)

 * The jmeter tests were modified to perform deletes before and after the test as a clean-up exercise, apart from perfroming deletes as a part of the test.

 * The test was repeated for 
    * a range of file sizes with mean 1B, 1kB, 8kB, 0.1MB, 1MB, 8MB and 100MB used as data for the datastreams 
    * for different thread counts (concurrent requests performed by Jmeter) - 1, 5, 10, 20, 40 and 80 threads

 * The test script [fedoraTest.sh](/2013-04-25-Fedora4Tests/fedora4Test.sh) was used to execute the test code with the different test parameters - file size and thread count

 * The test results are saved in csv files in the directory /opt/ff-jmeter-madness/log
   * For information regarding the test results produced by J, see https://wiki.duraspace.org/display/FF/FF+Candidate+Test+Harness#FFCandidateTestHarness-TestResults


### Running the tests

 * The tests were run from futures1 with fedor4 running on futures6

 * SSH to futures1 and cd to /opt/ff-jmeter-madness. This is cloned from the remote repo https://github.com/futures/ff-jmeter-madness

 * The jmeter plan executed is located at plans/fedora.jmx

 * To run the jmeter plan, run the command

    $ jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_4_server=futures6 -Jfedora_4_context=fcrepo/rest -Jfilesize_mean=1024 -Jfilesize_stddev=102 -Jnum_threads=5 -Jloop_count=10

 * If not already available, copy the test script [fedoraTest.sh](/2013-04-25-Fedora4Tests/fedora4Test.sh) to /opt/ff-jmeter-madness in futures1 and run the script in the background or using screen.

 * The test results are saved in csv files in the directory /opt/ff-jmeter-madness/log. 


## Analysing the test results

 * The stats visualizations were done using R (http://www.r-project.org/). 

 * See https://wiki.duraspace.org/display/FF/FF+Candidate+Test+Harness#FFCandidateTestHarness-Analyzingthetestresults for more information

 * The code used to produce the graphs is in [fedora-jmx.r](/2013-04-25-Fedora4Tests/fedora-jmx.r).

 * SCP the test results from /opt/ff-jmeter-madness/log to the machine where you have R installed

 * To execute the code, from within R, type  

    > source('/path/to/the/file/fedora-jmx.r')

 * The program will ask you to choose the directory which contains the test results (csv format)

 * It will run through all the files, gather the data and produce 3 graphs and a summary of the data. These will be saved in your current working directory.

