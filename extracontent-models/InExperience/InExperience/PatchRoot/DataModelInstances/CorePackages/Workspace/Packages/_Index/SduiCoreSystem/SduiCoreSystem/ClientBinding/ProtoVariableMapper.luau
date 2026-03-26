local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.ServiceContractsProto);
local v3 = require(l_script_FirstAncestor_0.SduiActionType);
local v4 = require(l_script_FirstAncestor_0.SduiComponentType);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBindingContentType);
local l_snakeToCamel_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBinderTransformUtils).snakeToCamel;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local v8 = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then {
    AUTOMATIC_SIZE_XY = "XY", 
    SIZE_CONSTRAINT_RELATIVE_XY = "RelativeXY", 
    SIZE_CONSTRAINT_RELATIVE_XX = "RelativeXX", 
    SIZE_CONSTRAINT_RELATIVE_YY = "RelativeYY"
} else {};
local function v15(v9, v10, v11) --[[ Line: 52 ]] --[[ Name: convertToLuaEnum ]]
    local v12 = string.match(v9, "^" .. v10 .. "(.*)");
    if not v12 then
        return v9;
    else
        local v14 = v12:lower():gsub("_(%l)", function(v13) --[[ Line: 66 ]]
            return v13:upper();
        end);
        if v11 then
            return v14:gsub("^%l", string.upper);
        else
            return v14;
        end;
    end;
end;
local function v20(v16, v17, v18) --[[ Line: 84 ]] --[[ Name: mapProtoEnumFormatToLua ]]
    -- upvalues: v8 (copy), v15 (copy)
    local v19 = v8[v16];
    if not v19 then
        v19 = v15(v16, v17, v18);
        v8[v16] = v19;
    end;
    return v19;
end;
local function v26(v21, v22, v23) --[[ Line: 97 ]] --[[ Name: mapProtoEngineEnumToLua ]]
    -- upvalues: v8 (copy), v15 (copy)
    if v21 == nil then
        return nil;
    else
        local v24 = v8[v21];
        if not v24 then
            v24 = v15(v21, v22, true);
            v8[v21] = v24;
        end;
        local l_v24_0 = v24;
        if l_v24_0 then
            return v23(l_v24_0);
        else
            return nil;
        end;
    end;
end;
return {
    mapProtoEnumFormatToLua = v20, 
    mapUiComponentTypeToLua = function(v27) --[[ Line: 118 ]] --[[ Name: mapUiComponentTypeToLua ]]
        -- upvalues: v8 (copy), v15 (copy), v4 (copy)
        if v27 == nil then
            return nil;
        else
            local v28 = v8[v27];
            if not v28 then
                v28 = v15(v27, "UI_COMPONENT_TYPE_", true);
                v8[v27] = v28;
            end;
            local l_v28_0 = v28;
            if v4[l_v28_0] then
                return v4[l_v28_0];
            else
                return nil;
            end;
        end;
    end, 
    mapHydrationContentTypeToLua = function(v30) --[[ Line: 152 ]] --[[ Name: mapHydrationContentTypeToLua ]]
        -- upvalues: v8 (copy), v5 (copy)
        if v30 == nil then
            return nil;
        else
            local v31 = v8[v30];
            if not v31 then
                local v32 = string.match(v30, "^HYDRATION_CONTENT_TYPE_(.*)");
                v31 = if not v32 then v30 else v32:lower():gsub("_(%l)", function(v33) --[[ Line: 66 ]]
                    return v33:upper();
                end);
                v8[v30] = v31;
            end;
            local l_v31_0 = v31;
            if v5[l_v31_0] then
                return v5[l_v31_0];
            else
                return nil;
            end;
        end;
    end, 
    mapActionTypeToLua = function(v35) --[[ Line: 135 ]] --[[ Name: mapActionTypeToLua ]]
        -- upvalues: v8 (copy), v15 (copy), v3 (copy)
        if v35 == nil then
            return nil;
        else
            local v36 = v8[v35];
            if not v36 then
                v36 = v15(v35, "ACTION_TYPE_", true);
                v8[v35] = v36;
            end;
            local l_v36_0 = v36;
            if v3[l_v36_0] then
                return v3[l_v36_0];
            else
                return nil;
            end;
        end;
    end, 
    mapPropName = function(v38) --[[ Line: 172 ]] --[[ Name: mapPropName ]]
        -- upvalues: v8 (copy), l_snakeToCamel_0 (copy)
        if v38 == nil then
            return nil;
        elseif typeof(v38) == "number" then
            return v38;
        else
            local v39 = v8[v38];
            if not v39 then
                v39 = l_snakeToCamel_0(v38);
                v8[v38] = v39;
            end;
            return v39;
        end;
    end, 
    mapProtoEngineEnumToLua = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v26 else nil
};