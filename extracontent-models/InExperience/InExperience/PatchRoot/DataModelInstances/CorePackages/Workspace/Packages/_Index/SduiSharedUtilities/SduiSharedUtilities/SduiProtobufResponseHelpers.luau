local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_getProtoVariableMapper_0 = require(l_Parent_0.SduiCoreSystem).getProtoVariableMapper;
local _ = require(l_script_FirstAncestor_0.SduiIntegrationTypes);
local l_FFlagSduiUniversalPageEntry_0 = require(l_Parent_0.SharedFlags).FFlagSduiUniversalPageEntry;
local l_FFlagSduiHydrationDataCamelCaseTopLevelKeys_0 = require(l_Parent_0.SharedFlags).FFlagSduiHydrationDataCamelCaseTopLevelKeys;
local l_FFlagSduiHydrationDataCamelCasePropertyKeys_0 = require(l_Parent_0.SharedFlags).FFlagSduiHydrationDataCamelCasePropertyKeys;
local l_FFlagSduiLocalizedLiterals_0 = require(l_Parent_0.SharedFlags).FFlagSduiLocalizedLiterals;
local function v12(v9, v10) --[[ Line: 23 ]] --[[ Name: decodeProto ]]
    local v11 = if typeof(v10) == "string" then buffer.fromstring(v10) else v10;
    return v9.decode(v11);
end;
local function v16(v13, v14) --[[ Line: 35 ]] --[[ Name: decodeProtobufJson ]]
    -- upvalues: l_HttpService_0 (copy)
    local v15 = if typeof(v14) == "buffer" then buffer.tostring(v14) else v14;
    return v13.jsonDecode(l_HttpService_0:JSONDecode(v15));
end;
return {
    decodeProto = v12, 
    decodeProtobufJson = v16, 
    makeProtoResponseDecoder = function(v17) --[[ Line: 43 ]] --[[ Name: makeProtoResponseDecoder ]]
        -- upvalues: v12 (copy)
        return function(v18) --[[ Line: 44 ]]
            -- upvalues: v12 (ref), v17 (copy)
            return v12(v17, v18);
        end;
    end, 
    makeProtobufJsonResponseDecoder = function(v19) --[[ Line: 52 ]] --[[ Name: makeProtobufJsonResponseDecoder ]]
        -- upvalues: v16 (copy)
        return function(v20) --[[ Line: 53 ]]
            -- upvalues: v16 (ref), v19 (copy)
            return v16(v19, v20);
        end;
    end, 
    parsePageEntriesFromResponse = function(v21) --[[ Line: 63 ]] --[[ Name: parsePageEntriesFromResponse ]]
        -- upvalues: l_FFlagSduiUniversalPageEntry_0 (copy)
        local v22 = {};
        if v21.page_entries then
            for _, v24 in v21.page_entries do
                local l_roblox_component_0 = v24.page_entry.roblox_component;
                local v26 = if l_FFlagSduiUniversalPageEntry_0 then v24.input_data and v24.input_data.kind and v24.input_data.kind.value else v24.kind and v24.kind.value;
                local l_identifier_0 = v24.page_entry.identifier;
                local l_title_0 = v24.page_entry.title;
                table.insert(v22, {
                    robloxComponentType = l_roblox_component_0, 
                    identifier = if l_identifier_0 ~= "" then l_identifier_0 else nil, 
                    componentInputData = v26, 
                    title = l_title_0
                });
            end;
        end;
        return v22;
    end, 
    parseHydrationDataFromResponse = function(v29) --[[ Line: 89 ]] --[[ Name: parseHydrationDataFromResponse ]]
        -- upvalues: l_FFlagSduiHydrationDataCamelCasePropertyKeys_0 (copy), l_getProtoVariableMapper_0 (copy), l_FFlagSduiHydrationDataCamelCaseTopLevelKeys_0 (copy)
        local l_hydration_data_0 = v29.hydration_data;
        if l_hydration_data_0 then
            for _, v32 in l_hydration_data_0 do
                for _, v34 in v32 do
                    if l_FFlagSduiHydrationDataCamelCasePropertyKeys_0 then
                        local v35 = {};
                        for v36, v37 in v34 do
                            v35[l_getProtoVariableMapper_0().mapPropName(v36)] = v37;
                        end;
                        for v38, v39 in v35 do
                            v34[v38] = v39;
                        end;
                    else
                        for v40, v41 in v34 do
                            v34[l_getProtoVariableMapper_0().mapPropName(v40)] = v41;
                        end;
                    end;
                end;
            end;
            if l_FFlagSduiHydrationDataCamelCaseTopLevelKeys_0 then
                local v42 = l_getProtoVariableMapper_0();
                local v43 = {};
                for v44, v45 in l_hydration_data_0 do
                    if v45 then
                        v43[v42.mapPropName(v44)] = v45;
                    end;
                end;
                for v46, v47 in v43 do
                    l_hydration_data_0[v46] = v47;
                end;
            end;
        end;
        return l_hydration_data_0;
    end, 
    parseLocalizedLiteralsFromResponse = function(v48) --[[ Line: 138 ]] --[[ Name: parseLocalizedLiteralsFromResponse ]]
        -- upvalues: l_FFlagSduiLocalizedLiterals_0 (copy)
        if l_FFlagSduiLocalizedLiterals_0 and v48.localized_literals then
            return v48.localized_literals;
        else
            return nil;
        end;
    end, 
    parseTemplateEntriesFromResponse = function(v49) --[[ Line: 149 ]] --[[ Name: parseTemplateEntriesFromResponse ]]
        local v50 = {};
        local v51 = {};
        if v49.templates then
            for v52, v53 in v49.templates do
                v51[v53.roblox_component] = v53.template;
                v50[v52] = v53.template;
            end;
        end;
        return v50, v51;
    end
};