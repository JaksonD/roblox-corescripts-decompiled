local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.SduiComponent);
local v4 = require(l_script_FirstAncestor_0.SduiFastPathComponent);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.createSduiClientBindingWrappers);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v8 = require(l_Parent_0.SharedFlags);
local l_FFlagSduiClientBinding_0 = v8.FFlagSduiClientBinding;
local l_FFlagSduiComponentFiltering_0 = v8.FFlagSduiComponentFiltering;
local v11 = nil;
local function v13(v12) --[[ Line: 34 ]]
    -- upvalues: l_FFlagSduiClientBinding_0 (copy), l_FFlagSduiComponentFiltering_0 (copy), v11 (ref), v4 (copy), v3 (copy)
    if l_FFlagSduiClientBinding_0 and v12 and v12.__isClientBinding then
        if v12.propSignals or l_FFlagSduiComponentFiltering_0 and v12.isComponentFilteredSignal ~= nil then
            return v11.SduiDataBindingWrapper;
        else
            return v11.SduiClientBindingThinWrapper;
        end;
    elseif v12 and v12.__processed and v12.conditionalProps == nil and v12.children == nil and (v12.templateKey == nil or v12.templateKey == "NONE") then
        return v4;
    else
        return v3;
    end;
end;
if l_FFlagSduiClientBinding_0 then
    v11 = v5(v13);
end;
return v13;