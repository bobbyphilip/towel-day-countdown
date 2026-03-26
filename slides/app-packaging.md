---
marp: true
theme: uncover
paginate: true
footer: 'App packaging in Linux'
style: |
  section.center > footer, footer {
    text-align: left !important;
    margin: 0 !important;
  }
  header strong {
    color: #000000;
    font-size: 4.0em; /* Make it larger */
    font-weight: 800; /* Extra bold */
  }
  section {
    font-family: 'Roboto', sans-serif;
    font-size: 20px;
  }
  
---

# App Packaging in Linux 

Bobby Alex Philip

---

![Image of an iceberg showing various layers in a linux application from distros to kernel. height:720px  center](./assets/iceberg.png) 

---
<!-- _header: "**Now to answer an important question**" -->
  * Not the answer to the Ultimate Question of Life, the Universe, and Everything 
      * _We already know that is 42_
  * How many sleeps to International Towel Day?


![Cover of the Hitchhiker's guide to the galaxy](./assets/h2g2.jpg)

---
<!-- _header: "**WHAT IS AN EXECUTABLE**" -->

* Source code → compiled into a binary (machine code)
* On Linux: typically an **ELF (Executable and Linkable Format)** file
* It can be:
  - **Statically linked** (everything included)
  - **Dynamically linked** (uses shared libraries)
* ```printf("Hello World!\n")```
   - printf() → libc → syscall → kernel
---
<!-- _header: "**Default C vs Go Compiled Binary**" -->
 
![dynamically linked  binary width:1200px](./assets/hello.png)
    
![statically linked binary ](./assets/towelday.png)

<!--
strings towelday | grep -i towel #to show parts of what is in a binary
-->

---
<!-- _header: "**HOW TO DISTRIBUTE THIS**" -->
![height:540px center "docker meme"](./assets/docker.png)


---
<!-- _header: "**HOW TO DISTRIBUTE THIS ON DESKTOP**" -->
![center "xkcd standards"](./assets/standards.png)

---
<!--_header: "**DISTRO-SPECIFIC PACKAGING**" -->

- Software is packaged specifically for each Linux distribution (e.g. deb, rpm)
- Delivered via repositories (official/community)
- Shared system libraries reduce duplication at the cost of complexity
- Stable vs Speedy updates

---
<!--_header: "**DISTRO PACKAGE FORMATS**" -->

| Format | Used By                  | Package Manager |
|--------|--------------------------|-----------------|
| .deb   | Debian, Ubuntu,Linux Mint | apt / dpkg     |
| .rpm   | Fedora, RHEL, CentOS     | dnf / yum       |
| .pkg.tar.zst | Arch Linux         | pacman          |
| .apk   | Alpine Linux             | apk             |

---
<!--_header: "**DISTRO AGNOSTIC PACKAGING**" -->
 - Reach all users via a single channel
 - Users can receive the latest software versions instantly
 - No need to cater to specific distro packaging requirements
 - Bundle all necessary dependencies to eliminate "dependency hell"
 - Larger application size

---
<!--_header: "**DISTRO AGNOSTIC PACKAGING**" -->

| Feature            | AppImage                                                                 | Flatpak                                              | Snap                                                      |
|--------------------|-------------------------------------------------------------------------|------------------------------------------------------|-----------------------------------------------------------|
| Installation       | Single file, download and run                                           | Installed via flatpak tool                           | Installed via snapd service                               |
| Format             | ELF executable + SquashFS (read-only filesystem)                        | Bundle + runtime                                     | Self-contained package + base snap                        |
| Dependencies       | Bundled (except core system libs like glibc)                            | Provided by shared runtimes                          | Bundled with application                                  |
| Sandboxing         | None out of the box                                                     | Strong sandboxing                                    | Sandboxed (confinement levels)                            |
| Updates            | No automatic updates                                                    | Managed via flatpak                                  | Automatic updates by default                              |
| Distribution       | Decentralised                                                           | Centralised (Flathub + remotes)                      | Controlled by Canonical (Snap Store)                      |
| Portability Model  | Build on old, run on new                                                | Runtime ensures compatibility                        | Base snap + bundled dependencies                          |

---

