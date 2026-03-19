local v0 = {
    __mode = "k"
};
local function _(v1) --[[ Line: 10 ]] --[[ Name: isCallable ]]
    if type(v1) == "function" then
        return true;
    else
        if type(v1) == "table" then
            local v2 = getmetatable(v1);
            if v2 and type((rawget(v2, "__call"))) == "function" then
                return true;
            end;
        end;
        return false;
    end;
end;
local function v11(v4, v5) --[[ Line: 28 ]] --[[ Name: makeEnum ]]
    local v6 = {};
    for _, v8 in ipairs(v5) do
        v6[v8] = v8;
    end;
    return (setmetatable(v6, {
        __index = function(_, v10) --[[ Line: 36 ]] --[[ Name: __index ]]
            -- upvalues: v4 (copy)
            error(string.format("%s is not in %s!", v10, v4), 2);
        end, 
        __newindex = function() --[[ Line: 39 ]] --[[ Name: __newindex ]]
            -- upvalues: v4 (copy)
            error(string.format("Creating new members in %s is not allowed!", v4), 2);
        end
    }));
end;
local v12 = nil;
v12 = {
    Kind = v11("Promise.Error.Kind", {
        "ExecutionError", 
        "AlreadyCancelled", 
        "NotResolvedInTime", 
        "TimedOut"
    })
};
v12.__index = v12;
v12.new = function(v13, v14) --[[ Line: 64 ]] --[[ Name: new ]]
    -- upvalues: v12 (ref)
    v13 = v13 or {};
    return (setmetatable({
        error = tostring(v13.error) or "[This error has no error text.]", 
        trace = v13.trace, 
        context = v13.context, 
        kind = v13.kind, 
        parent = v14, 
        createdTick = os.clock(), 
        createdTrace = debug.traceback()
    }, v12));
end;
v12.is = function(v15) --[[ Line: 77 ]] --[[ Name: is ]]
    if type(v15) == "table" then
        local v16 = getmetatable(v15);
        if type(v16) == "table" then
            local v17 = false;
            if rawget(v15, "error") ~= nil then
                v17 = type((rawget(v16, "extend"))) == "function";
            end;
            return v17;
        end;
    end;
    return false;
end;
v12.isKind = function(v18, v19) --[[ Line: 89 ]] --[[ Name: isKind ]]
    -- upvalues: v12 (ref)
    assert(v19 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil");
    return v12.is(v18) and v18.kind == v19;
end;
v12.extend = function(v20, v21) --[[ Line: 95 ]] --[[ Name: extend ]]
    -- upvalues: v12 (ref)
    v21 = v21 or {};
    v21.kind = v21.kind or v20.kind;
    return v12.new(v21, v20);
end;
v12.getErrorChain = function(v22) --[[ Line: 103 ]] --[[ Name: getErrorChain ]]
    local v23 = {
        v22
    };
    while v23[#v23].parent do
        table.insert(v23, v23[#v23].parent);
    end;
    return v23;
end;
v12.__tostring = function(v24) --[[ Line: 113 ]] --[[ Name: __tostring ]]
    local v25 = {
        string.format("-- Promise.Error(%s) --", v24.kind or "?")
    };
    for _, v27 in ipairs(v24:getErrorChain()) do
        table.insert(v25, table.concat({
            v27.trace or v27.error, 
            v27.context
        }, "\n"));
    end;
    return table.concat(v25, "\n");
end;
local function v28(...) --[[ Line: 137 ]] --[[ Name: pack ]]
    return select("#", ...), {
        ...
    };
end;
local function v30(v29, ...) --[[ Line: 144 ]] --[[ Name: packResult ]]
    return v29, select("#", ...), {
        ...
    };
end;
local function _(v31) --[[ Line: 148 ]] --[[ Name: makeErrorHandler ]]
    -- upvalues: v12 (ref)
    assert(v31 ~= nil, "traceback is nil");
    return function(v32) --[[ Line: 151 ]]
        -- upvalues: v12 (ref), v31 (copy)
        if type(v32) == "table" then
            return v32;
        else
            return v12.new({
                error = v32, 
                kind = v12.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v32), 2), 
                context = "Promise created at:\n\n" .. v31
            });
        end;
    end;
end;
local function v40(v34, v35, ...) --[[ Line: 171 ]] --[[ Name: runExecutor ]]
    -- upvalues: v30 (copy), v12 (ref)
    local l_v30_0 = v30;
    local l_xpcall_0 = xpcall;
    local l_v35_0 = v35;
    assert(v34 ~= nil, "traceback is nil");
    return l_v30_0(l_xpcall_0(l_v35_0, function(v39) --[[ Line: 151 ]]
        -- upvalues: v12 (ref), v34 (copy)
        if type(v39) == "table" then
            return v39;
        else
            return v12.new({
                error = v39, 
                kind = v12.Kind.ExecutionError, 
                trace = debug.traceback(tostring(v39), 2), 
                context = "Promise created at:\n\n" .. v34
            });
        end;
    end, ...));
end;
local function _(v41, v42, v43, v44) --[[ Line: 179 ]] --[[ Name: createAdvancer ]]
    -- upvalues: v40 (copy)
    return function(...) --[[ Line: 180 ]]
        -- upvalues: v40 (ref), v41 (copy), v42 (copy), v43 (copy), v44 (copy)
        local v45, v46, v47 = v40(v41, v42, ...);
        if v45 then
            v43(unpack(v47, 1, v46));
            return;
        else
            v44(v47[1]);
            return;
        end;
    end;
end;
local function _(v49) --[[ Line: 191 ]] --[[ Name: isEmpty ]]
    return next(v49) == nil;
end;
local v51 = {
    Error = v12, 
    Status = v11("Promise.Status", {
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
v51.__index = v51.prototype;
v51._new = function(v52, v53, v54) --[[ Line: 230 ]] --[[ Name: _new ]]
    -- upvalues: v51 (copy), v0 (copy), v40 (copy)
    if v54 ~= nil and not v51.is(v54) then
        error("Argument #2 to Promise.new must be a promise or nil", 2);
    end;
    local v55 = {
        _thread = nil, 
        _source = v52, 
        _status = v51.Status.Started, 
        _values = nil, 
        _valuesLength = -1, 
        _unhandledRejection = true, 
        _queuedResolve = {}, 
        _queuedReject = {}, 
        _queuedFinally = {}, 
        _cancellationHook = nil, 
        _parent = v54, 
        _consumers = setmetatable({}, v0)
    };
    if v54 and v54._status == v51.Status.Started then
        v54._consumers[v55] = true;
    end;
    setmetatable(v55, v51);
    local function v56(...) --[[ Line: 278 ]] --[[ Name: resolve ]]
        -- upvalues: v55 (copy)
        v55:_resolve(...);
    end;
    local function v57(...) --[[ Line: 282 ]] --[[ Name: reject ]]
        -- upvalues: v55 (copy)
        v55:_reject(...);
    end;
    local function v59(v58) --[[ Line: 286 ]] --[[ Name: onCancel ]]
        -- upvalues: v55 (copy), v51 (ref)
        if v58 then
            if v55._status == v51.Status.Cancelled then
                v58();
            else
                v55._cancellationHook = v58;
            end;
        end;
        return v55._status == v51.Status.Cancelled;
    end;
    v55._thread = coroutine.create(function() --[[ Line: 298 ]]
        -- upvalues: v40 (ref), v55 (copy), v53 (copy), v56 (copy), v57 (copy), v59 (copy)
        local v60, _, v62 = v40(v55._source, v53, v56, v57, v59);
        if not v60 then
            v57(v62[1]);
        end;
    end);
    task.spawn(v55._thread);
    return v55;
end;
v51.new = function(v63) --[[ Line: 349 ]] --[[ Name: new ]]
    -- upvalues: v51 (copy)
    return v51._new(debug.traceback(nil, 2), v63);
end;
v51.__tostring = function(v64) --[[ Line: 353 ]] --[[ Name: __tostring ]]
    return string.format("Promise(%s)", v64._status);
end;
v51.defer = function(v65) --[[ Line: 375 ]] --[[ Name: defer ]]
    -- upvalues: v51 (copy), v40 (copy)
    local v66 = debug.traceback(nil, 2);
    local _ = nil;
    return (v51._new(v66, function(v68, v69, v70) --[[ Line: 378 ]]
        -- upvalues: v51 (ref), v40 (ref), v66 (copy), v65 (copy)
        local v71 = nil;
        v71 = v51._timeEvent:Connect(function() --[[ Line: 380 ]]
            -- upvalues: v71 (ref), v40 (ref), v66 (ref), v65 (ref), v68 (copy), v69 (copy), v70 (copy)
            v71:Disconnect();
            local v72, _, v74 = v40(v66, v65, v68, v69, v70);
            if not v72 then
                v69(v74[1]);
            end;
        end);
    end));
end;
v51.async = v51.defer;
v51.resolve = function(...) --[[ Line: 418 ]] --[[ Name: resolve ]]
    -- upvalues: v28 (copy), v51 (copy)
    local v75, v76 = v28(...);
    return v51._new(debug.traceback(nil, 2), function(v77) --[[ Line: 420 ]]
        -- upvalues: v76 (copy), v75 (copy)
        v77(unpack(v76, 1, v75));
    end);
end;
v51.reject = function(...) --[[ Line: 435 ]] --[[ Name: reject ]]
    -- upvalues: v28 (copy), v51 (copy)
    local v78, v79 = v28(...);
    return v51._new(debug.traceback(nil, 2), function(_, v81) --[[ Line: 437 ]]
        -- upvalues: v79 (copy), v78 (copy)
        v81(unpack(v79, 1, v78));
    end);
end;
v51._try = function(v82, v83, ...) --[[ Line: 446 ]] --[[ Name: _try ]]
    -- upvalues: v28 (copy), v51 (copy)
    local v84, v85 = v28(...);
    return v51._new(v82, function(v86) --[[ Line: 449 ]]
        -- upvalues: v83 (copy), v85 (copy), v84 (copy)
        v86(v83(unpack(v85, 1, v84)));
    end);
end;
v51.try = function(v87, ...) --[[ Line: 477 ]] --[[ Name: try ]]
    -- upvalues: v51 (copy)
    return v51._try(debug.traceback(nil, 2), v87, ...);
end;
v51._all = function(v88, v89, v90) --[[ Line: 486 ]] --[[ Name: _all ]]
    -- upvalues: v51 (copy)
    if type(v89) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.all"), 3);
    end;
    for v91, v92 in pairs(v89) do
        if not v51.is(v92) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(v91))), 3);
        end;
    end;
    if #v89 == 0 or v90 == 0 then
        return v51.resolve({});
    else
        return v51._new(v88, function(v93, v94, v95) --[[ Line: 504 ]]
            -- upvalues: v90 (copy), v89 (copy)
            local v96 = {};
            local v97 = {};
            local v98 = 0;
            local v99 = 0;
            local v100 = false;
            local function v103() --[[ Line: 515 ]] --[[ Name: cancel ]]
                -- upvalues: v97 (copy)
                for _, v102 in ipairs(v97) do
                    v102:cancel();
                end;
            end;
            local function v107(v104, ...) --[[ Line: 522 ]] --[[ Name: resolveOne ]]
                -- upvalues: v100 (ref), v98 (ref), v90 (ref), v96 (copy), v89 (ref), v93 (copy), v97 (copy)
                if v100 then
                    return;
                else
                    v98 = v98 + 1;
                    if v90 == nil then
                        v96[v104] = ...;
                    else
                        v96[v98] = ...;
                    end;
                    if v98 >= (v90 or #v89) then
                        v100 = true;
                        v93(v96);
                        for _, v106 in ipairs(v97) do
                            v106:cancel();
                        end;
                    end;
                    return;
                end;
            end;
            v95(v103);
            for v108, v109 in ipairs(v89) do
                v97[v108] = v109:andThen(function(...) --[[ Line: 547 ]]
                    -- upvalues: v107 (copy), v108 (copy)
                    v107(v108, ...);
                end, function(...) --[[ Line: 549 ]]
                    -- upvalues: v99 (ref), v90 (ref), v89 (ref), v97 (copy), v100 (ref), v94 (copy)
                    v99 = v99 + 1;
                    if v90 == nil or #v89 - v99 < v90 then
                        for _, v111 in ipairs(v97) do
                            v111:cancel();
                        end;
                        v100 = true;
                        v94(...);
                    end;
                end);
            end;
            if v100 then
                for _, v113 in ipairs(v97) do
                    v113:cancel();
                end;
            end;
        end);
    end;
end;
v51.all = function(...) --[[ Line: 591 ]] --[[ Name: all ]]
    -- upvalues: v51 (copy)
    local v114 = {
        ...
    };
    if type(v114[1]) == "table" and not v51.is(v114[1]) then
        v114 = v114[1];
    end;
    return v51._all(debug.traceback(nil, 2), v114);
end;
v51.fold = function(v115, v116, v117) --[[ Line: 628 ]] --[[ Name: fold ]]
    -- upvalues: v51 (copy)
    local v118 = false;
    assert(type(v115) == "table", "Bad argument #1 to Promise.fold: must be a table");
    local v119;
    if type(v116) == "function" then
        v119 = true;
    else
        if type(v116) == "table" then
            local v120 = getmetatable(v116);
            if v120 and type((rawget(v120, "__call"))) == "function" then
                v119 = true;
                v118 = true;
            end;
        end;
        if not v118 then
            v119 = false;
        end;
    end;
    v118 = false;
    assert(v119, "Bad argument #2 to Promise.fold: must be a function");
    local v121 = v51.resolve(v117);
    return v51.each(v115, function(v122, v123) --[[ Line: 633 ]]
        -- upvalues: v121 (ref), v116 (copy)
        v121 = v121:andThen(function(v124) --[[ Line: 634 ]]
            -- upvalues: v116 (ref), v122 (copy), v123 (copy)
            return v116(v124, v122, v123);
        end);
    end):andThen(function() --[[ Line: 637 ]]
        -- upvalues: v121 (ref)
        return v121;
    end);
end;
v51.some = function(v125, v126) --[[ Line: 661 ]] --[[ Name: some ]]
    -- upvalues: v51 (copy)
    assert(type(v126) == "number", "Bad argument #2 to Promise.some: must be a number");
    return v51._all(debug.traceback(nil, 2), v125, v126);
end;
v51.any = function(v127) --[[ Line: 685 ]] --[[ Name: any ]]
    -- upvalues: v51 (copy)
    return v51._all(debug.traceback(nil, 2), v127, 1):andThen(function(v128) --[[ Line: 686 ]]
        return v128[1];
    end);
end;
v51.allSettled = function(v129) --[[ Line: 707 ]] --[[ Name: allSettled ]]
    -- upvalues: v51 (copy)
    if type(v129) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2);
    end;
    for v130, v131 in pairs(v129) do
        if not v51.is(v131) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(v130))), 2);
        end;
    end;
    if #v129 == 0 then
        return v51.resolve({});
    else
        return v51._new(debug.traceback(nil, 2), function(v132, _, v134) --[[ Line: 725 ]]
            -- upvalues: v129 (copy)
            local v135 = {};
            local v136 = {};
            local v137 = 0;
            local function v139(v138, ...) --[[ Line: 735 ]] --[[ Name: resolveOne ]]
                -- upvalues: v137 (ref), v135 (copy), v129 (ref), v132 (copy)
                v137 = v137 + 1;
                v135[v138] = ...;
                if v137 >= #v129 then
                    v132(v135);
                end;
            end;
            v134(function() --[[ Line: 745 ]]
                -- upvalues: v136 (copy)
                for _, v141 in ipairs(v136) do
                    v141:cancel();
                end;
            end);
            for v142, v143 in ipairs(v129) do
                v136[v142] = v143:finally(function(...) --[[ Line: 754 ]]
                    -- upvalues: v139 (copy), v142 (copy)
                    v139(v142, ...);
                end);
            end;
        end);
    end;
end;
v51.race = function(v144) --[[ Line: 785 ]] --[[ Name: race ]]
    -- upvalues: v51 (copy)
    assert(type(v144) == "table", string.format("Please pass a list of promises to %s", "Promise.race"));
    for v145, v146 in pairs(v144) do
        assert(v51.is(v146), string.format("Non-promise value passed into %s at index %s", "Promise.race", (tostring(v145))));
    end;
    return v51._new(debug.traceback(nil, 2), function(v147, v148, v149) --[[ Line: 792 ]]
        -- upvalues: v144 (copy)
        local v150 = {};
        local v151 = false;
        local _ = function() --[[ Line: 796 ]] --[[ Name: cancel ]]
            -- upvalues: v150 (copy)
            for _, v153 in ipairs(v150) do
                v153:cancel();
            end;
        end;
        local _ = function(v155) --[[ Line: 802 ]] --[[ Name: finalize ]]
            -- upvalues: v150 (copy), v151 (ref)
            return function(...) --[[ Line: 803 ]]
                -- upvalues: v150 (ref), v151 (ref), v155 (copy)
                for _, v157 in ipairs(v150) do
                    v157:cancel();
                end;
                v151 = true;
                return v155(...);
            end;
        end;
        if v149(function(...) --[[ Line: 803 ]]
            -- upvalues: v150 (copy), v151 (ref), v148 (copy)
            for _, v160 in ipairs(v150) do
                v160:cancel();
            end;
            v151 = true;
            return v148(...);
        end) then
            return;
        else
            for v161, v162 in ipairs(v144) do
                v150[v161] = v162:andThen(function(...) --[[ Line: 803 ]]
                    -- upvalues: v150 (copy), v151 (ref), v147 (copy)
                    for _, v164 in ipairs(v150) do
                        v164:cancel();
                    end;
                    v151 = true;
                    return v147(...);
                end, function(...) --[[ Line: 803 ]]
                    -- upvalues: v150 (copy), v151 (ref), v148 (copy)
                    for _, v166 in ipairs(v150) do
                        v166:cancel();
                    end;
                    v151 = true;
                    return v148(...);
                end);
            end;
            if v151 then
                for _, v168 in ipairs(v150) do
                    v168:cancel();
                end;
            end;
            return;
        end;
    end);
end;
v51.each = function(v169, v170) --[[ Line: 880 ]] --[[ Name: each ]]
    -- upvalues: v51 (copy), v12 (ref)
    local v171 = false;
    assert(type(v169) == "table", string.format("Please pass a list of promises to %s", "Promise.each"));
    local v172;
    if type(v170) == "function" then
        v172 = true;
    else
        if type(v170) == "table" then
            local v173 = getmetatable(v170);
            if v173 and type((rawget(v173, "__call"))) == "function" then
                v172 = true;
                v171 = true;
            end;
        end;
        if not v171 then
            v172 = false;
        end;
    end;
    v171 = false;
    assert(v172, string.format("Please pass a handler function to %s!", "Promise.each"));
    return v51._new(debug.traceback(nil, 2), function(v174, v175, v176) --[[ Line: 884 ]]
        -- upvalues: v169 (copy), v51 (ref), v12 (ref), v170 (copy)
        local v177 = {};
        local v178 = {};
        local v179 = false;
        local _ = function() --[[ Line: 890 ]] --[[ Name: cancel ]]
            -- upvalues: v178 (copy)
            for _, v181 in ipairs(v178) do
                v181:cancel();
            end;
        end;
        v176(function() --[[ Line: 896 ]]
            -- upvalues: v179 (ref), v178 (copy)
            v179 = true;
            for _, v184 in ipairs(v178) do
                v184:cancel();
            end;
        end);
        local v185 = {};
        for v186, v187 in ipairs(v169) do
            if v51.is(v187) then
                if v187:getStatus() == v51.Status.Cancelled then
                    for _, v189 in ipairs(v178) do
                        v189:cancel();
                    end;
                    return v175(v12.new({
                        error = "Promise is cancelled", 
                        kind = v12.Kind.AlreadyCancelled, 
                        context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v186, v187._source)
                    }));
                elseif v187:getStatus() == v51.Status.Rejected then
                    for _, v191 in ipairs(v178) do
                        v191:cancel();
                    end;
                    return v175(select(2, v187:await()));
                else
                    local v192 = v187:andThen(function(...) --[[ Line: 929 ]]
                        return ...;
                    end);
                    table.insert(v178, v192);
                    v185[v186] = v192;
                end;
            else
                v185[v186] = v187;
            end;
        end;
        for v193, v194 in ipairs(v185) do
            if v51.is(v194) then
                local v195 = nil;
                local v196, v197 = v194:await();
                v195 = v196;
                v194 = v197;
                if not v195 then
                    for _, v199 in ipairs(v178) do
                        v199:cancel();
                    end;
                    return v175(v194);
                end;
            end;
            if v179 then
                return;
            else
                local v200 = v51.resolve(v170(v194, v193));
                table.insert(v178, v200);
                local v201, v202 = v200:await();
                if not v201 then
                    for _, v204 in ipairs(v178) do
                        v204:cancel();
                    end;
                    return v175(v202);
                else
                    v177[v193] = v202;
                end;
            end;
        end;
        v174(v177);
    end);
end;
v51.is = function(v205) --[[ Line: 979 ]] --[[ Name: is ]]
    -- upvalues: v51 (copy)
    local v206 = false;
    if type(v205) ~= "table" then
        return false;
    else
        local v207 = getmetatable(v205);
        if v207 == v51 then
            return true;
        elseif v207 == nil then
            local l_andThen_0 = v205.andThen;
            if type(l_andThen_0) == "function" then
                return true;
            else
                if type(l_andThen_0) == "table" then
                    local v209 = getmetatable(l_andThen_0);
                    if v209 and type((rawget(v209, "__call"))) == "function" then
                        return true;
                    end;
                end;
                return false;
            end;
        else
            if type(v207) == "table" and type((rawget(v207, "__index"))) == "table" then
                local v210 = rawget(rawget(v207, "__index"), "andThen");
                local v211;
                if type(v210) == "function" then
                    v211 = true;
                else
                    if type(v210) == "table" then
                        local v212 = getmetatable(v210);
                        if v212 and type((rawget(v212, "__call"))) == "function" then
                            v211 = true;
                            v206 = true;
                        end;
                    end;
                    if not v206 then
                        v211 = false;
                    end;
                end;
                v206 = false;
                if v211 then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v51.promisify = function(v213) --[[ Line: 1028 ]] --[[ Name: promisify ]]
    -- upvalues: v51 (copy)
    return function(...) --[[ Line: 1029 ]]
        -- upvalues: v51 (ref), v213 (copy)
        return v51._try(debug.traceback(nil, 2), v213, ...);
    end;
end;
local v214 = nil;
local v215 = nil;
do
    local l_v214_0, l_v215_0 = v214, v215;
    v51.delay = function(v218) --[[ Line: 1059 ]] --[[ Name: delay ]]
        -- upvalues: v51 (copy), l_v215_0 (ref), l_v214_0 (ref)
        assert(type(v218) == "number", "Bad argument #1 to Promise.delay, must be a number.");
        if v218 < 0.016666666666666666 or v218 == 1e999 then
            v218 = 0.016666666666666666;
        end;
        return v51._new(debug.traceback(nil, 2), function(v219, _, v221) --[[ Line: 1067 ]]
            -- upvalues: v51 (ref), v218 (ref), l_v215_0 (ref), l_v214_0 (ref)
            local v222 = v51._getTime();
            local v223 = v222 + v218;
            local v224 = {
                resolve = v219, 
                startTime = v222, 
                endTime = v223
            };
            if l_v215_0 == nil then
                l_v214_0 = v224;
                l_v215_0 = v51._timeEvent:Connect(function() --[[ Line: 1079 ]]
                    -- upvalues: v51 (ref), l_v214_0 (ref), l_v215_0 (ref)
                    local v225 = v51._getTime();
                    while l_v214_0 ~= nil and l_v214_0.endTime < v225 do
                        local l_l_v214_0_0 = l_v214_0;
                        l_v214_0 = l_l_v214_0_0.next;
                        if l_v214_0 == nil then
                            l_v215_0:Disconnect();
                            l_v215_0 = nil;
                        else
                            l_v214_0.previous = nil;
                        end;
                        l_l_v214_0_0.resolve(v51._getTime() - l_l_v214_0_0.startTime);
                    end;
                end);
            elseif l_v214_0.endTime < v223 then
                local l_l_v214_0_1 = l_v214_0;
                local l_next_0 = l_l_v214_0_1.next;
                while l_next_0 ~= nil and l_next_0.endTime < v223 do
                    l_l_v214_0_1 = l_next_0;
                    l_next_0 = l_l_v214_0_1.next;
                end;
                l_l_v214_0_1.next = v224;
                v224.previous = l_l_v214_0_1;
                if l_next_0 ~= nil then
                    v224.next = l_next_0;
                    l_next_0.previous = v224;
                end;
            else
                v224.next = l_v214_0;
                l_v214_0.previous = v224;
                l_v214_0 = v224;
            end;
            v221(function() --[[ Line: 1124 ]]
                -- upvalues: v224 (copy), l_v214_0 (ref), l_v215_0 (ref)
                local l_next_1 = v224.next;
                if l_v214_0 == v224 then
                    if l_next_1 == nil then
                        l_v215_0:Disconnect();
                        l_v215_0 = nil;
                    else
                        l_next_1.previous = nil;
                    end;
                    l_v214_0 = l_next_1;
                    return;
                else
                    local l_previous_0 = v224.previous;
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
v214 = function(v231, v232, v233) --[[ Line: 1188 ]] --[[ Name: timeout ]]
    -- upvalues: v51 (copy), v12 (ref)
    local v234 = debug.traceback(nil, 2);
    return v51.race({
        v51.delay(v232):andThen(function() --[[ Line: 1192 ]]
            -- upvalues: v51 (ref), v233 (copy), v12 (ref), v232 (copy), v234 (copy)
            return v51.reject(v233 == nil and v12.new({
                kind = v12.Kind.TimedOut, 
                error = "Timed out", 
                context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", v232, v234)
            }) or v233);
        end), 
        v231
    });
end;
v51.prototype.timeout = v214;
v51.prototype.getStatus = function(v235) --[[ Line: 1212 ]] --[[ Name: getStatus ]]
    return v235._status;
end;
v214 = function(v236, v237, v238, v239) --[[ Line: 1221 ]] --[[ Name: _andThen ]]
    -- upvalues: v51 (copy), v40 (copy), v12 (ref)
    v236._unhandledRejection = false;
    return v51._new(v237, function(v240, v241) --[[ Line: 1225 ]]
        -- upvalues: v238 (copy), v237 (copy), v40 (ref), v239 (copy), v236 (copy), v51 (ref), v12 (ref)
        local l_v240_0 = v240;
        if v238 then
            local l_v237_0 = v237;
            local l_v238_0 = v238;
            local l_l_v237_0_0 = l_v237_0 --[[ copy: 3 -> 6 ]];
            local l_l_v238_0_0 = l_v238_0 --[[ copy: 4 -> 7 ]];
            l_v240_0 = function(...) --[[ Line: 180 ]]
                -- upvalues: v40 (ref), l_l_v237_0_0 (copy), l_l_v238_0_0 (copy), v240 (copy), v241 (copy)
                local v247, v248, v249 = v40(l_l_v237_0_0, l_l_v238_0_0, ...);
                if v247 then
                    v240(unpack(v249, 1, v248));
                    return;
                else
                    v241(v249[1]);
                    return;
                end;
            end;
        end;
        local l_v241_0 = v241;
        if v239 then
            local l_v237_1 = v237;
            local l_v239_0 = v239;
            l_v241_0 = function(...) --[[ Line: 180 ]]
                -- upvalues: v40 (ref), l_v237_1 (copy), l_v239_0 (copy), v240 (copy), v241 (copy)
                local v253, v254, v255 = v40(l_v237_1, l_v239_0, ...);
                if v253 then
                    v240(unpack(v255, 1, v254));
                    return;
                else
                    v241(v255[1]);
                    return;
                end;
            end;
        end;
        if v236._status == v51.Status.Started then
            table.insert(v236._queuedResolve, l_v240_0);
            table.insert(v236._queuedReject, l_v241_0);
            return;
        elseif v236._status == v51.Status.Resolved then
            l_v240_0(unpack(v236._values, 1, v236._valuesLength));
            return;
        elseif v236._status == v51.Status.Rejected then
            l_v241_0(unpack(v236._values, 1, v236._valuesLength));
            return;
        else
            if v236._status == v51.Status.Cancelled then
                v241(v12.new({
                    error = "Promise is cancelled", 
                    kind = v12.Kind.AlreadyCancelled, 
                    context = "Promise created at\n\n" .. v237
                }));
            end;
            return;
        end;
    end, v236);
end;
v51.prototype._andThen = v214;
v51.prototype.andThen = function(v256, v257, v258) --[[ Line: 1282 ]] --[[ Name: andThen ]]
    local v259 = false;
    local v260 = false;
    local v261 = true;
    if v257 ~= nil then
        if type(v257) == "function" then
            v261 = true;
        else
            if type(v257) == "table" then
                local v262 = getmetatable(v257);
                if v262 and type((rawget(v262, "__call"))) == "function" then
                    v261 = true;
                    v259 = true;
                end;
            end;
            if not v259 then
                v261 = false;
            end;
        end;
    end;
    v259 = false;
    assert(v261, string.format("Please pass a handler function to %s!", "Promise:andThen"));
    v261 = true;
    if v258 ~= nil then
        if type(v258) == "function" then
            v261 = true;
        else
            if type(v258) == "table" then
                local v263 = getmetatable(v258);
                if v263 and type((rawget(v263, "__call"))) == "function" then
                    v261 = true;
                    v260 = true;
                end;
            end;
            if not v260 then
                v261 = false;
            end;
        end;
    end;
    v260 = false;
    assert(v261, string.format("Please pass a handler function to %s!", "Promise:andThen"));
    return v256:_andThen(debug.traceback(nil, 2), v257, v258);
end;
v51.prototype.andThenAsync = function(v264, v265, v266) --[[ Line: 1310 ]] --[[ Name: andThenAsync ]]
    -- upvalues: v28 (copy), v51 (copy)
    local v267 = false;
    local v268 = false;
    local v269 = true;
    if v265 ~= nil then
        if type(v265) == "function" then
            v269 = true;
        else
            if type(v265) == "table" then
                local v270 = getmetatable(v265);
                if v270 and type((rawget(v270, "__call"))) == "function" then
                    v269 = true;
                    v267 = true;
                end;
            end;
            if not v267 then
                v269 = false;
            end;
        end;
    end;
    v267 = false;
    assert(v269, string.format("Please pass a handler function to %s!", "Promise:andThenAsync"));
    v269 = true;
    if v266 ~= nil then
        if type(v266) == "function" then
            v269 = true;
        else
            if type(v266) == "table" then
                local v271 = getmetatable(v266);
                if v271 and type((rawget(v271, "__call"))) == "function" then
                    v269 = true;
                    v268 = true;
                end;
            end;
            if not v268 then
                v269 = false;
            end;
        end;
    end;
    v268 = false;
    assert(v269, string.format("Please pass a handler function to %s!", "Promise:andThenAsync"));
    return v264:_andThen(debug.traceback(nil, 2), function(...) --[[ Line: 1317 ]]
        -- upvalues: v28 (ref), v51 (ref)
        local v272, v273 = v28(...);
        return v51.defer(function(v274) --[[ Line: 1319 ]]
            -- upvalues: v273 (copy), v272 (copy)
            v274(unpack(v273, 1, v272));
        end);
    end, function(...) --[[ Line: 1323 ]]
        -- upvalues: v28 (ref), v51 (ref)
        local v275, v276 = v28(...);
        return v51.defer(function(_, v278) --[[ Line: 1325 ]]
            -- upvalues: v276 (copy), v275 (copy)
            v278(unpack(v276, 1, v275));
        end);
    end):andThen(v265, v266);
end;
v51.prototype.catch = function(v279, v280) --[[ Line: 1352 ]] --[[ Name: catch ]]
    local v281 = false;
    local v282 = true;
    if v280 ~= nil then
        if type(v280) == "function" then
            v282 = true;
        else
            if type(v280) == "table" then
                local v283 = getmetatable(v280);
                if v283 and type((rawget(v283, "__call"))) == "function" then
                    v282 = true;
                    v281 = true;
                end;
            end;
            if not v281 then
                v282 = false;
            end;
        end;
    end;
    v281 = false;
    assert(v282, string.format("Please pass a handler function to %s!", "Promise:catch"));
    return v279:_andThen(debug.traceback(nil, 2), nil, v280);
end;
v51.prototype.tap = function(v284, v285) --[[ Line: 1373 ]] --[[ Name: tap ]]
    -- upvalues: v51 (copy), v28 (copy)
    local v286 = false;
    local v287;
    if type(v285) == "function" then
        v287 = true;
    else
        if type(v285) == "table" then
            local v288 = getmetatable(v285);
            if v288 and type((rawget(v288, "__call"))) == "function" then
                v287 = true;
                v286 = true;
            end;
        end;
        if not v286 then
            v287 = false;
        end;
    end;
    v286 = false;
    assert(v287, string.format("Please pass a handler function to %s!", "Promise:tap"));
    return v284:_andThen(debug.traceback(nil, 2), function(...) --[[ Line: 1375 ]]
        -- upvalues: v285 (copy), v51 (ref), v28 (ref)
        local v289 = v285(...);
        if v51.is(v289) then
            local v290, v291 = v28(...);
            return v289:andThen(function() --[[ Line: 1380 ]]
                -- upvalues: v291 (copy), v290 (copy)
                return unpack(v291, 1, v290);
            end);
        else
            return ...;
        end;
    end);
end;
v51.prototype.andThenCall = function(v292, v293, ...) --[[ Line: 1408 ]] --[[ Name: andThenCall ]]
    -- upvalues: v28 (copy)
    local v294 = false;
    local v295;
    if type(v293) == "function" then
        v295 = true;
    else
        if type(v293) == "table" then
            local v296 = getmetatable(v293);
            if v296 and type((rawget(v296, "__call"))) == "function" then
                v295 = true;
                v294 = true;
            end;
        end;
        if not v294 then
            v295 = false;
        end;
    end;
    v294 = false;
    assert(v295, string.format("Please pass a handler function to %s!", "Promise:andThenCall"));
    local v297;
    v297, v295 = v28(...);
    return v292:_andThen(debug.traceback(nil, 2), function() --[[ Line: 1411 ]]
        -- upvalues: v293 (copy), v295 (copy), v297 (copy)
        return v293(unpack(v295, 1, v297));
    end);
end;
v51.prototype.andThenReturn = function(v298, ...) --[[ Line: 1438 ]] --[[ Name: andThenReturn ]]
    -- upvalues: v28 (copy)
    local v299, v300 = v28(...);
    return v298:_andThen(debug.traceback(nil, 2), function() --[[ Line: 1440 ]]
        -- upvalues: v300 (copy), v299 (copy)
        return unpack(v300, 1, v299);
    end);
end;
v51.prototype.cancel = function(v301) --[[ Line: 1456 ]] --[[ Name: cancel ]]
    -- upvalues: v51 (copy)
    if v301._status ~= v51.Status.Started then
        return;
    else
        v301._status = v51.Status.Cancelled;
        if v301._cancellationHook then
            v301._cancellationHook();
        end;
        coroutine.close(v301._thread);
        if v301._parent then
            v301._parent:_consumerCancelled(v301);
        end;
        for v302 in pairs(v301._consumers) do
            v302:cancel();
        end;
        v301:_finalize();
        return;
    end;
end;
v51.prototype._consumerCancelled = function(v303, v304) --[[ Line: 1484 ]] --[[ Name: _consumerCancelled ]]
    -- upvalues: v51 (copy)
    if v303._status ~= v51.Status.Started then
        return;
    else
        v303._consumers[v304] = nil;
        if next(v303._consumers) == nil then
            v303:cancel();
        end;
        return;
    end;
end;
v51.prototype._finally = function(v305, v306, v307, v308) --[[ Line: 1500 ]] --[[ Name: _finally ]]
    -- upvalues: v51 (copy), v40 (copy)
    if not v308 then
        v305._unhandledRejection = false;
    end;
    return v51._new(v306, function(v309, v310) --[[ Line: 1506 ]]
        -- upvalues: v307 (copy), v306 (copy), v40 (ref), v308 (copy), v305 (copy), v51 (ref)
        local l_v309_0 = v309;
        if v307 then
            local l_v306_0 = v306;
            local l_v307_0 = v307;
            local l_l_v306_0_0 = l_v306_0 --[[ copy: 3 -> 5 ]];
            l_v309_0 = function(...) --[[ Line: 180 ]]
                -- upvalues: v40 (ref), l_l_v306_0_0 (copy), l_v307_0 (copy), v309 (copy), v310 (copy)
                local v315, v316, v317 = v40(l_l_v306_0_0, l_v307_0, ...);
                if v315 then
                    v309(unpack(v317, 1, v316));
                    return;
                else
                    v310(v317[1]);
                    return;
                end;
            end;
        end;
        if v308 then
            local l_l_v309_0_0 = l_v309_0;
            l_v309_0 = function(...) --[[ Line: 1514 ]]
                -- upvalues: v305 (ref), v51 (ref), v309 (copy), l_l_v309_0_0 (copy)
                if v305._status == v51.Status.Rejected then
                    return v309(v305);
                else
                    return l_l_v309_0_0(...);
                end;
            end;
        end;
        if v305._status == v51.Status.Started then
            table.insert(v305._queuedFinally, l_v309_0);
            return;
        else
            l_v309_0(v305._status);
            return;
        end;
    end, v305);
end;
v51.prototype.finally = function(v319, v320) --[[ Line: 1582 ]] --[[ Name: finally ]]
    local v321 = false;
    local v322 = true;
    if v320 ~= nil then
        if type(v320) == "function" then
            v322 = true;
        else
            if type(v320) == "table" then
                local v323 = getmetatable(v320);
                if v323 and type((rawget(v323, "__call"))) == "function" then
                    v322 = true;
                    v321 = true;
                end;
            end;
            if not v321 then
                v322 = false;
            end;
        end;
    end;
    v321 = false;
    assert(v322, string.format("Please pass a handler function to %s!", "Promise:finally"));
    return v319:_finally(debug.traceback(nil, 2), v320);
end;
v51.prototype.finallyCall = function(v324, v325, ...) --[[ Line: 1596 ]] --[[ Name: finallyCall ]]
    -- upvalues: v28 (copy)
    local v326 = false;
    local v327;
    if type(v325) == "function" then
        v327 = true;
    else
        if type(v325) == "table" then
            local v328 = getmetatable(v325);
            if v328 and type((rawget(v328, "__call"))) == "function" then
                v327 = true;
                v326 = true;
            end;
        end;
        if not v326 then
            v327 = false;
        end;
    end;
    v326 = false;
    assert(v327, string.format("Please pass a handler function to %s!", "Promise:finallyCall"));
    local v329;
    v329, v327 = v28(...);
    return v324:_finally(debug.traceback(nil, 2), function() --[[ Line: 1599 ]]
        -- upvalues: v325 (copy), v327 (copy), v329 (copy)
        return v325(unpack(v327, 1, v329));
    end);
end;
v51.prototype.finallyReturn = function(v330, ...) --[[ Line: 1622 ]] --[[ Name: finallyReturn ]]
    -- upvalues: v28 (copy)
    local v331, v332 = v28(...);
    return v330:_finally(debug.traceback(nil, 2), function() --[[ Line: 1624 ]]
        -- upvalues: v332 (copy), v331 (copy)
        return unpack(v332, 1, v331);
    end);
end;
v51.prototype.done = function(v333, v334) --[[ Line: 1632 ]] --[[ Name: done ]]
    local v335 = false;
    local v336 = true;
    if v334 ~= nil then
        if type(v334) == "function" then
            v336 = true;
        else
            if type(v334) == "table" then
                local v337 = getmetatable(v334);
                if v337 and type((rawget(v337, "__call"))) == "function" then
                    v336 = true;
                    v335 = true;
                end;
            end;
            if not v335 then
                v336 = false;
            end;
        end;
    end;
    v335 = false;
    assert(v336, string.format("Please pass a handler function to %s!", "Promise:done"));
    return v333:_finally(debug.traceback(nil, 2), v334, true);
end;
v51.prototype.doneCall = function(v338, v339, ...) --[[ Line: 1643 ]] --[[ Name: doneCall ]]
    -- upvalues: v28 (copy)
    local v340 = false;
    local v341;
    if type(v339) == "function" then
        v341 = true;
    else
        if type(v339) == "table" then
            local v342 = getmetatable(v339);
            if v342 and type((rawget(v342, "__call"))) == "function" then
                v341 = true;
                v340 = true;
            end;
        end;
        if not v340 then
            v341 = false;
        end;
    end;
    v340 = false;
    assert(v341, string.format("Please pass a handler function to %s!", "Promise:doneCall"));
    local v343;
    v343, v341 = v28(...);
    return v338:_finally(debug.traceback(nil, 2), function() --[[ Line: 1646 ]]
        -- upvalues: v339 (copy), v341 (copy), v343 (copy)
        return v339(unpack(v341, 1, v343));
    end, true);
end;
v51.prototype.doneReturn = function(v344, ...) --[[ Line: 1654 ]] --[[ Name: doneReturn ]]
    -- upvalues: v28 (copy)
    local v345, v346 = v28(...);
    return v344:_finally(debug.traceback(nil, 2), function() --[[ Line: 1656 ]]
        -- upvalues: v346 (copy), v345 (copy)
        return unpack(v346, 1, v345);
    end, true);
end;
v51.prototype.awaitStatus = function(v347) --[[ Line: 1668 ]] --[[ Name: awaitStatus ]]
    -- upvalues: v51 (copy)
    v347._unhandledRejection = false;
    if v347._status == v51.Status.Started then
        local v348 = coroutine.running();
        v347:finally(function() --[[ Line: 1674 ]]
            -- upvalues: v348 (copy)
            task.spawn(v348);
        end);
        coroutine.yield();
    end;
    if v347._status == v51.Status.Resolved then
        return v347._status, unpack(v347._values, 1, v347._valuesLength);
    elseif v347._status == v51.Status.Rejected then
        return v347._status, unpack(v347._values, 1, v347._valuesLength);
    else
        return v347._status;
    end;
end;
v214 = function(v349, ...) --[[ Line: 1690 ]] --[[ Name: awaitHelper ]]
    -- upvalues: v51 (copy)
    return v349 == v51.Status.Resolved, ...;
end;
v51.prototype.await = function(v350) --[[ Line: 1715 ]] --[[ Name: await ]]
    -- upvalues: v214 (copy)
    return v214(v350:awaitStatus());
end;
v215 = function(v351, ...) --[[ Line: 1719 ]] --[[ Name: expectHelper ]]
    -- upvalues: v51 (copy)
    if v351 ~= v51.Status.Resolved then
        error(... == nil and "Expected Promise rejected with no value." or ..., 3);
    end;
    return ...;
end;
v51.prototype.expect = function(v352) --[[ Line: 1752 ]] --[[ Name: expect ]]
    -- upvalues: v215 (copy)
    return v215(v352:awaitStatus());
end;
v51.prototype.awaitValue = v51.prototype.expect;
v51.prototype._unwrap = function(v353) --[[ Line: 1766 ]] --[[ Name: _unwrap ]]
    -- upvalues: v51 (copy)
    if v353._status == v51.Status.Started then
        error("Promise has not resolved or rejected.", 2);
    end;
    return v353._status == v51.Status.Resolved, unpack(v353._values, 1, v353._valuesLength);
end;
local function v363(v354, ...) --[[ Line: 1776 ]] --[[ Name: _resolve ]]
    -- upvalues: v51 (copy), v12 (ref), v28 (copy)
    if v354._status ~= v51.Status.Started then
        if v51.is((...)) then
            (...):_consumerCancelled(v354);
        end;
        return;
    elseif v51.is((...)) then
        if select("#", ...) > 1 then
            local v355 = string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", v354._source);
            warn(v355);
        end;
        local v356 = ...;
        local v358 = v356:andThen(function(...) --[[ Line: 1797 ]]
            -- upvalues: v354 (copy)
            v354:_resolve(...);
        end, function(...) --[[ Line: 1799 ]]
            -- upvalues: v356 (copy), v12 (ref), v354 (copy)
            local v357 = v356._values[1];
            if v356._error then
                v357 = v12.new({
                    error = v356._error, 
                    kind = v12.Kind.ExecutionError, 
                    context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
                });
            end;
            if v12.isKind(v357, v12.Kind.ExecutionError) then
                return v354:_reject(v357:extend({
                    error = "This Promise was chained to a Promise that errored.", 
                    trace = "", 
                    context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", v354._source)
                }));
            else
                v354:_reject(...);
                return;
            end;
        end);
        if v358._status == v51.Status.Cancelled then
            v354:cancel();
            return;
        else
            if v358._status == v51.Status.Started then
                v354._parent = v358;
                v358._consumers[v354] = true;
            end;
            return;
        end;
    else
        v354._status = v51.Status.Resolved;
        local v359, v360 = v28(...);
        v354._valuesLength = v359;
        v354._values = v360;
        for _, v362 in ipairs(v354._queuedResolve) do
            coroutine.wrap(v362)(...);
        end;
        v354:_finalize();
        return;
    end;
end;
v51.prototype._resolve = v363;
v51.prototype._reject = function(v364, ...) --[[ Line: 1847 ]] --[[ Name: _reject ]]
    -- upvalues: v51 (copy), v28 (copy)
    if v364._status ~= v51.Status.Started then
        return;
    else
        v364._status = v51.Status.Rejected;
        local v365, v366 = v28(...);
        v364._valuesLength = v365;
        v364._values = v366;
        v366 = v364._queuedReject;
        if not (next(v366) == nil) then
            for _, v368 in ipairs(v364._queuedReject) do
                coroutine.wrap(v368)(...);
            end;
        else
            v365 = tostring((...));
            coroutine.wrap(function() --[[ Line: 1869 ]]
                -- upvalues: v51 (ref), v364 (copy), v365 (copy)
                v51._timeEvent:Wait();
                if not v364._unhandledRejection then
                    return;
                else
                    local v369 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", v365, v364._source);
                    for _, v371 in ipairs(v51._unhandledRejectionCallbacks) do
                        task.spawn(v371, v364, unpack(v364._values, 1, v364._valuesLength));
                    end;
                    if v51.TEST then
                        return;
                    else
                        warn(v369);
                        return;
                    end;
                end;
            end)();
        end;
        v364:_finalize();
        return;
    end;
end;
v51.prototype._finalize = function(v372) --[[ Line: 1901 ]] --[[ Name: _finalize ]]
    -- upvalues: v51 (copy)
    for _, v374 in ipairs(v372._queuedFinally) do
        coroutine.wrap(v374)(v372._status);
    end;
    v372._queuedFinally = nil;
    v372._queuedReject = nil;
    v372._queuedResolve = nil;
    if not v51.TEST then
        v372._parent = nil;
        v372._consumers = nil;
    end;
    task.defer(coroutine.close, v372._thread);
end;
v363 = function(v375, v376) --[[ Line: 1938 ]] --[[ Name: now ]]
    -- upvalues: v51 (copy), v12 (ref)
    local v377 = debug.traceback(nil, 2);
    if v375._status == v51.Status.Resolved then
        return v375:_andThen(v377, function(...) --[[ Line: 1941 ]]
            return ...;
        end);
    else
        return v51.reject(v376 == nil and v12.new({
            kind = v12.Kind.NotResolvedInTime, 
            error = "This Promise was not resolved in time for :now()", 
            context = ":now() was called at:\n\n" .. v377
        }) or v376);
    end;
end;
v51.prototype.now = v363;
v51.retry = function(v378, v379, ...) --[[ Line: 1983 ]] --[[ Name: retry ]]
    -- upvalues: v51 (copy)
    local v380 = false;
    local v381;
    if type(v378) == "function" then
        v381 = true;
    else
        if type(v378) == "table" then
            local v382 = getmetatable(v378);
            if v382 and type((rawget(v382, "__call"))) == "function" then
                v381 = true;
                v380 = true;
            end;
        end;
        if not v380 then
            v381 = false;
        end;
    end;
    v380 = false;
    assert(v381, "Parameter #1 to Promise.retry must be a function");
    assert(type(v379) == "number", "Parameter #2 to Promise.retry must be a number");
    local v383 = {
        ...
    };
    v381 = select("#", ...);
    return v51.resolve(v378(...)):catch(function(...) --[[ Line: 1989 ]]
        -- upvalues: v379 (copy), v51 (ref), v378 (copy), v383 (copy), v381 (copy)
        if v379 > 0 then
            return v51.retry(v378, v379 - 1, unpack(v383, 1, v381));
        else
            return v51.reject(...);
        end;
    end);
end;
v51.retryWithDelay = function(v384, v385, v386, ...) --[[ Line: 2011 ]] --[[ Name: retryWithDelay ]]
    -- upvalues: v51 (copy)
    local v387 = false;
    local v388;
    if type(v384) == "function" then
        v388 = true;
    else
        if type(v384) == "table" then
            local v389 = getmetatable(v384);
            if v389 and type((rawget(v389, "__call"))) == "function" then
                v388 = true;
                v387 = true;
            end;
        end;
        if not v387 then
            v388 = false;
        end;
    end;
    v387 = false;
    assert(v388, "Parameter #1 to Promise.retry must be a function");
    assert(type(v385) == "number", "Parameter #2 (times) to Promise.retry must be a number");
    assert(type(v386) == "number", "Parameter #3 (seconds) to Promise.retry must be a number");
    local v390 = {
        ...
    };
    v388 = select("#", ...);
    return v51.resolve(v384(...)):catch(function(...) --[[ Line: 2018 ]]
        -- upvalues: v385 (copy), v51 (ref), v386 (copy), v384 (copy), v390 (copy), v388 (copy)
        if v385 > 0 then
            v51.delay(v386):await();
            return v51.retryWithDelay(v384, v385 - 1, v386, unpack(v390, 1, v388));
        else
            return v51.reject(...);
        end;
    end);
end;
v51.fromEvent = function(v391, v392) --[[ Line: 2053 ]] --[[ Name: fromEvent ]]
    -- upvalues: v51 (copy)
    v392 = v392 or function() --[[ Line: 2054 ]]
        return true;
    end;
    return v51._new(debug.traceback(nil, 2), function(v393, _, v395) --[[ Line: 2058 ]]
        -- upvalues: v391 (copy), v392 (ref)
        local v396 = nil;
        local v397 = false;
        local function v398() --[[ Line: 2062 ]] --[[ Name: disconnect ]]
            -- upvalues: v396 (ref)
            v396:Disconnect();
            v396 = nil;
        end;
        v396 = v391:Connect(function(...) --[[ Line: 2071 ]]
            -- upvalues: v392 (ref), v393 (copy), v396 (ref), v397 (ref)
            local v399 = v392(...);
            if v399 == true then
                v393(...);
                if v396 then
                    v396:Disconnect();
                    v396 = nil;
                    return;
                else
                    v397 = true;
                    return;
                end;
            else
                if type(v399) ~= "boolean" then
                    error("Promise.fromEvent predicate should always return a boolean");
                end;
                return;
            end;
        end);
        if v397 and v396 then
            return v398();
        else
            v395(v398);
            return;
        end;
    end);
end;
v51.onUnhandledRejection = function(v400) --[[ Line: 2105 ]] --[[ Name: onUnhandledRejection ]]
    -- upvalues: v51 (copy)
    table.insert(v51._unhandledRejectionCallbacks, v400);
    return function() --[[ Line: 2108 ]]
        -- upvalues: v51 (ref), v400 (copy)
        local v401 = table.find(v51._unhandledRejectionCallbacks, v400);
        if v401 then
            table.remove(v51._unhandledRejectionCallbacks, v401);
        end;
    end;
end;
return v51;