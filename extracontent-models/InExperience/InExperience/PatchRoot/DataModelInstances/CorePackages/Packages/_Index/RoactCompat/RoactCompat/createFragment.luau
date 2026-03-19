local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.warnOnce);
return function(v4) --[[ Line: 22 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    if v1.__DEV__ and v1.__COMPAT_WARNINGS__ then
        v3("createFragment", "Please instead use:\n\tReact.createElement(React.Fragment, ...)");
    end;
    return v2.createElement(v2.Fragment, nil, v4);
end;