local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_getProtoVariableMapper_0 = require(l_Parent_0.SduiCoreSystem).getProtoVariableMapper;
local _ = require(l_script_FirstAncestor_0.SduiIntegrationTypes);
local l_FFlagSduiUniversalPageEntry_0 = require(l_Parent_0.SharedFlags).FFlagSduiUniversalPageEntry;
local l_FFlagSduiHydrationDataCamelCaseTopLevelKeys_0 = require(l_Parent_0.SharedFlags).FFlagSduiHydrationDataCamelCaseTopLevelKeys;
local function v10(v7, v8) --[[ Line: 20 ]] --[[ Name: decodeProto ]]
    local v9 = if typeof(v8) == "string" then buffer.fromstring(v8) else v8;
    return v7.decode(v9);
end;
local function v14(v11, v12) --[[ Line: 32 ]] --[[ Name: decodeProtobufJson ]]
    -- upvalues: l_HttpService_0 (copy)
    local v13 = if typeof(v12) == "buffer" then buffer.tostring(v12) else v12;
    return v11.jsonDecode(l_HttpService_0:JSONDecode(v13));
end;
return {
    decodeProto = v10, 
    decodeProtobufJson = v14, 
    makeProtoResponseDecoder = function(v15) --[[ Line: 40 ]] --[[ Name: makeProtoResponseDecoder ]]
        -- upvalues: v10 (copy)
        return function(v16) --[[ Line: 41 ]]
            -- upvalues: v10 (ref), v15 (copy)
            return v10(v15, v16);
        end;
    end, 
    makeProtobufJsonResponseDecoder = function(v17) --[[ Line: 49 ]] --[[ Name: makeProtobufJsonResponseDecoder ]]
        -- upvalues: v14 (copy)
        return function(v18) --[[ Line: 50 ]]
            -- upvalues: v14 (ref), v17 (copy)
            return v14(v17, v18);
        end;
    end, 
    parsePageEntriesFromResponse = function(v19) --[[ Line: 60 ]] --[[ Name: parsePageEntriesFromResponse ]]
        -- upvalues: l_FFlagSduiUniversalPageEntry_0 (copy)
        local v20 = {};
        if v19.page_entries then
            for _, v22 in v19.page_entries do
                local l_roblox_component_0 = v22.page_entry.roblox_component;
                local v24 = if l_FFlagSduiUniversalPageEntry_0 then v22.input_data and v22.input_data.kind and v22.input_data.kind.value else v22.kind and v22.kind.value;
                local l_identifier_0 = v22.page_entry.identifier;
                local l_title_0 = v22.page_entry.title;
                table.insert(v20, {
                    robloxComponentType = l_roblox_component_0, 
                    identifier = if l_identifier_0 ~= "" then l_identifier_0 else nil, 
                    componentInputData = v24, 
                    title = l_title_0
                });
            end;
        end;
        return v20;
    end, 
    parseHydrationDataFromResponse = function(v27) --[[ Line: 85 ]] --[[ Name: parseHydrationDataFromResponse ]]
        -- upvalues: l_getProtoVariableMapper_0 (copy), l_FFlagSduiHydrationDataCamelCaseTopLevelKeys_0 (copy)
        local l_hydration_data_0 = v27.hydration_data;
        if l_hydration_data_0 then
            for _, v30 in l_hydration_data_0 do
                for _, v32 in v30 do
                    for v33, v34 in v32 do
                        v32[l_getProtoVariableMapper_0().mapPropName(v33)] = v34;
                    end;
                end;
            end;
            if l_FFlagSduiHydrationDataCamelCaseTopLevelKeys_0 then
                local v35 = l_getProtoVariableMapper_0();
                local v36 = {};
                for v37, v38 in l_hydration_data_0 do
                    if v38 then
                        v36[v35.mapPropName(v37)] = v38;
                    end;
                end;
                for v39, v40 in v36 do
                    l_hydration_data_0[v39] = v40;
                end;
            end;
        end;
        return l_hydration_data_0;
    end, 
    parseTemplateEntriesFromResponse = function(v41) --[[ Line: 123 ]] --[[ Name: parseTemplateEntriesFromResponse ]]
        local v42 = {};
        local v43 = {};
        if v41.templates then
            for v44, v45 in v41.templates do
                v43[v45.roblox_component] = v45.template;
                v42[v44] = v45.template;
            end;
        end;
        return v42, v43;
    end
};