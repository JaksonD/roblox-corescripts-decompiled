local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local v1 = require(l_script_FirstAncestor_0.SduiComponentType);
local v2 = require(l_script_FirstAncestor_0.SduiConfigTypes);
local l_SduiErrorType_0 = require(l_script_FirstAncestor_0.SduiErrors).SduiErrorType;
local l_UiComponentInterface_0 = v2.UiComponentInterface;
local v5 = require(l_script_FirstAncestor_0.validateInterface);
return function(v6, v7) --[[ Line: 19 ]] --[[ Name: validateSduiComponentConfig ]]
    -- upvalues: l_SduiErrorType_0 (copy), v5 (copy), l_UiComponentInterface_0 (copy), v1 (copy)
    if v6 == nil then
        return false, {
            errorType = l_SduiErrorType_0.NilComponentConfig
        };
    else
        assert(v6, "componentConfig must exist");
        local v8, v9 = v5(v6, l_UiComponentInterface_0, v7);
        if not v8 then
            return false, {
                errorType = l_SduiErrorType_0.InvalidComponentConfig, 
                message = v9
            };
        elseif v1[v6.componentType] ~= nil then
            return true;
        else
            return false, {
                errorType = l_SduiErrorType_0.ComponentTypeNotRecognized
            };
        end;
    end;
end;