local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.LoaderContext);
local function _(v3) --[[ Line: 19 ]] --[[ Name: isLoadDescriptor ]]
    local v4 = false;
    if typeof(v3) == "table" then
        v4 = v3["$load"] ~= nil;
    end;
    return v4;
end;
local function v13(v6, v7) --[[ Line: 26 ]] --[[ Name: cacheKey ]]
    if not v7 then
        return v6 .. "::{}";
    else
        local v8 = {};
        for v9 in pairs(v7) do
            table.insert(v8, v9);
        end;
        table.sort(v8);
        local v10 = {};
        for _, v12 in ipairs(v8) do
            table.insert(v10, v12 .. "=" .. v7[v12]);
        end;
        return v6 .. "::" .. table.concat(v10, ",");
    end;
end;
local function v33(v14) --[[ Line: 60 ]] --[[ Name: useLoader ]]
    -- upvalues: v2 (copy), v1 (copy), v13 (copy)
    local v15 = v2.useLoaderContext();
    local l_registryRef_0 = v15.registryRef;
    local l_cacheRef_0 = v15.cacheRef;
    local v18 = false;
    if typeof(v14) == "table" then
        v18 = v14["$load"] ~= nil;
    end;
    local v19 = if v18 then v14["$load"] else nil;
    local v20 = if v18 then v14.params else nil;
    local v21, v22 = v1.useState(if v18 then {
        data = nil, 
        loading = true, 
        error = nil
    } else {
        data = v14, 
        loading = false, 
        error = nil
    });
    local v23, v24 = v1.useState(0);
    v1.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v18 (copy), v22 (copy), v14 (copy), l_registryRef_0 (copy), v19 (copy), v13 (ref), v20 (copy), l_cacheRef_0 (copy)
        if not v18 then
            v22({
                data = v14, 
                loading = false, 
                error = nil
            });
            return;
        else
            local v25 = l_registryRef_0.current[v19];
            if not v25 then
                v22({
                    data = nil, 
                    loading = false, 
                    error = string.format("Loader \"%s\" not found in registry", v19)
                });
                return;
            else
                local v26 = v13(v19, v20);
                local v27 = l_cacheRef_0.current[v26];
                if v27 then
                    v22({
                        data = v27, 
                        loading = false, 
                        error = nil
                    });
                    return;
                else
                    local v28 = false;
                    v22({
                        data = nil, 
                        loading = true, 
                        error = nil
                    });
                    v25.fetch(v20 or {}):andThen(function(v29) --[[ Line: 107 ]]
                        -- upvalues: v28 (ref), l_cacheRef_0 (ref), v26 (copy), v22 (ref)
                        if v28 then
                            return;
                        else
                            l_cacheRef_0.current[v26] = v29;
                            v22({
                                data = v29, 
                                loading = false, 
                                error = nil
                            });
                            return;
                        end;
                    end):catch(function(v30) --[[ Line: 114 ]]
                        -- upvalues: v28 (ref), v22 (ref)
                        if v28 then
                            return;
                        else
                            v22({
                                data = nil, 
                                loading = false, 
                                error = tostring(v30)
                            });
                            return;
                        end;
                    end);
                    return function() --[[ Line: 125 ]]
                        -- upvalues: v28 (ref)
                        v28 = true;
                    end;
                end;
            end;
        end;
    end, {
        v20, 
        v14, 
        v23, 
        v18
    });
    local v32 = v1.useCallback(function() --[[ Line: 131 ]]
        -- upvalues: v18 (copy), l_cacheRef_0 (copy), v13 (ref), v19 (copy), v20 (copy), v24 (copy)
        if not v18 then
            return;
        else
            l_cacheRef_0.current[v13(v19, v20)] = nil;
            v24(function(v31) --[[ Line: 136 ]]
                return v31 + 1;
            end);
            return;
        end;
    end, {
        v14, 
        v20, 
        v18
    });
    return {
        data = v21.data, 
        loading = v21.loading, 
        error = v21.error, 
        retry = v32
    };
end;
return {
    useLoader = v33, 
    useListLoader = function(v34) --[[ Line: 156 ]] --[[ Name: useListLoader ]]
        -- upvalues: v33 (copy), v1 (copy)
        local v35 = v33(v34);
        return {
            data = v1.useMemo(function() --[[ Line: 158 ]]
                -- upvalues: v35 (copy)
                if not v35.data then
                    return nil;
                else
                    local v36 = {};
                    for _, v38 in ipairs(v35.data) do
                        if v38 ~= nil then
                            table.insert(v36, v38);
                        end;
                    end;
                    return v36;
                end;
            end, {
                v35.data
            }), 
            loading = v35.loading, 
            error = v35.error, 
            retry = v35.retry
        };
    end
};