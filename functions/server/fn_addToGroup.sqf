params ["_unit", ["_groupID", ""]];

private _identifier = format ["GRAD_GPM_%1", _groupID];
private _array = missionNamespace getVariable [_identifier, []];

// put in smallest group if none specified
if (_groupID == "") exitWith { diag_log format ["GRAD GPM: Failed to add %1 due to non-specified group", _unit]; };

_array pushBackUnique _unit;
missionNamespace setVariable [_identifier, _array, true];

_unit setVariable ["GRAD_GPM_assignedGroup", _groupID, true];

diag_log format ["GRAD GPM: Successfully added %1 to %2", _unit, _groupID];
