local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v4 = require(l_script_FirstAncestor_0.Actions.SetGamepadEnabled);
local v5 = true;
if l_UserInputService_0:GetPlatform() ~= Enum.Platform.XBoxOne then
    v5 = true;
    if l_UserInputService_0:GetPlatform() ~= Enum.Platform.PS4 then
        v5 = l_UserInputService_0:GetPlatform() == Enum.Platform.PS5;
    end;
end;
return (l_Rodux_0.createReducer(v5, {
    [v4.name] = function(_, v7) --[[ Line: 15 ]]
        return v7.enabled;
    end
}));