!include "MUI2.nsh"

!ifndef APP_DIR
  !error "APP_DIR is required"
!endif
!ifndef SETUP_PATH
  !error "SETUP_PATH is required"
!endif
!ifndef ICON_PATH
  !error "ICON_PATH is required"
!endif

Unicode true
RequestExecutionLevel user
SetCompressor /SOLID lzma
SetCompressorDictSize 64

Name "LinguaLeaf Reader V10.6.0 Full Offline"
OutFile "${SETUP_PATH}"
InstallDir "$LOCALAPPDATA\Programs\LinguaLeaf"
InstallDirRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LinguaLeaf" "InstallLocation"
Icon "${ICON_PATH}"
UninstallIcon "${ICON_PATH}"
BrandingText "LinguaLeaf V10.6.0 Full Offline · NSIS Fix"
ShowInstDetails show
ShowUninstDetails show

VIProductVersion "10.6.0.1"
VIAddVersionKey /LANG=1033 "ProductName" "LinguaLeaf Reader"
VIAddVersionKey /LANG=1033 "ProductVersion" "10.6.0.1"
VIAddVersionKey /LANG=1033 "FileDescription" "LinguaLeaf Full Offline NSIS Installer"
VIAddVersionKey /LANG=1033 "CompanyName" "LinguaLeaf Personal"

!define MUI_ABORTWARNING
!define MUI_ICON "${ICON_PATH}"
!define MUI_UNICON "${ICON_PATH}"
!define MUI_FINISHPAGE_RUN "$INSTDIR\LinguaLeaf.exe"
!define MUI_FINISHPAGE_RUN_TEXT "Mở LinguaLeaf"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_LANGUAGE "Vietnamese"
!insertmacro MUI_LANGUAGE "English"

Section "LinguaLeaf Full Offline" MainSection
  SectionIn RO
  SetShellVarContext current

  IfFileExists "$INSTDIR\LinguaLeaf.exe" 0 install_files
  ClearErrors
  RMDir /r "$INSTDIR"
  IfErrors 0 install_files
  MessageBox MB_ICONSTOP|MB_OK "Không thể cập nhật vì LinguaLeaf đang chạy. Hãy đóng ứng dụng rồi chạy lại bộ cài."
  Abort

install_files:
  SetOutPath "$INSTDIR"
  SetOverwrite on
  File /r "${APP_DIR}/*"
  File /oname=LinguaLeaf.ico "${ICON_PATH}"

  FileOpen $0 "$INSTDIR\README.txt" w
  FileWrite $0 "LinguaLeaf V10.6.0 Full Offline - NSIS Fix$\r$\n"
  FileWrite $0 "Da kem 4 mo hinh EN-VI, VI-EN, EN-ZH va ZH-EN.$\r$\n"
  FileWrite $0 "Khong cat ZIP bang PowerShell; bo cai NSIS tu kiem tra du lieu.$\r$\n"
  FileClose $0

  WriteUninstaller "$INSTDIR\Uninstall-LinguaLeaf.exe"
  CreateDirectory "$SMPROGRAMS\LinguaLeaf"
  CreateShortCut "$SMPROGRAMS\LinguaLeaf\LinguaLeaf.lnk" "$INSTDIR\LinguaLeaf.exe" "" "$INSTDIR\LinguaLeaf.exe" 0
  CreateShortCut "$SMPROGRAMS\LinguaLeaf\Gỡ cài đặt LinguaLeaf.lnk" "$INSTDIR\Uninstall-LinguaLeaf.exe"
  CreateShortCut "$DESKTOP\LinguaLeaf.lnk" "$INSTDIR\LinguaLeaf.exe" "" "$INSTDIR\LinguaLeaf.exe" 0

  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LinguaLeaf" "DisplayName" "LinguaLeaf Reader V10.6.0 Full Offline (NSIS Fix)"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LinguaLeaf" "DisplayVersion" "10.6.0.1"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LinguaLeaf" "Publisher" "LinguaLeaf Personal"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LinguaLeaf" "DisplayIcon" "$INSTDIR\LinguaLeaf.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LinguaLeaf" "InstallLocation" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LinguaLeaf" "UninstallString" '"$INSTDIR\Uninstall-LinguaLeaf.exe"'
  WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LinguaLeaf" "NoModify" 1
  WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LinguaLeaf" "NoRepair" 1
SectionEnd

Section "Uninstall"
  SetShellVarContext current
  Delete "$DESKTOP\LinguaLeaf.lnk"
  RMDir /r "$SMPROGRAMS\LinguaLeaf"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\LinguaLeaf"
  RMDir /r "$INSTDIR"
SectionEnd
