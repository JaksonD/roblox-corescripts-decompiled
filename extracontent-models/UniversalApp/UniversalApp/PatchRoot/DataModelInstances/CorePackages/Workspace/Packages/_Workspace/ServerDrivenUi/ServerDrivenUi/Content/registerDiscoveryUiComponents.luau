local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_getSduiComponentRegistry_0 = require(l_Parent_0.SduiCoreSystem).getSduiComponentRegistry;
local v3 = require(l_script_FirstAncestor_0.System.SduiComponentDefinitions);
return function() --[[ Line: 15 ]] --[[ Name: registerDiscoveryUiComponents ]]
    -- upvalues: v3 (copy), l_getSduiComponentRegistry_0 (copy)
    local l__registeredComponents_0 = v3.new()._registeredComponents;
    l_getSduiComponentRegistry_0().registerComponentDefinitions(l__registeredComponents_0);
end;