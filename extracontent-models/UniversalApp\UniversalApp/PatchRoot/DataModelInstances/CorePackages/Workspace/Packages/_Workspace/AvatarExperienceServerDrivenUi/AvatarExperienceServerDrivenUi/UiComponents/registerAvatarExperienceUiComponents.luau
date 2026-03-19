local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceServerDrivenUi").Parent;
local l_getSduiComponentRegistry_0 = require(l_Parent_0.SduiCoreSystem).getSduiComponentRegistry;
return function() --[[ Line: 7 ]] --[[ Name: registerAvatarExperienceUiComponents ]]
    -- upvalues: l_getSduiComponentRegistry_0 (copy)
    l_getSduiComponentRegistry_0().registerComponentDefinitions({});
end;