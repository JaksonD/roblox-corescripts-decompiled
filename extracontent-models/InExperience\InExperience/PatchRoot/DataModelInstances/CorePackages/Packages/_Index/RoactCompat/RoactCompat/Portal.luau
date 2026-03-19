local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactRoblox);
local v2 = require(l_Parent_0.ReactGlobals);
local v3 = require(script.Parent.warnOnce);
return function(v4) --[[ Line: 23 ]] --[[ Name: PortalComponent ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    if v2.__DEV__ and v2.__COMPAT_WARNINGS__ then
        v3("Roact.Portal", "Please use the createPortal API on ReactRoblox instead");
    end;
    return v1.createPortal(v4.children, v4.target);
end;