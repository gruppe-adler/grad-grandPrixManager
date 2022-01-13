// unit is executing player

params ["_unit"];

private _groupID = _unit getVariable ["GRAD_GPM_assignedGroup", ""];

private _statusIdentifier = format ["GRAD_GPM_status_%1", _groupID];
private _status = missionNamespace getVariable [_statusIdentifier, "idle"];

if (_status == "idle") exitWith {
    diag_log format ["GRAD GPM: Can not start activity of %1 due to status not idle.", _groupID];
};

[{

}, {

},[]] call CBA_fnc_waitUntilAndExecute;
