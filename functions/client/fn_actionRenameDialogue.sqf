params ["_unit"];

if (!canSuspend) exitWith {
    [_unit] spawn GRAD_GPM_fnc_actionRenameDialogue;
};


private _groupID = [_unit] call GRAD_GPM_fnc_groupGet;

disableSerialization;

private _display = findDisplay 46 createDisplay "RscDisplayEmpty";
private _ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
private _ctrlBackground = _display ctrlCreate ["RscTextMulti", -1, _ctrlGroup];

GRAD_GPM_INPUT_RENAME = 1337;

private _ctrlEdit = _display ctrlCreate ["RscEditMulti", GRAD_GPM_INPUT_RENAME, _ctrlGroup];
private _ctrlButton = _display ctrlCreate ["RscShortcutButton", -1, _ctrlGroup];

_ctrlGroup ctrlSetPosition [0.5, 0.5, 0, 0];
_ctrlGroup ctrlCommit 0;

_ctrlBackground ctrlSetPosition [0, 0, 0.5, 0.5];
_ctrlBackground ctrlSetBackgroundColor [0.5, 0.5, 0.5, 0.9];
_ctrlBackground ctrlSetText "ENTER TEXT:";
_ctrlBackground ctrlEnable false;
_ctrlBackground ctrlCommit 0;

_ctrlEdit ctrlSetPosition [0.01, 0.05, 0.48, 0.34];
_ctrlEdit ctrlSetBackgroundColor [0, 0, 0, 0.5];
_ctrlEdit ctrlCommit 0;

_ctrlButton ctrlSetPosition [0.185, 0.42, 0.13, 0.05];
_ctrlButton ctrlCommit 0;
_ctrlButton ctrlSetText "RENAME";
_ctrlButton ctrlAddEventHandler ["ButtonClick", 
{
    params ["_ctrl"];
    
    private _display = ctrlParent _ctrl;
    private _newName = ctrlText (_display displayCtrl GRAD_GPM_INPUT_RENAME);
    if (_newName == "") then { _newName = "No Name" };
    
    ["GRAD_GPM_groupRename", [_groupID, _newName]] call CBA_fnc_globalEvent;

    _display closeDisplay 1;

}];

ctrlSetFocus _ctrlEdit;
_ctrlGroup ctrlSetPosition [0.25, 0.25, 0.5, 0.5];
_ctrlGroup ctrlCommit 0.1;

playSound "Hint3";

