#v1.0a1.03 - Pre-Release
0647 SUN 11/17/19 -TJB
ver 1.0a1.02 - ver 1.0a1.03

* **Purpose:** Mainly for developers to have up-to-date code
* **Issues Addressed:** Not Applicable, no users
* **Notes:** Simply added more code to the pre-release. It will now be able to gather options when run from the command line and run different aspects of itself and deliver help.
* **Files Changed:**
  * **cli.rb**: Added a few options to for users to add at the command line, mostly in order to pre-configure the configure process
  * **version.rb**:
    * **Version bump**: v1.0.a1.02 - v1.0a.1.03
    * Added TARGET and PRE_RELEASE constants to be read by an outside script. This is here so that any part of the eveIRC Installer program has access to these pieces of information
      * **TARGET**: Contains the exact version number of eveIRC Bot that this installer is set to install
      * **PRE_RELEASE**: Indicates via a boolean if this build of the INSTALLER is pre-release or not. This is not where one would find if the eveIRC it is set to install is pre-release or not.
* **New Download Links**: This version is not meant for production, or even testing as it has no useful functional code. Therefore there are no archive or binary downloads, you are - however - free to download the source code from the repository at https::github.com/Inspyre-Technologies/eveIRC-Installer