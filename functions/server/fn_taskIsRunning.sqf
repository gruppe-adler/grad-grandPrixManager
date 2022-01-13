/*

    checks whether unit has already a task running or if the task itself is already running

*/

params ["_unit", "_taskID"];

private _taskStatusIdentifier = format ["GRAD_GPM_taskStatus_%1", _taskID];
private _taskStatus = missionNamespace getVariable [_taskStatusIdentifier, "idle"] != "idle";

private _unitStatusIdentifier = format ["GRAD_GPM_unitStatus_%1", _groupID];
private _unitStatus = missionNamespace getVariable [_unitStatusIdentifier, "idle"] != "idle";

private _return = if (_taskStatus || _unitStatus) then {
  diag_log format ["GRAD GPM: taskIsRunning: _taskStatus %1 – _unitStatus %2", _taskStatus, _unitStatus];
  true
} else { false };

_return
