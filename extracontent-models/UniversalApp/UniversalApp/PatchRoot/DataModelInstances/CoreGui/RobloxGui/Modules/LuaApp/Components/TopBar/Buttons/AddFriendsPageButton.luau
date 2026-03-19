local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRouteName_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useRouteName;
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsTopBar);
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToAddFriendsPage);
local v7 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v8.App.ImageSet.Images;
local l_UtilityActionIcon_0 = v8.App.Button.UtilityActionIcon;
local v11 = l_Images_0["icons/actions/friends/friendAdd"];
return function(v12) --[[ Line: 29 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRouteName_0 (copy), v7 (copy), v5 (copy), v6 (copy), v2 (copy), l_UtilityActionIcon_0 (copy), v11 (copy)
    local v13 = l_useDispatch_0();
    local v14 = l_useRouteName_0();
    local v15 = v7(v5);
    local function v16() --[[ Line: 34 ]]
        -- upvalues: v12 (copy), v13 (copy), v6 (ref), v15 (copy), v14 (copy)
        if v12.isSearching then
            return;
        else
            v13(v6());
            v15.reportAddFriendsButtonClick(v14);
            return;
        end;
    end;
    v2.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v12 (copy)
        local v17 = not v12.isSearching;
        v12.setVisible(v17);
    end, {
        v12.isSearching, 
        v12.setVisible
    });
    return v2.createElement(l_UtilityActionIcon_0, {
        icon = v11, 
        onActivated = v16, 
        ref = v12.buttonRef
    });
end;