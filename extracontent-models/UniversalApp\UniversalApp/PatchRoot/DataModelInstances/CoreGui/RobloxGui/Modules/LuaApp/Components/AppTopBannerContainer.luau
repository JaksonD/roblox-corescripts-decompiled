local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.ReactRoblox);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_AppTopBanner_0 = require(l_CorePackages_0.Workspace.Packages.AppTopBanner).AppTopBanner;
local l_AppTopBannerType_0 = require(l_CorePackages_0.Workspace.Packages.AppTopBanner).Enums.AppTopBannerType;
local l_DisableAppTopBanner_0 = require(l_CorePackages_0.Workspace.Packages.AppTopBanner).Actions.DisableAppTopBanner;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v10 = require(l_Modules_0.LuaApp.Hooks.usePageNavigationOptions);
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local v12 = {
    [l_AppTopBannerType_0.None] = nil, 
    [l_AppTopBannerType_0.ActiveSquad] = require(l_CorePackages_0.Workspace.Packages.Squads).SquadTopBanner
};
return v2.memo(function(v13) --[[ Line: 26 ]] --[[ Name: AppTopBannerContainer ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v10 (copy), v2 (copy), l_DisableAppTopBanner_0 (copy), v3 (copy), v11 (copy), l_AppTopBanner_0 (copy), v12 (copy), l_CoreGui_0 (copy)
    local v14 = l_useDispatch_0();
    local v16 = l_useSelector_0(function(v15) --[[ Line: 28 ]]
        return v15.TopBar.statusBarHeight;
    end);
    local v18 = l_useSelector_0(function(v17) --[[ Line: 32 ]]
        return v17.GlobalGuiInset;
    end);
    local v19 = v10();
    v2.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v19 (copy), v14 (copy), l_DisableAppTopBanner_0 (ref)
        local v20 = if v19 and v19.rootPageOptions then v19.rootPageOptions.disableAppTopBanner == true else false;
        local v21 = if v19 then v19.disableAppTopBanner == true else false;
        v14(l_DisableAppTopBanner_0(v20 or v21));
    end, {
        v19
    });
    return v3.createPortal({
        AppTopBannerScreen = v2.createElement("ScreenGui", {
            Enabled = true, 
            DisplayOrder = v13.displayOrder, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            ScreenInsets = if v11() then Enum.ScreenInsets.None else nil
        }, {
            AppTopBannerContainer = v2.createElement("Frame", {
                Size = UDim2.new(1, if v11() then -v18.left else 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0, if v11() then v18.left else 0, 0, v11() and 0 or -v18.top), 
                BackgroundTransparency = 1
            }, {
                AppTopBanner = v2.createElement(l_AppTopBanner_0, {
                    contentMaps = v12, 
                    deviceStatusBarHeight = v16
                })
            })
        })
    }, l_CoreGui_0);
end);