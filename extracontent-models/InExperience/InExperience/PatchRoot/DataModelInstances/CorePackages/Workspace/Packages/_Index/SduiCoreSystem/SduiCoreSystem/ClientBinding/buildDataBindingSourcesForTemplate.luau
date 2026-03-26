local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v3 = require(l_script_FirstAncestor_0.ClientBinding.tryGetPathFromData);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local _ = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.ProtoVariableMapper);
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
local v9 = {
    [v4.badge] = {
        "badge_id"
    }, 
    [v4.creator] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
        "creator_key"
    } else nil, 
    [v4.universe] = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
        "universe_id"
    } else nil, 
    [v4.ageRecommendation] = if l_FFlagSduiExperienceDetailsSupport_0 then {
        "universe_id"
    } else nil, 
    [v4.socialLink] = if l_FFlagSduiExperienceDetailsSupport_0 then {
        "social_link_id"
    } else nil
};
return function(v10, v11) --[[ Line: 75 ]] --[[ Name: buildDataBindingSourcesForTemplate ]]
    -- upvalues: v6 (copy), v3 (copy), v9 (copy)
    local v12 = {};
    for _, v14 in v11 do
        local v15 = v6.mapHydrationContentTypeToLua(v14.content_type);
        if not v15 then
            error((("Unsupported contentType %*"):format(v14.content_type)));
        end;
        local v16 = v14.id_binding and v14.id_binding.kind and v14.id_binding.kind.type;
        local v17 = v14.id_binding and v14.id_binding.kind and v14.id_binding.kind.value;
        local v18 = nil;
        if v16 == "literal" and v17 then
            v18 = v17;
        elseif v16 == "input_path" and v17 then
            local v19 = string.split(v17, ".");
            local v20, v21 = v3(v10, v19);
            if v20 and v21 ~= nil then
                v18 = v21;
            else
                error((("Unable to resolve path from inputPath: %* in data"):format(v17)));
            end;
        else
            local v22 = v9[v15];
            if v22 then
                local v23, v24 = v3(v10, v22);
                if v23 and v24 ~= nil then
                    v18 = v24;
                else
                    local v25 = table.concat(v22, ",");
                    error((("Unable to resolve default path: %* in data for contentType %*"):format(v25, v15)));
                end;
            else
                error((("Unable to find default for unknown contentType: %*"):format(v15)));
            end;
        end;
        v12[if v14.alias and v14.alias ~= "" then v14.alias else v15] = {
            contentType = v15, 
            id = v18
        };
    end;
    return v12;
end;