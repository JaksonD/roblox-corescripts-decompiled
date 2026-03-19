local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.tryGetPathFromData);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.ProtoVariableMapper);
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local v8 = {
    [v4.badge] = {
        "badge_id"
    }, 
    [v4.creator] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
        "creator_key"
    } else nil, 
    [v4.universe] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
        "universe_id"
    } else nil
};
return function(v9, v10) --[[ Line: 68 ]] --[[ Name: buildDataBindingSourcesForTemplate ]]
    -- upvalues: v6 (copy), v3 (copy), v8 (copy)
    local v11 = {};
    for _, v13 in v10 do
        local v14 = v6.mapHydrationContentTypeToLua(v13.content_type);
        if not v14 then
            error((("Unsupported contentType %*"):format(v13.content_type)));
        end;
        local v15 = v13.id_binding and v13.id_binding.kind and v13.id_binding.kind.type;
        local v16 = v13.id_binding and v13.id_binding.kind and v13.id_binding.kind.value;
        local v17 = nil;
        if v15 == "literal" and v16 then
            v17 = v16;
        elseif v15 == "input_path" and v16 then
            local v18 = string.split(v16, ".");
            local v19, v20 = v3(v9, v18);
            if v19 and v20 ~= nil then
                v17 = v20;
            else
                error((("Unable to resolve path from inputPath: %* in data"):format(v16)));
            end;
        else
            local v21 = v8[v14];
            if v21 then
                local v22, v23 = v3(v9, v21);
                if v22 and v23 ~= nil then
                    v17 = v23;
                else
                    local v24 = table.concat(v21, ",");
                    error((("Unable to resolve default path: %* in data for contentType %*"):format(v24, v14)));
                end;
            else
                error((("Unable to find default for unknown contentType: %*"):format(v14)));
            end;
        end;
        v11[if v13.alias and v13.alias ~= "" then v13.alias else v14] = {
            contentType = v14, 
            id = v17
        };
    end;
    return v11;
end;