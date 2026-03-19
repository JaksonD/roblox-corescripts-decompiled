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
local v11 = game:DefineFastFlag("FixMorePageThirdPartyUserNameBug", false);
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local _ = nil;
local v17 = nil;
local v18 = nil;
if v10 then
    v12 = require(l_Modules_0.LuaApp.Components.More.ThirdPartyLinkedUserInfoWidget);
    v13 = game:GetService("ThirdPartyUserService");
    v14 = game:GetService("Players");
    v15 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
    v17 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.isPlayerVerified;
    v18 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
end;
return function() --[[ Line: 27 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), v7 (copy), v6 (copy), l_useSelector_0 (copy), v10 (copy), v11 (copy), v18 (ref), v13 (ref), v14 (ref), v17 (ref), v15 (ref), v1 (copy), v12 (ref), v8 (copy), v9 (copy)
    local v19 = l_useDesignTokens_0();
    local l_Title_0 = v19.Semantic.Typography.Title;
    local l_Emphasis_0 = v19.Semantic.Color.Text.Emphasis;
    local l_Space_400_0 = v19.Global.Space_400;
    local l_TitleHeight_0 = v19.LuaApps.More.TitleHeight;
    local l_UserIconSize_0 = v19.LuaApps.More.UserIconSize;
    local l_UsernameTextFont_0 = v19.LuaApps.More.UsernameTextFont;
    local l_UsernameTextStyle_0 = v19.LuaApps.More.UsernameTextStyle;
    local v27 = l_useLocalization_0({
        title = v7[v6.More]
    });
    local v29 = l_useSelector_0(function(v28) --[[ Line: 41 ]]
        return v28.Users[v28.LocalUserId];
    end);
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    if v10 then
        local v35 = if v11 then v18(function(v34) --[[ Line: 48 ]]
            return v34.getShowDisplayName();
        end) else nil;
        if v13 and v13:IsSingleSignOnSupported() then
            v32 = v13:GetUserPlatformName();
        end;
        if v29 then
            if not v11 then
                v35 = v18(function(v36) --[[ Line: 59 ]]
                    return v36.getShowDisplayName();
                end);
            end;
            v30 = v29.id;
            v31 = if v35 then v29.displayName else v29.name;
            local l_LocalPlayer_0 = v14.LocalPlayer;
            if l_LocalPlayer_0 then
                v33 = if v17({
                    DisplayName = l_LocalPlayer_0.DisplayName, 
                    Name = l_LocalPlayer_0.Name, 
                    HasVerifiedBadge = l_LocalPlayer_0.HasVerifiedBadge, 
                    UserId = l_LocalPlayer_0.UserId
                }) then v15.emoji.verified else if v29.membership == Enum.MembershipType.Premium then v15.emoji.premium else "";
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
                Text = v27.title, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                Font = l_Title_0.Font, 
                TextSize = l_Title_0.FontSize, 
                TextColor3 = l_Emphasis_0.Color3, 
                TextTransparency = l_Emphasis_0.Transparency
            })
        }), 
        UserInfo = if v10 then v1.createElement(v12, {
            layoutOrder = 2, 
            userId = v30, 
            userName = v31, 
            userBadgeEmoji = v33, 
            thirdPartyUserName = v32, 
            thirdPartyPlatformIcon = "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png"
        }) else v1.createElement(v8, {
            layoutOrder = 2, 
            localUserModel = v29, 
            onActivated = nil, 
            selectable = not v9() and nil, 
            sideMargin = v19.Global.Space_150, 
            thumbnailSize = l_UserIconSize_0, 
            usernameTextFont = l_UsernameTextFont_0, 
            usernameTextStyle = l_UsernameTextStyle_0
        })
    });
end;