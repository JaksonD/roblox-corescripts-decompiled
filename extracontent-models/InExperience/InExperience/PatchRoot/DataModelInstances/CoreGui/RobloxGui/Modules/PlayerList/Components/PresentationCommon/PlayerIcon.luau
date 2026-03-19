local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v12 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_useLayoutValues_0 = v12.Common.useLayoutValues;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_Parent_1 = l_Parent_0.Parent;
local v16 = require(l_Parent_1.Flags.FFlagPlayerListReduceRerenders);
local l_FFlagUseNewPlayerList_0 = v12.Flags.FFlagUseNewPlayerList;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v19 = v3.PureComponent:extend("PlayerIcon");
v19.validateProps = v7.strictInterface({
    player = v8, 
    layoutOrder = v7.optional(v7.integer), 
    isSmallTouchDevice = v7.optional(v7.boolean), 
    playerIconInfo = v7.strictInterface({
        isPlaceOwner = v7.boolean, 
        avatarIcon = v7.optional(v7.table), 
        specialGroupIcon = v7.optional(v7.table)
    }), 
    playerRelationship = v7.strictInterface({
        isBlocked = v7.boolean, 
        friendStatus = v7.enum(Enum.FriendStatus), 
        isFollowing = v7.boolean, 
        isFollower = v7.boolean
    }), 
    layoutValues = v7.optional(v7.table)
});
local function _(v20, v21) --[[ Line: 54 ]] --[[ Name: getSocialIconImage ]]
    local v22 = v20.FriendIcons[v21.friendStatus];
    if v21.isBlocked then
        return v20.BlockedIcon;
    elseif v22 then
        return v22;
    else
        return nil;
    end;
end;
local function v30(v24, v25, v26, v27) --[[ Line: 66 ]] --[[ Name: getIconImage ]]
    -- upvalues: l_FFlagEnableBlackbirdCheckDev_0 (copy)
    local v28 = v24.FriendIcons[v27.friendStatus];
    local v29 = if v27.isBlocked then v24.BlockedIcon else v28 or nil;
    if v29 then
        return v29;
    elseif v26.isPlaceOwner then
        return v24.PlaceOwnerIcon;
    elseif v24.CustomPlayerIcons[v25.UserId] then
        return v24.CustomPlayerIcons[v25.UserId];
    elseif v26.specialGroupIcon then
        return v26.specialGroupIcon;
    elseif v27.isFollowing then
        return v24.FollowingIcon;
    elseif l_FFlagEnableBlackbirdCheckDev_0 and game:GetEngineFeature("ReadHasRobloxSubscriptionLua") and v25.HasRobloxSubscription then
        return v24.SubscriptionIcon;
    else
        v28 = v24.MembershipIcons[v25.MembershipType];
        if v28 then
            return v28;
        else
            return "";
        end;
    end;
end;
v19.render = function(v31) --[[ Line: 95 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_FFlagUseNewPlayerList_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v30 (copy)
    return l_WithLayoutValues_0(function(v32) --[[ Line: 96 ]]
        -- upvalues: l_FFlagUseNewPlayerList_0 (ref), v31 (copy), v3 (ref), l_ImageSetLabel_0 (ref), v30 (ref)
        if l_FFlagUseNewPlayerList_0 then
            v32 = v31.props.layoutValues;
        end;
        local v33 = v31.props.playerIconInfo and v31.props.playerIconInfo.avatarIcon;
        if v33 == nil then
            v33 = v32.DefaultThumbnail;
        end;
        if v32.IsTenFoot then
            return v3.createElement("ImageLabel", {
                LayoutOrder = v31.props.layoutOrder or 1, 
                Size = v32.PlayerIconBackgroundSize, 
                BackgroundTransparency = 1, 
                Image = v32.PlayerBackgroundImage
            }, {
                v3.createElement("ImageLabel", {
                    Size = v32.PlayerIconSize, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v33, 
                    BorderSizePixel = 0
                })
            });
        elseif v31.props.isSmallTouchDevice then
            return v3.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, v32.PlayerNamePaddingXMobile, 0.5, 0), 
                Size = v32.PlayerIconSizeMobile, 
                BackgroundTransparency = 1, 
                Image = v30(v32, v31.props.player, v31.props.playerIconInfo, v31.props.playerRelationship), 
                BorderSizePixel = 0
            });
        else
            return v3.createElement(l_ImageSetLabel_0, {
                LayoutOrder = v31.props.layoutOrder, 
                Size = v32.PlayerIconSize, 
                BackgroundTransparency = 1, 
                Image = v30(v32, v31.props.player, v31.props.playerIconInfo, v31.props.playerRelationship), 
                BorderSizePixel = 0
            });
        end;
    end);
end;
local function v35(v34) --[[ Line: 151 ]] --[[ Name: mapStateToProps ]]
    return {
        isSmallTouchDevice = v34.displayOptions.isSmallTouchDevice
    };
end;
local function v38(v36) --[[ Line: 157 ]]
    -- upvalues: l_FFlagUseNewPlayerList_0 (copy), l_useLayoutValues_0 (copy), v4 (copy), v19 (copy), v2 (copy)
    local v37 = if l_FFlagUseNewPlayerList_0 then l_useLayoutValues_0() else nil;
    return v4.createElement(v19, v2.Dictionary.join(v36, {
        layoutValues = v37
    }));
end;
if v16 then
    return v4.memo(v5.connect(v35, nil)(if l_FFlagUseNewPlayerList_0 then v38 else v19));
else
    return v5.connect(v35, nil)(if l_FFlagUseNewPlayerList_0 then v38 else v19);
end;