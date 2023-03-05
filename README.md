# aria2
I would like to introduce a tool that allows us to download a file from two different sources, and download the same file from the same source by establishing two connections at the same time. There are many possibilities, so if you want to learn about all the options, check out the website <a href="https://aria2.github.io/" target="_br">https://aria2.github.io/</a>.

<strong>Github:</strong> <a href="https://github.com/kgodzisz/aria2" target="_br">https://github.com/kgodzisz/aria2</a><br /> 
<strong>Blog:</strong> <a href="https://dockeryzacjaswiata.pl" target="_br">https://dockeryzacjaswiata.pl</a> <br />
<strong>Docker Hub:</strong> <a href="https://hub.docker.com/r/kgodzisz/aria2" target="_br">https://hub.docker.com/r/kgodzisz/aria2</a><br />

<strong>To download the file from Github:</strong><br />
<code>git clone https://github.com/kgodzisz/aria2.git</code>

<strong>To create your own image in your local repository:</strong><br />
<code>docker build -t aria2 .</code>

<strong>To run the tool:</strong><br />
<code>docker run --rm -v /path/to/folder:/files aria2 [option] [url]</code><br />

<strong>Example:</strong><br />
<code>docker run --rm -v /home/dockeryzacjaswiata:/files aria2 -x2 https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.is</code><br />

In this example, I'm downloading the latest stable version image of the Debian distribution by establishing two connections.

<strong>The second way is to download the prepared file from the Docker Hub repository:</strong><br />

<code>docker run --rm -v /path/to/folder:/files kgodzisz/aria2 [option] [url]</code><br />

<strong>Example:</strong><br />

<code>docker run --rm -v /home/dockeryzacjaswiata:/files kgodzisz/aria2 -x2 https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.is</code><br />

In this example, I'm downloading the latest stable version image of the Debian distribution by establishing two connections.<br />

<strong>Description of options used in commands:</strong> <br />

<code>--rm</code> - the container will automatically remove itself after completing the task;<br />
<code>-v</code> - the path where the downloaded files should be saved in the host system: the working directory of the container. If you do not set the working directory as /files, you should specify the appropriate directory in the Dockerfile;<br />
<code>aria2</code> - the name of the created image that we want to use; <br />
<code>kgodzisz/aria2</code> - the address to the image on the DockerHub platform.<br />

At the end of the command, we specify the available option that we want to use when running the container and the address from where the file should be downloaded. If we used CMD instead of ENTRYPOINT in the Dockerfile, we should also enter the name of the program because in the case of CMD, every command invocation when creating a container replaces what is in the CMD of the image.<br />
