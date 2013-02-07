Fedora Test Results
=====================
Fedora version: 3.6.2 (https://wiki.duraspace.org/display/FEDORA36/Downloads)  

Test code: https://github.com/futures/ff-jmeter-madness/blob/14e9184dd023be002c5ff187002a8f1617e518f7/plans/fedora.jmx  

The results of the test run are in the [log](/2013-02-01-FedoraTests/log/) directory  

The various plots analyzing the test reults are in the [results](/2013-02-01-FedoraTests/results/) directory  

The stats visualizations were done using R (http://www.r-project.org/)
The code used to produce the graphs are in the directory [RCode](/2013-02-01-FedoraTests/RCode/).  

The file [systemInfo.txt](/2013-02-01-FedoraTests/systemInfo.txt/) contains information of the system where the tests were run  

TODO
----
* Add box plots for create, read and delete actions 
* The stats code needs to be cleaned as it has a lot fo redundant lines. For now, I have just copied it as is from my work space.
