## Ubuntu Version 22.04
In order to ensure consistency between developers, our simulators and programs should all be run on ```Ubuntu 22.04```. This can either be installed on a dedicated machine or be run in a virtual environment.

## Ubuntu Install 
The official Ubuntu 22.04 .iso file can be found [here](https://releases.ubuntu.com/jammy/)

## Verifying Proper Operating System Installation
Once the machine is operating, verify the version by opening a terminal and running:
```
> uname -v 
```
if the proper version is installed, an output similar to the following should be returned:
```
#84~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC [date and time]
```

### Different Version Returned
If a different version is returned by ```uname -v```, verify the installation source and that the correct .iso file for Ubuntu 22.04 is being compiled onto the machine.
