# Welcome
Welcome to our quick start guide for developing in the [Julia language](https://julialang.org/)! This guide assumes limited prior experience working from a command line, and, of course, no prior experience with the Julia language. Let's get started.

## Quick access
[A `bash` cheat sheet](https://www.classes.cs.uchicago.edu/archive/2017/winter/51081-1/LabFAQ/introlab/unix_ref_card.pdf)

[A UChicago CS page on UNIX topics](https://www.classes.cs.uchicago.edu/archive/2017/winter/51081-1/LabFAQ/FAQ.html)

## Table of Contents
- [Getting access to a command line](https://github.com/evanmayer/julia-quickstart/blob/master/README.md#getting-access-to-a-command-line)
- [Moving about the cabin](https://github.com/evanmayer/julia-quickstart/blob/master/README.md#moving-about-the-cabin)
- [How do I move about it?](https://github.com/evanmayer/julia-quickstart/blob/master/README.md#how-do-i-move-about-it)
- [How can I break this thing?](https://github.com/evanmayer/julia-quickstart/blob/master/README.md#how-can-i-break-this-thing)
- [Download Julia](https://github.com/evanmayer/julia-quickstart/blob/master/README.md#download-julia)
- [Run the Julia REPL](https://github.com/evanmayer/julia-quickstart/blob/master/README.md#run-the-repl)

# Getting access to a command line
A command line is a text-based interface to file systems and applications on a computer, just like the graphical desktop you're familiar with. It gives you great power (which we need!), at the expense of a modest learning curve and unintuitive interface. There are many command-line interfaces to operating systems, but on this project, we can to try to pick just one to make it easier to help each other when developing. We're shooting for getting everyone access to the widely-used [`bash`](https://en.wikipedia.org/wiki/Bash_(Unix_shell)) shell. This mean's we'll have a unified set of commands for navigating folders, moving files, editing files, and running applications.

## Mac OS
If you're a Mac user, congratulations! You're done. Press `Command` + `spacebar` to open Spotlight, type `Terminal`, and open it up. The Mac Operating System (OS) you're familiar with has a desktop-style environment built on the [`UNIX`](https://en.wikipedia.org/wiki/Unix) OS, so the default shell for `Terminal` is already `bash`, giving you access to the UNIX-based OS for development tasks.

## Windows 10
If you're a Windows user, the process for you has different options. You could allocate some (a lot) of your hard drive space to a partition on which you run a Linux (an OS based on UNIX) distro such as Ubuntu or Debian. You could also use a virtual machine (VM) player such as [VirtualBox](https://www.virtualbox.org/) or [VMware Player](https://www.vmware.com/products/workstation-player.html) to emulate the operating system inside a Windows process. If you need help with this set of steps, we can walk through it. My personal choice at this point for most Linux tasks on Windows is downloading Ubuntu to run on VMware Workstation Player, and just living with the performance hit of emulation.

A new challenger approaches in the form of the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10). It offers very easy setup of a select subset of Linux-based environments, and interfaces close to your hardware, leaving behind the performance impacts of emulation, and avoiding allocating a large chunk of memory for a separate OS. It is still in development, and full featured support of Julia doesn't look like it's there yet.

Either way, once you've fired up your Linux OS (I use [Ubuntu](https://www.ubuntu.com/desktop/developers)) and logged in to the desktop, press the `Super` key (the Windows Key on a normal-person keyboard) and type `Terminal` to bring up a `bash` shell. You can also, if you have a right hand and a mouse, right-click on the desktop and select `Open Terminal`.

# Moving about the cabin
## What is in the cabin?
When you open the terminal, it spits you out onto a screen looking something like this:

![The Ubuntu bash shell prompt](https://github.com/evanmayer/julia-quickstart/blob/master/image0.png)

The string of characters you see on the left is the **prompt**. It has your username, your domain, a tilde (`~`) as shorthand for the [path](https://en.wikipedia.org/wiki/Path_(computing)) to the directory you are in, and character (`$`) denoting the end of the prompt. Commands you type appear here.

At this point, a [few](https://en.wikipedia.org/wiki/Bash_(Unix_shell)#Startup_scripts) [things](https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html#Bash-Startup-Files) have already happened automatically, one of which is the execution of a set of startup scripts. For the kind of shell you just opened, there is one script (a sequence of `bash` commands), and it lives in your `.bashrc` file. It is in `~`, your **home directory**, by default. Let's try to find it. 

- Type the command `pwd` (short for **print working directory**) and hit `Enter`/`Return` to see the full path to `~` expanded.

- Use the command `ls` (short for **list**) to show the files and directories in the file system hierarchy below your current working directory. In UNIX, technically, everything is a file!

![The cwd and ls commands](https://github.com/evanmayer/julia-quickstart/blob/master/image1.png)

What gives? Where is `.bashrc`? 
In UNIX-like operating systems, files and folders prefixed with a `.` are considered hidden. This is done for various reasons, but usually it's so the casual user can't easily break something like this, a terminal startup configuration. In order to see these files, we have to supply an **option** to the `ls` command to modify its behavior. 

- Type `ls -a` to show hidden files.

There are probably a lot! `.bashrc` should be among them. You don't have to list a file with `ls` before you open it, but now that you have confirmed that it does exist, we can have a look at what is inside. 

- Type `nano .bashrc` on Ubuntu or `pico .bashrc` on OS X. 

When you do this, you are invoking the text editor application with the filename as an **argument**, and it opens your file for viewing/editing. You may also have text editors such as `vim`, Sublime Text, or others installed and available.

![My .bashrc open in nano.](https://github.com/evanmayer/julia-quickstart/blob/master/image2.png)

(Note: If you ever see a command and wonder if it has other options, try `man <command>`, short for manual. To quit out of the so-called manpages after reading, press the `Q` key. This is a good skill to have.)

You can use arrow keys to move around and edit text and stuff. This probably isn't the first file you'll want to try editing, but it's fine to have a look around. You'll probably want to find a better text editor for real work, which you may or may not invoke from the command line. In `nano`, you can use `Ctrl`+`X` to exit the file, as seen at the bottom of the window.

Now you know where you are, how to see what's around you, and how to open and edit files.

## How do I move about it?
To move around the file system, I like to use a command that is often called `cd` or `chdir`, short for **change directory**. You can do a `help cd` to read the `bash` help info on it, but the syntax usually goes something like `cd [DIRNAME]`, where `DIRNAME` is the name of a directory or a [path](https://en.wikipedia.org/wiki/Path_(computing)) to one. `cd` doesn't work on files. Try these commands, followed by a `pwd`, to see where they take you. Your command prompt usually changes, too.

1. `cd Documents` (or another directory you see with `ls`)
2. `cd .`
3. `cd ..`
4. `cd /`
5. `cd /home/<username>/`
6. `cd ../..` 
7. `cd ~`

![Following the steps.](https://github.com/evanmayer/julia-quickstart/blob/master/image3.png)

In 1., you are telling `cd` to take you to a directory using a path **relative** to the current working directory. 

In 2., you are doing something that is usually pretty pointless, which is calling `cd` on the **dot** character, `.` that represents the current working directory. You `cd` into the directory you're in. 

In 3., you call `cd` on `..`, which represents the **parent directory**, one above the current one in the directory structure. 

In 4., `cd` takes you to `/`, which represents the **root** of the filesystem, the top level. It has no parent directories, only children.

Action 5. demonstrates the concept of an **absolute path**, the [path](https://en.wikipedia.org/wiki/Path_(computing)) through the file system from the root to the specified directory. It also shows how elements of the directory structure are strung together to create a path: in UNIX-like systems, the path separator is the `/` character (a forward slash).

In 6., we combine concepts from 3. and 5. to go up two directories. Wow!

In 7., we get back to our home dir using the `~` shorthand.

That's mostly it. That's how you move around using `bash`.

## How can I break this thing?
Hoo boy, there are a lot of ways. Some of them are even fun.

You already know how to edit existing files, so you could do a lot of damage. However, one of the most boring things you could do to break stuff would probably be to move a file so some program can't find it. Instead, let's make our own file.

First, let's give our file a home. The `mkdir` command (sound it out, you can figure out what this one stands for) will create a new directory at the path you give it:

- `mkdir foo`
- `cd foo`

Now, there are many ways to create a file if one does not exist already. One way is using the `touch` command. See `man touch` for more things `touch` can do. Another way might be to invoke a text editor on a file that doesn't exist, like `nano bar.txt`. Most text editors make the file for you by default.

- `touch bar.txt`

Including the file extension `.txt` isn't necessary to create the file, but some programs expect files with different extensions, so we'll play along. Now verify that the file has been created:

- `ls`

Move it to your home directory using `mv`:

- `mv bar.txt ~/` or `mv bar.txt ../` or `mv bar.txt /home/<username>`

This is simply rearranging how your file system is linked together to tell it the new desired path to your file `bar.txt`.

Now copy it into your dir `foo` using the copy command: `cp [FILENAME] [DESTINATION DIR]`:

- `cp bar.txt foo`

To "delete" a file, the command `rm` is used. [Technically](https://en.wikipedia.org/wiki/Rm_(Unix)), you're telling the OS to [unlink](https://en.wikipedia.org/wiki/Unlink_(Unix)) the file, and that it's okay to destroy the object when all other entities release their references to it. Don't `rm` anything you can't handle losing. This is a good one to run `man rm` on. There are options (`-r`) that allow you to unlink entire portions of your file system in one go by calling `rm` *recursively* on the specified directory and subdirectories. If you [combine it](https://askubuntu.com/questions/670648/what-does-rm-rf-do) with a force option (`-rf`), it will ignore nonexistent files and arguments, **never prompting you for confirmation**. Using this on the wrong directory is a great way to ensure you won't have a good day. Using it on the **root**, `/` is generally protected on most UNIX distros, but it [isn't always](https://superuser.com/questions/312769/how-far-will-you-get-with-an-rm-rf-command)...

We just made a copy of `bar.txt`, so we can delete this one though.

- `rm bar.txt`
- `ls`

![The result](https://github.com/evanmayer/julia-quickstart/blob/master/image4.png)

If you want, you can get rid of that test file and folder:

- `rm -r foo`

That covers a good bit to get you started moving around and interacting with files. There's much more you can do, from reading from and writing to files, with `cat`, `echo`-ing strings and **environment variables**, scripting with `bash` commands (`bash` is a language of its own), to searching for files and strings within files, assigning values to variables, performing web-based tasks, and automating tasks and actions. Anything you can do on a computer with a desktop, you can find a way to do from the command line. Often, [things may be faster](https://www.gimp.org/tutorials/Basic_Batch/) to do on the command line, especially anything involving a lot of files in distant places, or repetitive actions. 

There are plenty of tutorials with [more complete content](https://www.tutorialspoint.com/unix/) and [content that is written better](http://people.cs.uchicago.edu/~kaharris/10200/tutorials/unix/), and they cover concepts that you may eventually need.

Let's get to Julia.

# Julia
## Download Julia
Head over to the Julia [downloads page](https://julialang.org/downloads/), locate the correct download link for your OS, and get it. If you don't know the procedure for installing on your OS, you can hit [help] to get more comprehensive instructions.

Once Julia is installed on your machine, you can choose to make starting up the **REPL** (read-execute-print-loop) a little easier. I choose to have my `.bashrc` file prepend the directory containing the Julia binary to my [PATH variable](https://en.wikipedia.org/wiki/PATH_(variable)). This way, I can just type `julia` and have bash take care of finding out where the binary to execute is. At the bottom of my `.bashrc`, I write:

- `export PATH="/home/evanmayer/julia-1.1.0/bin:$PATH"'

## Run the REPL
