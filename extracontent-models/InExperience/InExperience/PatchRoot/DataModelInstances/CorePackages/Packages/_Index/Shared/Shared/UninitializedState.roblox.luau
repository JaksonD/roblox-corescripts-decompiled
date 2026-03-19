local v0 = require(script.Parent.console);
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.ReactGlobals);
local v3 = {};
setmetatable(v3, {
    __index = function(_, _) --[[ Line: 26 ]] --[[ Name: __index ]]
        -- upvalues: v2 (copy), v0 (copy)
        if v2.__DEV__ then
            v0.warn("Attempted to access uninitialized state. Use setState to initialize state");
        end;
        return nil;
    end, 
    __newindex = function(_, _) --[[ Line: 34 ]] --[[ Name: __newindex ]]
        -- upvalues: v2 (copy), v0 (copy)
        if v2.__DEV__ then
            v0.error("Attempted to directly mutate state. Use setState to assign new values to state.");
        end;
        return nil;
    end, 
    __tostring = function(_) --[[ Line: 42 ]] --[[ Name: __tostring ]]
        return "<uninitialized component state>";
    end, 
    __metatable = "UninitializedState"
});
return v3;