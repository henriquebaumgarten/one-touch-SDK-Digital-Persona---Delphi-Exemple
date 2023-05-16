   ------------------------------------------------------------------
                           DigitalPersona    

                Patch DP00_03_001 for DigitalPersona for
         One Touch for Windows SDK 1.6.1 and One Touch for ID 2.2.1
                 
                            Readme File
          
                             July 2011
   ------------------------------------------------------------------
               
          (c) DigitalPersona, Inc., 2010. All rights reserved



-------------------------
How to Use This Document
-------------------------

To view the Readme file on-screen in Windows Notepad, maximize the Notepad window. From the Format menu, ensure Word Wrap is checked.

To print the Readme file, open it in Notepad or another word processor, and then use the Print command on the File menu.


---------
CONTENTS
---------

1.   INSTALLATION

2.   COMPATIBILITY
     
3.   SYSTEM REQUIREMENTS

4.   RELEASE NOTES

5.   KNOWN ISSUE

6.   SUPPORT AND FEEDBACK


----------------
1. INSTALLATION
----------------

You must have local administrator rights to install this product on the supported operating systems. 

For 32 bit Windows workstation, run the dp00_03_001_x86.msi. 
For 64 bit Windows workstation, run the dp00_03_001_x64.msi. 

The patch files will be installed automatically. The machine should already have DigitalPersona One Touch for Windows SDK 1.6.1 or One Touch for ID 2.2.1 installed.


-----------------
2. COMPATIBILITY
-----------------

The DP00_03_001 patch is only compatible with DigitalPersona One Touch for Windows SDK 1.6.1 and One Touch for ID 2.2.1. 


-----------------------
3. SYSTEM REQUIREMENTS
-----------------------

- 3 MB hard disk space
- DigitalPersona One Touch for Windows SDK 1.6.1 or One Touch for ID 2.2.1 already installed


-----------------
4. RELEASE NOTES
-----------------

- The patch will provide support for 32 and 64 bit
- The patch fixes an issue with the DigitalPersona One Touch for Windows SDK 1.6.1 and One Touch for ID 2.2.1 whereby a false verification result was returned when the FARAchieved score was less than the FARRequested score. In addition, it also corrected a large difference in FAR scores intermittently observed.


----------------
5 KNOWN ISSUE
----------------

In the event of uninstalling patch DP00_03_001, DPFPVerNET.dll will be removed. To correct the issue, please Run Repair of the SDK you have installed accordingly from Add and Remove Program.


------------------------
6. SUPPORT AND FEEDBACK
------------------------
 
Technical support is available through the DigitalPersona Developer Connection at www.digitalpersona.com/webforums, where you can search for answers to questions posted by other developers and post your own questions. You can also purchase a Developer Support package at our web store: https://store2.esellerate.net/store/checkout/CustomLayout.aspx?s=STR1045285899&pc=&page=OnePageCatalog.htm



