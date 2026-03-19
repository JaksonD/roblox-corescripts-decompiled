local l_script_FirstAncestor_0 = script:FindFirstAncestor("NextDataExpirationTimeRodux");
local v1 = require(l_script_FirstAncestor_0.SetNextDataExpirationTime);
local v2 = require(l_script_FirstAncestor_0.ExpirationTimeNamespace);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local function v8() --[[ Line: 8 ]] --[[ Name: initializeExpirationTimes ]]
    -- upvalues: v2 (copy)
    local v5 = {};
    for _, v7 in v2 do
        v5[v7] = {};
    end;
    return v5;
end;
return {
    key = "NextDataExpirationTimeKey", 
    reducer = function(v9, v10) --[[ Line: 17 ]]
        -- upvalues: v8 (copy), v1 (copy)
        v9 = v9 or v8();
        if v10.type == v1.name then
            assert(v9, "state should always exist, assert for linter");
            local l_namespace_0 = v10.namespace;
            local l_key_0 = v10.key;
            assert(l_namespace_0, "SetNextDataExpirationTime does not have a valid namespace");
            assert(l_key_0, (("SetNextDataExpirationTime does not have a valid key for namespace %*"):format(l_namespace_0)));
            local v13 = v9[l_namespace_0];
            if not v13 then
                warn((("No namespace %* defined in NextDataExpirationTimeReducer for action"):format(l_namespace_0)));
                return v9;
            else
                assert(v13, "namespaceState should always exist, assert for linter");
                local v14 = table.clone(v13);
                v14[l_key_0] = v10.nextDataExpirationTime;
                local v15 = table.clone(v9);
                v15[l_namespace_0] = v14;
                return v15;
            end;
        else
            return v9;
        end;
    end
};