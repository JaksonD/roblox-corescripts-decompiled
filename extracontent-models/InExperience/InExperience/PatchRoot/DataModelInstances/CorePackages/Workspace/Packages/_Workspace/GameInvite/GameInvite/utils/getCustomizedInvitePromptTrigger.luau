local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local v1 = require(l_script_FirstAncestor_0.GameInviteConstants);
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local v3 = require(script.Parent.getCustomizedInvitePromptUserId);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), v1 (copy)
    return v3(v4) and v1.Triggers.DeveloperSingle or v1.Triggers.DeveloperMultiple;
end;