; #FUNCTION# ====================================================================================================================
; Name ..........: saveConfig.au3
; Description ...: Saves all of the GUI values to the config.ini and building.ini files
; Syntax ........: saveConfig()
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

Func SaveConfig_SimpleTrain()
	; QuickTrainCombo (Checkbox) - Demen
	ApplyConfig_SimpleTrain("Save")
	_Ini_Add("other", "ChkUseQTrain", $g_bQuickTrainEnable ? 1 : 0)
	_Ini_Add("troop", "QuickTrainArmy1", $g_bQuickTrainArmy[0] ? 1 : 0)
	_Ini_Add("troop", "QuickTrainArmy2", $g_bQuickTrainArmy[1] ? 1 : 0)
	_Ini_Add("troop", "QuickTrainArmy3", $g_bQuickTrainArmy[2] ? 1 : 0)

	; SimpleTrain (Demen)
	_Ini_Add("SimpleTrain", "Enable", $ichkSimpleTrain)
	_Ini_Add("SimpleTrain", "PreciseTroops", $ichkPreciseTroops)
	_Ini_Add("SimpleTrain", "ChkFillArcher", $ichkFillArcher)
	_Ini_Add("SimpleTrain", "FillArcher", $iFillArcher)
	_Ini_Add("SimpleTrain", "FillEQ", $ichkFillEQ)

EndFunc   ;==>SaveConfig_SimpleTrain

Func SaveConfig_SwitchAcc()
	ApplyConfig_SwitchAcc("Save")

	IniWriteS($profile, "SwitchAcc", "Enable", $ichkSwitchAcc ? 1 : 0)
	IniWriteS($profile, "SwitchAcc", "Total Coc Account", $icmbTotalCoCAcc) ; 1 = 1 Acc, 2 = 2 Acc, etc.
	IniWriteS($profile, "SwitchAcc", "Smart Switch", $ichkSmartSwitch ? 1 : 0)
	IniWriteS($profile, "SwitchAcc", "Force Switch", $ichkForceSwitch ? 1 : 0)
	IniWriteS($profile, "SwitchAcc", "Force Switch Search", $iForceSwitch)
	IniWriteS($profile, "SwitchAcc", "Force Stay Donate", $ichkForceStayDonate ? 1 : 0)
	IniWriteS($profile, "SwitchAcc", "Sleep Combo", $ichkCloseTraining) ; 0 = No Sleep, 1 = Close CoC, 2 = Close Android
	For $i = 1 To 8
		IniWriteS($profile, "SwitchAcc", "MatchProfileAcc." & $i, _GUICtrlComboBox_GetCurSel($cmbAccountNo[$i - 1]) + 1) ; 1 = Acc 1, 2 = Acc 2, etc.
		IniWriteS($profile, "SwitchAcc", "ProfileType." & $i, _GUICtrlComboBox_GetCurSel($cmbProfileType[$i - 1]) + 1) ; 1 = Active, 2 = Donate, 3 = Idle
	Next
EndFunc   ;==>SaveConfig_SwitchAcc

