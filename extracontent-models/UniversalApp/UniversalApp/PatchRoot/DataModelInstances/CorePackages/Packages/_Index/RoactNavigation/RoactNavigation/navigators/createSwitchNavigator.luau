local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.createNavigator);
local v2 = require(l_Parent_0.routers.SwitchRouter);
local v3 = require(l_Parent_0.views.SwitchView.SwitchView);
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    if v5 == nil then
        v5 = {};
    end;
    local v6 = v2(v4, v5);
    return v1(v3, v6, v5);
end;