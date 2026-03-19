local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_Modules_0.LuaApp.AppPage);
local _ = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_Images_0 = v2.App.ImageSet.Images;
return {
    tabs = require(l_Modules_0.LuaApp.Components.AppNav.GetIABottomBarItems)(), 
    options = {
        {
            titleLocalizationKey = "Feature.Catalog.Label.Search", 
            page = v3.SearchPage, 
            icon = l_Images_0["icons/common/search"], 
            actionType = nil
        }, 
        {
            titleLocalizationKey = "Feature.Home.Robux", 
            page = v3.PurchaseRobux, 
            icon = l_Images_0["icons/common/goldrobux"], 
            actionType = nil
        }, 
        {
            titleLocalizationKey = "CommonUI.Features.Label.More", 
            page = v3.More, 
            icon = l_Images_0["icons/common/more"], 
            actionType = nil
        }
    }
};