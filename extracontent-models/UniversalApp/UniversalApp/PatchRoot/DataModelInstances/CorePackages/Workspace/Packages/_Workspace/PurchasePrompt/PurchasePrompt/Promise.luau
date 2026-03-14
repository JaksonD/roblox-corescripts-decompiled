local function v0(...) --[[ Line: 12 ]] --[[ Name: pack ]]
    return select("#", ...), {
        ...
    };
end;
local function v6(v1, ...) --[[ Line: 25 ]] --[[ Name: wpcallPacked ]]
    -- upvalues: v0 (copy)
    local v2, v3 = v0(...);
    local v4, v5 = v0(xpcall(function() --[[ Line: 28 ]]
        -- upvalues: v1 (copy), v3 (copy), v2 (copy)
        return v1(unpack(v3, 1, v2));
    end, debug.traceback));
    return v4, v5;
end;
local function _(v7, v8, v9) --[[ Line: 48 ]] --[[ Name: createAdvancer ]]
    -- upvalues: v6 (copy)
    return function(...) --[[ Line: 49 ]]
        -- upvalues: v6 (ref), v7 (copy), v8 (copy), v9 (copy)
        local v10, v11 = v6(v7, ...);
        if v11[1] then
            v8(unpack(v11, 2, v10));
            return;
        else
            v9(unpack(v11, 2, v10));
            return;
        end;
    end;
end;
local function _(v13) --[[ Line: 61 ]] --[[ Name: isEmpty ]]
    return next(v13) == nil;
end;
local v15 = {};
v15.__index = v15;
v15.Status = {
    Started = "Started", 
    Resolved = "Resolved", 
    Rejected = "Rejected"
};
v15.new = function(v16) --[[ Line: 93 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy), v6 (copy)
    local v17 = {
        _source = debug.traceback(), 
        _type = "Promise", 
        _status = v15.Status.Started, 
        _values = nil, 
        _valuesLength = -1, 
        _unhandledRejection = false, 
        _queuedResolve = {}, 
        _queuedReject = {}
    };
    setmetatable(v17, v15);
    local function v18(...) --[[ Line: 121 ]] --[[ Name: resolve ]]
        -- upvalues: v17 (copy)
        v17:_resolve(...);
    end;
    local function v19(...) --[[ Line: 125 ]] --[[ Name: reject ]]
        -- upvalues: v17 (copy)
        v17:_reject(...);
    end;
    local _, v21 = v6(v16, v18, v19);
    local v22 = v21[1];
    local v23 = v21[2];
    if not v22 and v17._status == v15.Status.Started then
        v19(v23);
    end;
    return v17;
end;
v15.resolve = function(v24) --[[ Line: 143 ]] --[[ Name: resolve ]]
    -- upvalues: v15 (copy)
    return v15.new(function(v25) --[[ Line: 144 ]]
        -- upvalues: v24 (copy)
        v25(v24);
    end);
end;
v15.reject = function(v26) --[[ Line: 152 ]] --[[ Name: reject ]]
    -- upvalues: v15 (copy)
    return v15.new(function(_, v28) --[[ Line: 153 ]]
        -- upvalues: v26 (copy)
        v28(v26);
    end);
end;
v15.all = function(...) --[[ Line: 163 ]] --[[ Name: all ]]
    -- upvalues: v15 (copy)
    local v29 = {
        ...
    };
    if type(v29[1]) == "table" and v29[1]._type ~= "Promise" then
        v29 = v29[1];
    end;
    return v15.new(function(v30, v31) --[[ Line: 172 ]]
        -- upvalues: v29 (ref), v15 (ref)
        local v32 = false;
        local v33 = {};
        local v34 = 0;
        local v35 = 0;
        for _ in pairs(v29) do
            v35 = v35 + 1;
        end;
        local function _(v37, v38) --[[ Line: 184 ]] --[[ Name: promiseCompleted ]]
            -- upvalues: v32 (ref), v33 (copy), v34 (ref), v35 (ref), v30 (copy)
            if v32 then
                return;
            else
                v33[v37] = v38;
                v34 = v34 + 1;
                if v34 == v35 then
                    v30(v33);
                    v32 = true;
                end;
                return;
            end;
        end;
        if v35 == 0 then
            v30(v33);
            v32 = true;
            return;
        else
            for v40, v41 in pairs(v29) do
                if v41._status == v15.Status.Started then
                    v41:andThen(function(v42) --[[ Line: 208 ]]
                        -- upvalues: v40 (copy), v32 (ref), v33 (copy), v34 (ref), v35 (ref), v30 (copy)
                        local l_v40_0 = v40;
                        if v32 then
                            return;
                        else
                            v33[l_v40_0] = v42;
                            v34 = v34 + 1;
                            if v34 == v35 then
                                v30(v33);
                                v32 = true;
                            end;
                            return;
                        end;
                    end):catch(function(v44) --[[ Line: 211 ]]
                        -- upvalues: v32 (ref), v31 (copy)
                        v32 = true;
                        v31(v44);
                    end);
                elseif v41._status == v15.Status.Resolved then
                    local v45 = unpack(v41._values);
                    if not v32 then
                        v33[v40] = v45;
                        v34 = v34 + 1;
                        if v34 == v35 then
                            v30(v33);
                            v32 = true;
                        end;
                    end;
                else
                    v41:catch(function(_) --[[ Line: 224 ]]
                        -- upvalues: v32 (ref), v31 (copy), v41 (copy)
                        v32 = true;
                        v31(unpack(v41._values));
                    end);
                end;
            end;
            return;
        end;
    end);
end;
v15.is = function(v47) --[[ Line: 236 ]] --[[ Name: is ]]
    if type(v47) ~= "table" then
        return false;
    else
        return v47._type == "Promise";
    end;
end;
v15.promisify = function(v48) --[[ Line: 247 ]] --[[ Name: promisify ]]
    -- upvalues: v15 (copy)
    return function(...) --[[ Line: 248 ]]
        -- upvalues: v15 (ref), v48 (copy)
        local v49 = {
            ...
        };
        local v50 = select("#", ...);
        return v15.new(function(v51, v52) --[[ Line: 252 ]]
            -- upvalues: v48 (ref), v49 (copy), v50 (copy)
            spawn(function() --[[ Line: 253 ]]
                -- upvalues: v48 (ref), v49 (ref), v50 (ref), v51 (copy), v52 (copy)
                local l_status_0, l_result_0 = pcall(v48, unpack(v49, 1, v50));
                if l_status_0 then
                    v51(l_result_0);
                    return;
                else
                    v52(l_result_0);
                    return;
                end;
            end);
        end);
    end;
end;
v15.getStatus = function(v55) --[[ Line: 266 ]] --[[ Name: getStatus ]]
    return v55._status;
end;
v15.andThen = function(v56, v57, v58) --[[ Line: 274 ]] --[[ Name: andThen ]]
    -- upvalues: v15 (copy), v6 (copy)
    v56._unhandledRejection = false;
    return v15.new(function(v59, v60) --[[ Line: 278 ]]
        -- upvalues: v57 (copy), v6 (ref), v58 (copy), v56 (copy), v15 (ref)
        local l_v59_0 = v59;
        if v57 then
            local l_v57_0 = v57;
            local l_l_v57_0_0 = l_v57_0 --[[ copy: 3 -> 5 ]];
            l_v59_0 = function(...) --[[ Line: 49 ]]
                -- upvalues: v6 (ref), l_l_v57_0_0 (copy), v59 (copy), v60 (copy)
                local v64, v65 = v6(l_l_v57_0_0, ...);
                if v65[1] then
                    v59(unpack(v65, 2, v64));
                    return;
                else
                    v60(unpack(v65, 2, v64));
                    return;
                end;
            end;
        end;
        local l_v60_0 = v60;
        if v58 then
            local l_v58_0 = v58;
            l_v60_0 = function(...) --[[ Line: 49 ]]
                -- upvalues: v6 (ref), l_v58_0 (copy), v59 (copy), v60 (copy)
                local v68, v69 = v6(l_v58_0, ...);
                if v69[1] then
                    v59(unpack(v69, 2, v68));
                    return;
                else
                    v60(unpack(v69, 2, v68));
                    return;
                end;
            end;
        end;
        if v56._status == v15.Status.Started then
            table.insert(v56._queuedResolve, l_v59_0);
            table.insert(v56._queuedReject, l_v60_0);
            return;
        elseif v56._status == v15.Status.Resolved then
            l_v59_0(unpack(v56._values, 1, v56._valuesLength));
            return;
        else
            if v56._status == v15.Status.Rejected then
                l_v60_0(unpack(v56._values, 1, v56._valuesLength));
            end;
            return;
        end;
    end);
end;
v15.catch = function(v70, v71) --[[ Line: 309 ]] --[[ Name: catch ]]
    return v70:andThen(nil, v71);
end;
v15.await = function(v72) --[[ Line: 317 ]] --[[ Name: await ]]
    -- upvalues: v15 (copy)
    v72._unhandledRejection = false;
    if v72._status == v15.Status.Started then
        local v73 = nil;
        local v74 = nil;
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        v72:andThen(function(...) --[[ Line: 325 ]]
            -- upvalues: v73 (ref), v74 (ref), l_BindableEvent_0 (copy)
            v73 = {
                ...
            };
            v74 = select("#", ...);
            l_BindableEvent_0:Fire(true);
        end, function(...) --[[ Line: 329 ]]
            -- upvalues: v73 (ref), v74 (ref), l_BindableEvent_0 (copy)
            v73 = {
                ...
            };
            v74 = select("#", ...);
            l_BindableEvent_0:Fire(false);
        end);
        local v76 = l_BindableEvent_0.Event:Wait();
        l_BindableEvent_0:Destroy();
        return v76, unpack(v73, 1, v74);
    elseif v72._status == v15.Status.Resolved then
        return true, unpack(v72._values, 1, v72._valuesLength);
    elseif v72._status == v15.Status.Rejected then
        return false, unpack(v72._values, 1, v72._valuesLength);
    else
        return;
    end;
end;
v15._resolve = function(v77, ...) --[[ Line: 346 ]] --[[ Name: _resolve ]]
    -- upvalues: v15 (copy)
    if v77._status ~= v15.Status.Started then
        return;
    else
        local v78 = select("#", ...);
        if v15.is((...)) then
            if v78 > 1 then
                local v79 = ("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s"):format(v77._source);
                warn(v79);
            end;
            (...):andThen(function(...) --[[ Line: 363 ]]
                -- upvalues: v77 (copy)
                v77:_resolve(...);
            end, function(...) --[[ Line: 365 ]]
                -- upvalues: v77 (copy)
                v77:_reject(...);
            end);
            return;
        else
            v77._status = v15.Status.Resolved;
            v77._values = {
                ...
            };
            v77._valuesLength = v78;
            for _, v81 in ipairs(v77._queuedResolve) do
                v81(...);
            end;
            return;
        end;
    end;
end;
v15._reject = function(v82, ...) --[[ Line: 382 ]] --[[ Name: _reject ]]
    -- upvalues: v15 (copy)
    if v82._status ~= v15.Status.Started then
        return;
    else
        v82._status = v15.Status.Rejected;
        v82._values = {
            ...
        };
        v82._valuesLength = select("#", ...);
        local l__queuedReject_0 = v82._queuedReject;
        if not (next(l__queuedReject_0) == nil) then
            for _, v85 in ipairs(v82._queuedReject) do
                v85(...);
            end;
            return;
        else
            v82._unhandledRejection = true;
            local v86 = tostring((...));
            spawn(function() --[[ Line: 406 ]]
                -- upvalues: v82 (copy), v86 (copy)
                if not v82._unhandledRejection then
                    return;
                else
                    local v87 = ("Unhandled promise rejection:\n\n%s\n\n%s"):format(v86, v82._source);
                    warn(v87);
                    return;
                end;
            end);
            return;
        end;
    end;
end;
return v15;