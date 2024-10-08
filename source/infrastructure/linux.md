# Linux

## Richard Stallman

<img align="right" src="../_static/image/rms.jpg" alt="Richard Matthew Stallman" style="height:200px;">

Richard Matthew Stallman (1953-) is an American programmer and free software movement activist. Stallman launched the GNU (*GNU is Not Unix*) Project, founded the Free Software Foundation (FSF) in 1985, to campaign for software to be distributed in such a manner that its users have the freedom to use, study, distribute, and modify that software, a.k.a, the *"free software"*.

### copyright and "copy*left*"

The *Copyright Act of 1976*, came into effect in 1978, spells out the basic rights of copyright holders, codified the doctrine of "fair use". To prevent software from being used on their competitors' computers, most manufacturers stopped distributing source code and began using copyright and restrictive software licenses to limit or prohibit copying and redistribution.

In 1980, Stallman and some other hackers at the AI Lab were refused access to the source code for the software of a newly installed laser printer, the Xerox 9700. Stallman had modified the software for the Lab's previous laser printer (the XGP, Xerographic Printer), so it electronically messaged a user when the person's job was printed, and would message all logged-in users waiting for print jobs if the printer was jammed. This experience convinced Stallman of people's need to be able to freely modify the software they use.

### GNU project

Stallman announced the plan for the GNU operating system in September 1983 on several ARPANET mailing lists and USENET. He started the project on his own and describes: "As an operating system developer, I had the right skills for this job. So even though I could not take success for granted, I realized that I was elected to do the job. I chose to make the system compatible with Unix so that it would be portable, and so that Unix users could easily switch to it."

## UNIX and LINUX

In 1969, Bell labs research centre started to develop a family of multitasking, multi-user computer operating systems that derive from the original *AT&T Unix*. Although AT&T Corporation created Unix, by the 1980s, the University of California, Berkeley Computer Systems Research Group (Berkeley Software Distribution, BSD) was the leading non-commercial Unix developer. All were derived from AT&T's Research Unix but had diverged considerably. Further, each vendor's version of Unix was different to some degree. 

### <<*1984*>>

In 1984, AT&T divested itself of its regional operating companies, and was released from its obligation not to enter the computer business; freed of that obligation, Bell Labs began selling Unix as a proprietary product, where users were not legally allowed to modify it. 

With Unix increasingly "locked in" as a proprietary product, the GNU Project, started in 1983 by Richard Stallman, had the goal of creating a "complete Unix-compatible software system" composed entirely of free software. Work began in 1984. Later, in 1985, Stallman started the Free Software Foundation and wrote the GNU General Public License (GNU GPL) in 1989. By the early 1990s, many of the programs required in an operating system (such as libraries, compilers, text editors, a command-line shell, and a windowing system) were completed, although low-level elements such as device drivers, daemons, and the kernel, called GNU Hurd, were stalled and incomplete.

<img align="right" src="../_static/image/Linus_Torvalds_(cropped).jpg" alt="Linus Torvalds" style="height:200px;">

*Minix* was created by Andrew S. Tanenbaum, a computer science professor, and released in 1987 as a minimal Unix-like operating system targeted at students and others who wanted to learn operating system principles. In 1991, a  University of Helsinki student, Linus Torvalds (1969-), became curious about operating systems. Frustrated by the licensing of Minix, which at the time limited it to educational use only, he began to work on his operating system kernel, which eventually became the Linux kernel.

### Linux

The adoption of Linux in production environments, rather than being used only by hobbyists, started to take off first in the mid-1990s in the supercomputing community, where organizations such as NASA started to replace their increasingly expensive machines with clusters of inexpensive commodity computers running Linux. Commercial use began when Dell and IBM, followed by Hewlett-Packard, started offering Linux support to escape Microsoft's monopoly in the desktop operating system market.

Today, Linux systems are used throughout computing, from embedded systems to virtually all supercomputers, and have secured a place in server installations such as the popular LAMP (**L**inux, **A**pache, **M**ySQL, **P**erl/**P**HP/**P**ython) application stack. 

## Infrastructure

Linux is the dominant operating system for high performance computing (HPC), according to TOP500 list that keeps track of world’s most powerful computer systems, all TOP500 supercomputers run Linux. In microTi, we do HPC. We rent the supercomputers' resources from [Beijing Super Cloud Computing Centre, BSCC](https://cloud.blsc.cn/) and [Bohrium AI4S Station](https://bohrium.dp.tech), we maintain our own computer systems [hal9000](./local.md) and [550W](./local.md) (would be online in the summer time, 2024).

### Environment Modules

Typically users initialize their environment when they log in by setting environment information for every application they will reference during the session. The [Environment Modules](https://modules.sourceforge.net/) package is a tool that simplify shell initialization and lets users easily modify their environment during the session with modulefiles.

### [BSCC](./bscc.md)

In BSCC, N26 section (with V100 SXM 32G card) is used. Software applications are compiled and installed in the `~/run/.local` directory.

### [hal9000 and 550W](./local.md)

In local PCs, gaming NVIDIA cards are used.