local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_console_0 = v1.console;
local l_Error_0 = v1.Error;
local v6 = setmetatable({}, {
    __index = l_Error_0
});
v6.__index = v6;
v6.new = function(v7) --[[ Line: 20 ]] --[[ Name: new ]]
    -- upvalues: l_Error_0 (copy), v6 (copy)
    local l_v7_0 = v7;
    if v7 == nil then
        l_v7_0 = "Invariant Violation";
    end;
    local v9 = nil;
    v9 = if typeof(l_v7_0) == "number" then ("%s: %s (see https://github.com/apollographql/invariant-packages)"):format("Invariant Violation", (tostring(l_v7_0))) else l_v7_0;
    local v10 = l_Error_0.new(v9);
    v10.framesToPop = 1;
    v10.name = "Invariant Violation";
    return (setmetatable(v10, v6));
end;
local function _(v11, v12) --[[ Line: 43 ]] --[[ Name: invariant ]]
    -- upvalues: l_Boolean_0 (copy), v6 (copy)
    if not l_Boolean_0.toJSBoolean(v11) then
        error(v6.new(v12));
    end;
end;
local v14 = {
    "debug", 
    "log", 
    "warn", 
    "error", 
    "silent"
};
local v15 = l_Array_0.indexOf(v14, "log");
local function _(v16) --[[ Line: 53 ]] --[[ Name: wrapConsoleMethod ]]
    -- upvalues: l_Array_0 (copy), v14 (copy), v15 (ref), l_Boolean_0 (copy), l_console_0 (copy)
    return function(...) --[[ Line: 54 ]]
        -- upvalues: l_Array_0 (ref), v14 (ref), v16 (copy), v15 (ref), l_Boolean_0 (ref), l_console_0 (ref)
        if l_Array_0.indexOf(v14, v16) >= v15 then
            return (l_Boolean_0.toJSBoolean(l_console_0[v16]) and l_console_0[v16] or l_console_0.log)(...);
        else
            return;
        end;
    end;
end;
local v18 = {};
local v19 = {};
local v20 = "debug";
local l_v20_0 = v20 --[[ copy: 16 -> 17 ]];
v19.debug = function(...) --[[ Line: 54 ]]
    -- upvalues: l_Array_0 (copy), v14 (copy), l_v20_0 (copy), v15 (ref), l_Boolean_0 (copy), l_console_0 (copy)
    if l_Array_0.indexOf(v14, l_v20_0) >= v15 then
        return (l_Boolean_0.toJSBoolean(l_console_0[l_v20_0]) and l_console_0[l_v20_0] or l_console_0.log)(...);
    else
        return;
    end;
end;
v20 = "log";
local l_v20_1 = v20 --[[ copy: 16 -> 18 ]];
v19.log = function(...) --[[ Line: 54 ]]
    -- upvalues: l_Array_0 (copy), v14 (copy), l_v20_1 (copy), v15 (ref), l_Boolean_0 (copy), l_console_0 (copy)
    if l_Array_0.indexOf(v14, l_v20_1) >= v15 then
        return (l_Boolean_0.toJSBoolean(l_console_0[l_v20_1]) and l_console_0[l_v20_1] or l_console_0.log)(...);
    else
        return;
    end;
end;
v20 = "warn";
local l_v20_2 = v20 --[[ copy: 16 -> 19 ]];
v19.warn = function(...) --[[ Line: 54 ]]
    -- upvalues: l_Array_0 (copy), v14 (copy), l_v20_2 (copy), v15 (ref), l_Boolean_0 (copy), l_console_0 (copy)
    if l_Array_0.indexOf(v14, l_v20_2) >= v15 then
        return (l_Boolean_0.toJSBoolean(l_console_0[l_v20_2]) and l_console_0[l_v20_2] or l_console_0.log)(...);
    else
        return;
    end;
end;
v20 = "error";
v19.error = function(...) --[[ Line: 54 ]]
    -- upvalues: l_Array_0 (copy), v14 (copy), v20 (copy), v15 (ref), l_Boolean_0 (copy), l_console_0 (copy)
    if l_Array_0.indexOf(v14, v20) >= v15 then
        return (l_Boolean_0.toJSBoolean(l_console_0[v20]) and l_console_0[v20] or l_console_0.log)(...);
    else
        return;
    end;
end;
v18.invariant = setmetatable(v19, {
    __call = function(_, v25, v26) --[[ Line: 72 ]] --[[ Name: __call ]]
        -- upvalues: l_Boolean_0 (copy), v6 (copy)
        if not l_Boolean_0.toJSBoolean(v25) then
            error(v6.new(v26));
        end;
    end
});
v18.InvariantError = v6;
v18.setVerbosity = function(v27) --[[ Line: 77 ]] --[[ Name: setVerbosity ]]
    -- upvalues: v14 (copy), v15 (ref), l_Array_0 (copy)
    local v28 = v14[v15];
    v15 = math.max(1, l_Array_0.indexOf(v14, v27));
    return v28;
end;
return v18;