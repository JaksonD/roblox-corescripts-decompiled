local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = {};
local _ = require(script.Parent.Parent.core.types);
v2.selectURI = function(v4, v5) --[[ Line: 19 ]] --[[ Name: selectURI ]]
    -- upvalues: l_Boolean_0 (copy)
    local l_uri_0 = v4:getContext().uri;
    if l_Boolean_0.toJSBoolean(l_uri_0) then
        return l_uri_0;
    elseif typeof(v5) == "function" then
        return v5(v4);
    else
        return l_Boolean_0.toJSBoolean(v5) and v5 or "/graphql";
    end;
end;
return v2;