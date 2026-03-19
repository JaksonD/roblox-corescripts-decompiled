local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.FocusNavigationUtils);
local l_getAncestors_0 = v1.getAncestors;
local l_mockableWarn_0 = v1.mockableWarn;
local v4 = require(script.Parent.eventPropagationEvent);
local l___DEBUG_EVENT_PROPAGATION___0 = _G.__DEBUG_EVENT_PROPAGATION__;
local function v7(v6) --[[ Line: 113 ]] --[[ Name: describeFunction ]]
    return table.concat(table.pack(debug.info(v6, "sln")), " ");
end;
local function _(v8, v9) --[[ Line: 117 ]] --[[ Name: getEventsFromRegistry ]]
    return v8[v9];
end;
local function _(v11, v12, v13) --[[ Line: 121 ]] --[[ Name: getEventPhasesFromRegistry ]]
    local v14 = v11[v12];
    if v14 then
        return v14[v13];
    else
        return nil;
    end;
end;
local function _(v16, v17, v18, v19) --[[ Line: 130 ]] --[[ Name: getEventHandler ]]
    local v20 = v16[v17];
    local v21 = if v20 then v20[v18] else nil;
    if v21 ~= nil then
        return v21[v19];
    else
        return nil;
    end;
end;
local v23 = {};
v23.__index = v23;
v23.registerEventHandler = function(v24, v25, v26, v27, v28) --[[ Line: 143 ]] --[[ Name: registerEventHandler ]]
    -- upvalues: l___DEBUG_EVENT_PROPAGATION___0 (copy), l_mockableWarn_0 (copy), v7 (copy)
    if l___DEBUG_EVENT_PROPAGATION___0 then
        print("+++ register handler", v26, tostring(v25), v28 or "Bubble");
    end;
    local v29 = v28 or "Bubble";
    v24.eventHandlerRegistry[v25] = v24.eventHandlerRegistry[v25] or {};
    v24.eventHandlerRegistry[v25][v26] = v24.eventHandlerRegistry[v25][v26] or {};
    if _G.__DEV__ then
        local v30 = v24.eventHandlerRegistry[v25][v26][v29];
        if v30 then
            l_mockableWarn_0(string.format("New handler bound to the %s phase of '%s' will override an existing handler:\n\tprevious handler: %s\n\t     new handler: %s", v29, v26, table.concat(table.pack(debug.info(v27, "sln")), " "), v7(v30)));
        end;
    end;
    v24.eventHandlerRegistry[v25][v26][v29] = v27;
end;
v23.registerEventHandlers = function(v31, v32, v33) --[[ Line: 174 ]] --[[ Name: registerEventHandlers ]]
    if not v31.eventHandlerRegistry[v32] then
        v31.eventHandlerRegistry[v32] = {};
    end;
    for v34, v35 in v33 do
        v31:registerEventHandler(v32, v34, v35.handler, v35.phase);
    end;
end;
v23.deregisterEventHandlers = function(v36, v37, v38) --[[ Line: 183 ]] --[[ Name: deregisterEventHandlers ]]
    if not v36.eventHandlerRegistry[v37] then
        return;
    else
        for v39, v40 in v38 do
            v36:deregisterEventHandler(v37, v39, v40.handler, v40.phase);
        end;
        return;
    end;
end;
v23.deregisterEventHandler = function(v41, v42, v43, v44, v45) --[[ Line: 192 ]] --[[ Name: deregisterEventHandler ]]
    -- upvalues: l___DEBUG_EVENT_PROPAGATION___0 (copy), l_mockableWarn_0 (copy)
    if l___DEBUG_EVENT_PROPAGATION___0 then
        print("--- deregister handler", v43, tostring(v42), v45 or "Bubble");
    end;
    local v46 = v45 or "Bubble";
    local v47 = v41.eventHandlerRegistry[v42];
    local v48 = if v47 then v47[v43] else nil;
    if v48 and v48[v46] then
        if _G.__DEV__ then
            local v49 = v48[v46];
            if v49 ~= v44 then
                l_mockableWarn_0(string.format("Deregistering non-matching event handler bound to the %s phase of '%s':\n\tprevious handler: %s\n\t     new handler: %s", v46, v43, if type(v44) == "function" then table.concat(table.pack(debug.info(v44, "sln")), " ") else tostring(v44), if type(v49) == "function" then table.concat(table.pack(debug.info(v49, "sln")), " ") else tostring(v49)));
            end;
        end;
        v48[v46] = nil;
        return;
    else
        if _G.__DEV__ then
            l_mockableWarn_0(string.format("Cannot deregister unregistered event handler bound to the %s phase of '%s'", v46, v43));
        end;
        return;
    end;
end;
v23.getRegisteredEventHandlers = function(v50, v51) --[[ Line: 233 ]] --[[ Name: getRegisteredEventHandlers ]]
    local v52 = v50.eventHandlerRegistry[v51];
    if v52 then
        local v53 = {};
        for v54, v55 in v52 do
            v53[v54] = next(v55) ~= nil;
        end;
        return v53;
    else
        return nil;
    end;
end;
v23.propagateEvent = function(v56, v57, v58, v59, v60) --[[ Line: 247 ]] --[[ Name: propagateEvent ]]
    -- upvalues: v4 (copy), l_getAncestors_0 (copy), l___DEBUG_EVENT_PROPAGATION___0 (copy)
    local v61 = v60 or {};
    local v62 = v61.synthetic or false;
    local v63 = v61.silent or false;
    local function _(v64, v65) --[[ Line: 257 ]] --[[ Name: runEventHandler ]]
        -- upvalues: v56 (copy), v58 (copy), v4 (ref), v57 (copy), v62 (copy), v59 (copy)
        local l_eventHandlerRegistry_0 = v56.eventHandlerRegistry;
        local l_v58_0 = v58;
        local v68 = l_eventHandlerRegistry_0[v64];
        local v69 = if v68 then v68[l_v58_0] else nil;
        local v70 = if v69 ~= nil then v69[v65] else nil;
        if v70 then
            l_eventHandlerRegistry_0 = v4.new(v57, v64, v58, v65, v62, v59);
            v70(l_eventHandlerRegistry_0);
            return l_eventHandlerRegistry_0.cancelled;
        else
            return false;
        end;
    end;
    local v72 = false;
    local v73 = if v63 then {
        v57
    } else l_getAncestors_0(v57);
    if l___DEBUG_EVENT_PROPAGATION___0 then
        print(">>> capture event", v58, "for", (tostring(v57)));
    end;
    for v74 = #v73, 1, -1 do
        local v75 = v73[v74];
        local v76 = v56.eventHandlerRegistry[v75];
        local v77 = if v76 then v76[v58] else nil;
        local v78 = if v77 ~= nil then v77.Capture else nil;
        if v78 then
            local v79 = v4.new(v57, v75, v58, "Capture", v62, v59);
            v78(v79);
            v72 = v79.cancelled;
        else
            v72 = false;
        end;
        if v72 then
            return;
        end;
    end;
    local v80 = v56.eventHandlerRegistry[v57];
    local v81 = if v80 then v80[v58] else nil;
    local v82 = if v81 ~= nil then v81.Target else nil;
    if v82 then
        local v83 = v4.new(v57, v57, v58, "Target", v62, v59);
        v82(v83);
        v72 = v83.cancelled;
    else
        v72 = false;
    end;
    if v72 then
        return;
    else
        if l___DEBUG_EVENT_PROPAGATION___0 then
            print("<<< bubble event", v58, "from", (tostring(v57)));
        end;
        for v84 = 1, #v73 do
            v80 = v73[v84];
            local v85 = v56.eventHandlerRegistry[v80];
            local v86 = if v85 then v85[v58] else nil;
            local v87 = if v86 ~= nil then v86.Bubble else nil;
            if v87 then
                local v88 = v4.new(v57, v80, v58, "Bubble", v62, v59);
                v87(v88);
                v72 = v88.cancelled;
            else
                v72 = false;
            end;
            if v72 then
                return;
            end;
        end;
        return;
    end;
end;
v23.new = function() --[[ Line: 304 ]] --[[ Name: new ]]
    -- upvalues: v23 (copy)
    local v89 = {
        eventHandlerRegistry = setmetatable({}, {
            __mode = "k"
        })
    };
    setmetatable(v89, v23);
    return v89;
end;
return v23;