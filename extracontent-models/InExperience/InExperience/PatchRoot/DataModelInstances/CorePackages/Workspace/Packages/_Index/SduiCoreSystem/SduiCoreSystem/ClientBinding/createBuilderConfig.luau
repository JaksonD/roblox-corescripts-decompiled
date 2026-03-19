local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.getPropBuilder);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
return function(v5) --[[ Line: 26 ]] --[[ Name: createBuilderConfig ]]
    -- upvalues: v3 (copy)
    return {
        appPage = v5.appPage, 
        debugName = v5.debugName, 
        getTemplateForRobloxComponent = v5.getTemplateForRobloxComponent, 
        getPropBuilder = v3
    };
end;