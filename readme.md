# PBox is a modular development platform based on DLL Form

- [¼òÌåÖÐÎÄ](readmeCN.md)

## I. Development purpose
    Based on the principle of minimizing or not modifying the original project source code(Delphi¡¢VC¡¢QT);
    Support Delphi DLL Form¡¢VC DLL Form(Dialog/MFC)¡¢QT DLL Form; 

## II. Development platform
    Delphi10.4.2¡¢WIN10X64;
    Do not install any third-party controls;
    WIN10X64 test pass;Support X86¡¢X64;
    Email£ºdbyoung@sina.com;
    QQgrp£º101611228;

## III.Usage 
### Delphi£º
* Delphi original exe project, modified to DLL project. Output export function, the original code without any modification;
* Put the compiled DLL file in the plugins directory;
* Example: Module\sPath;
* Example: Module\pm;
* Example: Module\PDFView;
* Delphi function declaration:  
```
 procedure db_ShowDllForm_Plugins(var frm: TFormClass; var strParentModuleName, strSubModuleName: PAnsiChar); stdcall;
```
### VC2017 / VC2019
* Convert VC form exe to DLL for calling by other languages: [https://blog.csdn.net/dbyoung/article/details/103987103]
* VC original EXE(base on Dialog) project£¬without any modifitication¡£new a dll.cpp file£¬output export function;
* VC original EXE(base on    MFC) project£¬need a little modify code;
* Put the compiled DLL file in the plugins directory;
* Example(base on Dialog)£ºmodule\7-zip
* Example(base on Dialog)£ºmodule\Notepad2;
* Example(base on    MFC)£ºmodule\mpc-be;
* VC2017 /VC2019 function declaration:  
```
enum TLangStyle {lsDelphiDll, lsVCDLGDll, lsVCMFCDll, lsQTDll, lsEXE};
extern "C" __declspec(dllexport) void db_ShowDllForm_Plugins(TLangStyle* lsFileType, char** strParentName, char** strSubModuleName, char** strClassName, char** strWindowName, const bool show = false)
```

### QT
* QT original EXE£¬without any modifitication¡£Compile to exe;
* New a dll.cpp file£¬output export function; together compile to dll;
* Put the compiled DLL file in the plugins directory;
* Same as VC Dialog DLL;
* Example£ºmodule\cmake-gui;
* function declaration:
```
enum TLangStyle {lsDelphiDll, lsVCDLGDll, lsVCMFCDll, lsQTDll, lsEXE};
extern "C" __declspec(dllexport) void db_ShowDllForm_Plugins(TLangStyle* lsFileType, char** strParentName, char** strSubModuleName, char** strClassName, char** strWindowName, const bool show = false)
```


## IV: Description of DLL output function parameters 
* Delphi £º
```
 procedure db_ShowDllForm_Plugins(var frm: TFormClass; var strParentModuleName, strSubModuleName: PAnsiChar); stdcall;

 frm                 £ºDLL main form class name in Delphi;
 strParentModuleName £ºParent module name;  
 strSubModuleName    £ºSub module name;  
```
* VC2017/QT £º
```
extern "C" __declspec(dllexport) void db_ShowDllForm_Plugins(TLangStyle* lsFileType, char** strParentName, char** strSubModuleName, char** strClassName, char** strWindowName, const bool show = false)

 lsFileType        £ºBase on Dialog DLL£¬or base MFC DLL or QT DLL;
 strParentName     £ºParent module name;  
 strSubModuleName  £ºSub module name; 
 strClassName      £ºDLL Main form class name;
 strWindowName     £ºDLL Main form title name;
 show              £ºshow/hide DLL main form;
```

## V. Features 
    The UI supports menu display, button (dialog box) display and list view display;  
    Supports the display of an EXE form program in our forms; 
    Support the EXE program of dynamic change of form class name;support multiple document forms;
    Support file drag and drop to exe and DLL forms; 
    Support x86 EXE call x64 EXE, x64 EXE call x86 EXE;
    
## VI. Next work:  
    Add database support (because I am not familiar with the database, the development is slow, and it is developed in my spare time)  
