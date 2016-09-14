# sysdig-moby
Image to run Sysdig on Docker for mac
#Why ?
Why a particular image for Docker for mac ?
Sysdig provides a Docker image to run sysdig/csysdig on Docker but on a Linux host. As the sources os Docker for mac are not yet avaliable, there is no easy way to use the DKMS build capability of the upstream image. Finally, I could not just publish an image to the Docker Hub as kernel are upgraded often on Docker for mac.

Why that name ?
Because some difficulties to reach my target comes from the fact that Docker for mac named the kernel linux-4.4.x-moby. And that particular name had me to search for a few trick on compiling kernel libs, so it's gonna be like a souvenir every time I get back to this project.

# Get it, build it

    # git clone https://github.com/fdebonneval/sysdig-moby.git
    # cd sysdig-moby
    # make build

Build time is around 15 minutes with a decend internet access and my i5 MBP.
After the build, the image is published in your local registry with the name `sysdig-moby:(sysdig verion)`
You can choose the tag/branch you want to build against by changing the VERSION variable in the Makefile

# And run it
To run csysdig, the great htop like ncurses tool, just use

    # make csysdig

To run sysdig, use 

    # make sysdig

# Todo
* Reduce image size. I gave a try to Alpine, but it seem there is an issue around Libc
* Fix mouse inputs in spectro view
* Write some examples


# References
* Thanks to @etown for his work on module build that inspired me a lot 
  * https://github.com/etown/install-sysdig-module
* Thanks to Sysdig team (@draios), thanks to the official image I found a few env that made the stuff work 
  * http://www.sysdig.org/wiki/how-to-install-sysdig-from-the-source-code/
  * http://www.sysdig.org/wiki/how-to-install-sysdig-for-linux/
  * https://github.com/draios/sysdig/tree/dev/docker
* Thanks to a very shy collegue of mine for his help on the rest
