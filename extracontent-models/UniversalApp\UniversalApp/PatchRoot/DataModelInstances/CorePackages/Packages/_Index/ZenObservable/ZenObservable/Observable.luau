local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local v2 = require(l_Parent_0.Promise);
local l_instanceof_0 = v1.instanceof;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_setTimeout_0 = v1.setTimeout;
local l_Array_0 = v1.Array;
local l_Symbol_0 = v1.Symbol;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local function _(v13) --[[ Line: 29 ]] --[[ Name: isCallable ]]
    if typeof(v13) == "function" then
        return true;
    else
        if typeof(v13) == "table" then
            local v14 = getmetatable(v13);
            if v14 and rawget(v14, "__call") then
                return true;
            elseif v13._isMockFunction then
                return true;
            end;
        end;
        return false;
    end;
end;
local function _() --[[ Line: 45 ]] --[[ Name: hasSymbols ]]
    -- upvalues: l_Symbol_0 (copy)
    local v16 = false;
    if typeof(l_Symbol_0) == "table" then
        v16 = typeof(getmetatable(l_Symbol_0).__call) == "function";
    end;
    return v16;
end;
local function _(v18) --[[ Line: 50 ]] --[[ Name: hasSymbol ]]
    -- upvalues: l_Symbol_0 (copy), l_Boolean_0 (copy)
    local v19 = false;
    if typeof(l_Symbol_0) == "table" then
        v19 = typeof(getmetatable(l_Symbol_0).__call) == "function";
    end;
    if v19 then
        v19 = l_Boolean_0.toJSBoolean(l_Symbol_0[v18]);
    end;
    return v19;
end;
local function _(v21) --[[ Line: 54 ]] --[[ Name: getSymbol ]]
    -- upvalues: l_Symbol_0 (copy), l_Boolean_0 (copy)
    local v22 = false;
    if typeof(l_Symbol_0) == "table" then
        v22 = typeof(getmetatable(l_Symbol_0).__call) == "function";
    end;
    if v22 then
        v22 = l_Boolean_0.toJSBoolean(l_Symbol_0[v21]);
    end;
    if v22 then
        return l_Symbol_0[v21];
    else
        return "@@" .. v21;
    end;
end;
local v24 = false;
if typeof(l_Symbol_0) == "table" then
    v24 = typeof(getmetatable(l_Symbol_0).__call) == "function";
end;
if v24 then
    v24 = false;
    if typeof(l_Symbol_0) == "table" then
        v24 = typeof(getmetatable(l_Symbol_0).__call) == "function";
    end;
    if v24 then
        v24 = l_Boolean_0.toJSBoolean(l_Symbol_0.observable);
    end;
    if not v24 then
        l_Symbol_0.observable = l_Symbol_0("observable");
    end;
end;
local v25 = false;
if typeof(l_Symbol_0) == "table" then
    v25 = typeof(getmetatable(l_Symbol_0).__call) == "function";
end;
if v25 then
    v25 = l_Boolean_0.toJSBoolean(l_Symbol_0.iterator);
end;
v24 = if v25 then l_Symbol_0.iterator else "@@iterator";
local v26 = false;
if typeof(l_Symbol_0) == "table" then
    v26 = typeof(getmetatable(l_Symbol_0).__call) == "function";
end;
if v26 then
    v26 = l_Boolean_0.toJSBoolean(l_Symbol_0.observable);
end;
v25 = if v26 then l_Symbol_0.observable else "@@observable";
local v27 = false;
if typeof(l_Symbol_0) == "table" then
    v27 = typeof(getmetatable(l_Symbol_0).__call) == "function";
end;
if v27 then
    v27 = l_Boolean_0.toJSBoolean(l_Symbol_0.species);
end;
v26 = if v27 then l_Symbol_0.species else "@@species";
v27 = function(v28, v29) --[[ Line: 72 ]] --[[ Name: getMethod ]]
    -- upvalues: l_Error_0 (copy)
    local v30 = false;
    local v31 = v28[v29];
    if v31 == nil then
        return nil;
    else
        local v32;
        if typeof(v31) == "function" then
            v32 = true;
        else
            if typeof(v31) == "table" then
                local v33 = getmetatable(v31);
                if v33 and rawget(v33, "__call") then
                    v32 = true;
                    v30 = true;
                elseif v31._isMockFunction then
                    v32 = true;
                    v30 = true;
                end;
            end;
            if not v30 then
                if not v30 then
                    v32 = false;
                end;
            end;
        end;
        v30 = false;
        if not v32 then
            error(l_Error_0.new(tostring(v31) .. " is not a function"));
        end;
        return v31;
    end;
end;
local function _(v34) --[[ Line: 86 ]] --[[ Name: getSpecies ]]
    -- upvalues: v26 (copy), v9 (ref)
    local v35 = v34[v26];
    if v35 ~= nil then
        return v35;
    else
        return v9;
    end;
end;
local function _(v37) --[[ Line: 97 ]] --[[ Name: isObservable ]]
    -- upvalues: l_instanceof_0 (copy), v9 (ref)
    return l_instanceof_0(v37, v9);
end;
local v39 = nil;
v39 = setmetatable({}, {
    __call = function(_, v41) --[[ Line: 104 ]] --[[ Name: __call ]]
        -- upvalues: v39 (ref), l_setTimeout_0 (copy)
        if v39.log then
            v39:log(v41);
            return;
        else
            l_setTimeout_0(function() --[[ Line: 108 ]]
                -- upvalues: v41 (copy)
                error(v41);
            end, 0);
            return;
        end;
    end
});
local function _(v42) --[[ Line: 116 ]] --[[ Name: enqueue ]]
    -- upvalues: v2 (copy), v39 (ref)
    v2.delay(0):doneCall(function() --[[ Line: 117 ]]
        -- upvalues: v42 (copy), v39 (ref)
        xpcall(v42, function(v43) --[[ Line: 118 ]]
            -- upvalues: v39 (ref)
            v39(v43);
        end);
    end);
end;
local function v58(v45) --[[ Line: 124 ]] --[[ Name: cleanupSubscription ]]
    -- upvalues: l_Error_0 (copy), v39 (ref)
    local v46 = false;
    local v47 = false;
    local l__cleanup_0 = v45._cleanup;
    if l__cleanup_0 == nil then
        return;
    else
        v45._cleanup = nil;
        if not l__cleanup_0 then
            return;
        else
            local v49 = true;
            local v50 = nil;
            local v51;
            if typeof(l__cleanup_0) == "function" then
                v51 = true;
            else
                if typeof(l__cleanup_0) == "table" then
                    local v52 = getmetatable(l__cleanup_0);
                    if v52 and rawget(v52, "__call") then
                        v51 = true;
                        v46 = true;
                    elseif l__cleanup_0._isMockFunction then
                        v51 = true;
                        v46 = true;
                    end;
                end;
                if not v46 then
                    if not v46 then
                        v51 = false;
                    end;
                end;
            end;
            v46 = false;
            if v51 then
                local v53;
                v51, v53 = pcall(l__cleanup_0);
                v49 = v51;
                v50 = v53;
            else
                local l_unsubscribe_0 = l__cleanup_0.unsubscribe;
                if l_unsubscribe_0 == nil then
                    v51 = nil;
                else
                    local v55;
                    if typeof(l_unsubscribe_0) == "function" then
                        v55 = true;
                    else
                        if typeof(l_unsubscribe_0) == "table" then
                            local v56 = getmetatable(l_unsubscribe_0);
                            if v56 and rawget(v56, "__call") then
                                v55 = true;
                                v47 = true;
                            elseif l_unsubscribe_0._isMockFunction then
                                v55 = true;
                                v47 = true;
                            end;
                        end;
                        if not v47 then
                            if not v47 then
                                v55 = false;
                            end;
                        end;
                    end;
                    v47 = false;
                    if not v55 then
                        error(l_Error_0.new(tostring(l_unsubscribe_0) .. " is not a function"));
                    end;
                    v51 = l_unsubscribe_0;
                end;
                if v51 then
                    local v57;
                    l_unsubscribe_0, v57 = pcall(v51, l__cleanup_0);
                    v49 = l_unsubscribe_0;
                    v50 = v57;
                end;
            end;
            if not v49 then
                v39(v50);
            end;
            return;
        end;
    end;
end;
local function _(v59) --[[ Line: 153 ]] --[[ Name: closeSubscription ]]
    v59._observer = nil;
    v59._queue = nil;
    v59._state = "closed";
end;
local function v64(v61) --[[ Line: 159 ]] --[[ Name: flushSubscription ]]
    -- upvalues: l_Boolean_0 (copy), v11 (ref)
    local l__queue_0 = v61._queue;
    if not l_Boolean_0.toJSBoolean(l__queue_0) then
        return;
    else
        v61._queue = nil;
        v61._state = "ready";
        for v63 = 1, #l__queue_0 do
            v11(v61, l__queue_0[v63].type, l__queue_0[v63].value);
            if v61._state == "closed" then
                break;
            end;
        end;
        return;
    end;
end;
v11 = function(v65, v66, v67) --[[ Line: 177 ]] --[[ Name: notifySubscription ]]
    -- upvalues: v27 (copy), v39 (ref), v58 (copy)
    v65._state = "running";
    local l__observer_0 = v65._observer;
    local v69 = nil;
    local l_status_0, l_result_0 = pcall(v27, l__observer_0, v66);
    if not l_status_0 then
        v39(l_result_0);
        return;
    else
        if v66 == "next" then
            if l_result_0 then
                local l_status_1, l_result_1 = pcall(l_result_0, l__observer_0, v67);
                l_status_0 = l_status_1;
                v69 = l_result_1;
            end;
        elseif v66 == "error" then
            v65._observer = nil;
            v65._queue = nil;
            v65._state = "closed";
            if l_result_0 then
                local l_status_2, l_result_2 = pcall(l_result_0, l__observer_0, v67);
                l_status_0 = l_status_2;
                v69 = l_result_2;
            else
                v39(v67);
            end;
        elseif v66 == "complete" then
            v65._observer = nil;
            v65._queue = nil;
            v65._state = "closed";
            if l_result_0 then
                local l_status_3, l_result_3 = pcall(l_result_0, l__observer_0, v67);
                l_status_0 = l_status_3;
                v69 = l_result_3;
            end;
        end;
        if not l_status_0 then
            v39(v69);
        end;
        if v65._state == "closed" then
            v58(v65);
            return;
        else
            if v65._state == "running" then
                v65._state = "ready";
            end;
            return;
        end;
    end;
end;
local function v83(v78, v79, v80) --[[ Line: 216 ]] --[[ Name: onNotify ]]
    -- upvalues: v64 (copy), v2 (copy), v39 (ref), v11 (ref)
    if v78._state == "closed" then
        return;
    elseif v78._state == "buffering" then
        assert(v78._queue, "observable subscription queue nil during onNotify");
        table.insert(v78._queue, {
            type = v79, 
            value = v80
        });
        return;
    elseif v78._state ~= "ready" then
        v78._state = "buffering";
        v78._queue = {
            {
                type = v79, 
                value = v80
            }
        };
        local function v81() --[[ Line: 230 ]]
            -- upvalues: v64 (ref), v78 (copy)
            return v64(v78);
        end;
        v2.delay(0):doneCall(function() --[[ Line: 117 ]]
            -- upvalues: v81 (copy), v39 (ref)
            xpcall(v81, function(v82) --[[ Line: 118 ]]
                -- upvalues: v39 (ref)
                v39(v82);
            end);
        end);
        return;
    else
        v11(v78, v79, v80);
        return;
    end;
end;
local v84 = {};
v84.__index = function(v85, v86) --[[ Line: 259 ]]
    -- upvalues: v84 (copy)
    if v86 == "closed" then
        return v85._state == "closed";
    elseif rawget(v85, v86) then
        return (rawget(v85, v86));
    elseif rawget(v84, v86) then
        return (rawget(v84, v86));
    else
        return nil;
    end;
end;
v84.__newindex = function(v87, v88, v89) --[[ Line: 271 ]]
    if v88 == "closed" then
        error("setting getter-only property 'closed'");
    end;
    rawset(v87, v88, v89);
end;
v84.new = function(v90, v91) --[[ Line: 278 ]] --[[ Name: new ]]
    -- upvalues: v84 (copy), v10 (ref)
    local v92 = setmetatable({}, v84);
    v92._cleanup = nil;
    v92._observer = v90;
    v92._queue = nil;
    v92._state = "initializing";
    local v93 = v10.new(v92);
    local l_status_4, l_result_4 = pcall(v91, v93);
    if l_status_4 then
        v92._cleanup = l_result_4;
    else
        v93:error(l_result_4);
    end;
    if v92._state == "initializing" then
        v92._state = "ready";
    end;
    return v92;
end;
v84.unsubscribe = function(v96) --[[ Line: 304 ]] --[[ Name: unsubscribe ]]
    -- upvalues: v58 (copy)
    if v96._state ~= "closed" then
        v96._observer = nil;
        v96._queue = nil;
        v96._state = "closed";
        v58(v96);
    end;
end;
v10 = {};
v10.__index = function(v97, v98) --[[ Line: 320 ]]
    -- upvalues: v10 (ref)
    if v98 == "closed" then
        return v97._subscription._state == "closed";
    elseif rawget(v10, v98) then
        return (rawget(v10, v98));
    else
        return (rawget(v97, v98));
    end;
end;
v10.__newindex = function(v99, v100, v101) --[[ Line: 329 ]]
    if v100 == "closed" then
        error("setting getter-only property 'closed'");
    end;
    rawset(v99, v100, v101);
end;
v10.new = function(v102) --[[ Line: 336 ]] --[[ Name: new ]]
    -- upvalues: v10 (ref)
    return (setmetatable({
        _subscription = v102
    }, v10));
end;
v10.next = function(v103, v104) --[[ Line: 345 ]] --[[ Name: next ]]
    -- upvalues: v83 (copy)
    v83(v103._subscription, "next", v104);
end;
v10.error = function(v105, v106) --[[ Line: 349 ]] --[[ Name: error ]]
    -- upvalues: v83 (copy)
    v83(v105._subscription, "error", v106);
end;
v10.complete = function(v107) --[[ Line: 353 ]] --[[ Name: complete ]]
    -- upvalues: v83 (copy)
    v83(v107._subscription, "complete");
end;
v9 = {};
v9.__index = v9;
v12 = function(v108) --[[ Line: 413 ]] --[[ Name: isObservableClass ]]
    -- upvalues: v25 (copy), v9 (ref)
    local v109 = false;
    if typeof(v108) == "table" then
        v109 = false;
        if v108[v25] == v9[v25] then
            v109 = typeof((rawget(v108, "new"))) == "function";
        end;
    end;
    return v109;
end;
v9.new = function(v110) --[[ Line: 419 ]] --[[ Name: new ]]
    -- upvalues: v9 (ref)
    local v111 = false;
    local v112;
    if typeof(v110) == "function" then
        v112 = true;
    else
        if typeof(v110) == "table" then
            local v113 = getmetatable(v110);
            if v113 and rawget(v113, "__call") then
                v112 = true;
                v111 = true;
            elseif v110._isMockFunction then
                v112 = true;
                v111 = true;
            end;
        end;
        if not v111 then
            if not v111 then
                v112 = false;
            end;
        end;
    end;
    v111 = false;
    if not v112 then
        error("Observable initializer must be a function");
    end;
    return (setmetatable({
        _subscriber = v110
    }, v9));
end;
v9.subscribe = function(v114, v115, v116, v117) --[[ Line: 437 ]] --[[ Name: subscribe ]]
    -- upvalues: v84 (copy)
    if typeof(v115) ~= "table" or v115 == nil then
        v115 = {
            start = nil, 
            next = v115, 
            error = v116, 
            complete = v117
        };
    end;
    return (v84.new(v115, v114._subscriber));
end;
v9.forEach = function(v118, v119) --[[ Line: 455 ]] --[[ Name: forEach ]]
    -- upvalues: v2 (copy), l_Error_0 (copy)
    return v2.new(function(v120, v121) --[[ Line: 456 ]]
        -- upvalues: v119 (copy), l_Error_0 (ref), v118 (copy)
        local v122 = false;
        local l_v119_0 = v119;
        local v124;
        if typeof(l_v119_0) == "function" then
            v124 = true;
        else
            if typeof(l_v119_0) == "table" then
                local v125 = getmetatable(l_v119_0);
                if v125 and rawget(v125, "__call") then
                    v124 = true;
                    v122 = true;
                elseif l_v119_0._isMockFunction then
                    v124 = true;
                    v122 = true;
                end;
            end;
            if not v122 then
                if not v122 then
                    v124 = false;
                end;
            end;
        end;
        v122 = false;
        if not v124 then
            v121(l_Error_0.new(tostring(v119) .. " is not a function"));
            return;
        else
            v124 = nil;
            l_v119_0 = function() --[[ Line: 466 ]] --[[ Name: done ]]
                -- upvalues: v124 (ref), v120 (copy)
                v124:unsubscribe();
                v120();
            end;
            v124 = v118:subscribe({
                next = function(_, v127) --[[ Line: 472 ]] --[[ Name: next ]]
                    -- upvalues: v119 (ref), l_v119_0 (copy), v121 (copy), v124 (ref)
                    local l_status_5, l_result_5 = pcall(v119, v127, l_v119_0);
                    if not l_status_5 then
                        v121(l_result_5);
                        v124:unsubscribe();
                    end;
                end, 
                error = function(_, v131) --[[ Line: 481 ]] --[[ Name: error ]]
                    -- upvalues: v121 (copy)
                    v121(v131);
                end, 
                complete = function(_) --[[ Line: 484 ]] --[[ Name: complete ]]
                    -- upvalues: v120 (copy)
                    v120();
                end
            });
            return;
        end;
    end);
end;
v9.map = function(v133, v134) --[[ Line: 492 ]] --[[ Name: map ]]
    -- upvalues: l_Error_0 (copy), v26 (copy), v9 (ref)
    local v135 = false;
    local v136;
    if typeof(v134) == "function" then
        v136 = true;
    else
        if typeof(v134) == "table" then
            local v137 = getmetatable(v134);
            if v137 and rawget(v137, "__call") then
                v136 = true;
                v135 = true;
            elseif v134._isMockFunction then
                v136 = true;
                v135 = true;
            end;
        end;
        if not v135 then
            if not v135 then
                v136 = false;
            end;
        end;
    end;
    v135 = false;
    if not v136 then
        error(l_Error_0.new(tostring(v134) .. " is not a function"));
    end;
    local v138 = v133[v26];
    return (if v138 ~= nil then v138 else v9).new(function(v139) --[[ Line: 501 ]]
        -- upvalues: v133 (copy), v134 (copy)
        return v133:subscribe({
            next = function(_, v141) --[[ Line: 503 ]] --[[ Name: next ]]
                -- upvalues: v134 (ref), v139 (copy)
                local l_status_6, l_result_6 = pcall(v134, v141);
                if not l_status_6 then
                    v139:error(l_result_6);
                    return;
                else
                    v139:next(l_result_6);
                    return;
                end;
            end, 
            error = function(_, v145) --[[ Line: 514 ]] --[[ Name: error ]]
                -- upvalues: v139 (copy)
                v139:error(v145);
            end, 
            complete = function(_) --[[ Line: 517 ]] --[[ Name: complete ]]
                -- upvalues: v139 (copy)
                v139:complete();
            end
        });
    end);
end;
v9.filter = function(v147, v148) --[[ Line: 526 ]] --[[ Name: filter ]]
    -- upvalues: l_Error_0 (copy), v26 (copy), v9 (ref), l_Boolean_0 (copy)
    local v149 = false;
    local v150;
    if typeof(v148) == "function" then
        v150 = true;
    else
        if typeof(v148) == "table" then
            local v151 = getmetatable(v148);
            if v151 and rawget(v151, "__call") then
                v150 = true;
                v149 = true;
            elseif v148._isMockFunction then
                v150 = true;
                v149 = true;
            end;
        end;
        if not v149 then
            if not v149 then
                v150 = false;
            end;
        end;
    end;
    v149 = false;
    if not v150 then
        error(l_Error_0.new(tostring(v148) .. " is not a function"));
    end;
    local v152 = v147[v26];
    return (if v152 ~= nil then v152 else v9).new(function(v153) --[[ Line: 535 ]]
        -- upvalues: v147 (copy), v148 (copy), l_Boolean_0 (ref)
        return v147:subscribe({
            next = function(_, v155) --[[ Line: 537 ]] --[[ Name: next ]]
                -- upvalues: v148 (ref), v153 (copy), l_Boolean_0 (ref)
                local v157, v158 = xpcall(v148, function(v156) --[[ Line: 539 ]]
                    -- upvalues: v153 (ref)
                    v153:error(v156);
                end, v155);
                if v157 and not l_Boolean_0.toJSBoolean(v158) then
                    return;
                elseif not v157 then
                    return;
                else
                    v153:next(v155);
                    return;
                end;
            end, 
            error = function(_, v160) --[[ Line: 552 ]] --[[ Name: error ]]
                -- upvalues: v153 (copy)
                v153:error(v160);
            end, 
            complete = function(_) --[[ Line: 555 ]] --[[ Name: complete ]]
                -- upvalues: v153 (copy)
                v153:complete();
            end
        });
    end);
end;
v9.reduce = function(v162, v163, ...) --[[ Line: 562 ]] --[[ Name: reduce ]]
    -- upvalues: l_Error_0 (copy), v26 (copy), v9 (ref)
    local v164 = false;
    local v165 = {
        v163, 
        ...
    };
    local v166;
    if typeof(v163) == "function" then
        v166 = true;
    else
        if typeof(v163) == "table" then
            local v167 = getmetatable(v163);
            if v167 and rawget(v167, "__call") then
                v166 = true;
                v164 = true;
            elseif v163._isMockFunction then
                v166 = true;
                v164 = true;
            end;
        end;
        if not v164 then
            if not v164 then
                v166 = false;
            end;
        end;
    end;
    v164 = false;
    if not v166 then
        error(l_Error_0.new(tostring(v163) .. " is not a function"));
    end;
    local v168 = v162[v26];
    v166 = if v168 ~= nil then v168 else v9;
    v168 = #v165 > 1;
    local v169 = false;
    local v170 = v165[2];
    return v166.new(function(v171) --[[ Line: 577 ]]
        -- upvalues: v162 (copy), v169 (ref), v168 (copy), v170 (ref), v163 (copy), l_Error_0 (ref)
        return v162:subscribe({
            next = function(_, v173) --[[ Line: 579 ]] --[[ Name: next ]]
                -- upvalues: v169 (ref), v168 (ref), v170 (ref), v163 (ref), v171 (copy)
                local v174 = not v169;
                v169 = true;
                if not v174 or v168 then
                    local v175 = nil;
                    local v177, v178 = xpcall(v163, function(v176) --[[ Line: 585 ]]
                        -- upvalues: v171 (ref)
                        v171:error(v176);
                    end, v170, v173);
                    v170 = v178;
                    v175 = v177;
                    return;
                else
                    v170 = v173;
                    return;
                end;
            end, 
            error = function(_, v180) --[[ Line: 593 ]] --[[ Name: error ]]
                -- upvalues: v171 (copy)
                v171:error(v180);
            end, 
            complete = function(_) --[[ Line: 596 ]] --[[ Name: complete ]]
                -- upvalues: v169 (ref), v168 (ref), v171 (copy), l_Error_0 (ref), v170 (ref)
                if not v169 and not v168 then
                    v171:error(l_Error_0.new("Cannot reduce an empty sequence"));
                end;
                v171:next(v170);
                v171:complete();
            end
        });
    end);
end;
v9.concat = function(v182, ...) --[[ Line: 609 ]] --[[ Name: concat ]]
    -- upvalues: v26 (copy), v9 (ref), l_Boolean_0 (copy)
    local v183 = {
        ...
    };
    local v184 = v182[v26];
    local v185 = if v184 ~= nil then v184 else v9;
    return v185.new(function(v186) --[[ Line: 614 ]]
        -- upvalues: v183 (copy), v185 (copy), v182 (copy), l_Boolean_0 (ref)
        local v187 = nil;
        local v188 = 1;
        local function v189(v190) --[[ Line: 617 ]] --[[ Name: startNext ]]
            -- upvalues: v187 (ref), v186 (copy), v188 (ref), v183 (ref), v189 (copy), v185 (ref)
            v187 = v190:subscribe({
                next = function(_, v192) --[[ Line: 619 ]] --[[ Name: next ]]
                    -- upvalues: v186 (ref)
                    v186:next(v192);
                end, 
                error = function(_, v194) --[[ Line: 622 ]] --[[ Name: error ]]
                    -- upvalues: v186 (ref)
                    v186:error(v194);
                end, 
                complete = function(_) --[[ Line: 625 ]] --[[ Name: complete ]]
                    -- upvalues: v188 (ref), v183 (ref), v187 (ref), v186 (ref), v189 (ref), v185 (ref)
                    if v188 == #v183 + 1 then
                        v187 = nil;
                        v186:complete();
                        return;
                    else
                        local l_v189_0 = v189;
                        local l_from_0 = v185.from;
                        local l_v183_0 = v183;
                        local l_v188_0 = v188;
                        v188 = v188 + 1;
                        l_v189_0(l_from_0(l_v183_0[l_v188_0]));
                        return;
                    end;
                end
            });
        end;
        v189(v182);
        return function() --[[ Line: 644 ]]
            -- upvalues: l_Boolean_0 (ref), v187 (ref)
            if l_Boolean_0.toJSBoolean(v187) then
                v187:unsubscribe();
                v187 = nil;
            end;
        end;
    end);
end;
v9.flatMap = function(v200, v201) --[[ Line: 654 ]] --[[ Name: flatMap ]]
    -- upvalues: l_Error_0 (copy), v26 (copy), v9 (ref), l_Boolean_0 (copy), l_Array_0 (copy)
    local v202 = false;
    local v203 = nil;
    local v204;
    if typeof(v201) == "function" then
        v204 = true;
    else
        if typeof(v201) == "table" then
            local v205 = getmetatable(v201);
            if v205 and rawget(v205, "__call") then
                v204 = true;
                v202 = true;
            elseif v201._isMockFunction then
                v204 = true;
                v202 = true;
            end;
        end;
        if not v202 then
            if not v202 then
                v204 = false;
            end;
        end;
    end;
    v202 = false;
    if not v204 then
        error(l_Error_0.new(tostring(v201) .. " is not a function"));
    end;
    local v206 = v200[v26];
    v204 = if v206 ~= nil then v206 else v9;
    return v204.new(function(v207) --[[ Line: 665 ]]
        -- upvalues: v200 (copy), l_Boolean_0 (ref), v201 (copy), v204 (copy), l_Array_0 (ref), v203 (ref)
        local v208 = {};
        local v225 = v200:subscribe({
            next = function(_, v210) --[[ Line: 668 ]] --[[ Name: next ]]
                -- upvalues: l_Boolean_0 (ref), v201 (ref), v207 (copy), v204 (ref), l_Array_0 (ref), v208 (copy), v203 (ref)
                if l_Boolean_0.toJSBoolean(v201) then
                    local v211 = nil;
                    local v213, v214 = xpcall(v201, function(v212) --[[ Line: 672 ]]
                        -- upvalues: v207 (ref)
                        v207:error(v212);
                    end, v210);
                    v211 = v213;
                    v210 = v214;
                end;
                local v215 = nil;
                v215 = v204.from(v210):subscribe({
                    next = function(_, v217) --[[ Line: 680 ]] --[[ Name: next ]]
                        -- upvalues: v207 (ref)
                        v207:next(v217);
                    end, 
                    error = function(_, v219) --[[ Line: 683 ]] --[[ Name: error ]]
                        -- upvalues: v207 (ref)
                        v207:error(v219);
                    end, 
                    complete = function(_) --[[ Line: 686 ]] --[[ Name: complete ]]
                        -- upvalues: l_Array_0 (ref), v208 (ref), v215 (ref), v203 (ref)
                        local v221 = l_Array_0.indexOf(v208, v215);
                        if v221 >= 1 then
                            l_Array_0.splice(v208, v221, 1);
                        end;
                        v203();
                    end
                });
                table.insert(v208, v215);
                return nil;
            end, 
            error = function(_, v223) --[[ Line: 701 ]] --[[ Name: error ]]
                -- upvalues: v207 (copy)
                v207:error(v223);
            end, 
            complete = function(_) --[[ Line: 704 ]] --[[ Name: complete ]]
                -- upvalues: v203 (ref)
                v203();
            end
        });
        v203 = function() --[[ Line: 709 ]] --[[ Name: completeIfDone ]]
            -- upvalues: v225 (copy), v208 (copy), v207 (copy)
            if v225.closed and #v208 == 0 then
                v207:complete();
            end;
        end;
        return function() --[[ Line: 715 ]]
            -- upvalues: l_Array_0 (ref), v208 (copy), v225 (copy)
            l_Array_0.forEach(v208, function(v226) --[[ Line: 716 ]]
                return v226:unsubscribe();
            end);
            v225:unsubscribe();
        end;
    end);
end;
v9[v25] = function(v227) --[[ Line: 724 ]]
    return v227;
end;
v9.from = function(v228, v229) --[[ Line: 729 ]] --[[ Name: from ]]
    -- upvalues: v12 (ref), v9 (ref), l_Error_0 (copy), v25 (copy), l_instanceof_0 (copy), l_Array_0 (copy), v2 (copy), v39 (ref)
    local v230 = false;
    local v231 = nil;
    local v232 = nil;
    if v12(v228) then
        v231 = v228;
        v232 = v229;
    else
        v231 = v9;
        v232 = v228;
    end;
    if v232 == nil then
        error(l_Error_0.new(tostring(v232) .. " is not an object"));
    end;
    local v233 = v232[v25];
    local v234;
    if v233 == nil then
        v234 = nil;
    else
        local v235;
        if typeof(v233) == "function" then
            v235 = true;
        else
            if typeof(v233) == "table" then
                local v236 = getmetatable(v233);
                if v236 and rawget(v236, "__call") then
                    v235 = true;
                    v230 = true;
                elseif v233._isMockFunction then
                    v235 = true;
                    v230 = true;
                end;
            end;
            if not v230 then
                if not v230 then
                    v235 = false;
                end;
            end;
        end;
        v230 = false;
        if not v235 then
            error(l_Error_0.new(tostring(v233) .. " is not a function"));
        end;
        v234 = v233;
    end;
    if v234 then
        local v237 = v234(v232);
        if l_instanceof_0(v237, v9) and v237.new == v231.new then
            return v237;
        else
            return v231.new(function(v238) --[[ Line: 758 ]]
                -- upvalues: v237 (copy)
                return v237:subscribe(v238);
            end);
        end;
    elseif l_Array_0.isArray(v232) then
        return v9.new(function(v239) --[[ Line: 780 ]]
            -- upvalues: v232 (ref), v2 (ref), v39 (ref)
            local function v242() --[[ Line: 781 ]]
                -- upvalues: v239 (copy), v232 (ref)
                if v239.closed then
                    return;
                else
                    for _, v241 in pairs(v232) do
                        v239:next(v241);
                        if v239.closed then
                            return;
                        end;
                    end;
                    v239:complete();
                    return;
                end;
            end;
            v2.delay(0):doneCall(function() --[[ Line: 117 ]]
                -- upvalues: v242 (copy), v39 (ref)
                xpcall(v242, function(v243) --[[ Line: 118 ]]
                    -- upvalues: v39 (ref)
                    v39(v243);
                end);
            end);
        end);
    else
        error(l_Error_0.new(tostring(v232) .. " is not observable"));
        return;
    end;
end;
v9.of = function(v244, ...) --[[ Line: 803 ]] --[[ Name: of ]]
    -- upvalues: v12 (ref), v9 (ref), v2 (copy), v39 (ref)
    local v245 = nil;
    local v246 = nil;
    if v12(v244) then
        v245 = v244;
        v246 = {
            ...
        };
    else
        v245 = v9;
        v246 = {
            v244, 
            ...
        };
    end;
    return v245.new(function(v247) --[[ Line: 813 ]]
        -- upvalues: v246 (ref), v2 (ref), v39 (ref)
        local function v250() --[[ Line: 814 ]]
            -- upvalues: v247 (copy), v246 (ref)
            if v247.closed then
                return;
            else
                for _, v249 in ipairs(v246) do
                    v247:next(v249);
                    if v247.closed then
                        return;
                    end;
                end;
                v247:complete();
                return;
            end;
        end;
        v2.delay(0):doneCall(function() --[[ Line: 117 ]]
            -- upvalues: v250 (copy), v39 (ref)
            xpcall(v250, function(v251) --[[ Line: 118 ]]
                -- upvalues: v39 (ref)
                v39(v251);
            end);
        end);
    end);
end;
local v252 = false;
if typeof(l_Symbol_0) == "table" then
    v252 = typeof(getmetatable(l_Symbol_0).__call) == "function";
end;
if v252 then
    v9[l_Symbol_0("extensions")] = {
        symbol = v25, 
        hostReportError = v39
    };
end;
return {
    Observable = v9
};