#/bin/sh
jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures5 -Jfedora_port=9999 -Jfedora_context=rest -Jnumthreads=1 -Jloopcount=10 -Jfilesize_mean=1024 -Jfilesize_stddev=102 -Jtest_label=modeshape

jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures5 -Jfedora_port=9999 -Jfedora_context=rest -Jnumthreads=5 -Jloopcount=10 -Jfilesize_mean=1024 -Jfilesize_stddev=1 -Jtest_label=modeshape

jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures5 -Jfedora_port=9999 -Jfedora_context=rest -Jnumthreads=1 -Jloopcount=10 -Jfilesize_mean=8192 -Jfilesize_stddev=819 -Jtest_label=modeshape

jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures5 -Jfedora_port=9999 -Jfedora_context=rest -Jnumthreads=5 -Jloopcount=10 -Jfilesize_mean=8192 -Jfilesize_stddev=819 -Jtest_label=modeshape

jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures5 -Jfedora_port=9999 -Jfedora_context=rest -Jnumthreads=1 -Jloopcount=10 -Jfilesize_mean=104858 -Jfilesize_stddev=10486 -Jtest_label=modeshape

jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures5 -Jfedora_port=9999 -Jfedora_context=rest -Jnumthreads=5 -Jloopcount=10 -Jfilesize_mean=104858 -Jfilesize_stddev=10486 -Jtest_label=modeshape

jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures5 -Jfedora_port=9999 -Jfedora_context=rest -Jnumthreads=1 -Jloopcount=10 -Jfilesize_mean=1048576 -Jfilesize_stddev=104858 -Jtest_label=modeshape

jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures5 -Jfedora_port=9999 -Jfedora_context=rest -Jnumthreads=5 -Jloopcount=10 -Jfilesize_mean=1048576 -Jfilesize_stddev=104858 -Jtest_label=modeshape

jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures5 -Jfedora_port=9999 -Jfedora_context=rest -Jnumthreads=1 -Jloopcount=10 -Jfilesize_mean=8388608 -Jfilesize_stddev=838861 -Jtest_label=modeshape

jmeter/bin/jmeter.sh -n -t plans/fedora.jmx -Jfedora_server=futures5 -Jfedora_port=9999 -Jfedora_context=rest -Jnumthreads=5 -Jloopcount=10 -Jfilesize_mean=8388608 -Jfilesize_stddev=838861 -Jtest_label=modeshape


