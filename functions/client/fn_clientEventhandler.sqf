["GRAD_GPM_taskStatusChange", {
    params ["_unit", "_taskID", "_string"];

    if (!isNull (getAssignedCuratorLogic player)) then {
        private _message = (name _unit + " " + _string + " task " + _taskID);
        private _color = [0.7,0.1,0.1,1];
        [_color, _message] call GRAD_GPM_fnc_curatorShowFeedbackMessage;
    };

}] call CBA_fnc_addEventhandler;


["GRAD_GPM_groupRename", {
    params ["_groupID", "_name"];

    if (!isNull (getAssignedCuratorLogic player)) then {
        private _message =  ("Gruppe " + str _groupID + " renamed to " + _name);
        private _color = [0.7,0.1,0.1,1];
        [_color, _message] call GRAD_GPM_fnc_curatorShowFeedbackMessage;
    };

}] call CBA_fnc_addEventhandler;
