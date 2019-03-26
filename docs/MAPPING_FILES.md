# Mapping files

The issue with just rebuilding your docker image & recreating container every time you are making a change is obviously wasted time.
Which is reason why automatic reload have been implemented in basically framework out there, and you wouldn't want to loose that just because you moved your development enviroment into docker container.

# mounting local volume

This is most common, and mostly working solution, one thing that you have to be aware of that it is not safe thing to do on production.
The issue is that the default docker user is root, and you give that user full access to host machine filesystem.
