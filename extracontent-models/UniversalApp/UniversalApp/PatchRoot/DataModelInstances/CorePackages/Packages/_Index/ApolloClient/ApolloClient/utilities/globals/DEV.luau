local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local l_default_0 = require(script.Parent.Parent.common.global).default;
local _ = function() --[[ Line: 23 ]] --[[ Name: getDEV ]]
    -- upvalues: l_Boolean_0 (copy), l_default_0 (copy)
    local _, v5 = xpcall(function() --[[ Line: 25 ]]
        -- upvalues: l_Boolean_0 (ref)
        return l_Boolean_0.toJSBoolean(_G.__DEV__);
    end, function() --[[ Line: 27 ]]
        -- upvalues: l_default_0 (ref)
        l_default_0.__DEV__ = true;
        return l_default_0.__DEV__;
    end);
    return v5;
end;
local _, v8 = xpcall(function() --[[ Line: 25 ]]
    -- upvalues: l_Boolean_0 (copy)
    return l_Boolean_0.toJSBoolean(_G.__DEV__);
end, function() --[[ Line: 27 ]]
    -- upvalues: l_default_0 (copy)
    l_default_0.__DEV__ = true;
    return l_default_0.__DEV__;
end);
v0.default = v8;
return v0;