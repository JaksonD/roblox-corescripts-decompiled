local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = {};
local v3 = nil;
v2.setExtraStackFrame = function(v4) --[[ Line: 19 ]] --[[ Name: setExtraStackFrame ]]
    -- upvalues: v1 (copy), v3 (ref)
    if v1.__DEV__ then
        v3 = v4;
    end;
end;
if v1.__DEV__ then
    v2.getCurrentStack = nil;
    v2.getStackAddendum = function() --[[ Line: 36 ]] --[[ Name: getStackAddendum ]]
        -- upvalues: v3 (ref), v2 (copy)
        local v5 = "";
        if v3 then
            v5 = v5 .. v3;
        end;
        local l_getCurrentStack_0 = v2.getCurrentStack;
        if l_getCurrentStack_0 then
            v5 = v5 .. (l_getCurrentStack_0() or "");
        end;
        return v5;
    end;
end;
return v2;