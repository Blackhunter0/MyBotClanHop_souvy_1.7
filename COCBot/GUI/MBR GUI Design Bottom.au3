; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the bottom panel
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GKevinOD (2014)
; Modified ......: DkEd, Hervidero (2015), CodeSlinger69 (2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

Global $g_hBtnStart = 0, $g_hBtnStop = 0, $g_hBtnPause = 0, $g_hBtnResume = 0, $g_hBtnSearchMode = 0, $g_hBtnMakeScreenshot = 0, $g_hBtnHide = 0, $g_hBtnEmbed = 0, _
	   $g_hChkBackgroundMode = 0, $g_hLblDonate = 0, $g_hBtnAttackNowDB = 0, $g_hBtnAttackNowLB = 0, $g_hBtnAttackNowTS = 0
Global $g_hPicTwoArrowShield = 0, $g_hLblVersion = 0, $g_hPicArrowLeft = 0, $g_hPicArrowRight = 0
Global $g_hGrpVillage = 0
Global $g_hLblResultGoldNow = 0, $g_hLblResultGoldHourNow = 0, $g_hPicResultGoldNow = 0, $g_hPicResultGoldTemp = 0
Global $g_hLblResultElixirNow = 0, $g_hLblResultElixirHourNow = 0, $g_hPicResultElixirNow = 0, $g_hPicResultElixirTemp = 0
Global $g_hLblResultDENow = 0, $g_hLblResultDEHourNow = 0, $g_hPicResultDENow = 0, $g_hPicResultDETemp = 0
Global $g_hLblResultTrophyNow = 0, $g_hPicResultTrophyNow = 0, $g_hLblResultRuntimeNow = 0, $g_hPicResultRuntimeNow = 0, $g_hLblResultBuilderNow = 0, $g_hPicResultBuilderNow = 0
Global $g_hLblResultAttackedHourNow = 0, $g_hPicResultAttackedHourNow = 0, $g_hLblResultGemNow = 0, $g_hPicResultGemNow = 0, $g_hLblResultSkippedHourNow = 0, $g_hPicResultSkippedHourNow = 0
Global $g_hLblVillageReportTemp = 0, $g_hBtnTestVillage = 0
Global $g_hBtnEnableGUI = 0, $g_hBtnDisableGUI = 0	; Adding button to enable/disable GUI while botting (as requested by YScorpion) - Demen
Global $g_ahLblHero[3], $g_hLblLab, $g_hLblLabTime	; Hero & Lab Status - Demen

Func CreateBottomPanel()
   Local $sTxtTip = ""
   ;~ ------------------------------------------------------
   ;~ Lower part visible on all Tabs
   ;~ ------------------------------------------------------

   ;~ Buttons
   Local $y_bottom = 0 ; 515
   Local $x = 10, $y = $y_bottom + 10
   GUICtrlCreateGroup("https://mybot.run " & GetTranslatedFileIni("MBR GUI Design Bottom", "Group_01", "- freeware bot -"), $x - 5, $y - 10, 190, 108)
	   $g_hBtnStart = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Bottom", "BtnStart", "Start Bot"), $x, $y + 2 +5, 90, 40-5)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Bottom", "BtnStart_Info_01", "Use this to START the bot."))
		   GUICtrlSetOnEvent(-1, "btnStart")
		   If $g_bBtnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
		   GUICtrlSetState(-1, $GUI_DISABLE)
	   $g_hBtnStop = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Bottom", "BtnStop", "Stop Bot"), -1, -1, 90, 40-5)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Bottom", "BtnStop_Info_01", "Use this to STOP the bot (or ESC key)."))
		   If $g_bBtnColor then GUICtrlSetBkColor(-1, 0xDB4D4D)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hBtnPause = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Bottom", "BtnPause", "Pause"), $x + 90, -1, 90, 40-5)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Bottom", "BtnPause_Info_01", "Use this to PAUSE all actions of the bot until you Resume (or Pause/Break key)."))
		   If $g_bBtnColor then GUICtrlSetBkColor(-1,  0xFFA500)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hBtnResume = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Bottom", "BtnResume", "Resume"), -1, -1, 90, 40-5)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Bottom", "BtnResume_Info_01", "Use this to RESUME a paused Bot (or Pause/Break key)."))
		   If $g_bBtnColor then GUICtrlSetBkColor(-1,  0xFFA500)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hBtnSearchMode = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Bottom", "BtnSearchMode", "Search Mode"), -1, -1, 90, 40-5)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Bottom", "BtnSearchMode_Info_01", "Does not attack. Searches for a Village that meets conditions."))
		   GUICtrlSetOnEvent(-1, "btnSearchMode")
		   If $g_bBtnColor then GUICtrlSetBkColor(-1,  0xFFA500)
		   GUICtrlSetState(-1, $GUI_DISABLE)
	   $g_hBtnMakeScreenshot = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Bottom", "BtnMakeScreenshot", "Photo"), $x , $y + 45, 40, -1)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Bottom", "BtnMakeScreenshot_Info_01", "Click here to take a snaphot of your village and save it to a file."))
		   If $g_bBtnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
	   $g_hBtnHide = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Bottom", "BtnHide", "Hide"), $x + 40, $y + 45, 50, -1)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Bottom", "BtnHide_Info_01", "Use this to move the Android Window out of sight.") & @CRLF & _
						      GetTranslatedFileIni("MBR GUI Design Bottom", "BtnHide_Info_02", "(Not minimized, but hidden)"))
		   If $g_bBtnColor Then GUICtrlSetBkColor(-1, 0x22C4F5)
		   GUICtrlSetState(-1, $GUI_DISABLE)
	   $g_hBtnEmbed = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Bottom", "BtnEmbed", "Dock"), $x + 90, $y + 45, 90, -1)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Bottom", "BtnEmbed_Info_01", "Use this to embed the Android Window into Bot."))
		   If $g_bBtnColor Then GUICtrlSetBkColor(-1, 0x22C4F5)
		   GUICtrlSetState(-1, $GUI_DISABLE)
		   GUICtrlSetOnEvent(-1, "btnEmbed")
	   $g_hChkBackgroundMode = GUICtrlCreateCheckbox(GetTranslatedFileIni("MBR GUI Design Bottom", "ChkBackgroundMode", "Background Mode"), $x + 1, $y + 72, 90, 24)
		   GUICtrlSetFont(-1, 7)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Bottom", "ChkBackgroundMode_Info_01", "Check this to ENABLE the Background Mode of the Bot.") & @CRLF & _
						      GetTranslatedFileIni("MBR GUI Design Bottom", "ChkBackgroundMode_Info_02", "With this you can also hide the Android Emulator window out of sight."))
		   GUICtrlSetOnEvent(-1, "chkBackground")
		   GUICtrlSetState(-1, (($g_bAndroidAdbScreencap = True) ? ($GUI_CHECKED) : ($GUI_UNCHECKED)))
	   $g_hLblDonate = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Bottom", "LblDonate", "Support the development"), $x + 224, $y + 85, 220, 20, $SS_RIGHT) ; was y+80 x height 24. Sorry I have to move this down a little bit - Demen		   GUICtrlSetCursor(-1, 0) ; https://www.autoitscript.com/autoit3/docs/functions/MouseGetCursor.htm
		   GUICtrlSetFont(-1, 8.5, $FW_BOLD) ;, $GUI_FONTITALIC + $GUI_FONTUNDER)
		   _GUICtrlSetTip(-1, GetTranslatedFileIni("MBR GUI Design Bottom", "LblDonate_Info_01", "Paypal Donate?"))
	   $g_hBtnAttackNowDB = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Bottom", "BtnAttackNowDB", "DB Attack!"), $x + 190, $y - 4, 60, -1)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hBtnAttackNowLB = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Bottom", "BtnAttackNowLB", "LB Attack!"), $x + 190, $y + 23, 60, -1)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hBtnAttackNowTS = GUICtrlCreateButton(GetTranslatedFileIni("MBR GUI Design Bottom", "BtnAttackNowTS", "TH Snipe!"), $x + 190, $y + 50, 60, -1)
		   GUICtrlSetState(-1, $GUI_HIDE)

		; Adding button to enable/disable GUI while botting (as requested by YScorpion) - Demen
		$g_hBtnEnableGUI = GUICtrlCreateButton("Enable GUI", $x + 100, $y + 72, 80, 22)
			_GUICtrlSetTip(-1, 	"Enable GUI control while botting" & @CRLF & _
								"   Warning:  USE THIS WITH CAUTION!" & @CRLF & _
								"   This function may create errors that require bot/PC restart" & @CRLF & _
								" 	Better to stop the Bot completely if you need to change the setting" )
			GUICtrlSetOnEvent(-1, "btnEnableGUI")
			GUICtrlSetState(-1, $GUI_HIDE)
		$g_hBtnDisableGUI = GUICtrlCreateButton("Disable GUI", $x + 100, $y + 72, 80, 22)
			_GUICtrlSetTip(-1, "Enable GUI control while botting")
			GUICtrlSetOnEvent(-1, "btnDisableGUI")
			GUICtrlSetState(-1, $GUI_HIDE)

   GUICtrlCreateGroup("", -99, -99, 1, 1)

   If $g_bAndroidAdbScreencap = True Then chkBackground() ; update background mode GUI

   $g_hPicTwoArrowShield = _GUICtrlCreateIcon($g_sLibIconPath, $eIcn2Arrow, $x + 190, $y + 10, 48, 48)

   $g_hLblVersion = GUICtrlCreateLabel($g_sBotVersion, 200, $y + 60, 60, 17, $SS_CENTER)
	   GUICtrlSetColor(-1, $COLOR_MEDGRAY)
   GUICtrlCreateLabel($g_sModversion, 200, $y + 80, 70, 17, $SS_CENTER) ;- Adding DEMEN Mod Version
	   GUICtrlSetColor(-1, $COLOR_MEDGRAY)

   $g_hPicArrowLeft = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnArrowLeft, $x + 249, $y + 30, 16, 16)
	  $sTxtTip = GetTranslatedFileIni("MBR GUI Design Bottom", "GrpVillage_Info_01", "Switch between village info and stats")
	  _GUICtrlSetTip(-1, $sTxtTip)
   $g_hPicArrowRight = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnArrowRight, $x + 247 + 198, $y + 30, 16, 16)
	  _GUICtrlSetTip(-1, $sTxtTip)

   ;~ Village
   Local $x = 295, $y = $y_bottom + 20	; y was +20 - Demen
   $g_hGrpVillage = GUICtrlCreateGroup(GetTranslatedFileIni("MBR GUI Design Bottom", "GrpVillage", "Village"), $x - 20, $y - 20, 180, 95) ; y height was 85
	   $y = $y_bottom + 17	; Move up a little bit - Demen
	   $g_hLblResultGoldNow = GUICtrlCreateLabel("", $x - 5, $y + 2, 60, 15, $SS_RIGHT)
	   $g_hLblResultGoldHourNow = GUICtrlCreateLabel("", $x, $y + 2, 60, 15, $SS_RIGHT)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultGoldNow = _GUICtrlCreateIcon ($g_sLibIconPath, $eIcnGold, $x + 60, $y, 16, 16)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultGoldTemp = _GUICtrlCreateIcon ($g_sLibIconPath, $eIcnGold, $x - 5, $y, 16, 16)
	   $g_hLblResultElixirNow = GUICtrlCreateLabel("", $x - 5, $y + 22, 60, 15, $SS_RIGHT)
	   $g_hLblResultElixirHourNow = GUICtrlCreateLabel("", $x, $y + 22, 60, 15, $SS_RIGHT)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultElixirNow = _GUICtrlCreateIcon ($g_sLibIconPath, $eIcnElixir, $x + 60, $y + 20, 16, 16)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultElixirTemp = _GUICtrlCreateIcon ($g_sLibIconPath, $eIcnElixir, $x - 5, $y + 20, 16, 16)
	   $g_hLblResultDENow = GUICtrlCreateLabel("", $x, $y + 42, 55, 15, $SS_RIGHT)
	   $g_hLblResultDEHourNow = GUICtrlCreateLabel("", $x, $y + 42, 60, 15, $SS_RIGHT)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultDENow = _GUICtrlCreateIcon ($g_sLibIconPath, $eIcnDark, $x + 60, $y + 40, 16, 16)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultDETemp = _GUICtrlCreateIcon ($g_sLibIconPath, $eIcnDark, $x - 5, $y + 40, 16, 16)

	   ;Hero & Lab status - Demen
	   $g_ahLblHero[0] = GUICtrlCreateLabel("K", $x - 5, $y + 60, 12, 14, $SS_CENTER)
	   GUICtrlSetFont(-1, 8.5)
	   GUICtrlSetColor(-1, $COLOR_MEDGRAY)
	   $g_ahLblHero[1] = GUICtrlCreateLabel("Q", $x + 25, $y + 60, 12, 14, $SS_CENTER)
	   GUICtrlSetFont(-1, 8.5)
	   GUICtrlSetColor(-1, $COLOR_MEDGRAY)
	   $g_ahLblHero[2] = GUICtrlCreateLabel("W", $x + 55, $y + 60, 12, 14, $SS_CENTER)
	   GUICtrlSetFont(-1, 8.5)
	   GUICtrlSetColor(-1, $COLOR_MEDGRAY)
	   $g_hLblLab = GUICtrlCreateLabel("Lab:", $x + 85, $y + 60, 22, 14, $SS_CENTER)
	   GUICtrlSetFont(-1, 8.5)
	   GUICtrlSetColor(-1, $COLOR_MEDGRAY)
	   $g_hlblLabTime = GUICtrlCreateLabel("", $x + 108, $y + 60, 45, 14, $SS_LEFT)
	   GUICtrlSetFont(-1, 8.5)
	   GUICtrlSetColor(-1, $COLOR_MEDGRAY)

	   $x += 75
	   ;trophy / runtime
	   $g_hLblResultTrophyNow = GUICtrlCreateLabel("", $x, $y + 2, 55, 15, $SS_RIGHT)
	   $g_hPicResultTrophyNow = _GUICtrlCreateIcon ($g_sLibIconPath, $eIcnTrophy, $x + 59, $y , 16, 16)
	   $g_hLblResultRuntimeNow = GUICtrlCreateLabel("00:00:00", $x, $y + 2, 50, 15, $SS_RIGHT)
	   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultRuntimeNow = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnHourGlass, $x +57, $y, 16, 16)
	   GUICtrlSetState(-1, $GUI_HIDE)
	   ;builders/attacked
	   $g_hLblResultBuilderNow = GUICtrlCreateLabel("", $x, $y + 22, 55, 15, $SS_RIGHT)
	   $g_hPicResultBuilderNow = _GUICtrlCreateIcon ($g_sLibIconPath, $eIcnBuilder, $x + 59, $y + 20, 16, 16)
	   $g_hLblResultAttackedHourNow = GUICtrlCreateLabel("0", $x, $y + 22, 50, 15, $SS_RIGHT)
	   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultAttackedHourNow = _GUICtrlCreateIcon($g_sLibIconPath, $eIcnBldgTarget, $x +59, $y + 20, 16, 16)
	   GUICtrlSetState(-1, $GUI_HIDE)
	   ;gems/skipped
	   $g_hLblResultGemNow = GUICtrlCreateLabel("", $x + 5, $y + 42, 50, 15, $SS_RIGHT)
	   $g_hPicResultGemNow = _GUICtrlCreateIcon ($g_sLibIconPath, $eIcnGem, $x + 59, $y + 40, 16, 16)
	   $g_hLblResultSkippedHourNow = GUICtrlCreateLabel("0", $x, $y + 42, 50, 15, $SS_RIGHT)
	   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultSkippedHourNow = _GUICtrlCreateIcon ($g_sLibIconPath, $eIcnBldgX, $x + 59, $y + 40, 16, 16)
	   GUICtrlSetState(-1, $GUI_HIDE)

	   $x = 285
	   $g_hLblVillageReportTemp = GUICtrlCreateLabel(GetTranslatedFileIni("MBR GUI Design Bottom", "LblVillageReportTemp_01", "Village Report") & @CRLF & GetTranslatedFileIni("MBR GUI Design Bottom", "LblVillageReportTemp_02", "will appear here") & @CRLF & GetTranslatedFileIni("MBR GUI Design Bottom", "LblVillageReportTemp_03", "on first run."), $x + 27, $y + 5, 100, 45, BITOR($SS_CENTER, $BS_MULTILINE))

	   $g_hBtnTestVillage = GUICtrlCreateButton("TEST BUTTON", $x + 25 , $y + 54, 100, 18)
		   GUICtrlSetOnEvent(-1, "ButtonBoost")
		   GUICtrlSetState(-1, $GUI_HIDE)

   GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc
