# Welcome
Welcome to the quick start guide for developing in the [Julia language](https://julialang.org/)! This guide assumes limited prior experience working from a command line, and, of course, no prior experience with the Julia language. Let's get started.

# Getting access to a command line
A command line is a text-based interface to file systems and applications on a computer, just like the graphical desktop you're familiar with. It gives you great power (which we need!), at the expense of a modest learning curve and unintuitive interface. There are many command-line interfaces to operating systems, but on this project, we can to try to pick just one to make it easier to help each other when developing. We're shooting for getting everyone access to the widely-used [`bash`](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) shell. This mean's we'll have a unified set of commands for navigating folders, moving files, editing files, and running applications.

## Mac OS
If you're a Mac user, congratulations! You're done. Press `Command` + `spacebar` to open Spotlight, type `Terminal`, and open it up. The Mac Operating System (OS) you're familiar with has a desktop-style environment built on the `UNIX` OS, so the default shell for `Terminal` is already `bash`, giving you access to the UNIX-based OS for development tasks.

## Windows 10
If you're a Windows user, the process for you has different options. You could allocate some (a lot) of your hard drive space to a partition on which you run a Linux (an OS based on UNIX) distro such as Ubuntu or Debian. You could also use a virtual machine (VM) player such as [VirtualBox](https://www.virtualbox.org/) or [VMware Player](https://www.vmware.com/products/workstation-player.html) to emulate the operating system inside a Windows process. If you need help with this set of steps, we can walk through it. My personal choice at this point for most Linux tasks on Windows is downloading Ubuntu to run on VMware Workstation Player, and just living with the performance hit of emulation.

A new challenger approaches in the form of the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10). It offers very easy setup of a select subset of Linux-based environments, and interfaces close to your hardware, leaving behind the performance impacts of emulation, and avoiding allocating a large chunk of memory for a separate OS. It is still in development, and full featured support of Julia doesn't look like it's there yet.

Either way, once you've fired up your Linux OS (I use Ubuntu) and logged in to the desktop, press the `Super` key (the Windows Key on a normal-person keyboard) and type `Terminal` to bring up a `bash` shell. You can also, if you have two hands and a mouse, right-click on the desktop and select `Open Terminal`.

# Moving about the cabin
