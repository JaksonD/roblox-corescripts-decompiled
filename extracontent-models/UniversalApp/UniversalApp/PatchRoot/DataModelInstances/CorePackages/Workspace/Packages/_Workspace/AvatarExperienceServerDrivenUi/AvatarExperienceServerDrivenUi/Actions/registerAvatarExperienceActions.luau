local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceServerDrivenUi").Parent;
local l_getSduiActionHandlerRegistry_0 = require(l_Parent_0.SduiCoreSystem).getSduiActionHandlerRegistry;
return function() --[[ Line: 9 ]] --[[ Name: registerAvatarExperienceActions ]]
    -- upvalues: l_getSduiActionHandlerRegistry_0 (copy)
    l_getSduiActionHandlerRegistry_0().registerActionHandlerConfigs({});
end;