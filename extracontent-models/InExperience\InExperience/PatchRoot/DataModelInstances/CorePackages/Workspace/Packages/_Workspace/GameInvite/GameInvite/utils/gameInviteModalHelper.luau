local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local v1 = require(l_script_FirstAncestor_0.GameInviteConstants);
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
isTriggerDDI = function(v3) --[[ Line: 5 ]] --[[ Name: isTriggerDDI ]]
    -- upvalues: v1 (copy)
    local v4 = true;
    if v3 ~= v1.Triggers.DeveloperSingle then
        v4 = v3 == v1.Triggers.DeveloperMultiple;
    end;
    return v4;
end;
isTriggerGameMenu = function(v5) --[[ Line: 9 ]] --[[ Name: isTriggerGameMenu ]]
    -- upvalues: v1 (copy)
    return v5 == v1.Triggers.GameMenu;
end;
return {
    isTriggerDDI = isTriggerDDI, 
    isTriggerGameMenu = isTriggerGameMenu
};