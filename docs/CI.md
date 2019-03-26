# CI with docker-compose

To make it work there are couple of rules you have to stick with:
* avoid interacting with host networking stack 
  * don't bind to host ports! use docker-compose config files stacking for development
* don't use the same network for every run!
 * docker-compose -p '${BUILD_TAG}${postfix}' -f docker-compose.yml ${cmd} 
* you may need to mount named volume to store CI command output files (e.g. coverage report, screenshots, documentation)
