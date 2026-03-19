local l_LuaApp_0 = game:GetService("CoreGui").RobloxGui.Modules.LuaApp;
local v1 = require(l_LuaApp_0.Actions.UserAccess.SetUserAccessRestrictionDetail);
return function(v2, v3) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    v2 = v2 or {};
    if v3.type == v1.name then
        v2 = {
            restrictionDetail = v3.restrictionDetail
        };
    end;
    return v2;
end;