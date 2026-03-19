local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Map_0 = v1.Map;
local l_instanceof_0 = v1.instanceof;
local l_setTimeout_0 = v1.setTimeout;
local l_Error_0 = v1.Error;
local l_Error_1 = v1.Error;
local v9 = require(l_Parent_0.Promise);
local v10 = {};
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = {};
v21.__index = v21;
v21.new = function(v22, v23) --[[ Line: 142 ]] --[[ Name: new ]]
    -- upvalues: v21 (copy), l_Error_0 (copy), v12 (ref), v16 (ref), v17 (ref), v18 (ref), v19 (ref)
    local v24 = setmetatable({}, v21);
    if typeof(v22) ~= "function" then
        error(l_Error_0.new("DataLoader must be constructed with a function which accepts " .. ("Array<key> and returns Promise<Array<value>>, but got: %s."):format((tostring(v22)))));
    end;
    v24._batchLoadFn = v22;
    v24._maxBatchSize = v12(v23);
    v24._batchScheduleFn = v16(v23);
    v24._cacheKeyFn = v17(v23);
    v24._cacheMap = v18(v23);
    v24._batch = nil;
    v24.name = v19(v23);
    return v24;
end;
v21.load = function(v25, v26) --[[ Line: 162 ]] --[[ Name: load ]]
    -- upvalues: l_Error_0 (copy), v11 (ref), l_Boolean_0 (copy), v9 (copy)
    local v27 = false;
    if v26 == nil then
        error(l_Error_0.new("The loader.load() function must be called with a value, " .. ("but got: %s."):format((tostring(v26)))));
    end;
    local v28 = v11(v25);
    local l__cacheMap_0 = v25._cacheMap;
    local v30 = v25._cacheKeyFn(v26);
    if l_Boolean_0.toJSBoolean(l__cacheMap_0) then
        local v31 = l__cacheMap_0:get(v30);
        if l_Boolean_0.toJSBoolean(v31) then
            local v32;
            if l_Boolean_0.toJSBoolean(v28.cacheHits) then
                v32 = v28.cacheHits;
                v27 = v32;
            end;
            if not v27 then
                v28.cacheHits = {};
                v32 = v28.cacheHits;
            end;
            v27 = false;
            return v9.new(function(v33) --[[ Line: 182 ]]
                -- upvalues: v32 (copy), v31 (copy)
                table.insert(v32, function() --[[ Line: 183 ]]
                    -- upvalues: v33 (copy), v31 (ref)
                    v33(v31);
                end);
            end);
        end;
    end;
    table.insert(v28.keys, v26);
    local v36 = v9.new(function(v34, v35) --[[ Line: 192 ]]
        -- upvalues: v28 (copy)
        table.insert(v28.callbacks, {
            resolve = v34, 
            reject = v35
        });
    end);
    if l_Boolean_0.toJSBoolean(l__cacheMap_0) then
        l__cacheMap_0:set(v30, v36);
    end;
    return v36;
end;
v21.loadMany = function(v37, v38) --[[ Line: 202 ]] --[[ Name: loadMany ]]
    -- upvalues: l_Boolean_0 (copy), v20 (ref), l_Error_0 (copy), v9 (copy)
    if not l_Boolean_0.toJSBoolean(v20(v38)) then
        error(l_Error_0.new("The loader.loadMany() function must be called with Array<key> " .. ("but got: %s."):format((tostring(v38)))));
    end;
    local v39 = {};
    local v40 = 0;
    while v40 < #v38 do
        table.insert(v39, v37:load(v38[v40 + 1]):catch(function(v41) --[[ Line: 219 ]]
            return v41;
        end));
        v40 = v40 + 1;
    end;
    return v9.all(v39);
end;
v21.clear = function(v42, v43) --[[ Line: 230 ]] --[[ Name: clear ]]
    -- upvalues: l_Boolean_0 (copy)
    local l__cacheMap_1 = v42._cacheMap;
    if l_Boolean_0.toJSBoolean(l__cacheMap_1) then
        l__cacheMap_1:delete((v42._cacheKeyFn(v43)));
    end;
    return v42;
end;
v21.clearAll = function(v45) --[[ Line: 239 ]] --[[ Name: clearAll ]]
    -- upvalues: l_Boolean_0 (copy)
    local l__cacheMap_2 = v45._cacheMap;
    if l_Boolean_0.toJSBoolean(l__cacheMap_2) then
        l__cacheMap_2:clear();
    end;
    return v45;
end;
v21.prime = function(v47, v48, v49) --[[ Line: 247 ]] --[[ Name: prime ]]
    -- upvalues: l_Boolean_0 (copy), l_instanceof_0 (copy), l_Error_1 (copy), v9 (copy)
    local l__cacheMap_3 = v47._cacheMap;
    if l_Boolean_0.toJSBoolean(l__cacheMap_3) then
        local v51 = v47._cacheKeyFn(v48);
        if l__cacheMap_3:get(v51) == nil then
            local v52 = nil;
            if l_instanceof_0(v49, l_Error_1) then
                v52 = v9.reject(v49);
                v52:catch(function() --[[ Line: 260 ]]

                end);
            else
                v52 = v9.resolve(v49);
            end;
            l__cacheMap_3:set(v51, v52);
        end;
    end;
    return v47;
end;
local function v54(v53) --[[ Line: 296 ]]
    -- upvalues: l_setTimeout_0 (copy)
    l_setTimeout_0(v53);
end;
v11 = function(v55) --[[ Line: 316 ]] --[[ Name: getCurrentBatch ]]
    -- upvalues: l_Boolean_0 (copy), v13 (ref)
    local l__batch_0 = v55._batch;
    if l__batch_0 ~= nil and not l_Boolean_0.toJSBoolean(l__batch_0.hasDispatched) and #l__batch_0.keys < v55._maxBatchSize then
        return l__batch_0;
    else
        local v57 = {
            hasDispatched = false, 
            keys = {}, 
            callbacks = {}
        };
        v55._batch = v57;
        v55._batchScheduleFn(function() --[[ Line: 332 ]]
            -- upvalues: v13 (ref), v55 (copy), v57 (copy)
            v13(v55, v57);
        end);
        return v57;
    end;
end;
v13 = function(v58, v59) --[[ Line: 338 ]] --[[ Name: dispatchBatch ]]
    -- upvalues: v15 (ref), v14 (ref), l_Error_0 (copy), l_Boolean_0 (copy), v20 (ref), l_instanceof_0 (copy), l_Error_1 (copy)
    v59.hasDispatched = true;
    if #v59.keys == 0 then
        v15(v59);
        return;
    else
        local v60 = nil;
        local _, v63, v64 = xpcall(function() --[[ Line: 350 ]]
            -- upvalues: v60 (ref), v58 (copy), v59 (copy)
            v60 = v58._batchLoadFn(v59.keys);
        end, function(v61) --[[ Line: 352 ]]
            -- upvalues: v14 (ref), v58 (copy), v59 (copy), l_Error_0 (ref)
            return v14(v58, v59, l_Error_0.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function " .. ("errored synchronously: %s."):format((tostring(v61))))), true;
        end);
        if v64 then
            return v63;
        elseif not l_Boolean_0.toJSBoolean(v60) or typeof(v60.andThen) ~= "function" then
            return v14(v58, v59, l_Error_0.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. ("not return a Promise: %s."):format((tostring(v60)))));
        else
            v60:andThen(function(v65) --[[ Line: 384 ]]
                -- upvalues: l_Boolean_0 (ref), v20 (ref), l_Error_0 (ref), v59 (copy), v15 (ref), l_instanceof_0 (ref), l_Error_1 (ref)
                if not l_Boolean_0.toJSBoolean(v20(v65)) then
                    error(l_Error_0.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. ("not return a Promise of an Array: %s."):format(table.concat(v65, ","))));
                end;
                if #v65 ~= #v59.keys then
                    error(l_Error_0.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. "not return a Promise of an Array of the same length as the Array " .. "of keys." .. ("\n\nKeys:\n%s"):format(table.concat(v59.keys, ",")) .. ("\n\nValues:\n%s"):format(table.concat(v65, ","))));
                end;
                v15(v59);
                local v66 = 0;
                while v66 < #v59.callbacks do
                    local v67 = v65[v66 + 1];
                    if l_instanceof_0(v67, l_Error_1) then
                        v59.callbacks[v66 + 1].reject(v67);
                    else
                        v59.callbacks[v66 + 1].resolve(v67);
                    end;
                    v66 = v66 + 1;
                end;
            end):catch(function(v68) --[[ Line: 425 ]]
                -- upvalues: v14 (ref), v58 (copy), v59 (copy)
                v14(v58, v59, v68);
            end);
            return nil;
        end;
    end;
end;
v14 = function(v69, v70, v71) --[[ Line: 433 ]] --[[ Name: failedDispatch ]]
    -- upvalues: v15 (ref)
    v15(v70);
    local v72 = 0;
    while v72 < #v70.keys do
        v69:clear(v70.keys[v72 + 1]);
        v70.callbacks[v72 + 1].reject(v71);
        v72 = v72 + 1;
    end;
end;
v15 = function(v73) --[[ Line: 448 ]] --[[ Name: resolveCacheHits ]]
    -- upvalues: l_Boolean_0 (copy)
    if l_Boolean_0.toJSBoolean(v73.cacheHits) then
        local v74 = 0;
        while v74 < #v73.cacheHits do
            v73.cacheHits[v74 + 1]();
            v74 = v74 + 1;
        end;
    end;
end;
v12 = function(v75) --[[ Line: 463 ]] --[[ Name: getValidMaxBatchSize ]]
    -- upvalues: l_Boolean_0 (copy), l_Error_0 (copy)
    local v76 = not l_Boolean_0.toJSBoolean(v75) or v75.batch ~= false;
    if not l_Boolean_0.toJSBoolean(v76) then
        return 1;
    else
        local v77 = if l_Boolean_0.toJSBoolean(v75) then v75.maxBatchSize else v75;
        if v77 == nil then
            return 1e999;
        else
            if typeof(v77) ~= "number" or v77 < 1 then
                error(l_Error_0.new(("maxBatchSize must be a positive number: %s"):format((tostring(v77)))));
            end;
            return v77;
        end;
    end;
end;
v16 = function(v78) --[[ Line: 481 ]] --[[ Name: getValidBatchScheduleFn ]]
    -- upvalues: l_Boolean_0 (copy), v54 (copy), l_Error_0 (copy)
    local v79 = if l_Boolean_0.toJSBoolean(v78) then v78.batchScheduleFn else v78;
    if v79 == nil then
        return v54;
    else
        if typeof(v79) ~= "function" then
            error(l_Error_0.new(("batchScheduleFn must be a function: %s"):format((tostring(v79)))));
        end;
        return v79;
    end;
end;
v17 = function(v80) --[[ Line: 495 ]] --[[ Name: getValidCacheKeyFn ]]
    -- upvalues: l_Boolean_0 (copy), l_Error_0 (copy)
    local v81 = if l_Boolean_0.toJSBoolean(v80) then v80.cacheKeyFn else v80;
    if v81 == nil then
        return function(v82) --[[ Line: 498 ]]
            return v82;
        end;
    else
        if typeof(v81) ~= "function" then
            error(l_Error_0.new(("cacheKeyFn must be a function: %s"):format((tostring(v81)))));
        end;
        return v81;
    end;
end;
v18 = function(v83) --[[ Line: 509 ]] --[[ Name: getValidCacheMap ]]
    -- upvalues: l_Boolean_0 (copy), l_Map_0 (copy), l_Array_0 (copy), l_Error_0 (copy)
    local v84 = not l_Boolean_0.toJSBoolean(v83) or v83.cache ~= false;
    if not l_Boolean_0.toJSBoolean(v84) then
        return nil;
    else
        local v85 = if l_Boolean_0.toJSBoolean(v83) then v83.cacheMap else v83;
        if v85 == nil then
            return l_Map_0.new();
        else
            if v85 ~= nil then
                local v87 = l_Array_0.filter({
                    "get", 
                    "set", 
                    "delete", 
                    "clear"
                }, function(v86) --[[ Line: 520 ]]
                    -- upvalues: l_Boolean_0 (ref), v85 (copy)
                    if l_Boolean_0.toJSBoolean(v85) then
                        return typeof(v85[tostring(v86)]) ~= "function";
                    else
                        return v85;
                    end;
                end);
                if #v87 ~= 0 then
                    error(l_Error_0.new("Custom cacheMap missing methods: " .. tostring(l_Array_0.join(v87, ", "))));
                end;
            end;
            return v85;
        end;
    end;
end;
v19 = function(v88) --[[ Line: 530 ]] --[[ Name: getValidName ]]
    -- upvalues: l_Boolean_0 (copy)
    if l_Boolean_0.toJSBoolean(if l_Boolean_0.toJSBoolean(v88) then v88.name else v88) then
        return v88.name;
    else
        return nil;
    end;
end;
v20 = function(v89) --[[ Line: 538 ]] --[[ Name: isArrayLike ]]
    local v90 = false;
    if typeof(v89) == "table" then
        v90 = true;
        if #v89 ~= 0 then
            v90 = false;
            if #v89 > 0 then
                v90 = v89[#v89] ~= nil;
            end;
        end;
    end;
    return v90;
end;
v10.DataLoader = v21;
return v10;