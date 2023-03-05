# aria2
ENGLISH VERSION:
This week I would like to introduce a tool that allows us to download a file from two different sources, and download the same file from the same source by establishing two connections at the same time. There are many possibilities, so if you want to learn about all the options, check out the website https://aria2.github.io/.

Github: https://github.com/kgodzisz/aria2 
Blog: https://dockeryzacjaswiata.pl 
Docker Hub: https://hub.docker.com/r/kgodzisz/aria2

To download the file from Github:
git clone https://github.com/kgodzisz/aria2.git

To create your own image in your local repository:
docker build -t aria2 .

To run the tool:
docker run --rm -v /path/to/folder:/files aria2 [option] [url]
Example:
docker run --rm -v /home/dockeryzacjaswiata:/files aria2 -x2 https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.is
In this example, I'm downloading the latest stable version image of the Debian distribution by establishing two connections.

The second way is to download the prepared file from the Docker Hub repository:
docker run --rm -v /path/to/folder:/files kgodzisz/aria2 [option] [url]
Example:
docker run --rm -v /home/dockeryzacjaswiata:/files kgodzisz/aria2 -x2 https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.is
In this example, I'm downloading the latest stable version image of the Debian distribution by establishing two connections.

Description of options used in commands: 
--rm - the container will automatically remove itself after completing the task;
 -v - the path where the downloaded files should be saved in the host system: the working directory of the container. If you do not set the working directory as /files, you should specify the appropriate directory in the Dockerfile;
aria2 - the name of the created image that we want to use; 
kgodzisz/aria2 - the address to the image on the DockerHub platform.
At the end of the command, we specify the available option that we want to use when running the container and the address from where the file should be downloaded. If we used CMD instead of ENTRYPOINT in the Dockerfile, we should also enter the name of the program because in the case of CMD, every command invocation when creating a container replaces what is in the CMD of the image.
