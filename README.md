# Python app development inside docker container

*WORK IN PROGRESS*
*Please create an issue or submit PR if you want to see something more here!*

Example of how Python app can be developed inside a docker container,
along with  pros and cons of such solution.


## Summary

Summary of pros & cons of development inside of container

### Pros

* one command setup*
* closer to the production environment
* you can use exactly the same environment for CI**

*your experience may vary, see Cons and possible workarounds
**if your CI worker/runner supports creating docker containers

### Cons

* [mapping filesystem](docs/MAPPING_FILES.md) mounting volumes for immediate access of freshest sources inside docker containers is a must have, but also has its own problems
  * creating files as root by default
  * overriding files already existing in the container (for example files copied from the image, i.e. created during installation process)
  * even more advanced IDEs have trouble mapping local files to remote 
* [dialling home](docs/DIAL_HOME.md) (connecting to dev host aka localhost) is not exactly straight forward
