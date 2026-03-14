local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Signals);
local l_createSignal_0 = v1.createSignal;
local l_createComputed_0 = v1.createComputed;
local l_batch_0 = require(l_Parent_0.SignalsScheduler).batch;
local function _(v5) --[[ Line: 21 ]] --[[ Name: createWrappedSignal ]]
    -- upvalues: l_createSignal_0 (copy)
    local v6, v7 = l_createSignal_0(function() --[[ Line: 22 ]]
        -- upvalues: v5 (copy)
        return v5;
    end);
    return {
        getter = v6, 
        setter = v7
    };
end;
return function(v9) --[[ Line: 28 ]] --[[ Name: createProxy ]]
    -- upvalues: l_createSignal_0 (copy), l_createComputed_0 (copy), l_batch_0 (copy)
    local v10 = {};
    for v11, v12 in v9 do
        local v13, v14 = l_createSignal_0(function() --[[ Line: 22 ]]
            -- upvalues: v12 (copy)
            return v12;
        end);
        v10[v11] = {
            getter = v13, 
            setter = v14
        };
    end;
    local v15, v16 = l_createSignal_0(nil, function() --[[ Line: 35 ]]
        return false;
    end);
    local v21 = l_createComputed_0(function(v17) --[[ Line: 39 ]]
        -- upvalues: v15 (copy), v10 (copy)
        v15(v17);
        local v18 = 0;
        for _, v20 in ipairs(v10) do
            if v20.getter(false) ~= nil then
                v18 = v18 + 1;
            end;
        end;
        return v18;
    end);
    local function v42(_, v23) --[[ Line: 50 ]] --[[ Name: createTrackedProxy ]]
        -- upvalues: v21 (copy), v15 (copy), v10 (copy), l_createSignal_0 (ref)
        local function v24() --[[ Line: 51 ]] --[[ Name: trackedLength ]]
            -- upvalues: v21 (ref), v23 (copy)
            return v21(v23);
        end;
        local function v30(v25, v26) --[[ Line: 55 ]] --[[ Name: nextSignal ]]
            -- upvalues: v23 (copy)
            while true do
                local v27, v28 = next(v25, v26);
                if v27 == nil then
                    return nil;
                else
                    if v28 ~= nil then
                        local v29 = v28.getter(v23);
                        if v29 ~= nil then
                            return v27, v29;
                        end;
                    end;
                    v26 = v27;
                end;
            end;
        end;
        local function v31() --[[ Line: 71 ]] --[[ Name: trackedIterator ]]
            -- upvalues: v15 (ref), v23 (copy), v30 (copy), v10 (ref)
            v15(v23);
            return v30, v10;
        end;
        local function v38(_, v33) --[[ Line: 76 ]] --[[ Name: trackedIndex ]]
            -- upvalues: v10 (ref), v23 (copy), l_createSignal_0 (ref)
            local v34 = v10[v33];
            if v34 == nil then
                if v23 == nil then
                    return nil;
                else
                    local l_l_createSignal_0_0 = l_createSignal_0;
                    local v36 = nil;
                    local v37;
                    l_l_createSignal_0_0, v37 = l_l_createSignal_0_0(function() --[[ Line: 22 ]]
                        -- upvalues: v36 (copy)
                        return v36;
                    end);
                    v34 = {
                        getter = l_l_createSignal_0_0, 
                        setter = v37
                    };
                    v10[v33] = v34;
                end;
            end;
            return v34.getter(v23);
        end;
        return (setmetatable({}, (table.freeze({
            __len = v24, 
            __iter = v31, 
            __index = v38, 
            __newindex = function(_, v40, v41) --[[ Line: 88 ]] --[[ Name: noNewIndex ]]
                error(("attempt to update read-only store at %* with %*"):format(v40, v41), 2);
            end, 
            __metatable = false
        }))));
    end;
    local function v43() --[[ Line: 103 ]] --[[ Name: untrackedLength ]]
        -- upvalues: v21 (copy)
        return v21(false);
    end;
    local function v49(v44, v45) --[[ Line: 107 ]] --[[ Name: nextSignal ]]
        while true do
            local v46, v47 = next(v44, v45);
            if v46 == nil then
                return nil;
            else
                if v47 ~= nil then
                    local v48 = v47.getter(false);
                    if v48 ~= nil then
                        return v46, v48;
                    end;
                end;
                v45 = v46;
            end;
        end;
    end;
    local function v50() --[[ Line: 123 ]] --[[ Name: untrackedIterator ]]
        -- upvalues: v49 (copy), v10 (copy)
        return v49, v10;
    end;
    local function v54(_, v52) --[[ Line: 127 ]] --[[ Name: untrackedIndex ]]
        -- upvalues: v10 (copy)
        local v53 = v10[v52];
        if v53 ~= nil then
            return v53.getter(false);
        else
            return nil;
        end;
    end;
    local function v62(_, v56, v57) --[[ Line: 135 ]] --[[ Name: newIndex ]]
        -- upvalues: v10 (copy), l_createSignal_0 (ref), v16 (copy), l_batch_0 (ref)
        local v58 = v10[v56];
        if v58 == nil then
            if v57 ~= nil then
                local v59, v60 = l_createSignal_0(function() --[[ Line: 22 ]]
                    -- upvalues: v57 (copy)
                    return v57;
                end);
                v10[v56] = {
                    getter = v59, 
                    setter = v60
                };
                v16();
            end;
        else
            local v61 = v58.getter(false);
            if v61 ~= v57 then
                l_batch_0(function() --[[ Line: 146 ]]
                    -- upvalues: v58 (ref), v57 (copy), v61 (copy), v16 (ref)
                    v58.setter(function() --[[ Line: 147 ]]
                        -- upvalues: v57 (ref)
                        return v57;
                    end);
                    if v61 == nil or v57 == nil then
                        v16();
                    end;
                end);
            end;
        end;
    end;
    return (setmetatable({}, (table.freeze({
        __len = v43, 
        __call = v42, 
        __iter = v50, 
        __index = v54, 
        __newindex = v62, 
        __metatable = false
    }))));
end;