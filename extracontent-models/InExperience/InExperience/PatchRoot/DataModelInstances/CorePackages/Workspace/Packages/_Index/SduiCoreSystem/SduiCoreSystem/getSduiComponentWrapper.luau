local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.SduiComponent);
local v4 = require(l_script_FirstAncestor_0.SduiFastPathComponent);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.createSduiClientBindingWrappers);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local l_FFlagSduiComponentFiltering_0 = require(l_Parent_0.SharedFlags).FFlagSduiComponentFiltering;
local v9 = nil;
local function v11(v10) --[[ Line: 33 ]]
    -- upvalues: l_FFlagSduiComponentFiltering_0 (copy), v9 (ref), v4 (copy), v3 (copy)
    if v10 and v10.__isClientBinding then
        if v10.propSignals or l_FFlagSduiComponentFiltering_0 and v10.isComponentFilteredSignal ~= nil then
            return v9.SduiDataBindingWrapper;
        else
            return v9.SduiClientBindingThinWrapper;
        end;
    elseif v10 and v10.__processed and v10.conditionalProps == nil and v10.children == nil and (v10.templateKey == nil or v10.templateKey == "NONE") then
        return v4;
    else
        return v3;
    end;
end;
v9 = v5(v11);
return v11;