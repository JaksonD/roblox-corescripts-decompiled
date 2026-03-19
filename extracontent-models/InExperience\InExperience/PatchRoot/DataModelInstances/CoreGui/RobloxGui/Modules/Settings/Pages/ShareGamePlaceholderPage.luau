local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v3 = require(l_ShareGame_0.Constants);
local l_ClearShareInviteLink_0 = require(l_CorePackages_0.Workspace.Packages.NotificationsCommon).ReducerDependencies.ShareLinksRodux.Actions.ClearShareInviteLink;
local v5 = require(l_ShareGame_0.Actions.OpenPage);
local v6 = require(l_ShareGame_0.Actions.ClosePage);
local v7 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local l_FFlagEnableConsoleExpControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls;
local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
l_NewPage_0.TabHeader = nil;
l_NewPage_0.PageListLayout.Parent = nil;
l_NewPage_0.ShouldShowBottomBar = false;
l_NewPage_0.ShouldShowHubBar = false;
l_NewPage_0.IsPageClipped = false;
l_NewPage_0.Page.Name = "ShareGameDummy";
l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
l_NewPage_0.ConnectHubToApp = function(_, v11, v12) --[[ Line: 37 ]] --[[ Name: ConnectHubToApp ]]
    -- upvalues: l_NewPage_0 (copy), v3 (copy), v5 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v7 (copy), l_RobloxGui_0 (copy), v6 (copy)
    l_NewPage_0:SetHub(v11);
    v12.store.changed:connect(function(v13, v14) --[[ Line: 40 ]]
        -- upvalues: v3 (ref), l_NewPage_0 (ref)
        local l_Page_0 = v13.Page;
        local l_IsOpen_0 = v14.Page.IsOpen;
        if l_Page_0.Route == v3.PageRoute.SHARE_GAME and l_IsOpen_0 and not l_Page_0.IsOpen then
            l_NewPage_0.HubRef:PopMenu(nil, true);
        end;
    end);
    l_NewPage_0.Displayed.Event:Connect(function() --[[ Line: 52 ]]
        -- upvalues: v12 (copy), v5 (ref), v3 (ref), l_FFlagEnableConsoleExpControls_0 (ref), v7 (ref), l_RobloxGui_0 (ref)
        if not v12.store:getState().Page.IsOpen then
            v12.store:dispatch(v5(v3.PageRoute.SETTINGS_HUB));
            if l_FFlagEnableConsoleExpControls_0 and v7 then
                require(l_RobloxGui_0.Modules.Chrome.Service):setHideShortcutBar("ShareGamePlaceholderPage", true);
            end;
        end;
    end);
    l_NewPage_0.Hidden.Event:Connect(function() --[[ Line: 64 ]]
        -- upvalues: v12 (copy), v6 (ref), v3 (ref), l_FFlagEnableConsoleExpControls_0 (ref), v7 (ref), l_RobloxGui_0 (ref)
        if v12.store:getState().Page.IsOpen then
            v12.store:dispatch(v6(v3.PageRoute.SETTINGS_HUB));
            if l_FFlagEnableConsoleExpControls_0 and v7 then
                require(l_RobloxGui_0.Modules.Chrome.Service):setHideShortcutBar("ShareGamePlaceholderPage", false);
            end;
        end;
    end);
    v12.store:dispatch(v6(v3.PageRoute.SETTINGS_HUB));
end;
l_NewPage_0.ClearShareInviteLink = function(_, v18) --[[ Line: 81 ]] --[[ Name: ClearShareInviteLink ]]
    -- upvalues: l_ClearShareInviteLink_0 (copy)
    if v18.store:getState().ShareLinks.Invites.ShareInviteLink ~= nil then
        v18.store:dispatch(l_ClearShareInviteLink_0());
    end;
end;
return l_NewPage_0;