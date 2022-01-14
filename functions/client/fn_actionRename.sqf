// rename action
private _displayName = "Rename Group";
private _action = ["grad_gpm_renameGroup", _displayName, "\A3\ui_f\data\igui\cfg\actions\heal_ca.paa", {
    [player] spawn GRAD_GPM_fnc_actionRenameDialogue;
}, {(_target == leader group _target}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
