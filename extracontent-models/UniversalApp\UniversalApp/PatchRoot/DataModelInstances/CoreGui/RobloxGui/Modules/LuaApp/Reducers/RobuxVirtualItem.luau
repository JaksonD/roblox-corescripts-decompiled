local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Actions.Economy.SetShowBuyRobuxButtonBadge);
local v3 = require(l_Modules_0.LuaApp.Actions.Economy.SetBuyRobuxButtonClicked);
local v4 = require(l_Modules_0.LuaApp.Actions.Economy.SetHasFetchedRobuxBadge);
local v5 = require(l_CorePackages_0.Packages.Cryo);
return function(v6, v7) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v4 (copy)
    v6 = v6 or {
        showBuyRobuxButtonBadge = false, 
        buyRobuxButtonClicked = false, 
        hasFetchedRobuxBadge = false
    };
    assert(v6, "");
    if v7.type == v2.name then
        return v5.Dictionary.join(v6, {
            showBuyRobuxButtonBadge = v7.showBuyRobuxButtonBadge
        });
    elseif v7.type == v3.name then
        return v5.Dictionary.join(v6, {
            buyRobuxButtonClicked = v7.buyRobuxButtonClicked
        });
    elseif v7.type == v4.name then
        return v5.Dictionary.join(v6, {
            hasFetchedRobuxBadge = v7.hasFetchedRobuxBadge
        });
    else
        return v6;
    end;
end;