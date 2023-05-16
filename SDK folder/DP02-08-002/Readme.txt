  -------------------------------------------------------------------
			   DigitalPersona

              Patch DP02_08_002 One Touch for Windows SDK

			   Version 1.6.1
			
			    Readme File
			   
			September 11, 2015
				
  -------------------------------------------------------------------
	  (c) 1996-2015 DigitalPersona, Inc. All Rights Reserved. 


This document provides late-breaking or other information that supplements the DigitalPersona One Touch for Windows SDK documentation.


-------------------------
How to Use This Document
-------------------------

To view the Readme file on-screen in Windows Notepad, maximize the Notepad window. On the Format menu, click Word Wrap. To print the Readme file, open it in Notepad or another word processor, and then use the Print command on the File menu.


---------
CONTENTS
---------

1.   INSTALLATION

2.   COMPATIBILITY

3.   SYSTEM REQUIREMENTS

4.   RELEASE NOTES     
     
5.   SUPPORT AND FEEDBACK
 

----------------
1. INSTALLATION
----------------

You must have local administrator rights to install this product on the supported Windows systems.

Copy dp02_08_002_SDK_*.msp to a local working directory. To start the installation, run dp02_08_002_SDK_*.msp. The patch files will be extracted and then installed automatically. The machine should already have DigitalPersona One Touch for Windows SDK 1.6.1 installed.

RTE installations are patched through the same procedure, by employing respective dp02_08_002_RTE_*.msp files.

-----------------
2. COMPATIBILITY
-----------------

The DP02_08_002 patch is compatible with DigitalPersona One Touch for Windows SDK 1.6.1


-----------------------
3. SYSTEM REQUIREMENTS
-----------------------

- x86-based processor or better
- DigitalPersona One Touch for Windows SDK 1.6.1 already installed


-----------------
4. RELEASE NOTES
-----------------

- This patch addresses a memory leak in the Java API.  The update allows the allocated system memory for each device to be correctly released when the application is closed. 

- In managed applications, developers should call stopCapture after finishing a capture session to promptly release any allocated session resources; releasing these resources will improve the performance of the application.

------------------------
5. SUPPORT AND FEEDBACK
------------------------

Technical support is available through the DigitalPersona Developer Connection at www.digitalpersona.com/webforums, where you can search for answers to questions posted by other developers and post your own questions. You can also purchase a Developer Support package at our web store, http://buy.digitalpersona.com.

