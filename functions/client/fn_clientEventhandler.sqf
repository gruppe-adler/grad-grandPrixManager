["GRAD_GPM_taskStatusChange", {
    params ["_unit", "_taskID", "_string"];

    if (!isNull (getAssignedCuratorLogic player)) then {
        hint (name _unit + " " + _string + " task " + _taskID);
    };

}] call CBA_fnc_addEventhandler;
