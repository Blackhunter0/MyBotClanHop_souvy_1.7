; #FUNCTION# ====================================================================================================================
; Name ..........: readConfig.au3
; Description ...: Reads config file and sets variables
; Syntax ........: readConfig()
; Parameters ....: NA
; Return values .: NA
; Author ........: Demen
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func ReadConfig_SimpleTrain()

	; QuickTrainCombo (check box)
	$g_bQuickTrainEnable = (IniRead($g_sProfileConfigPath, "other", "ChkUseQTrain", "0") = "1")
	$g_bQuickTrainArmy[0] = (IniRead($g_sProfileConfigPath, "troop", "QuickTrainArmy1", "0") = "1")
	$g_bQuickTrainArmy[1] = (IniRead($g_sProfileConfigPath, "troop", "QuickTrainArmy2", "0") = "1")
	$g_bQuickTrainArmy[2] = (IniRead($g_sProfileConfigPath, "troop", "QuickTrainArmy3", "0") = "1")

	; SimpleTrain
	IniReadS($ichkSimpleTrain, $g_sProfileConfigPath, "SimpleTrain", "Enable", 0, "int")
	IniReadS($ichkPreciseTroops, $g_sProfileConfigPath, "SimpleTrain", "PreciseTroops", 0, "int")
	IniReadS($ichkFillArcher, $g_sProfileConfigPath, "SimpleTrain", "ChkFillArcher", 0, "int")
	IniReadS($iFillArcher, $g_sProfileConfigPath, "SimpleTrain", "FillArcher", 5, "int")
	IniReadS($ichkFillEQ, $g_sProfileConfigPath, "SimpleTrain", "FillEQ", 0, "int")

EndFunc   ;==>ReadConfig_SimpleTrain

Func ReadConfig_SwitchAcc()
	IniReadS($ichkSwitchAcc, $profile, "SwitchAcc", "Enable", 0, "int")
	IniReadS($icmbTotalCoCAcc, $profile, "SwitchAcc", "Total Coc Account", -1, "int")
	IniReadS($ichkSmartSwitch, $profile, "SwitchAcc", "Smart Switch", 0, "int")
	IniReadS($ichkForceSwitch, $profile, "SwitchAcc", "Force Switch", 0, "int")
	IniReadS($iForceSwitch, $profile, "SwitchAcc", "Force Switch Search", 100, "int")
	IniReadS($ichkForceStayDonate, $profile, "SwitchAcc", "Force Stay Donate", 0, "int")
	IniReads($ichkCloseTraining, $profile, "SwitchAcc", "Sleep Combo", 0, "int") ; Sleep Combo, 1 = Close CoC, 2 = Close Android, 0 = No sleep
	For $i = 0 To 7
		IniReadS($aMatchProfileAcc[$i], $profile, "SwitchAcc", "MatchProfileAcc." & $i + 1, "-1")
		IniReadS($aProfileType[$i], $profile, "SwitchAcc", "ProfileType." & $i + 1, "-1")
		IniReadS($aAccPosY[$i], $profile, "SwitchAcc", "AccLocation." & $i + 1, "-1")
	Next
EndFunc   ;==>ReadConfig_SwitchAcc
