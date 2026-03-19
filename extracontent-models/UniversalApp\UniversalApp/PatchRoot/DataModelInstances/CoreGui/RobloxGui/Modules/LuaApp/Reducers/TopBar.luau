local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Immutable);
local v2 = require(l_Modules_0.LuaApp.Actions.SetTopBarHeight);
local v3 = require(l_Modules_0.LuaApp.Actions.SetStatusBarHeight);
local v4 = require(l_Modules_0.LuaApp.Constants);
return function(v5, v6) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy), v3 (copy)
    v5 = v5 or {
        topBarHeight = v4.TOP_BAR_SIZE, 
        statusBarHeight = 0
    };
    assert(v5, "");
    if v6.type == v2.name then
        if v5.topBarHeight ~= v6.topBarHeight then
            local v7 = {
                topBarHeight = v6.topBarHeight
            };
            return (v1.JoinDictionaries(v5, v7));
        end;
    elseif v6.type == v3.name then
        local v8 = {
            statusBarHeight = v6.statusBarHeight
        };
        v5 = v1.JoinDictionaries(v5, v8);
    end;
    return v5;
end;