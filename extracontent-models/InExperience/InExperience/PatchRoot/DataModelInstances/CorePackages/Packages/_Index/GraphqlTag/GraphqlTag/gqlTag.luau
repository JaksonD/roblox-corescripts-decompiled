local l_Parent_0 = script.Parent.Parent;
local l_parse_0 = require(l_Parent_0.GraphQL).parse;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Map_0 = v2.Map;
local l_Set_0 = v2.Set;
local l_String_0 = v2.String;
local l_Object_0 = v2.Object;
local l_Array_0 = v2.Array;
local l_console_0 = v2.console;
local v9 = l_Map_0.new(nil);
local v10 = l_Map_0.new(nil);
local v11 = true;
local v12 = false;
local function v15(v13) --[[ Line: 30 ]] --[[ Name: normalize ]]
    -- upvalues: l_String_0 (copy)
    local v14 = v13:gsub(",+%s+", " ");
    return l_String_0.trim(v14);
end;
local function _(v16) --[[ Line: 35 ]] --[[ Name: cacheKeyFromLoc ]]
    -- upvalues: v15 (copy)
    return v15(v16.source.body:sub(v16.start, v16._end));
end;
local function v27(v18) --[[ Line: 39 ]] --[[ Name: processFragments ]]
    -- upvalues: l_Set_0 (copy), l_String_0 (copy), v10 (copy), v11 (ref), l_console_0 (copy), l_Object_0 (copy)
    local v19 = l_Set_0.new(nil);
    local v20 = {};
    for v21 = 1, #v18.definitions do
        local v22 = v18.definitions[v21];
        if v22.kind == "FragmentDefinition" then
            local l_value_0 = v22.name.value;
            local l_loc_0 = v22.loc;
            local v25 = l_loc_0.source.body:sub(l_loc_0.start, l_loc_0._end):gsub(",+%s+", " ");
            local v26 = l_String_0.trim(v25);
            l_loc_0 = v10:get(l_value_0);
            if l_loc_0 and not l_loc_0:has(v26) then
                if v11 then
                    l_console_0.warn("Warning: fragment with name " .. l_value_0 .. " already exists.\n" .. "graphql-tag enforces all fragment names across your application to be unique; read more about\n" .. "this in the docs: http://dev.apollodata.com/core/fragments.html#unique-names");
                end;
            elseif not l_loc_0 then
                l_loc_0 = l_Set_0.new();
                v10:set(l_value_0, l_loc_0);
            end;
            l_loc_0:add(v26);
            if not v19:has(v26) then
                v19:add(v26);
                table.insert(v20, v22);
            end;
        else
            table.insert(v20, v22);
        end;
    end;
    return l_Object_0.assign({}, v18, {
        definitions = v20
    });
end;
local function v35(v28) --[[ Line: 83 ]] --[[ Name: stripLoc ]]
    -- upvalues: l_Set_0 (copy), l_Object_0 (copy), l_Array_0 (copy)
    local v29 = l_Set_0.new(nil);
    for v30 = 1, #v29 do
        local v31 = v29[v30];
        if v31.loc then
            v29:delete(v31.loc);
        end;
        for v32 = 1, #l_Object_0.keys(v31) do
            local v33 = v31[tostring(l_Object_0.keys(v31)[v32])];
            if v33 and typeof(v33) == "table" and not l_Array_0.isArray(v33) then
                v29:add(v33);
            end;
        end;
    end;
    local l_loc_1 = v28.loc;
    if l_loc_1 then
        l_loc_1.startToken = nil;
        l_loc_1.endToken = nil;
    end;
    return v28;
end;
local function v39(v36) --[[ Line: 107 ]] --[[ Name: parseDocument ]]
    -- upvalues: l_String_0 (copy), v9 (copy), l_parse_0 (copy), v12 (ref), v35 (copy), v27 (copy)
    local v37 = v36:gsub(",+%s+", " ");
    local v38 = l_String_0.trim(v37);
    if not v9:has(v38) then
        v37 = l_parse_0(v36, {
            experimentalFragmentVariables = v12
        });
        if not v37 or v37.kind ~= "Document" then
            error("Not a valid GraphQL document.");
        end;
        v9:set(v38, (v35(v27(v37))));
    end;
    return (v9:get(v38));
end;
local function v41(v40) --[[ Line: 130 ]] --[[ Name: gql ]]
    -- upvalues: v39 (copy)
    if typeof(v40) == "string" then
        return (v39(v40));
    elseif typeof(v40) == "table" and v40.kind == "Document" then
        return v40;
    else
        error("graphql-tag-lua does not currently support non-strings or Fragments. Please file an issue or PR if you need this feature added.");
        return;
    end;
end;
resetCaches = function() --[[ Line: 159 ]] --[[ Name: resetCaches ]]
    -- upvalues: v9 (copy), v10 (copy)
    v9:clear();
    v10:clear();
end;
disableFragmentWarnings = function() --[[ Line: 164 ]] --[[ Name: disableFragmentWarnings ]]
    -- upvalues: v11 (ref)
    v11 = false;
end;
enableExperimentalFragmentVariables = function() --[[ Line: 168 ]] --[[ Name: enableExperimentalFragmentVariables ]]
    -- upvalues: v12 (ref)
    v12 = true;
end;
disableExperimentalFragmentVariables = function() --[[ Line: 172 ]] --[[ Name: disableExperimentalFragmentVariables ]]
    -- upvalues: v12 (ref)
    v12 = false;
end;
local v42 = {
    gql = v41, 
    resetCaches = resetCaches, 
    disableFragmentWarnings = disableFragmentWarnings, 
    enableExperimentalFragmentVariables = enableExperimentalFragmentVariables, 
    disableExperimentalFragmentVariables = disableExperimentalFragmentVariables
};
return {
    default = v41, 
    gql = v41, 
    resetCaches = v42.resetCaches, 
    disableFragmentWarnings = v42.disableFragmentWarnings, 
    enableExperimentalFragmentVariables = v42.enableExperimentalFragmentVariables, 
    disableExperimentalFragmentVariables = v42.disableExperimentalFragmentVariables
};