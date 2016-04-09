# Fuzzing ImageMagick
This folder contains files and scripts for fuzzing ImageMagick.
We will mostly follow the tutorial from [The Fuzzing Project](https://fuzzing-project.org/).
The tool we will use is [afl](http://lcamtuf.coredump.cx/afl/).

Since most of the easy bugs found with fuzzing are [already fixed](https://marc.info/?l=oss-security&m=141942017331222&w=2), we will also use an older version of ImageMagick (6.8.9-10) and compare it with the current version (6.9.3-7).

There are some issues when multiple versions of ImageMagick are installed.
You can uninstall by running `sudo apt-get purge imagemagick imagemagick-common` and install 6.8.9-10 by running `sudo make install`.

# Method

We will fuzz the `convert` command.
Specifically, we will convert from png to jpg with the command

`afl-fuzz -i input -o output convert @@ jpg:/dev/null`

The input and output folders should be pointing at the correct folders.
The convert command should point to the correct binary.
@@ is replacement for the file from the input folder.
`jpg:/dev/null` means to convert the input file to jpg and output it to `/dev/null`, i.e., into the empty void of darkness where it is lost forever.
