// unit is executing player

params ["_unit", "_taskID", ["_wholegroup", false]];

private _groupID = [_unit] call GRAD_GPM_fnc_getGroup;

private _statusIdentifier = format ["GRAD_GPM_status_%1", _groupID];
private _status = missionNamespace getVariable [_statusIdentifier, "idle"];

if (_status != "idle") exitWith {
    diag_log format ["GRAD GPM: Can not start activity of %1 due to status not idle.", _groupID];
};

private _time = CBA_missionTime;
private _timeIdentifier = format ["GRAD_GPM_currentIndividualTime_%1", _unit];

if (_wholegroup) then {
    _timeIdentifier = format ["GRAD_GPM_currentGroupTime_%1", _groupID];
};

missionNamespace setVariable [_timeIdentifier, _time, true];

private _taskStatusIdentifier = format ["GRAD_GPM_taskStatus_%1", _taskID];
missionNamespace setVariable [_taskStatusIdentifier, "running", true];

// raise event for e.g. Curator to catch
["GRAD_GPM_taskStatusChange", [_unit, _taskID, "Started"]] call CBA_fnc_globalEvent;
