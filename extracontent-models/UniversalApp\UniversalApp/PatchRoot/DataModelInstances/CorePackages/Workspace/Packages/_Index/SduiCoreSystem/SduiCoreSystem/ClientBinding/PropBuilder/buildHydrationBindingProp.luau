local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local v1 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBinder);
local v2 = require(l_script_FirstAncestor_0.ClientBinding.tryGetPathFromData);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
return function(v5, v6, v7, v8) --[[ Line: 32 ]] --[[ Name: buildHydrationBindingProp ]]
    -- upvalues: v2 (copy), l_PropResultCategory_0 (copy), v1 (copy)
    local v9 = string.split(v5, ".");
    local v10, v11 = v2(v7, v9);
    if v10 and v11 ~= nil then
        if v8 then
            return v8(v11), l_PropResultCategory_0.Literal;
        else
            return v11, l_PropResultCategory_0.Literal;
        end;
    else
        local v12 = v9[1];
        local v13 = v6 and v6[v12];
        if v13 ~= nil then
            local l_contentType_0 = v13.contentType;
            local l_id_0 = v13.id;
            return v1.createFieldComputed(l_contentType_0, v9, l_id_0, v8), l_PropResultCategory_0.PropSignal;
        else
            error((("Could not find hydration source for key %*"):format(v12)));
            return;
        end;
    end;
end;