local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactGlobals);
local v3 = require(script.Parent.warnOnce);
return function(v4) --[[ Line: 22 ]] --[[ Name: oneChild ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    if v2.__DEV__ and v2.__COMPAT_WARNINGS__ then
        v3("oneChild", "You likely don't need this at all! If you were assigning children via `React.oneChild(someChildren)`, you can simply use `someChildren` directly.");
    end;
    if not v4 then
        return nil;
    else
        local v5, v6 = next(v4);
        if not v6 then
            return nil;
        else
            if next(v4, v5) then
                error("Expected at most one child, had more than one child.", 2);
            end;
            return v1.Children.only(v6);
        end;
    end;
end;