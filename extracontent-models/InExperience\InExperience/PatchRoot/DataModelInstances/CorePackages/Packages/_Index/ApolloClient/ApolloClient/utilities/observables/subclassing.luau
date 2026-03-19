local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local l_Observable_0 = require(script.Parent.Observable).Observable;
v0.fixObservableSubclass = function(v4) --[[ Line: 30 ]] --[[ Name: fixObservableSubclass ]]
    -- upvalues: l_Observable_0 (copy)
    local function _(v5) --[[ Line: 32 ]] --[[ Name: set ]]
        -- upvalues: v4 (copy), l_Observable_0 (ref)
        v4[v5] = l_Observable_0;
    end;
    v4["@@species"] = l_Observable_0;
    return v4;
end;
return v0;