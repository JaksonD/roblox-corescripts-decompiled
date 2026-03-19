local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_LoadableImage_0 = v4.App.Loading.LoadableImage;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v8 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_isPlayerVerified_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.isPlayerVerified;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_FFlagLuaAppMoveProfileIntoTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar;
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagFixUserInfoSelection);
local v14 = v3.PureComponent:extend("UserWidget");
local v15 = {
    [Enum.MembershipType.None] = 0, 
    [Enum.MembershipType.BuildersClub] = 24, 
    [Enum.MembershipType.TurboBuildersClub] = 24, 
    [Enum.MembershipType.OutrageousBuildersClub] = 24, 
    [Enum.MembershipType.Premium] = 36
};
v14.renderUserAvatar = function(_, v17, v18, v19, v20) --[[ Line: 35 ]] --[[ Name: renderUserAvatar ]]
    -- upvalues: l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), v3 (copy), l_LoadableImage_0 (copy)
    local v21 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v20.id);
    return v3.createElement(l_LoadableImage_0, {
        Size = UDim2.new(0, v17, 0, v17), 
        LayoutOrder = 1, 
        BackgroundColor3 = v18, 
        BackgroundTransparency = v19, 
        Image = v21, 
        useShimmerAnimationWhileLoading = true, 
        cornerRadius = UDim.new(0.5, 0), 
        shouldHandleReloads = true
    });
end;
v14.render = function(v22) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), v15 (copy), l_Text_0 (copy), v3 (copy), v8 (copy), l_isPlayerVerified_0 (copy), l_Players_0 (copy), v13 (copy), l_withStyle_0 (copy)
    local l_localUserModel_0 = v22.props.localUserModel;
    local l_onActivated_0 = v22.props.onActivated;
    local l_layoutOrder_0 = v22.props.layoutOrder;
    local l_sideMargin_0 = v22.props.sideMargin;
    local v27 = if l_FFlagLuaAppMoveProfileIntoTopBar_0 then v22.props.shouldOnlyDisplayAvatarIcon else nil;
    local v28 = if l_FFlagLuaAppMoveProfileIntoTopBar_0 then v22.props.onlyAvatarButtonRef else nil;
    if l_localUserModel_0 == nil then
        return nil;
    else
        local v29 = if v22.props.thumbnailSize then v22.props.thumbnailSize else 36;
        local l_name_0 = l_localUserModel_0.name;
        if v22.props.enableDisplayNamePolicy then
            l_name_0 = l_localUserModel_0.displayName;
        end;
        local l_membership_0 = l_localUserModel_0.membership;
        return l_withStyle_0(function(v32) --[[ Line: 79 ]]
            -- upvalues: v22 (copy), l_membership_0 (copy), v15 (ref), l_Text_0 (ref), l_name_0 (ref), v3 (ref), v8 (ref), l_isPlayerVerified_0 (ref), l_Players_0 (ref), l_onActivated_0 (copy), l_layoutOrder_0 (copy), l_sideMargin_0 (copy), v29 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (ref), v28 (copy), v13 (ref), v27 (copy), l_localUserModel_0 (copy)
            local l_Font_0 = v32.Font;
            local l_Theme_0 = v32.Theme;
            local v35 = if v22.props.usernameTextFont then v22.props.usernameTextFont else l_Font_0.Header1;
            local v36 = if v22.props.usernameTextStyle then v22.props.usernameTextStyle else l_Theme_0.TextEmphasis;
            local l_Font_1 = v35.Font;
            local v38 = if v35.FontSize then v35.FontSize else l_Font_0.BaseSize * v35.RelativeSize;
            local v39 = l_membership_0 ~= nil and v15[l_membership_0] or 0;
            local l_Color_0 = v36.Color;
            local l_Transparency_0 = v36.Transparency;
            local l_Color_1 = l_Theme_0.PlaceHolder.Color;
            local l_Transparency_1 = l_Theme_0.PlaceHolder.Transparency;
            local v44 = l_Text_0.GetTextBounds(l_name_0, l_Font_1, v38, Vector2.new(10000, 10000));
            local v45 = v3.createElement("Frame", {
                Size = UDim2.new(0, v44.X + v39 + 4, 0, v44.Y), 
                AutomaticSize = Enum.AutomaticSize.None, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                HorizontalLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 4)
                }), 
                Username = v3.createElement(v8.EmojiWrapper, {
                    size = UDim2.fromScale(0, 0), 
                    emoji = if l_isPlayerVerified_0(l_Players_0.LocalPlayer) then v8.emoji.verified else if l_membership_0 == Enum.MembershipType.Premium then v8.emoji.premium else "", 
                    color = if l_membership_0 == Enum.MembershipType.Premium then l_Theme_0.TextEmphasis.Color else nil, 
                    layoutOrder = 2, 
                    onActivated = l_onActivated_0
                }, {
                    UsernameText = v3.createElement("TextButton", {
                        Size = UDim2.new(0, v44.X, 0, v44.Y), 
                        BackgroundTransparency = 1, 
                        TextSize = v38, 
                        TextColor3 = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        TextTruncate = Enum.TextTruncate.None, 
                        Font = l_Font_1, 
                        Text = l_name_0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        [v3.Event.Activated] = l_onActivated_0, 
                        Selectable = l_onActivated_0 ~= nil
                    })
                })
            });
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = l_layoutOrder_0, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_sideMargin_0), 
                    PaddingRight = UDim.new(0, l_sideMargin_0)
                }), 
                UsernameAvatarFrame = v3.createElement("TextButton", {
                    Size = UDim2.new(0, v29, 0, v29), 
                    BackgroundTransparency = 1, 
                    Text = "", 
                    LayoutOrder = 1, 
                    [v3.Event.Activated] = l_onActivated_0, 
                    [v3.Ref] = if l_FFlagLuaAppMoveProfileIntoTopBar_0 then v28 else nil, 
                    Selectable = if v13() then v22.props.selectable else nil
                }, if l_FFlagLuaAppMoveProfileIntoTopBar_0 and v27 then {
                    UserAvatar = v22:renderUserAvatar(v29, l_Color_1, l_Transparency_1, l_localUserModel_0)
                } else {
                    HorizontalLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 12)
                    }), 
                    UserAvatar = v22:renderUserAvatar(v29, l_Color_1, l_Transparency_1, l_localUserModel_0); 
                    v45
                })
            });
        end);
    end;
end;
return l_RoactAppPolicy_0.connect(function(v46, _) --[[ Line: 186 ]]
    return {
        enableDisplayNamePolicy = v46.getShowDisplayName()
    };
end)(v14);