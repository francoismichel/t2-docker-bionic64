# How to build and run the image

To build the image and give it the name `t2`, set your current working directory to the directory containing the Dockerfile, and then simply run :

```
docker build . -t t2
```
This can take several minutes. To check for the termination of a T2 file located in the directory `$MY_DIR` on your computer, simply run :
```
docker run -v $MY_DIR:/mount t2 --input_t2=/mount/my_file.t2 --termination
```

This will mount the directory `$MY_DIR` into the `/mount` directory of the docker image. If `my_file.t2` is present in `$MY_DIR` on your computer, il will be present at `/mount/my_file.t2` in the docker image. The arguments `--input_t2=/mount/my_file.t2` and `--termination` are directly passed to T2, asking for the termination of the specified file. You can pass potentially any argument that T2 can take.

**Warning: Running the test suite currently does not work**
