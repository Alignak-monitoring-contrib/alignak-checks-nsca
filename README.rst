Alignak checks package for Windows passively checked hosts/services
===================================================================

*Checks pack for monitoring Windows hosts with NSCA passive checks*


.. image:: https://badge.fury.io/py/alignak-checks-windows-nsca.svg
    :target: https://badge.fury.io/py/alignak-checks-windows-nsca
    :alt: Most recent PyPi version

.. image:: https://img.shields.io/badge/License-AGPL%20v3-blue.svg
    :target: http://www.gnu.org/licenses/agpl-3.0
    :alt: License AGPL v3

Installation
------------

From PyPI
~~~~~~~~~
To install the package from PyPI:
::

   sudo pip install alignak-checks-windows-nsca


From source files
~~~~~~~~~~~~~~~~~
To install the package from the source files:
::

   git clone https://github.com/Alignak-monitoring-contrib/alignak-checks-windows-nsca
   cd alignak-checks-windows-nsca
   sudo pip install .

.. note: using `sudo python setup.py install` will not ocrrectly manage the package configuration files! The recommended way is really to use `pip`;)

Documentation
-------------

Configuration
~~~~~~~~~~~~~
This checks pack do not need any specific configuration.


Prepare Windows host
~~~~~~~~~~~~~~~~~~~~
Some operations are necessary on the Windows monitored hosts if NSClient++ is not yet installed and running.

Install and configure NSClient++ for scheduled NSCA checks. As an example a registry configuration:

::

    Windows Registry Editor Version 5.00

    [HKEY_LOCAL_MACHINE\SOFTWARE\NSClient++\settings\scheduler]
    "threads"=dword:00000005

    [HKEY_LOCAL_MACHINE\SOFTWARE\NSClient++\settings\scheduler\schedules]

    [HKEY_LOCAL_MACHINE\SOFTWARE\NSClient++\settings\scheduler\schedules\check_alive]
    "alias"="host_check"
    "interval"="300s"
    "command"="check_ok"

    [HKEY_LOCAL_MACHINE\SOFTWARE\NSClient++\settings\scheduler\schedules\check_cpu]
    "command"="alias_cpu"
    "alias"="nsca_cpu"
    "interval"="15m"

    [HKEY_LOCAL_MACHINE\SOFTWARE\NSClient++\settings\scheduler\schedules\check_disk]
    "command"="alias_disk"
    "interval"="10m"
    "alias"="nsca_disk"

    [HKEY_LOCAL_MACHINE\SOFTWARE\NSClient++\settings\scheduler\schedules\check_mem]
    "command"="alias_mem"
    "interval"="5m"
    "alias"="nsca_memory"

    [HKEY_LOCAL_MACHINE\SOFTWARE\NSClient++\settings\scheduler\schedules\check_services]
    "command"="alias_service"
    "interval"="6h"
    "alias"="nsca_service"

    [HKEY_LOCAL_MACHINE\SOFTWARE\NSClient++\settings\scheduler\schedules\check_uptime]
    "command"="check_uptime \"warning=uptime<-5m\" \"critical=uptime<-3m\""
    "interval"="60s"
    "alias"="nsca_uptime"

    [HKEY_LOCAL_MACHINE\SOFTWARE\NSClient++\settings\scheduler\schedules\default]
    "interval"="3600s"



Alignak configuration
~~~~~~~~~~~~~~~~~~~~~

You simply have to tag the concerned hosts with the template `windows-passive-host`.
::

    define host{
        use                     windows-passive-host
        host_name               my_windows_passive_host
        address                 0.0.0.0
    }

and this host will automatically inherit from the template parameters and services.


Bugs, issues and contributing
-----------------------------

Contributions to this project are welcome and encouraged ... `issues in the project repository <https://github.com/alignak-monitoring-contrib/alignak-checks-windows-nsca/issues>`_ are the common way to raise an information.
