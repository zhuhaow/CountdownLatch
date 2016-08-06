CountdownLatch
==============

[CountdownLatch](https://docs.oracle.com/javase/7/docs/api/java/util/concurrent/CountDownLatch.html)
in Swift.

From [MSDN
Magazine](https://web.archive.org/web/20081003065703/http://msdn.microsoft.com/en-us/magazine/cc163427.aspx):

> Semaphores are one of the better known data structures in concurrent programming for many reasons, not the least of which is that semaphores have a long history in computer science dating back to operating system design in the 1960s. A semaphore is simply a data structure with a count field, and it supports two operations: put and take (often called P and V, respectively). A put operation increments the semaphore’s count by one, and a take decrements it by one. When the semaphore’s count becomes zero, any subsequent attempts to take from it will block (wait) until another a concurrent put makes the count non-zero. Both are atomic, concurrency-safe operations, ensuring that concurrent puts and takes are serialized with respect to one another. 

> ...

> A kind of "reverse semaphore" is often useful, too. That is to say, sometimes you want a data structure that supports waiting for the data structure’s count to reach zero. Fork/join parallelism—where a single "master" thread controls the execution of n "subservient" threads and then waits for them to finish—is quite common in data parallel programming, and having a reverse semaphore on hand is very useful for such cases. Most of the time, you don’t actually want waking threads to modify the count, so in this case we’ll call the structure a countdown "latch" to indicate that counts decrease, and that once set to the signaled state, the latch remains signaled (a property often associated with latches). 

> ...

> To build a countdown latch, you just initialize its counter to n, and have each subservient task atomically decrement it by one when it finishes, for example by surrounding the decrement operation with a lock or with a call to Interlocked.Decrement. Then, instead of a take operation, a thread could decrement and wait for the counter to become zero; when awoken, it will know that n signals have been registered with the latch. Instead of spinning on this condition, as in while (count != 0), it’s usually a good idea to let the waiting thread block, in which case you then have to use an event.