/*

    groups are specified through slots (setVariable in init)
    groupname can be set independently

    results are stored by group id hash for each task

*/


if (!isServer) exitWith {};

private _tasks = "true" configClasses (configFile >> "cfgGRADGPM");
private _count = count _tasks;

diag_log format ["GRAD GPM: %1 Tasks detected", _count];

// create hashmap for group names
missionNamespace setVariable ["GRAD_GPM_groupNames", createHashMap, true];
missionNamespace setVariable ["GRAD_GPM_taskStates", createHashMap];

// create result hashmap for each task
for "_i" from 1 to _count do {
    private _taskResult = format ["GRAD_GPM_taskResult_%1", _i];
    missionNamespace setVariable [_taskResult, createHashMap];

    diag_log format ["GRAD GPM: Hashmap for task %1 created", _i];

    GRAD_GPM_taskStates set [_i, "idle"];
};

publicVariable "GRAD_GPM_groupNames";
publicVariable "GRAD_GPM_taskStates";


addMissionEventHandler ["PlayerConnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

  private _player = _uid call BIS_fnc_getUnitByUID;

  [([_player] call GRAD_GPM_fnc_groupGet)] call GRAD_GPM_fnc_groupAdd;

  // _unit setVariable ["GRAD_GPM_assignedGroup", 1, true]; // put into every playable units init
}];
