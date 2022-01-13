// unit is executing player

params ["_unit", "_taskID", ["_wholegroup", false]];

// get identifier variables
private _groupID = [_unit] call GRAD_GPM_fnc_getGroup;
private _groupStatusIdentifier = format ["GRAD_GPM_groupStatus_%1", _groupID];
private _groupStatus = missionNamespace getVariable [_groupStatusIdentifier, "idle"];

// stores task status
private _taskStatusIdentifier = format ["GRAD_GPM_taskStatus_%1", _taskID];

// stores result indefinitely
private _resultsIdentifier = format ["GRAD_GPM_result_task_%1_group_%2", _taskID, _groupID];
private _previousResults = missionNameSpace getVariable [_resultsIdentifier, []];

// stores time value during measurement
private _timeIdentifier = format ["GRAD_GPM_currentIndividualTime_%1", _unit];
if (_wholegroup) then {
    _timeIdentifier = format ["GRAD_GPM_currentGroupTime_%1", _groupID];
};

if (_groupStatus == "idle") exitWith {
    diag_log format ["GRAD GPM: Can not stop activity of %1 due to status idle.", _groupID];
};


// read timings
private _endTime = CBA_missionTime;
private _startTime = missionNamespace getVariable [_timeIdentifier, 0];
private _elapsedTime = _endTime - _startTime;

if (_wholegroup) then {
  _previousResults pushBack [_unit, _elapsedTime];
} else {
  _previousResults pushBack [_groupID, _elapsedTime];
};

// store end time in dedicated var array indefinitely
missionNameSpace setVariable [_resultsIdentifier, _previousResults, true];


// reset group status and task status to default
missionNamespace setVariable [_groupStatusIdentifier, "idle", true];
missionNamespace setVariable [_taskStatusIdentifier, "idle", true];

// raise event for e.g. Curator to catch
["GRAD_GPM_taskStatusChange", [_unit, _taskID, "Stopped"]] call CBA_fnc_globalEvent;
