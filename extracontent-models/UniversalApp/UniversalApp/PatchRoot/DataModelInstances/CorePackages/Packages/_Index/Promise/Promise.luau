local v0 = {
    __mode = "k"
};
local l_status_0, l_result_0 = pcall(game.DefineFastFlag, game, "ReducePromiseTaskDefer", false);
if not l_status_0 then
    l_result_0 = false;
end;
local function _(v3) --[[ Line: 16 ]] --[[ Name: isCallable ]]
    if type(v3) == "function" then
        return true;
    else
        if type(v3) == "table" then
            local v4 = getmetatable(v3);
            if v4 and type((rawget(v4, "__call"))) == "function" then
                return true;
            end;
        end;
        return false;
    end;
end;
local function v13(v6, v7) --[[ Line: 34 ]] --[[ Name: makeEnum ]]
    local v8 = {};
    for _, v10 in ipairs(v7) do
        v8[v10] = v10;
    end;
    return (setmetatable(v8, {
        __index = function(_, v12) --[[ Line: 42 ]] --[[ Name: __index ]]
            -- upvalues: v6 (copy)
            error(string.format("%s is not in %s!", v12, v6), 2);
        end, 
        __newindex = function() --[[ Line: 45 ]] --[[ Name: __newindex ]]
            -- upvalues: v6 (copy)
            error(string.format("Creating new members in %s is not allowed!", v6), 2);
        end
    }));
end;
local v14 = nil;
v14 = {
    Kind = v13("Promise.Error.Kind", {
        "ExecutionError", 
        "AlreadyCancelled", 
        "NotResolvedInTime", 
        "TimedOut"
    })
};
v14.__index = v14;
v14.new = function(v15, v16) --[[ Line: 70 ]] --[[ Name: new ]]
    -- upvalues: v14 (ref)
    v15 = v15 or {};
    return (setmetatable({
        error = tostring(v15.error) or "[This error has no error text.]", 
        trace = v15.trace, 
        context = v15.context, 
        kind = v15.kind, 
        parent = v16, 
        createdTick = os.clock(), 
        createdTrace = debug.traceback()
    }, v14));
end;
v14.is = function(v17) --[[ Line: 83 ]] --[[ Name: is ]]
    if type(v17) == "table" then
        local v18 = getmetatable(v17);
        if type(v18) == "table" then
            local v19 = false;
            if rawget(v17, "error") ~= nil then
                v19 = type((rawget(v18, "extend"))) == "function";
            end;
            return v19;
        end;
    end;
    return false;
end;
v14.isKind = function(v20, v21) --[[ Line: 95 ]] --[[ Name: isKind ]]
    -- upvalues: v14 (ref)
    assert(v21 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil");
    return v14.is(v20) and v20.kind == v21;
end;
v14.extend = function(v22, v23) --[[ Line: 101 ]] --[[ Name: extend ]]
    -- upvalues: v14 (ref)
    v23 = v23 or {};
    v23.kind = v23.kind or v22.kind;
    return v14.new(v23, v22);
end;
v14.getErrorChain = function(v24) --[[ Line: 109 ]] --[[ Name: getErrorChain ]]
    local v25 = {
        v24
    };
    while v25[#v25].parent do
        table.insert(v25, v25[#v25].parent);
    end;
    return v25;
end;
v14.__tostring = function(v26) --[[ Line: 119 ]] --[[ Name: __tostring ]]
    local v27 = {
        string.format("-- Promise.Error(%s) --", v26.kind or "?")
    };
    for _, v29 in ipairs(v26:getErrorChain()) do
        table.insert(v27, table.concat({
            v29.trace or v29.error, 
            v29.context
        }, "\n"));
    end;
    return table.concat(v27, "\n");
end;
local function v30(...) --[[ Line: 143 ]] --[[ Name: pack ]]
    return select("#", ...), {
        ...
    };
end;
local function v32(v31, ...) --[[ Line: 150 ]] --[[ Name: packResult ]]
    return v31, select("#", ...), {
        ...
    };
end;
local function _(v33) --[[ Line: 154 ]] --[[ Name: makeErrorHandler ]]
    -- upvalues: v14 (ref)
    assert(v33 ~= nil, "traceback is nil");
    return function(v34) --[[ Line: 157 ]]
        -- upvalues: v14 (ref), v33 (copy)
        if type(v34) == "table" then
            return v34;
        else
            return v14.new({
                error = v34, 
                kind = v14.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v34), 2), 
                context = "Promise created at:\n\n" .. v33
            });
        end;
    end;
end;
local function v42(v36, v37, ...) --[[ Line: 177 ]] --[[ Name: runExecutor ]]
    -- upvalues: v32 (copy), v14 (ref)
    local l_v32_0 = v32;
    local l_xpcall_0 = xpcall;
    local l_v37_0 = v37;
    assert(v36 ~= nil, "traceback is nil");
    return l_v32_0(l_xpcall_0(l_v37_0, function(v41) --[[ Line: 157 ]]
        -- upvalues: v14 (ref), v36 (copy)
        if type(v41) == "table" then
            return v41;
        else
            return v14.new({
                error = v41, 
                kind = v14.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v41), 2), 
                context = "Promise created at:\n\n" .. v36
            });
        end;
    end, ...));
end;
local function _(v43, v44, v45, v46) --[[ Line: 185 ]] --[[ Name: createAdvancer ]]
    -- upvalues: v42 (copy)
    return function(...) --[[ Line: 186 ]]
        -- upvalues: v42 (ref), v43 (copy), v44 (copy), v45 (copy), v46 (copy)
        local v47, v48, v49 = v42(v43, v44, ...);
        if v47 then
            v45(unpack(v49, 1, v48));
            return;
        else
            v46(v49[1]);
            return;
        end;
    end;
end;
local function _(v51) --[[ Line: 197 ]] --[[ Name: isEmpty ]]
    return next(v51) == nil;
end;
local v53 = {
    Error = v14, 
    Status = v13("Promise.Status", {
        "Started", 
        "Resolved", 
        "Rejected", 
        "Cancelled"
    }), 
    _getTime = os.clock, 
    _timeEvent = game:GetService("RunService").Heartbeat, 
    _unhandledRejectionCallbacks = {}, 
    prototype = {}
};
v53.__index = v53.prototype;
v53._new = function(v54, v55, v56) --[[ Line: 236 ]] --[[ Name: _new ]]
    -- upvalues: v53 (copy), v0 (copy), v42 (copy)
    if v56 ~= nil and not v53.is(v56) then
        error("Argument #2 to Promise.new must be a promise or nil", 2);
    end;
    local v57 = {
        _thread = nil, 
        _source = v54, 
        _status = v53.Status.Started, 
        _values = nil, 
        _valuesLength = -1, 
        _unhandledRejection = true, 
        _queuedResolve = {}, 
        _queuedReject = {}, 
        _queuedFinally = {}, 
        _cancellationHook = nil, 
        _parent = v56, 
        _consumers = setmetatable({}, v0)
    };
    if v56 and v56._status == v53.Status.Started then
        v56._consumers[v57] = true;
    end;
    setmetatable(v57, v53);
    local function v58(...) --[[ Line: 284 ]] --[[ Name: resolve ]]
        -- upvalues: v57 (copy)
        v57:_resolve(...);
    end;
    local function v59(...) --[[ Line: 288 ]] --[[ Name: reject ]]
        -- upvalues: v57 (copy)
        v57:_reject(...);
    end;
    local function v61(v60) --[[ Line: 292 ]] --[[ Name: onCancel ]]
        -- upvalues: v57 (copy), v53 (ref)
        if v60 then
            if v57._status == v53.Status.Cancelled then
                v60();
            else
                v57._cancellationHook = v60;
            end;
        end;
        return v57._status == v53.Status.Cancelled;
    end;
    v57._thread = coroutine.create(function() --[[ Line: 304 ]]
        -- upvalues: v42 (ref), v57 (copy), v55 (copy), v58 (copy), v59 (copy), v61 (copy)
        local v62, _, v64 = v42(v57._source, v55, v58, v59, v61);
        if not v62 then
            v59(v64[1]);
        end;
    end);
    task.spawn(v57._thread);
    return v57;
end;
v53.new = function(v65) --[[ Line: 355 ]] --[[ Name: new ]]
    -- upvalues: v53 (copy)
    return v53._new(debug.traceback(nil, 2), v65);
end;
v53.__tostring = function(v66) --[[ Line: 359 ]] --[[ Name: __tostring ]]
    return string.format("Promise(%s)", v66._status);
end;
v53.defer = function(v67) --[[ Line: 381 ]] --[[ Name: defer ]]
    -- upvalues: v53 (copy), v42 (copy)
    local v68 = debug.traceback(nil, 2);
    local _ = nil;
    return (v53._new(v68, function(v70, v71, v72) --[[ Line: 384 ]]
        -- upvalues: v53 (ref), v42 (ref), v68 (copy), v67 (copy)
        local v73 = nil;
        v73 = v53._timeEvent:Connect(function() --[[ Line: 386 ]]
            -- upvalues: v73 (ref), v42 (ref), v68 (ref), v67 (ref), v70 (copy), v71 (copy), v72 (copy)
            v73:Disconnect();
            local v74, _, v76 = v42(v68, v67, v70, v71, v72);
            if not v74 then
                v71(v76[1]);
            end;
        end);
    end));
end;
v53.async = v53.defer;
v53.resolve = function(...) --[[ Line: 424 ]] --[[ Name: resolve ]]
    -- upvalues: v30 (copy), v53 (copy)
    local v77, v78 = v30(...);
    return v53._new(debug.traceback(nil, 2), function(v79) --[[ Line: 426 ]]
        -- upvalues: v78 (copy), v77 (copy)
        v79(unpack(v78, 1, v77));
    end);
end;
v53.reject = function(...) --[[ Line: 441 ]] --[[ Name: reject ]]
    -- upvalues: v30 (copy), v53 (copy)
    local v80, v81 = v30(...);
    return v53._new(debug.traceback(nil, 2), function(_, v83) --[[ Line: 443 ]]
        -- upvalues: v81 (copy), v80 (copy)
        v83(unpack(v81, 1, v80));
    end);
end;
v53._try = function(v84, v85, ...) --[[ Line: 452 ]] --[[ Name: _try ]]
    -- upvalues: v30 (copy), v53 (copy)
    local v86, v87 = v30(...);
    return v53._new(v84, function(v88) --[[ Line: 455 ]]
        -- upvalues: v85 (copy), v87 (copy), v86 (copy)
        v88(v85(unpack(v87, 1, v86)));
    end);
end;
v53.try = function(v89, ...) --[[ Line: 483 ]] --[[ Name: try ]]
    -- upvalues: v53 (copy)
    return v53._try(debug.traceback(nil, 2), v89, ...);
end;
v53._all = function(v90, v91, v92) --[[ Line: 492 ]] --[[ Name: _all ]]
    -- upvalues: v53 (copy)
    if type(v91) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.all"), 3);
    end;
    for v93, v94 in pairs(v91) do
        if not v53.is(v94) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(v93))), 3);
        end;
    end;
    if #v91 == 0 or v92 == 0 then
        return v53.resolve({});
    else
        return v53._new(v90, function(v95, v96, v97) --[[ Line: 510 ]]
            -- upvalues: v92 (copy), v91 (copy)
            local v98 = {};
            local v99 = {};
            local v100 = 0;
            local v101 = 0;
            local v102 = false;
            local function v105() --[[ Line: 521 ]] --[[ Name: cancel ]]
                -- upvalues: v99 (copy)
                for _, v104 in ipairs(v99) do
                    v104:cancel();
                end;
            end;
            local function v109(v106, ...) --[[ Line: 528 ]] --[[ Name: resolveOne ]]
                -- upvalues: v102 (ref), v100 (ref), v92 (ref), v98 (copy), v91 (ref), v95 (copy), v99 (copy)
                if v102 then
                    return;
                else
                    v100 = v100 + 1;
                    if v92 == nil then
                        v98[v106] = ...;
                    else
                        v98[v100] = ...;
                    end;
                    if v100 >= (v92 or #v91) then
                        v102 = true;
                        v95(v98);
                        for _, v108 in ipairs(v99) do
                            v108:cancel();
                        end;
                    end;
                    return;
                end;
            end;
            v97(v105);
            for v110, v111 in ipairs(v91) do
                v99[v110] = v111:andThen(function(...) --[[ Line: 553 ]]
                    -- upvalues: v109 (copy), v110 (copy)
                    v109(v110, ...);
                end, function(...) --[[ Line: 555 ]]
                    -- upvalues: v101 (ref), v92 (ref), v91 (ref), v99 (copy), v102 (ref), v96 (copy)
                    v101 = v101 + 1;
                    if v92 == nil or #v91 - v101 < v92 then
                        for _, v113 in ipairs(v99) do
                            v113:cancel();
                        end;
                        v102 = true;
                        v96(...);
                    end;
                end);
            end;
            if v102 then
                for _, v115 in ipairs(v99) do
                    v115:cancel();
                end;
            end;
        end);
    end;
end;
v53.all = function(...) --[[ Line: 597 ]] --[[ Name: all ]]
    -- upvalues: v53 (copy)
    local v116 = {
        ...
    };
    if type(v116[1]) == "table" and not v53.is(v116[1]) then
        v116 = v116[1];
    end;
    return v53._all(debug.traceback(nil, 2), v116);
end;
v53.fold = function(v117, v118, v119) --[[ Line: 634 ]] --[[ Name: fold ]]
    -- upvalues: v53 (copy)
    local v120 = false;
    assert(type(v117) == "table", "Bad argument #1 to Promise.fold: must be a table");
    local v121;
    if type(v118) == "function" then
        v121 = true;
    else
        if type(v118) == "table" then
            local v122 = getmetatable(v118);
            if v122 and type((rawget(v122, "__call"))) == "function" then
                v121 = true;
                v120 = true;
            end;
        end;
        if not v120 then
            v121 = false;
        end;
    end;
    v120 = false;
    assert(v121, "Bad argument #2 to Promise.fold: must be a function");
    local v123 = v53.resolve(v119);
    return v53.each(v117, function(v124, v125) --[[ Line: 639 ]]
        -- upvalues: v123 (ref), v118 (copy)
        v123 = v123:andThen(function(v126) --[[ Line: 640 ]]
            -- upvalues: v118 (ref), v124 (copy), v125 (copy)
            return v118(v126, v124, v125);
        end);
    end):andThen(function() --[[ Line: 643 ]]
        -- upvalues: v123 (ref)
        return v123;
    end);
end;
v53.some = function(v127, v128) --[[ Line: 667 ]] --[[ Name: some ]]
    -- upvalues: v53 (copy)
    assert(type(v128) == "number", "Bad argument #2 to Promise.some: must be a number");
    return v53._all(debug.traceback(nil, 2), v127, v128);
end;
v53.any = function(v129) --[[ Line: 691 ]] --[[ Name: any ]]
    -- upvalues: v53 (copy)
    return v53._all(debug.traceback(nil, 2), v129, 1):andThen(function(v130) --[[ Line: 692 ]]
        return v130[1];
    end);
end;
v53.allSettled = function(v131) --[[ Line: 713 ]] --[[ Name: allSettled ]]
    -- upvalues: v53 (copy)
    if type(v131) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2);
    end;
    for v132, v133 in pairs(v131) do
        if not v53.is(v133) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(v132))), 2);
        end;
    end;
    if #v131 == 0 then
        return v53.resolve({});
    else
        return v53._new(debug.traceback(nil, 2), function(v134, _, v136) --[[ Line: 731 ]]
            -- upvalues: v131 (copy)
            local v137 = {};
            local v138 = {};
            local v139 = 0;
            local function v141(v140, ...) --[[ Line: 741 ]] --[[ Name: resolveOne ]]
                -- upvalues: v139 (ref), v137 (copy), v131 (ref), v134 (copy)
                v139 = v139 + 1;
                v137[v140] = ...;
                if v139 >= #v131 then
                    v134(v137);
                end;
            end;
            v136(function() --[[ Line: 751 ]]
                -- upvalues: v138 (copy)
                for _, v143 in ipairs(v138) do
                    v143:cancel();
                end;
            end);
            for v144, v145 in ipairs(v131) do
                v138[v144] = v145:finally(function(...) --[[ Line: 760 ]]
                    -- upvalues: v141 (copy), v144 (copy)
                    v141(v144, ...);
                end);
            end;
        end);
    end;
end;
v53.race = function(v146) --[[ Line: 791 ]] --[[ Name: race ]]
    -- upvalues: v53 (copy)
    assert(type(v146) == "table", string.format("Please pass a list of promises to %s", "Promise.race"));
    for v147, v148 in pairs(v146) do
        assert(v53.is(v148), string.format("Non-promise value passed into %s at index %s", "Promise.race", (tostring(v147))));
    end;
    return v53._new(debug.traceback(nil, 2), function(v149, v150, v151) --[[ Line: 798 ]]
        -- upvalues: v146 (copy)
        local v152 = {};
        local v153 = false;
        local _ = function() --[[ Line: 802 ]] --[[ Name: cancel ]]
            -- upvalues: v152 (copy)
            for _, v155 in ipairs(v152) do
                v155:cancel();
            end;
        end;
        local _ = function(v157) --[[ Line: 808 ]] --[[ Name: finalize ]]
            -- upvalues: v152 (copy), v153 (ref)
            return function(...) --[[ Line: 809 ]]
                -- upvalues: v152 (ref), v153 (ref), v157 (copy)
                for _, v159 in ipairs(v152) do
                    v159:cancel();
                end;
                v153 = true;
                return v157(...);
            end;
        end;
        if v151(function(...) --[[ Line: 809 ]]
            -- upvalues: v152 (copy), v153 (ref), v150 (copy)
            for _, v162 in ipairs(v152) do
                v162:cancel();
            end;
            v153 = true;
            return v150(...);
        end) then
            return;
        else
            for v163, v164 in ipairs(v146) do
                v152[v163] = v164:andThen(function(...) --[[ Line: 809 ]]
                    -- upvalues: v152 (copy), v153 (ref), v149 (copy)
                    for _, v166 in ipairs(v152) do
                        v166:cancel();
                    end;
                    v153 = true;
                    return v149(...);
                end, function(...) --[[ Line: 809 ]]
                    -- upvalues: v152 (copy), v153 (ref), v150 (copy)
                    for _, v168 in ipairs(v152) do
                        v168:cancel();
                    end;
                    v153 = true;
                    return v150(...);
                end);
            end;
            if v153 then
                for _, v170 in ipairs(v152) do
                    v170:cancel();
                end;
            end;
            return;
        end;
    end);
end;
v53.each = function(v171, v172) --[[ Line: 886 ]] --[[ Name: each ]]
    -- upvalues: v53 (copy), v14 (ref)
    local v173 = false;
    assert(type(v171) == "table", string.format("Please pass a list of promises to %s", "Promise.each"));
    local v174;
    if type(v172) == "function" then
        v174 = true;
    else
        if type(v172) == "table" then
            local v175 = getmetatable(v172);
            if v175 and type((rawget(v175, "__call"))) == "function" then
                v174 = true;
                v173 = true;
            end;
        end;
        if not v173 then
            v174 = false;
        end;
    end;
    v173 = false;
    assert(v174, string.format("Please pass a handler function to %s!", "Promise.each"));
    return v53._new(debug.traceback(nil, 2), function(v176, v177, v178) --[[ Line: 890 ]]
        -- upvalues: v171 (copy), v53 (ref), v14 (ref), v172 (copy)
        local v179 = {};
        local v180 = {};
        local v181 = false;
        local _ = function() --[[ Line: 896 ]] --[[ Name: cancel ]]
            -- upvalues: v180 (copy)
            for _, v183 in ipairs(v180) do
                v183:cancel();
            end;
        end;
        v178(function() --[[ Line: 902 ]]
            -- upvalues: v181 (ref), v180 (copy)
            v181 = true;
            for _, v186 in ipairs(v180) do
                v186:cancel();
            end;
        end);
        local v187 = {};
        for v188, v189 in ipairs(v171) do
            if v53.is(v189) then
                if v189:getStatus() == v53.Status.Cancelled then
                    for _, v191 in ipairs(v180) do
                        v191:cancel();
                    end;
                    return v177(v14.new({
                        error = "Promise is cancelled", 
                        kind = v14.Kind.AlreadyCancelled, 
                        context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v188, v189._source)
                    }));
                elseif v189:getStatus() == v53.Status.Rejected then
                    for _, v193 in ipairs(v180) do
                        v193:cancel();
                    end;
                    return v177(select(2, v189:await()));
                else
                    local v194 = v189:andThen(function(...) --[[ Line: 935 ]]
                        return ...;
                    end);
                    table.insert(v180, v194);
                    v187[v188] = v194;
                end;
            else
                v187[v188] = v189;
            end;
        end;
        for v195, v196 in ipairs(v187) do
            if v53.is(v196) then
                local v197 = nil;
                local v198, v199 = v196:await();
                v197 = v198;
                v196 = v199;
                if not v197 then
                    for _, v201 in ipairs(v180) do
                        v201:cancel();
                    end;
                    return v177(v196);
                end;
            end;
            if v181 then
                return;
            else
                local v202 = v53.resolve(v172(v196, v195));
                table.insert(v180, v202);
                local v203, v204 = v202:await();
                if not v203 then
                    for _, v206 in ipairs(v180) do
                        v206:cancel();
                    end;
                    return v177(v204);
                else
                    v179[v195] = v204;
                end;
            end;
        end;
        v176(v179);
    end);
end;
v53.is = function(v207) --[[ Line: 985 ]] --[[ Name: is ]]
    -- upvalues: v53 (copy)
    local v208 = false;
    if type(v207) ~= "table" then
        return false;
    else
        local v209 = getmetatable(v207);
        if v209 == v53 then
            return true;
        elseif v209 == nil then
            local l_andThen_0 = v207.andThen;
            if type(l_andThen_0) == "function" then
                return true;
            else
                if type(l_andThen_0) == "table" then
                    local v211 = getmetatable(l_andThen_0);
                    if v211 and type((rawget(v211, "__call"))) == "function" then
                        return true;
                    end;
                end;
                return false;
            end;
        else
            if type(v209) == "table" and type((rawget(v209, "__index"))) == "table" then
                local v212 = rawget(rawget(v209, "__index"), "andThen");
                local v213;
                if type(v212) == "function" then
                    v213 = true;
                else
                    if type(v212) == "table" then
                        local v214 = getmetatable(v212);
                        if v214 and type((rawget(v214, "__call"))) == "function" then
                            v213 = true;
                            v208 = true;
                        end;
                    end;
                    if not v208 then
                        v213 = false;
                    end;
                end;
                v208 = false;
                if v213 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v53.promisify = function(v215) --[[ Line: 1034 ]] --[[ Name: promisify ]]
    -- upvalues: v53 (copy)
    return function(...) --[[ Line: 1035 ]]
        -- upvalues: v53 (ref), v215 (copy)
        return v53._try(debug.traceback(nil, 2), v215, ...);
    end;
end;
local v216 = nil;
local v217 = nil;
do
    local l_v216_0, l_v217_0 = v216, v217;
    v53.delay = function(v220) --[[ Line: 1065 ]] --[[ Name: delay ]]
        -- upvalues: v53 (copy), l_v217_0 (ref), l_v216_0 (ref)
        assert(type(v220) == "number", "Bad argument #1 to Promise.delay, must be a number.");
        if v220 < 0.016666666666666666 or v220 == 1e999 then
            v220 = 0.016666666666666666;
        end;
        return v53._new(debug.traceback(nil, 2), function(v221, _, v223) --[[ Line: 1073 ]]
            -- upvalues: v53 (ref), v220 (ref), l_v217_0 (ref), l_v216_0 (ref)
            local v224 = v53._getTime();
            local v225 = v224 + v220;
            local v226 = {
                resolve = v221, 
                startTime = v224, 
                endTime = v225
            };
            if l_v217_0 == nil then
                l_v216_0 = v226;
                l_v217_0 = v53._timeEvent:Connect(function() --[[ Line: 1085 ]]
                    -- upvalues: v53 (ref), l_v216_0 (ref), l_v217_0 (ref)
                    local v227 = v53._getTime();
                    while l_v216_0 ~= nil and l_v216_0.endTime < v227 do
                        local l_l_v216_0_0 = l_v216_0;
                        l_v216_0 = l_l_v216_0_0.next;
                        if l_v216_0 == nil then
                            l_v217_0:Disconnect();
                            l_v217_0 = nil;
                        else
                            l_v216_0.previous = nil;
                        end;
                        l_l_v216_0_0.resolve(v53._getTime() - l_l_v216_0_0.startTime);
                    end;
                end);
            elseif l_v216_0.endTime < v225 then
                local l_l_v216_0_1 = l_v216_0;
                local l_next_0 = l_l_v216_0_1.next;
                while l_next_0 ~= nil and l_next_0.endTime < v225 do
                    l_l_v216_0_1 = l_next_0;
                    l_next_0 = l_l_v216_0_1.next;
                end;
                l_l_v216_0_1.next = v226;
                v226.previous = l_l_v216_0_1;
                if l_next_0 ~= nil then
                    v226.next = l_next_0;
                    l_next_0.previous = v226;
                end;
            else
                v226.next = l_v216_0;
                l_v216_0.previous = v226;
                l_v216_0 = v226;
            end;
            v223(function() --[[ Line: 1130 ]]
                -- upvalues: v226 (copy), l_v216_0 (ref), l_v217_0 (ref)
                local l_next_1 = v226.next;
                if l_v216_0 == v226 then
                    if l_next_1 == nil then
                        l_v217_0:Disconnect();
                        l_v217_0 = nil;
                    else
                        l_next_1.previous = nil;
                    end;
                    l_v216_0 = l_next_1;
                    return;
                else
                    local l_previous_0 = v226.previous;
                    l_previous_0.next = l_next_1;
                    if l_next_1 ~= nil then
                        l_next_1.previous = l_previous_0;
                    end;
                    return;
                end;
            end);
        end);
    end;
end;
v216 = function(v233, v234, v235) --[[ Line: 1194 ]] --[[ Name: timeout ]]
    -- upvalues: v53 (copy), v14 (ref)
    local v236 = debug.traceback(nil, 2);
    return v53.race({
        v53.delay(v234):andThen(function() --[[ Line: 1198 ]]
            -- upvalues: v53 (ref), v235 (copy), v14 (ref), v234 (copy), v236 (copy)
            return v53.reject(v235 == nil and v14.new({
                kind = v14.Kind.TimedOut, 
                error = "Timed out", 
                context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", v234, v236)
            }) or v235);
        end), 
        v233
    });
end;
v53.prototype.timeout = v216;
v53.prototype.getStatus = function(v237) --[[ Line: 1218 ]] --[[ Name: getStatus ]]
    return v237._status;
end;
v216 = function(v238, v239, v240, v241) --[[ Line: 1227 ]] --[[ Name: _andThen ]]
    -- upvalues: v53 (copy), v42 (copy), v14 (ref)
    v238._unhandledRejection = false;
    return v53._new(v239, function(v242, v243) --[[ Line: 1231 ]]
        -- upvalues: v240 (copy), v239 (copy), v42 (ref), v241 (copy), v238 (copy), v53 (ref), v14 (ref)
        local l_v242_0 = v242;
        if v240 then
            local l_v239_0 = v239;
            local l_v240_0 = v240;
            local l_l_v239_0_0 = l_v239_0 --[[ copy: 3 -> 6 ]];
            local l_l_v240_0_0 = l_v240_0 --[[ copy: 4 -> 7 ]];
            l_v242_0 = function(...) --[[ Line: 186 ]]
                -- upvalues: v42 (ref), l_l_v239_0_0 (copy), l_l_v240_0_0 (copy), v242 (copy), v243 (copy)
                local v249, v250, v251 = v42(l_l_v239_0_0, l_l_v240_0_0, ...);
                if v249 then
                    v242(unpack(v251, 1, v250));
                    return;
                else
                    v243(v251[1]);
                    return;
                end;
            end;
        end;
        local l_v243_0 = v243;
        if v241 then
            local l_v239_1 = v239;
            local l_v241_0 = v241;
            l_v243_0 = function(...) --[[ Line: 186 ]]
                -- upvalues: v42 (ref), l_v239_1 (copy), l_v241_0 (copy), v242 (copy), v243 (copy)
                local v255, v256, v257 = v42(l_v239_1, l_v241_0, ...);
                if v255 then
                    v242(unpack(v257, 1, v256));
                    return;
                else
                    v243(v257[1]);
                    return;
                end;
            end;
        end;
        if v238._status == v53.Status.Started then
            table.insert(v238._queuedResolve, l_v242_0);
            table.insert(v238._queuedReject, l_v243_0);
            return;
        elseif v238._status == v53.Status.Resolved then
            l_v242_0(unpack(v238._values, 1, v238._valuesLength));
            return;
        elseif v238._status == v53.Status.Rejected then
            l_v243_0(unpack(v238._values, 1, v238._valuesLength));
            return;
        else
            if v238._status == v53.Status.Cancelled then
                v243(v14.new({
                    error = "Promise is cancelled", 
                    kind = v14.Kind.AlreadyCancelled, 
                    context = "Promise created at\n\n" .. v239
                }));
            end;
            return;
        end;
    end, v238);
end;
v53.prototype._andThen = v216;
v53.prototype.andThen = function(v258, v259, v260) --[[ Line: 1288 ]] --[[ Name: andThen ]]
    local v261 = false;
    local v262 = false;
    local v263 = true;
    if v259 ~= nil then
        if type(v259) == "function" then
            v263 = true;
        else
            if type(v259) == "table" then
                local v264 = getmetatable(v259);
                if v264 and type((rawget(v264, "__call"))) == "function" then
                    v263 = true;
                    v261 = true;
                end;
            end;
            if not v261 then
                v263 = false;
            end;
        end;
    end;
    v261 = false;
    assert(v263, string.format("Please pass a handler function to %s!", "Promise:andThen"));
    v263 = true;
    if v260 ~= nil then
        if type(v260) == "function" then
            v263 = true;
        else
            if type(v260) == "table" then
                local v265 = getmetatable(v260);
                if v265 and type((rawget(v265, "__call"))) == "function" then
                    v263 = true;
                    v262 = true;
                end;
            end;
            if not v262 then
                v263 = false;
            end;
        end;
    end;
    v262 = false;
    assert(v263, string.format("Please pass a handler function to %s!", "Promise:andThen"));
    return v258:_andThen(debug.traceback(nil, 2), v259, v260);
end;
v53.prototype.andThenAsync = function(v266, v267, v268) --[[ Line: 1316 ]] --[[ Name: andThenAsync ]]
    -- upvalues: v30 (copy), v53 (copy)
    local v269 = false;
    local v270 = false;
    local v271 = true;
    if v267 ~= nil then
        if type(v267) == "function" then
            v271 = true;
        else
            if type(v267) == "table" then
                local v272 = getmetatable(v267);
                if v272 and type((rawget(v272, "__call"))) == "function" then
                    v271 = true;
                    v269 = true;
                end;
            end;
            if not v269 then
                v271 = false;
            end;
        end;
    end;
    v269 = false;
    assert(v271, string.format("Please pass a handler function to %s!", "Promise:andThenAsync"));
    v271 = true;
    if v268 ~= nil then
        if type(v268) == "function" then
            v271 = true;
        else
            if type(v268) == "table" then
                local v273 = getmetatable(v268);
                if v273 and type((rawget(v273, "__call"))) == "function" then
                    v271 = true;
                    v270 = true;
                end;
            end;
            if not v270 then
                v271 = false;
            end;
        end;
    end;
    v270 = false;
    assert(v271, string.format("Please pass a handler function to %s!", "Promise:andThenAsync"));
    return v266:_andThen(debug.traceback(nil, 2), function(...) --[[ Line: 1323 ]]
        -- upvalues: v30 (ref), v53 (ref)
        local v274, v275 = v30(...);
        return v53.defer(function(v276) --[[ Line: 1325 ]]
            -- upvalues: v275 (copy), v274 (copy)
            v276(unpack(v275, 1, v274));
        end);
    end, function(...) --[[ Line: 1329 ]]
        -- upvalues: v30 (ref), v53 (ref)
        local v277, v278 = v30(...);
        return v53.defer(function(_, v280) --[[ Line: 1331 ]]
            -- upvalues: v278 (copy), v277 (copy)
            v280(unpack(v278, 1, v277));
        end);
    end):andThen(v267, v268);
end;
v53.prototype.catch = function(v281, v282) --[[ Line: 1358 ]] --[[ Name: catch ]]
    local v283 = false;
    local v284 = true;
    if v282 ~= nil then
        if type(v282) == "function" then
            v284 = true;
        else
            if type(v282) == "table" then
                local v285 = getmetatable(v282);
                if v285 and type((rawget(v285, "__call"))) == "function" then
                    v284 = true;
                    v283 = true;
                end;
            end;
            if not v283 then
                v284 = false;
            end;
        end;
    end;
    v283 = false;
    assert(v284, string.format("Please pass a handler function to %s!", "Promise:catch"));
    return v281:_andThen(debug.traceback(nil, 2), nil, v282);
end;
v53.prototype.tap = function(v286, v287) --[[ Line: 1379 ]] --[[ Name: tap ]]
    -- upvalues: v53 (copy), v30 (copy)
    local v288 = false;
    local v289;
    if type(v287) == "function" then
        v289 = true;
    else
        if type(v287) == "table" then
            local v290 = getmetatable(v287);
            if v290 and type((rawget(v290, "__call"))) == "function" then
                v289 = true;
                v288 = true;
            end;
        end;
        if not v288 then
            v289 = false;
        end;
    end;
    v288 = false;
    assert(v289, string.format("Please pass a handler function to %s!", "Promise:tap"));
    return v286:_andThen(debug.traceback(nil, 2), function(...) --[[ Line: 1381 ]]
        -- upvalues: v287 (copy), v53 (ref), v30 (ref)
        local v291 = v287(...);
        if v53.is(v291) then
            local v292, v293 = v30(...);
            return v291:andThen(function() --[[ Line: 1386 ]]
                -- upvalues: v293 (copy), v292 (copy)
                return unpack(v293, 1, v292);
            end);
        else
            return ...;
        end;
    end);
end;
v53.prototype.andThenCall = function(v294, v295, ...) --[[ Line: 1414 ]] --[[ Name: andThenCall ]]
    -- upvalues: v30 (copy)
    local v296 = false;
    local v297;
    if type(v295) == "function" then
        v297 = true;
    else
        if type(v295) == "table" then
            local v298 = getmetatable(v295);
            if v298 and type((rawget(v298, "__call"))) == "function" then
                v297 = true;
                v296 = true;
            end;
        end;
        if not v296 then
            v297 = false;
        end;
    end;
    v296 = false;
    assert(v297, string.format("Please pass a handler function to %s!", "Promise:andThenCall"));
    local v299;
    v299, v297 = v30(...);
    return v294:_andThen(debug.traceback(nil, 2), function() --[[ Line: 1417 ]]
        -- upvalues: v295 (copy), v297 (copy), v299 (copy)
        return v295(unpack(v297, 1, v299));
    end);
end;
v53.prototype.andThenReturn = function(v300, ...) --[[ Line: 1444 ]] --[[ Name: andThenReturn ]]
    -- upvalues: v30 (copy)
    local v301, v302 = v30(...);
    return v300:_andThen(debug.traceback(nil, 2), function() --[[ Line: 1446 ]]
        -- upvalues: v302 (copy), v301 (copy)
        return unpack(v302, 1, v301);
    end);
end;
v53.prototype.cancel = function(v303) --[[ Line: 1462 ]] --[[ Name: cancel ]]
    -- upvalues: v53 (copy)
    if v303._status ~= v53.Status.Started then
        return;
    else
        v303._status = v53.Status.Cancelled;
        if v303._cancellationHook then
            v303._cancellationHook();
        end;
        coroutine.close(v303._thread);
        if v303._parent then
            v303._parent:_consumerCancelled(v303);
        end;
        for v304 in pairs(v303._consumers) do
            v304:cancel();
        end;
        v303:_finalize();
        return;
    end;
end;
v53.prototype._consumerCancelled = function(v305, v306) --[[ Line: 1490 ]] --[[ Name: _consumerCancelled ]]
    -- upvalues: v53 (copy)
    if v305._status ~= v53.Status.Started then
        return;
    else
        v305._consumers[v306] = nil;
        if next(v305._consumers) == nil then
            v305:cancel();
        end;
        return;
    end;
end;
v53.prototype._finally = function(v307, v308, v309, v310) --[[ Line: 1506 ]] --[[ Name: _finally ]]
    -- upvalues: v53 (copy), v42 (copy)
    if not v310 then
        v307._unhandledRejection = false;
    end;
    return v53._new(v308, function(v311, v312) --[[ Line: 1512 ]]
        -- upvalues: v309 (copy), v308 (copy), v42 (ref), v310 (copy), v307 (copy), v53 (ref)
        local l_v311_0 = v311;
        if v309 then
            local l_v308_0 = v308;
            local l_v309_0 = v309;
            local l_l_v308_0_0 = l_v308_0 --[[ copy: 3 -> 5 ]];
            l_v311_0 = function(...) --[[ Line: 186 ]]
                -- upvalues: v42 (ref), l_l_v308_0_0 (copy), l_v309_0 (copy), v311 (copy), v312 (copy)
                local v317, v318, v319 = v42(l_l_v308_0_0, l_v309_0, ...);
                if v317 then
                    v311(unpack(v319, 1, v318));
                    return;
                else
                    v312(v319[1]);
                    return;
                end;
            end;
        end;
        if v310 then
            local l_l_v311_0_0 = l_v311_0;
            l_v311_0 = function(...) --[[ Line: 1520 ]]
                -- upvalues: v307 (ref), v53 (ref), v311 (copy), l_l_v311_0_0 (copy)
                if v307._status == v53.Status.Rejected then
                    return v311(v307);
                else
                    return l_l_v311_0_0(...);
                end;
            end;
        end;
        if v307._status == v53.Status.Started then
            table.insert(v307._queuedFinally, l_v311_0);
            return;
        else
            l_v311_0(v307._status);
            return;
        end;
    end, v307);
end;
v53.prototype.finally = function(v321, v322) --[[ Line: 1588 ]] --[[ Name: finally ]]
    local v323 = false;
    local v324 = true;
    if v322 ~= nil then
        if type(v322) == "function" then
            v324 = true;
        else
            if type(v322) == "table" then
                local v325 = getmetatable(v322);
                if v325 and type((rawget(v325, "__call"))) == "function" then
                    v324 = true;
                    v323 = true;
                end;
            end;
            if not v323 then
                v324 = false;
            end;
        end;
    end;
    v323 = false;
    assert(v324, string.format("Please pass a handler function to %s!", "Promise:finally"));
    return v321:_finally(debug.traceback(nil, 2), v322);
end;
v53.prototype.finallyCall = function(v326, v327, ...) --[[ Line: 1602 ]] --[[ Name: finallyCall ]]
    -- upvalues: v30 (copy)
    local v328 = false;
    local v329;
    if type(v327) == "function" then
        v329 = true;
    else
        if type(v327) == "table" then
            local v330 = getmetatable(v327);
            if v330 and type((rawget(v330, "__call"))) == "function" then
                v329 = true;
                v328 = true;
            end;
        end;
        if not v328 then
            v329 = false;
        end;
    end;
    v328 = false;
    assert(v329, string.format("Please pass a handler function to %s!", "Promise:finallyCall"));
    local v331;
    v331, v329 = v30(...);
    return v326:_finally(debug.traceback(nil, 2), function() --[[ Line: 1605 ]]
        -- upvalues: v327 (copy), v329 (copy), v331 (copy)
        return v327(unpack(v329, 1, v331));
    end);
end;
v53.prototype.finallyReturn = function(v332, ...) --[[ Line: 1628 ]] --[[ Name: finallyReturn ]]
    -- upvalues: v30 (copy)
    local v333, v334 = v30(...);
    return v332:_finally(debug.traceback(nil, 2), function() --[[ Line: 1630 ]]
        -- upvalues: v334 (copy), v333 (copy)
        return unpack(v334, 1, v333);
    end);
end;
v53.prototype.done = function(v335, v336) --[[ Line: 1638 ]] --[[ Name: done ]]
    local v337 = false;
    local v338 = true;
    if v336 ~= nil then
        if type(v336) == "function" then
            v338 = true;
        else
            if type(v336) == "table" then
                local v339 = getmetatable(v336);
                if v339 and type((rawget(v339, "__call"))) == "function" then
                    v338 = true;
                    v337 = true;
                end;
            end;
            if not v337 then
                v338 = false;
            end;
        end;
    end;
    v337 = false;
    assert(v338, string.format("Please pass a handler function to %s!", "Promise:done"));
    return v335:_finally(debug.traceback(nil, 2), v336, true);
end;
v53.prototype.doneCall = function(v340, v341, ...) --[[ Line: 1649 ]] --[[ Name: doneCall ]]
    -- upvalues: v30 (copy)
    local v342 = false;
    local v343;
    if type(v341) == "function" then
        v343 = true;
    else
        if type(v341) == "table" then
            local v344 = getmetatable(v341);
            if v344 and type((rawget(v344, "__call"))) == "function" then
                v343 = true;
                v342 = true;
            end;
        end;
        if not v342 then
            v343 = false;
        end;
    end;
    v342 = false;
    assert(v343, string.format("Please pass a handler function to %s!", "Promise:doneCall"));
    local v345;
    v345, v343 = v30(...);
    return v340:_finally(debug.traceback(nil, 2), function() --[[ Line: 1652 ]]
        -- upvalues: v341 (copy), v343 (copy), v345 (copy)
        return v341(unpack(v343, 1, v345));
    end, true);
end;
v53.prototype.doneReturn = function(v346, ...) --[[ Line: 1660 ]] --[[ Name: doneReturn ]]
    -- upvalues: v30 (copy)
    local v347, v348 = v30(...);
    return v346:_finally(debug.traceback(nil, 2), function() --[[ Line: 1662 ]]
        -- upvalues: v348 (copy), v347 (copy)
        return unpack(v348, 1, v347);
    end, true);
end;
v53.prototype.awaitStatus = function(v349) --[[ Line: 1674 ]] --[[ Name: awaitStatus ]]
    -- upvalues: v53 (copy)
    v349._unhandledRejection = false;
    if v349._status == v53.Status.Started then
        local v350 = coroutine.running();
        v349:finally(function() --[[ Line: 1680 ]]
            -- upvalues: v350 (copy)
            task.spawn(v350);
        end);
        coroutine.yield();
    end;
    if v349._status == v53.Status.Resolved then
        return v349._status, unpack(v349._values, 1, v349._valuesLength);
    elseif v349._status == v53.Status.Rejected then
        return v349._status, unpack(v349._values, 1, v349._valuesLength);
    else
        return v349._status;
    end;
end;
v216 = function(v351, ...) --[[ Line: 1696 ]] --[[ Name: awaitHelper ]]
    -- upvalues: v53 (copy)
    return v351 == v53.Status.Resolved, ...;
end;
v53.prototype.await = function(v352) --[[ Line: 1721 ]] --[[ Name: await ]]
    -- upvalues: v216 (copy)
    return v216(v352:awaitStatus());
end;
v217 = function(v353, ...) --[[ Line: 1725 ]] --[[ Name: expectHelper ]]
    -- upvalues: v53 (copy)
    if v353 ~= v53.Status.Resolved then
        error(... == nil and "Expected Promise rejected with no value." or ..., 3);
    end;
    return ...;
end;
v53.prototype.expect = function(v354) --[[ Line: 1758 ]] --[[ Name: expect ]]
    -- upvalues: v217 (copy)
    return v217(v354:awaitStatus());
end;
v53.prototype.awaitValue = v53.prototype.expect;
v53.prototype._unwrap = function(v355) --[[ Line: 1772 ]] --[[ Name: _unwrap ]]
    -- upvalues: v53 (copy)
    if v355._status == v53.Status.Started then
        error("Promise has not resolved or rejected.", 2);
    end;
    return v355._status == v53.Status.Resolved, unpack(v355._values, 1, v355._valuesLength);
end;
local function v365(v356, ...) --[[ Line: 1782 ]] --[[ Name: _resolve ]]
    -- upvalues: v53 (copy), v14 (ref), v30 (copy)
    if v356._status ~= v53.Status.Started then
        if v53.is((...)) then
            (...):_consumerCancelled(v356);
        end;
        return;
    elseif v53.is((...)) then
        if select("#", ...) > 1 then
            local v357 = string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", v356._source);
            warn(v357);
        end;
        local v358 = ...;
        local v360 = v358:andThen(function(...) --[[ Line: 1803 ]]
            -- upvalues: v356 (copy)
            v356:_resolve(...);
        end, function(...) --[[ Line: 1805 ]]
            -- upvalues: v358 (copy), v14 (ref), v356 (copy)
            local v359 = v358._values[1];
            if v358._error then
                v359 = v14.new({
                    error = v358._error, 
                    kind = v14.Kind.ExecutionError, 
                    context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
                });
            end;
            if v14.isKind(v359, v14.Kind.ExecutionError) then
                return v356:_reject(v359:extend({
                    error = "This Promise was chained to a Promise that errored.", 
                    trace = "", 
                    context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", v356._source)
                }));
            else
                v356:_reject(...);
                return;
            end;
        end);
        if v360._status == v53.Status.Cancelled then
            v356:cancel();
            return;
        else
            if v360._status == v53.Status.Started then
                v356._parent = v360;
                v360._consumers[v356] = true;
            end;
            return;
        end;
    else
        v356._status = v53.Status.Resolved;
        local v361, v362 = v30(...);
        v356._valuesLength = v361;
        v356._values = v362;
        for _, v364 in ipairs(v356._queuedResolve) do
            coroutine.wrap(v364)(...);
        end;
        v356:_finalize();
        return;
    end;
end;
v53.prototype._resolve = v365;
v53.prototype._reject = function(v366, ...) --[[ Line: 1853 ]] --[[ Name: _reject ]]
    -- upvalues: v53 (copy), v30 (copy)
    if v366._status ~= v53.Status.Started then
        return;
    else
        v366._status = v53.Status.Rejected;
        local v367, v368 = v30(...);
        v366._valuesLength = v367;
        v366._values = v368;
        v368 = v366._queuedReject;
        if not (next(v368) == nil) then
            for _, v370 in ipairs(v366._queuedReject) do
                coroutine.wrap(v370)(...);
            end;
        else
            v367 = tostring((...));
            coroutine.wrap(function() --[[ Line: 1875 ]]
                -- upvalues: v53 (ref), v366 (copy), v367 (copy)
                v53._timeEvent:Wait();
                if not v366._unhandledRejection then
                    return;
                else
                    local v371 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", v367, v366._source);
                    for _, v373 in ipairs(v53._unhandledRejectionCallbacks) do
                        task.spawn(v373, v366, unpack(v366._values, 1, v366._valuesLength));
                    end;
                    if v53.TEST then
                        return;
                    else
                        warn(v371);
                        return;
                    end;
                end;
            end)();
        end;
        v366:_finalize();
        return;
    end;
end;
v365 = {};
local v374 = nil;
do
    local l_v365_0, l_v374_0 = v365, v374;
    local function v380() --[[ Line: 1906 ]] --[[ Name: closeThreads ]]
        -- upvalues: l_v374_0 (ref), l_v365_0 (ref)
        l_v374_0 = nil;
        local l_l_v365_0_0 = l_v365_0;
        l_v365_0 = {};
        for _, v379 in l_l_v365_0_0 do
            coroutine.close(v379);
        end;
    end;
    local function v384(v381) --[[ Line: 1920 ]] --[[ Name: _finalize ]]
        -- upvalues: v53 (copy), l_result_0 (ref), l_v365_0 (ref), l_v374_0 (ref), v380 (copy)
        for _, v383 in ipairs(v381._queuedFinally) do
            coroutine.wrap(v383)(v381._status);
        end;
        v381._queuedFinally = nil;
        v381._queuedReject = nil;
        v381._queuedResolve = nil;
        if not v53.TEST then
            v381._parent = nil;
            v381._consumers = nil;
        end;
        if l_result_0 then
            table.insert(l_v365_0, v381._thread);
            if not l_v374_0 then
                l_v374_0 = task.defer(v380);
                return;
            end;
        else
            task.defer(coroutine.close, v381._thread);
        end;
    end;
    v53.prototype._finalize = v384;
end;
v365 = function(v385, v386) --[[ Line: 1965 ]] --[[ Name: now ]]
    -- upvalues: v53 (copy), v14 (ref)
    local v387 = debug.traceback(nil, 2);
    if v385._status == v53.Status.Resolved then
        return v385:_andThen(v387, function(...) --[[ Line: 1968 ]]
            return ...;
        end);
    else
        return v53.reject(v386 == nil and v14.new({
            kind = v14.Kind.NotResolvedInTime, 
            error = "This Promise was not resolved in time for :now()", 
            context = ":now() was called at:\n\n" .. v387
        }) or v386);
    end;
end;
v53.prototype.now = v365;
v53.retry = function(v388, v389, ...) --[[ Line: 2010 ]] --[[ Name: retry ]]
    -- upvalues: v53 (copy)
    local v390 = false;
    local v391;
    if type(v388) == "function" then
        v391 = true;
    else
        if type(v388) == "table" then
            local v392 = getmetatable(v388);
            if v392 and type((rawget(v392, "__call"))) == "function" then
                v391 = true;
                v390 = true;
            end;
        end;
        if not v390 then
            v391 = false;
        end;
    end;
    v390 = false;
    assert(v391, "Parameter #1 to Promise.retry must be a function");
    assert(type(v389) == "number", "Parameter #2 to Promise.retry must be a number");
    local v393 = {
        ...
    };
    v391 = select("#", ...);
    return v53.resolve(v388(...)):catch(function(...) --[[ Line: 2016 ]]
        -- upvalues: v389 (copy), v53 (ref), v388 (copy), v393 (copy), v391 (copy)
        if v389 > 0 then
            return v53.retry(v388, v389 - 1, unpack(v393, 1, v391));
        else
            return v53.reject(...);
        end;
    end);
end;
v53.retryWithDelay = function(v394, v395, v396, ...) --[[ Line: 2038 ]] --[[ Name: retryWithDelay ]]
    -- upvalues: v53 (copy)
    local v397 = false;
    local v398;
    if type(v394) == "function" then
        v398 = true;
    else
        if type(v394) == "table" then
            local v399 = getmetatable(v394);
            if v399 and type((rawget(v399, "__call"))) == "function" then
                v398 = true;
                v397 = true;
            end;
        end;
        if not v397 then
            v398 = false;
        end;
    end;
    v397 = false;
    assert(v398, "Parameter #1 to Promise.retry must be a function");
    assert(type(v395) == "number", "Parameter #2 (times) to Promise.retry must be a number");
    assert(type(v396) == "number", "Parameter #3 (seconds) to Promise.retry must be a number");
    local v400 = {
        ...
    };
    v398 = select("#", ...);
    return v53.resolve(v394(...)):catch(function(...) --[[ Line: 2045 ]]
        -- upvalues: v395 (copy), v53 (ref), v396 (copy), v394 (copy), v400 (copy), v398 (copy)
        if v395 > 0 then
            v53.delay(v396):await();
            return v53.retryWithDelay(v394, v395 - 1, v396, unpack(v400, 1, v398));
        else
            return v53.reject(...);
        end;
    end);
end;
v53.fromEvent = function(v401, v402) --[[ Line: 2080 ]] --[[ Name: fromEvent ]]
    -- upvalues: v53 (copy)
    v402 = v402 or function() --[[ Line: 2081 ]]
        return true;
    end;
    return v53._new(debug.traceback(nil, 2), function(v403, _, v405) --[[ Line: 2085 ]]
        -- upvalues: v401 (copy), v402 (ref)
        local v406 = nil;
        local v407 = false;
        local function v408() --[[ Line: 2089 ]] --[[ Name: disconnect ]]
            -- upvalues: v406 (ref)
            v406:Disconnect();
            v406 = nil;
        end;
        v406 = v401:Connect(function(...) --[[ Line: 2098 ]]
            -- upvalues: v402 (ref), v403 (copy), v406 (ref), v407 (ref)
            local v409 = v402(...);
            if v409 == true then
                v403(...);
                if v406 then
                    v406:Disconnect();
                    v406 = nil;
                    return;
                else
                    v407 = true;
                    return;
                end;
            else
                if type(v409) ~= "boolean" then
                    error("Promise.fromEvent predicate should always return a boolean");
                end;
                return;
            end;
        end);
        if v407 and v406 then
            return v408();
        else
            v405(v408);
            return;
        end;
    end);
end;
v53.onUnhandledRejection = function(v410) --[[ Line: 2132 ]] --[[ Name: onUnhandledRejection ]]
    -- upvalues: v53 (copy)
    table.insert(v53._unhandledRejectionCallbacks, v410);
    return function() --[[ Line: 2135 ]]
        -- upvalues: v53 (ref), v410 (copy)
        local v411 = table.find(v53._unhandledRejectionCallbacks, v410);
        if v411 then
            table.remove(v53._unhandledRejectionCallbacks, v411);
        end;
    end;
end;
return v53;