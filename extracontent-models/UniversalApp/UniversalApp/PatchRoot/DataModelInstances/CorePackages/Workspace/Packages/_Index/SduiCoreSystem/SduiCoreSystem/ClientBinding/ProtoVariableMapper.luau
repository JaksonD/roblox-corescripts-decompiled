local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v3 = require(l_script_FirstAncestor_0.SduiActionType);
local v4 = require(l_script_FirstAncestor_0.SduiComponentType);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local l_snakeToCamel_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBinderTransformUtils).snakeToCamel;
local l_FFlagSduiV2ConditionalSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2ConditionalSupport;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local v9 = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
    AUTOMATIC_SIZE_XY = "XY", 
    SIZE_CONSTRAINT_RELATIVE_XY = "RelativeXY", 
    SIZE_CONSTRAINT_RELATIVE_XX = "RelativeXX", 
    SIZE_CONSTRAINT_RELATIVE_YY = "RelativeYY"
} else {};
local function v16(v10, v11, v12) --[[ Line: 53 ]] --[[ Name: convertToLuaEnum ]]
    local v13 = string.match(v10, "^" .. v11 .. "(.*)");
    if not v13 then
        return v10;
    else
        local v15 = v13:lower():gsub("_(%l)", function(v14) --[[ Line: 67 ]]
            return v14:upper();
        end);
        if v12 then
            return v15:gsub("^%l", string.upper);
        else
            return v15;
        end;
    end;
end;
local function v21(v17, v18, v19) --[[ Line: 85 ]] --[[ Name: mapProtoEnumFormatToLua ]]
    -- upvalues: v9 (copy), v16 (copy)
    local v20 = v9[v17];
    if not v20 then
        v20 = v16(v17, v18, v19);
        v9[v17] = v20;
    end;
    return v20;
end;
local function v27(v22, v23, v24) --[[ Line: 98 ]] --[[ Name: mapProtoEngineEnumToLua ]]
    -- upvalues: v9 (copy), v16 (copy)
    if v22 == nil then
        return nil;
    else
        local v25 = v9[v22];
        if not v25 then
            v25 = v16(v22, v23, true);
            v9[v22] = v25;
        end;
        local l_v25_0 = v25;
        if l_v25_0 then
            return v24(l_v25_0);
        else
            return nil;
        end;
    end;
end;
return {
    mapProtoEnumFormatToLua = v21, 
    mapUiComponentTypeToLua = function(v28) --[[ Line: 119 ]] --[[ Name: mapUiComponentTypeToLua ]]
        -- upvalues: v9 (copy), v16 (copy), v4 (copy)
        if v28 == nil then
            return nil;
        else
            local v29 = v9[v28];
            if not v29 then
                v29 = v16(v28, "UI_COMPONENT_TYPE_", true);
                v9[v28] = v29;
            end;
            local l_v29_0 = v29;
            if v4[l_v29_0] then
                return v4[l_v29_0];
            else
                return nil;
            end;
        end;
    end, 
    mapHydrationContentTypeToLua = function(v31) --[[ Line: 153 ]] --[[ Name: mapHydrationContentTypeToLua ]]
        -- upvalues: v9 (copy), v16 (copy), v5 (copy)
        if v31 == nil then
            return nil;
        else
            local v32 = v9[v31];
            if not v32 then
                v32 = v16(v31, "HYDRATION_CONTENT_TYPE_", false);
                v9[v31] = v32;
            end;
            local l_v32_0 = v32;
            if v5[l_v32_0] then
                return v5[l_v32_0];
            else
                return nil;
            end;
        end;
    end, 
    mapActionTypeToLua = function(v34) --[[ Line: 136 ]] --[[ Name: mapActionTypeToLua ]]
        -- upvalues: v9 (copy), v16 (copy), v3 (copy)
        if v34 == nil then
            return nil;
        else
            local v35 = v9[v34];
            if not v35 then
                v35 = v16(v34, "ACTION_TYPE_", true);
                v9[v34] = v35;
            end;
            local l_v35_0 = v35;
            if v3[l_v35_0] then
                return v3[l_v35_0];
            else
                return nil;
            end;
        end;
    end, 
    mapPropName = function(v37) --[[ Line: 173 ]] --[[ Name: mapPropName ]]
        -- upvalues: l_FFlagSduiV2ConditionalSupport_0 (copy), v9 (copy), l_snakeToCamel_0 (copy)
        if v37 == nil then
            return nil;
        elseif l_FFlagSduiV2ConditionalSupport_0 and typeof(v37) == "number" then
            return v37;
        else
            local v38 = v9[v37];
            if not v38 then
                v38 = l_snakeToCamel_0(v37);
                v9[v37] = v38;
            end;
            return v38;
        end;
    end, 
    mapProtoEngineEnumToLua = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v27 else nil
};