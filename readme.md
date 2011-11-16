A tiny example of a rails app serving requests asynchronously.
==============================================================

relevant things to look at
--------------------------
 * mycontroller_controller.rb
 * application.rb (`config.threadsafe!`)
 * Procfile


how to run the server
---------------------
synchronously: `bundle exec thin start`

asynchronously: `bundle exec thin start --threaded`


how to observe synchronous vs. asynchronous behavior
----------------------------------------------------
compare behavior when refreshing http://0.0.0.0:3000/mycontroller/slow and http://0.0.0.0:3000/mycontroller/fast. When running without threads, fast will always have to wait for slow. When running with threads, you can refresh fast with wild abandon while waiting for a request to slow to finish.


how to benchmark
----------------

`ab -n 1000 -c 10 http://0.0.0.0:3000/mycontroller/fast`

Threaded mode is successfully asynchronous, but serves fewer requests per second.


open questions
--------------
1. Is anyone in the world doing this in production?
2. How does thin decide how many threads to create?
3. What is the space complexity of each thread?
4. Why is threaded slower? (MRI 1.9.2 and 1.9.3)

discussion elsewhere
--------------------

 * https://groups.google.com/d/topic/thin-ruby/Kv4Ftb7HBcU/discussion
 * http://stackoverflow.com/questions/8146851/how-to-deploy-a-threadsafe-asynchronous-rails-app

