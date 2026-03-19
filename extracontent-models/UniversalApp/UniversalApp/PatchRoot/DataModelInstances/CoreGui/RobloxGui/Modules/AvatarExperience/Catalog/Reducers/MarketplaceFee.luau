local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.Common.Models.MarketplaceFeeInfo);
local v5 = require(l_CorePackages_0.Packages.Rodux);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetMarketplaceFee);
return v5.createReducer({}, {
    [v6.name] = function(v7, v8) --[[ Line: 18 ]]
        -- upvalues: v4 (copy), v3 (copy)
        local v9 = v4.fromGetResaleTaxRate(v8.marketplaceFeeInfo);
        return v3.Dictionary.join(v7, v9);
    end
});