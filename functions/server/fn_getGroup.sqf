params ["_unit"];

private _return = _unit getVariable ["GRAD_GPM_assignedGroup", ""];

if (_return == "") exitWith { diag_log format ["GRAD GPM ERROR: Cant find group for unit %1", _unit]; _return };

_return
