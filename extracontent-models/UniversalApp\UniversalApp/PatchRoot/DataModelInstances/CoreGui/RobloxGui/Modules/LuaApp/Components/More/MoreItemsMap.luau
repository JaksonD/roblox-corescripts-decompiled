local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Components.More.Config.MorePageSettings);
local _ = require(l_Modules_0.LuaApp.Components.More.MoreItems.Types);
local v5 = require(l_Modules_0.LuaApp.Components.More.MoreItems.SwitchProfileSection);
local v6 = require(l_Modules_0.LuaApp.Components.More.MoreItems.DeviceSettingsSection);
local v7 = require(l_Modules_0.LuaApp.Components.More.MoreItems.LicensingSection);
local v8 = require(l_Modules_0.LuaApp.Components.More.MoreItems.VersionSection);
local v9 = require(l_Modules_0.LuaApp.Components.More.MoreItems.AccountSettingsInfoItem);
local v10 = require(l_Modules_0.LuaApp.Components.More.MoreItems.LinkButtonItem);
local v11 = {
    [v3.ItemType.Settings_SwitchProfileSection] = v5, 
    [v3.ItemType.Settings_DeviceSettingsSection] = v6, 
    [v3.ItemType.About_LicensingSection] = v7, 
    [v3.ItemType.About_VersionSection] = v8
};
local v12 = {
    [v3.ItemType.Settings_AccountSettingsInfo] = v9, 
    [v3.ItemType.About_TermsOfService] = v10, 
    [v3.ItemType.About_Privacy] = v10
};
return {
    getSectionComponent = function(v13) --[[ Line: 35 ]]
        -- upvalues: v11 (copy)
        return v11[v13];
    end, 
    getItemComponent = function(v14) --[[ Line: 39 ]]
        -- upvalues: v12 (copy)
        return v12[v14];
    end
};