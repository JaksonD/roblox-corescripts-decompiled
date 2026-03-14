local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.AppPage);
local v7 = require(l_Modules_0.LuaApp.AppPageLocalizationKeys);
local v8 = require(l_Modules_0.LuaApp.Components.Home.UserInfoWidget);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagFixUserInfoSelection);
local v10 = game:DefineFastFlag("DisplayMorePageThirdPartyUserName2", false);
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local _ = nil;
local v16 = nil;
local v17 = nil;
if v10 then
    v11 = require(l_Modules_0.LuaApp.Components.More.ThirdPartyLinkedUserInfoWidget);
    v12 = game:GetService("ThirdPartyUserService");
    v13 = game:GetService("Players");
    v14 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
    v16 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.isPlayerVerified;
    v17 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
end;
return function() --[[ Line: 26 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), v7 (copy), v6 (copy), l_useSelector_0 (copy), v10 (copy), v12 (ref), v17 (ref), v13 (ref), v16 (ref), v14 (ref), v1 (copy), v11 (ref), v8 (copy), v9 (copy)
    local v18 = l_useDesignTokens_0();
    local l_Title_0 = v18.Semantic.Typography.Title;
    local l_Emphasis_0 = v18.Semantic.Color.Text.Emphasis;
    local l_Space_400_0 = v18.Global.Space_400;
    local l_TitleHeight_0 = v18.LuaApps.More.TitleHeight;
    local l_UserIconSize_0 = v18.LuaApps.More.UserIconSize;
    local l_UsernameTextFont_0 = v18.LuaApps.More.UsernameTextFont;
    local l_UsernameTextStyle_0 = v18.LuaApps.More.UsernameTextStyle;
    local v26 = l_useLocalization_0({
        title = v7[v6.More]
    });
    local v28 = l_useSelector_0(function(v27) --[[ Line: 40 ]]
        return v27.Users[v27.LocalUserId];
    end);
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    if v10 then
        if v12 and v12:IsSingleSignOnSupported() then
            v31 = v12:GetUserPlatformName();
        end;
        if v28 then
            local v34 = v17(function(v33) --[[ Line: 51 ]]
                return v33.getShowDisplayName();
            end);
            v29 = v28.id;
            v30 = if v34 then v28.displayName else v28.name;
            local l_LocalPlayer_0 = v13.LocalPlayer;
            if l_LocalPlayer_0 then
                v32 = if v16({
                    DisplayName = l_LocalPlayer_0.DisplayName, 
                    Name = l_LocalPlayer_0.Name, 
                    HasVerifiedBadge = l_LocalPlayer_0.HasVerifiedBadge, 
                    UserId = l_LocalPlayer_0.UserId
                }) then v14.emoji.verified else if v28.membership == Enum.MembershipType.Premium then v14.emoji.premium else "";
            end;
        end;
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_Space_400_0)
        }), 
        TitleFrame = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_TitleHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            Title = v1.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = v26.title, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Font = l_Title_0.Font, 
                TextSize = l_Title_0.FontSize, 
                TextColor3 = l_Emphasis_0.Color3, 
                TextTransparency = l_Emphasis_0.Transparency
            })
        }), 
        UserInfo = if v10 then v1.createElement(v11, {
            layoutOrder = 2, 
            userId = v29, 
            userName = v30, 
            userBadgeEmoji = v32, 
            thirdPartyUserName = v31, 
            thirdPartyPlatformIcon = "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png"
        }) else v1.createElement(v8, {
            layoutOrder = 2, 
            localUserModel = v28, 
            onActivated = nil, 
            selectable = not v9() and nil, 
            sideMargin = v18.Global.Space_150, 
            thumbnailSize = l_UserIconSize_0, 
            usernameTextFont = l_UsernameTextFont_0, 
            usernameTextStyle = l_UsernameTextStyle_0
        })
    });
end;