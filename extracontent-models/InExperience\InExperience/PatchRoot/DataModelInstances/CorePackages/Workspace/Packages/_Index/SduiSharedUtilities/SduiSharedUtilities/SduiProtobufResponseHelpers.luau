local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_getProtoVariableMapper_0 = require(l_Parent_0.SduiCoreSystem).getProtoVariableMapper;
local _ = require(l_script_FirstAncestor_0.SduiIntegrationTypes);
local l_FFlagSduiUniversalPageEntry_0 = require(l_Parent_0.SharedFlags).FFlagSduiUniversalPageEntry;
local function v9(v6, v7) --[[ Line: 18 ]] --[[ Name: decodeProto ]]
    local v8 = if typeof(v7) == "string" then buffer.fromstring(v7) else v7;
    return v6.decode(v8);
end;
local function v13(v10, v11) --[[ Line: 30 ]] --[[ Name: decodeProtobufJson ]]
    -- upvalues: l_HttpService_0 (copy)
    local v12 = if typeof(v11) == "buffer" then buffer.tostring(v11) else v11;
    return v10.jsonDecode(l_HttpService_0:JSONDecode(v12));
end;
return {
    decodeProto = v9, 
    decodeProtobufJson = v13, 
    makeProtoResponseDecoder = function(v14) --[[ Line: 38 ]] --[[ Name: makeProtoResponseDecoder ]]
        -- upvalues: v9 (copy)
        return function(v15) --[[ Line: 39 ]]
            -- upvalues: v9 (ref), v14 (copy)
            return v9(v14, v15);
        end;
    end, 
    makeProtobufJsonResponseDecoder = function(v16) --[[ Line: 47 ]] --[[ Name: makeProtobufJsonResponseDecoder ]]
        -- upvalues: v13 (copy)
        return function(v17) --[[ Line: 48 ]]
            -- upvalues: v13 (ref), v16 (copy)
            return v13(v16, v17);
        end;
    end, 
    parsePageEntriesFromResponse = function(v18) --[[ Line: 58 ]] --[[ Name: parsePageEntriesFromResponse ]]
        -- upvalues: l_FFlagSduiUniversalPageEntry_0 (copy)
        local v19 = {};
        if v18.page_entries then
            for _, v21 in v18.page_entries do
                local l_roblox_component_0 = v21.page_entry.roblox_component;
                local v23 = if l_FFlagSduiUniversalPageEntry_0 then v21.input_data and v21.input_data.kind and v21.input_data.kind.value else v21.kind and v21.kind.value;
                local l_identifier_0 = v21.page_entry.identifier;
                local l_title_0 = v21.page_entry.title;
                table.insert(v19, {
                    robloxComponentType = l_roblox_component_0, 
                    identifier = if l_identifier_0 ~= "" then l_identifier_0 else nil, 
                    componentInputData = v23, 
                    title = l_title_0
                });
            end;
        end;
        return v19;
    end, 
    parseHydrationDataFromResponse = function(v26) --[[ Line: 83 ]] --[[ Name: parseHydrationDataFromResponse ]]
        -- upvalues: l_getProtoVariableMapper_0 (copy)
        local l_hydration_data_0 = v26.hydration_data;
        if l_hydration_data_0 then
            for _, v29 in l_hydration_data_0 do
                for _, v31 in v29 do
                    for v32, v33 in v31 do
                        v31[l_getProtoVariableMapper_0().mapPropName(v32)] = v33;
                    end;
                end;
            end;
        end;
        return l_hydration_data_0;
    end, 
    parseTemplateEntriesFromResponse = function(v34) --[[ Line: 104 ]] --[[ Name: parseTemplateEntriesFromResponse ]]
        local v35 = {};
        local v36 = {};
        if v34.templates then
            for v37, v38 in v34.templates do
                v36[v38.roblox_component] = v38.template;
                v35[v37] = v38.template;
            end;
        end;
        return v35, v36;
    end
};