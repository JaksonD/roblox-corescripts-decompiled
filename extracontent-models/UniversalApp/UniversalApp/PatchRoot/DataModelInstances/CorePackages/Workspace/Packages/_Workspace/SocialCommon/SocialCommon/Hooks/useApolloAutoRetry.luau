local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({});
local v4 = require(script.Parent.StatusCodesToRetry);
local function _(v5) --[[ Line: 10 ]] --[[ Name: shouldRetryRequest ]]
    -- upvalues: v3 (copy), v4 (copy)
    if v5.error then
        local v6 = v3.Dictionary.getDeepValue(v5, "error.graphQLErrors");
        if v6 and v6[1] then
            return v4[v3.Dictionary.getDeepValue(v6[1], "extensions.status")] or false;
        end;
    end;
    return false;
end;
return function(v8, v9) --[[ Line: 22 ]] --[[ Name: useApolloAutoRetry ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v2 (copy)
    local v10, v11 = v1.useState(0);
    local v12, v13 = v1.useState(false);
    v1.useEffect(function() --[[ Line: 26 ]]
        -- upvalues: v8 (copy), v3 (ref), v4 (ref), v10 (copy), v9 (copy), v12 (copy), v13 (copy), v11 (copy)
        local v14 = false;
        local l_v8_0 = v8;
        local v16;
        if l_v8_0.error then
            local v17 = v3.Dictionary.getDeepValue(l_v8_0, "error.graphQLErrors");
            if v17 and v17[1] then
                v16 = v4[v3.Dictionary.getDeepValue(v17[1], "extensions.status")] or false;
                v14 = true;
            end;
        end;
        if not v14 then
            v16 = false;
        end;
        v14 = false;
        if v16 and v10 < v9.retryCount and not v12 then
            v13(true);
            task.delay(2 ^ v10 + math.random(), function() --[[ Line: 30 ]]
                -- upvalues: v8 (ref), v13 (ref), v11 (ref), v10 (ref)
                v8:refetch();
                v13(false);
                v11(v10 + 1);
            end);
        end;
    end, {
        v8, 
        v12, 
        v10
    });
    return (v1.useMemo(function() --[[ Line: 38 ]]
        -- upvalues: v2 (ref), v8 (copy), v3 (ref), v4 (ref), v10 (copy), v9 (copy)
        local v18 = false;
        local l_join_0 = v2.Dictionary.join;
        local l_v8_1 = v8;
        local v21 = {};
        local l_v8_2 = v8;
        local v23;
        if l_v8_2.error then
            local v24 = v3.Dictionary.getDeepValue(l_v8_2, "error.graphQLErrors");
            if v24 and v24[1] then
                v23 = v4[v3.Dictionary.getDeepValue(v24[1], "extensions.status")] or false;
                v18 = true;
            end;
        end;
        if not v18 then
            v23 = false;
        end;
        v18 = false;
        if v23 then
            v23 = v10 < v9.retryCount;
        end;
        v21.isRetrying = v23;
        v21.retryCount = v10;
        return l_join_0(l_v8_1, v21);
    end, {
        v8, 
        v10
    }));
end;