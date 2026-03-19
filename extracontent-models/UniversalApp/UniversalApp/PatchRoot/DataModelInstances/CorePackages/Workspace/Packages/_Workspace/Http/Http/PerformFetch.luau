local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Result);
local v3 = require(l_Parent_0.Promise);
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local l_RetrievalStatus_0 = require(l_script_FirstAncestor_0.Enum).RetrievalStatus;
local l_BatchUpdateFetchingStatus_0 = require(l_script_FirstAncestor_0.Actions).BatchUpdateFetchingStatus;
local v7 = {};
local v8 = {};
v7.ClearOutstandingPromiseStatus = function() --[[ Line: 37 ]] --[[ Name: ClearOutstandingPromiseStatus ]]
    -- upvalues: v8 (ref)
    v8 = {};
end;
local function v10(v9) --[[ Line: 41 ]] --[[ Name: singleFetchKeymapper ]]
    return v9;
end;
v7.GetStatus = function(v11, v12) --[[ Line: 50 ]] --[[ Name: GetStatus ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    assert(typeof(v11) == "table");
    assert(typeof(v12) == "string");
    assert(#v12 > 0);
    return v11.FetchingStatus[v12] or l_RetrievalStatus_0.NotStarted;
end;
v7.Single = function(v13, v14) --[[ Line: 81 ]] --[[ Name: Single ]]
    -- upvalues: v7 (copy), v10 (copy), v3 (copy), v2 (copy)
    assert(typeof(v13) == "string");
    assert(typeof(v14) == "function");
    assert(#v13 > 0);
    return function(v15) --[[ Line: 86 ]]
        -- upvalues: v7 (ref), v13 (copy), v10 (ref), v14 (copy), v3 (ref), v2 (ref)
        return v7.Batch({
            v13
        }, v10, function(v16, v17) --[[ Line: 88 ]]
            -- upvalues: v14 (ref), v3 (ref), v13 (ref), v2 (ref)
            assert(#v17 == 1);
            local v18 = v14(v16);
            assert(v3.is(v18));
            return v18:andThen(function(...) --[[ Line: 94 ]]
                -- upvalues: v3 (ref), v13 (ref), v2 (ref)
                assert(#{
                    ...
                } <= 1);
                return v3.resolve({
                    [v13] = v2.new(true, (...))
                });
            end, function(...) --[[ Line: 97 ]]
                -- upvalues: v3 (ref), v13 (ref), v2 (ref)
                assert(#{
                    ...
                } <= 1);
                return v3.resolve({
                    [v13] = v2.new(false, (...))
                });
            end);
        end)(v15):andThen(function(v19) --[[ Line: 101 ]]
            -- upvalues: v13 (ref), v3 (ref)
            local v20, v21 = v19[v13]:unwrap();
            if v20 then
                return v3.resolve(v21);
            else
                return v3.reject(v21);
            end;
        end);
    end;
end;
v7.Batch = function(v22, v23, v24) --[[ Line: 154 ]] --[[ Name: Batch ]]
    -- upvalues: v8 (ref), v3 (copy), l_RetrievalStatus_0 (copy), l_BatchUpdateFetchingStatus_0 (copy), l_PromiseUtilities_0 (copy), v2 (copy)
    assert(typeof(v22) == "table");
    assert(typeof(v23) == "function");
    assert(typeof(v24) == "function");
    return function(v25) --[[ Line: 159 ]]
        -- upvalues: v22 (copy), v23 (copy), v8 (ref), v3 (ref), l_RetrievalStatus_0 (ref), l_BatchUpdateFetchingStatus_0 (ref), v24 (copy), l_PromiseUtilities_0 (ref), v2 (ref)
        local v26 = {};
        local v27 = {};
        local v28 = {};
        for _, v30 in ipairs(v22) do
            local v31 = v23(v30);
            local v32 = v8[v31];
            if v32 then
                v28[v31] = v32;
            else
                table.insert(v26, v30);
                v27[v30] = v31;
            end;
        end;
        local v33 = nil;
        local v35 = v3.new(function(v34) --[[ Line: 178 ]]
            -- upvalues: v33 (ref)
            v33 = v34;
        end);
        local v36 = nil;
        if #v26 > 0 then
            local v37 = {};
            for _, v39 in pairs(v27) do
                table.insert(v37, {
                    key = v39, 
                    status = l_RetrievalStatus_0.Fetching
                });
                v8[v39] = v35;
            end;
            if #v37 > 0 then
                v25:dispatch(l_BatchUpdateFetchingStatus_0(v37));
            end;
            v36 = v24(v25, v26);
            assert(v3.is(v36));
        else
            v36 = v3.resolve({});
        end;
        v36:andThen(function(v40) --[[ Line: 209 ]]
            -- upvalues: l_PromiseUtilities_0 (ref), v28 (copy)
            v40 = v40 or {};
            return l_PromiseUtilities_0.Batch(v28):andThen(function(v41) --[[ Line: 212 ]]
                -- upvalues: v40 (ref)
                local v42 = {};
                for v43, v44 in pairs(v41) do
                    local _, v46 = v44:unwrap();
                    v42[v43] = v46[v43];
                end;
                return v40, v42;
            end);
        end, function() --[[ Line: 222 ]]
            assert(false, "PerformFetch fetchFunctor should never reject");
        end):andThen(function(v47, v48) --[[ Line: 225 ]]
            -- upvalues: v27 (copy), v2 (ref), l_RetrievalStatus_0 (ref), v8 (ref), v25 (copy), l_BatchUpdateFetchingStatus_0 (ref)
            local v49 = {};
            for _, v51 in pairs(v27) do
                local v52 = v47[v51];
                if v2.is(v52) then
                    v48[v51] = v52;
                else
                    v48[v51] = v2.error();
                end;
                local v53 = v48[v51]:unwrap() and l_RetrievalStatus_0.Done or l_RetrievalStatus_0.Failed;
                table.insert(v49, {
                    key = v51, 
                    status = v53
                });
                v8[v51] = nil;
            end;
            if #v49 > 0 then
                v25:dispatch(l_BatchUpdateFetchingStatus_0(v49));
            end;
            return v48;
        end):andThen(function(v54) --[[ Line: 255 ]]
            -- upvalues: v33 (ref)
            v33(v54);
        end);
        return v35;
    end;
end;
return v7;