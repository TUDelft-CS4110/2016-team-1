This folder contains files and scripts for fuzzing ImageMagick.
We will mostly follow the tutorial from [The Fuzzing Project](https://fuzzing-project.org/).
The tools we will use are zzuf and [afl](http://lcamtuf.coredump.cx/afl/).
Since most of the easy bugs found with fuzzing are [already fixed](https://marc.info/?l=oss-security&m=141942017331222&w=2), we will use an older version of ImageMagick, specifically version 6.8.9-10.
