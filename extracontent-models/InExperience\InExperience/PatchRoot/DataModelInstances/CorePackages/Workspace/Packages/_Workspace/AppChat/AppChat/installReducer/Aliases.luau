local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_llama_0 = require(l_Parent_0.LuaSocialLibrariesDeps).llama;
local v3 = require(l_script_FirstAncestor_0.Http.RoduxAliases);
local function v10(v4) --[[ Line: 8 ]] --[[ Name: convertToNewAliasUpdatedActions ]]
    -- upvalues: v3 (copy)
    local v5 = {};
    for _, v7 in ipairs(v4) do
        local v8 = tostring(v7.targetUserId);
        local l_targetUserTag_0 = v7.targetUserTag;
        table.insert(v5, v3.Actions.AliasUpdated(v8, l_targetUserTag_0));
    end;
    return v5;
end;
local v13 = {
    GetAliases_Success = function(v11) --[[ Line: 20 ]]
        -- upvalues: v10 (copy)
        return (v10(v11.responseBody));
    end, 
    ReceivedAliases = function(v12) --[[ Line: 24 ]]
        -- upvalues: v10 (copy)
        return (v10(v12.aliases));
    end
};
local v14 = v3.installReducer();
return function(v15, v16) --[[ Line: 31 ]]
    -- upvalues: v13 (copy), l_llama_0 (copy), v14 (copy)
    v15 = v15 or {
        byUserId = {
            ShowUserAlias = true
        }
    };
    local v17 = {
        v16
    };
    local v18 = v13[v16.type];
    if v18 then
        v17 = v18(v16);
    end;
    return l_llama_0.List.reduce(v17, v14, v15);
end;