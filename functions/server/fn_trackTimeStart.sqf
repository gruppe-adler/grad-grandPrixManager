/*

    starts time tracking for unit or group
    sends event to curator for information

*/

params ["_unit", "_taskID"];

private _groupID = [_unit] call GRAD_GPM_fnc_getGroup;

private _taskState = format ["GRAD_GPM_taskState_%1", _taskID];
private _state = missionNamespace getVariable [_taskState, "idle"];

if (_status != "idle") exitWith {
    diag_log format ["GRAD GPM: Can not start activity of %1 due to status not idle.", _groupID];
};

private _time = CBA_missionTime;
private _timeIdentifier = format ["GRAD_GPM_currentGroupTime_%1", _groupID];
missionNamespace setVariable [_timeIdentifier, _time, true];

private _taskStatusIdentifier = format ["GRAD_GPM_taskStatus_%1", _taskID];
missionNamespace setVariable [_taskStatusIdentifier, "running", true];

// raise event for e.g. Curator to catch
["GRAD_GPM_taskStatusChange", [_unit, _taskID, "Started"]] call CBA_fnc_globalEvent;
