local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local _ = require(l_Parent_0.Signals);
local v2 = require(l_Parent_0.DataHydration);
local l_createDataCache_0 = v2.createDataCache;
local l_createDataResolver_0 = v2.createDataResolver;
local v5 = require(l_Parent_0.SharedFlags);
local v6 = require(script.Parent.Requests.fetchUserDescription);
local v7 = require(script.Parent.Requests.updateUserDescription);
local l_FFlagLuaAppDataHydrationSupportsMultiGet_0 = v5.FFlagLuaAppDataHydrationSupportsMultiGet;
local l_FFlagLuaAppDataHydrationDataCacheReplaceItem_0 = v5.FFlagLuaAppDataHydrationDataCacheReplaceItem;
local function _(v10) --[[ Line: 26 ]] --[[ Name: createMultiGetWrapper ]]
    -- upvalues: l_Parent_0 (copy)
    return function(v11) --[[ Line: 27 ]]
        -- upvalues: l_Parent_0 (ref), v10 (copy)
        local v12 = require(l_Parent_0.Promise);
        local v13 = {};
        local v14 = {};
        for v15, v16 in v11 do
            table.insert(v14, v15);
            table.insert(v13, v10(v15, v16));
        end;
        return v12.all(v13):andThen(function(v17) --[[ Line: 35 ]]
            -- upvalues: v14 (copy)
            local v18 = {};
            for v19, v20 in v14 do
                v18[v20] = v17[v19];
            end;
            return v18;
        end);
    end;
end;
local v22 = l_createDataCache_0();
local v33 = l_createDataResolver_0({
    cache = v22, 
    supportsMultiGet = false, 
    fetchFn = if l_FFlagLuaAppDataHydrationSupportsMultiGet_0 then v6 else function(v23) --[[ Line: 27 ]]
        -- upvalues: l_Parent_0 (copy), v6 (copy)
        local v24 = require(l_Parent_0.Promise);
        local v25 = {};
        local v26 = {};
        for v27, v28 in v23 do
            table.insert(v26, v27);
            table.insert(v25, v6(v27, v28));
        end;
        return v24.all(v25):andThen(function(v29) --[[ Line: 35 ]]
            -- upvalues: v26 (copy)
            local v30 = {};
            for v31, v32 in v26 do
                v30[v32] = v29[v31];
            end;
            return v30;
        end);
    end, 
    queueProcessDelaySec = 0
});
return {
    getDescription = function(v34) --[[ Line: 55 ]] --[[ Name: getDescription ]]
        -- upvalues: v33 (copy)
        return (v33.getAndFetchItem(v34));
    end, 
    updateDescription = function(v35, v36) --[[ Line: 60 ]] --[[ Name: updateDescription ]]
        -- upvalues: v7 (copy), l_FFlagLuaAppDataHydrationDataCacheReplaceItem_0 (copy), v22 (copy)
        return v7(v36):andThen(function(v37) --[[ Line: 61 ]]
            -- upvalues: l_FFlagLuaAppDataHydrationDataCacheReplaceItem_0 (ref), v22 (ref), v35 (copy)
            if l_FFlagLuaAppDataHydrationDataCacheReplaceItem_0 then
                v22.replaceItem(v35, v37);
                return v37;
            else
                v22.replaceItems({
                    [v35] = v37
                });
                return v37;
            end;
        end);
    end
};