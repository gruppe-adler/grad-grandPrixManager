params ["_unit"];

private _groupID = [_unit] call GRAD_GPM_fnc_groupGet;


private _newName = "Todo";
["GRAD_GPM_groupRename", [_groupID, _newName]] call CBA_fnc_globalEvent;
