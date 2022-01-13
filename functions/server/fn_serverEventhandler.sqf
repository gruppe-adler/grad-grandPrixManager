["GRAD_GPM_trackTimeIndividualStart", {
    params ["_unit", "_taskID"];

    // time cannot be tracked if a) this task is running already or b) the unit already runs another task
    if ([_unit, _taskID] call GRAD_GPM_fnc_taskIsRunning) exitWith {};
    [_unit, false] call GRAD_GPM_fnc_trackTimeStart;

}] call CBA_fnc_addEventhandler;


["GRAD_GPM_trackTimeGroupStart", {
    params ["_unit", "_taskID"];

    // time cannot be tracked if a) this task is running already or b) the unit already runs another task
    if ([_unit, _taskID] call GRAD_GPM_fnc_taskIsRunning) exitWith {};
    [_unit, true] call GRAD_GPM_fnc_trackTimeStart;

}] call CBA_fnc_addEventhandler;
