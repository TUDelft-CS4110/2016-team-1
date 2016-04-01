# Download ImageMagick version 6.8.9-10
curl -O http://www.imagemagick.org/download/releases/ImageMagick-6.8.9-10.tar.xz

# Extract the archive
tar xf ImageMagick-6.8.9-10.tar.xz

# Remove the archive file
rm ImageMagick-6.8.9-10.tar.xz

# Compile ImageMagick with the afl compiler
cd ImageMagick-6.8.9-10/
./configure CC="afl-gcc" CXX="afl-g++" --disable-shared; make

# Create folders for input and output files
cd ..
mkdir input/
mkdir output/
