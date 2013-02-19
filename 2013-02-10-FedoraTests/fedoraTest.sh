#/bin/sh
#1 mean
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1 -Jfilesize_stddev=0.1 -Jnumthreads=1 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1 -Jfilesize_stddev=0.1 -Jnumthreads=5 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1 -Jfilesize_stddev=0.1 -Jnumthreads=10 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1 -Jfilesize_stddev=0.1 -Jnumthreads=20 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1 -Jfilesize_stddev=0.1 -Jnumthreads=40 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1 -Jfilesize_stddev=0.1 -Jnumthreads=80 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1 -Jfilesize_stddev=0.1 -Jnumthreads=160 -Jloopcount=10
#jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1 -Jfilesize_stddev=0.1 -Jnumthreads=320 -Jloopcount=10

#1024 mean
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1024 -Jfilesize_stddev=102 -Jnumthreads=1 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1024 -Jfilesize_stddev=102 -Jnumthreads=5 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1024 -Jfilesize_stddev=102 -Jnumthreads=10 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1024 -Jfilesize_stddev=102 -Jnumthreads=20 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1024 -Jfilesize_stddev=102 -Jnumthreads=40 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1024 -Jfilesize_stddev=102 -Jnumthreads=80 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1024 -Jfilesize_stddev=102 -Jnumthreads=160 -Jloopcount=10
#jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1024 -Jfilesize_stddev=102 -Jnumthreads=320 -Jloopcount=10

#8192 mean
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8192 -Jfilesize_stddev=819 -Jnumthreads=1 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8192 -Jfilesize_stddev=819 -Jnumthreads=5 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8192 -Jfilesize_stddev=819 -Jnumthreads=10 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8192 -Jfilesize_stddev=819 -Jnumthreads=20 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8192 -Jfilesize_stddev=819 -Jnumthreads=40 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8192 -Jfilesize_stddev=819 -Jnumthreads=80 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8192 -Jfilesize_stddev=819 -Jnumthreads=160 -Jloopcount=10
#jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8192 -Jfilesize_stddev=819 -Jnumthreads=320 -Jloopcount=10

#104858 mean
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=104858 -Jfilesize_stddev=10486 -Jnumthreads=1 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=104858 -Jfilesize_stddev=10486 -Jnumthreads=5 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=104858 -Jfilesize_stddev=10486 -Jnumthreads=10 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=104858 -Jfilesize_stddev=10486 -Jnumthreads=20 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=104858 -Jfilesize_stddev=10486 -Jnumthreads=40 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=104858 -Jfilesize_stddev=10486 -Jnumthreads=80 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=104858 -Jfilesize_stddev=10486 -Jnumthreads=160 -Jloopcount=10
#jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=104858 -Jfilesize_stddev=10486 -Jnumthreads=320 -Jloopcount=10

#1048576 mean
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1048576 -Jfilesize_stddev=104858 -Jnumthreads=1 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1048576 -Jfilesize_stddev=104858 -Jnumthreads=5 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1048576 -Jfilesize_stddev=104858 -Jnumthreads=10 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1048576 -Jfilesize_stddev=104858 -Jnumthreads=20 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1048576 -Jfilesize_stddev=104858 -Jnumthreads=40 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1048576 -Jfilesize_stddev=104858 -Jnumthreads=80 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1048576 -Jfilesize_stddev=104858 -Jnumthreads=160 -Jloopcount=10
#jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=1048576 -Jfilesize_stddev=104858 -Jnumthreads=320 -Jloopcount=10

#8388608 mean
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8388608 -Jfilesize_stddev=838861 -Jnumthreads=1 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8388608 -Jfilesize_stddev=838861 -Jnumthreads=5 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8388608 -Jfilesize_stddev=838861 -Jnumthreads=10 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8388608 -Jfilesize_stddev=838861 -Jnumthreads=20 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8388608 -Jfilesize_stddev=838861 -Jnumthreads=40 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8388608 -Jfilesize_stddev=838861 -Jnumthreads=80 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8388608 -Jfilesize_stddev=838861 -Jnumthreads=160 -Jloopcount=10
#jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=8388608 -Jfilesize_stddev=838861 -Jnumthreads=320 -Jloopcount=10

#107374182 mean
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=107374182 -Jfilesize_stddev=10737418 -Jnumthreads=1 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=107374182 -Jfilesize_stddev=10737418 -Jnumthreads=5 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=107374182 -Jfilesize_stddev=10737418 -Jnumthreads=10 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=107374182 -Jfilesize_stddev=10737418 -Jnumthreads=20 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=107374182 -Jfilesize_stddev=10737418 -Jnumthreads=40 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=107374182 -Jfilesize_stddev=10737418 -Jnumthreads=80 -Jloopcount=10
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=107374182 -Jfilesize_stddev=10737418 -Jnumthreads=160 -Jloopcount=10
#jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures6 -Jfedora_port=8080 -Jfedora_context=fedora -Jtest_label=fedora -Jfilesize_mean=107374182 -Jfilesize_stddev=10737418 -Jnumthreads=320 -Jloopcount=10
