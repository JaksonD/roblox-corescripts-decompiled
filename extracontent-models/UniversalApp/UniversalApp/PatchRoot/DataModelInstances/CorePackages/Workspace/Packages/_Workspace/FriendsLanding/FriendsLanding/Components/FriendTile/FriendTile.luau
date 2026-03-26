local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_t_0 = v2.t;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_OpenTypeSupport_0 = l_UIBlox_0.Utility.OpenTypeSupport;
local l_PlayerTile_0 = l_UIBlox_0.App.Tile.PlayerTile;
local l_withLocalization_0 = v2.withLocalization;
local v11 = require(l_Parent_0.UserProfiles);
local v12 = require(l_script_FirstAncestor_0.Friends.userPresenceText);
local v13 = require(l_script_FirstAncestor_0.Friends.userPresenceIcon);
local v14 = require(l_script_FirstAncestor_0.Friends.getCorrectUserPresence);
local l_memoize_0 = v2.memoize;
local v16 = require(script.Parent.createRelevancyInfo);
local v17 = require(l_Parent_0.SocialCommon);
local l_ButtonTypes_0 = require(l_Parent_0.UserList).Enums.ButtonTypes;
local l_ButtonVariant_0 = require(l_Parent_0.Foundation).Enums.ButtonVariant;
local v20 = require(script.Parent.FriendTileWithTrustedIndicator);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_FFlagFriendsPageAlwaysOpenPPV_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageAlwaysOpenPPV;
local l_FFlagFriendsPageUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageUserListEnabled;
local l_FFlagFriendsPageViewBtnEnabled_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageViewBtnEnabled;
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagAddFriendsTileTCIndicatorLabel);
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local v27 = l_Roact_0.PureComponent:extend("FriendTile");
local function v28() --[[ Line: 38 ]]
    return function() --[[ Line: 39 ]]

    end;
end;
v27.validateProps = l_t_0.strictInterface({
    user = l_t_0.table, 
    index = l_t_0.number, 
    openPlayerProfile = l_t_0.optional(l_t_0.callback), 
    openPlayerProfileHandle = l_t_0.optional(l_t_0.callback), 
    pageLoadingTimeReport = l_t_0.optional(l_t_0.callback), 
    createRow = l_t_0.optional(l_t_0.callback), 
    selected = l_t_0.optional(l_t_0.boolean), 
    focusGuiObject = l_t_0.optional(l_t_0.callback), 
    userProfile = l_t_0.optional(l_t_0.table), 
    trustedConnection = l_t_0.optional(l_t_0.boolean), 
    isRobloxSubscriber = l_t_0.optional(l_t_0.boolean), 
    isLuobu = l_t_0.optional(l_t_0.boolean), 
    buttons = l_t_0.optional(l_t_0.array(l_t_0.strictInterface({
        icon = l_t_0.optional(l_t_0.string), 
        onActivated = l_t_0.optional(l_t_0.callback), 
        isSecondary = l_t_0.optional(l_t_0.boolean), 
        isDisabled = l_t_0.optional(l_t_0.boolean)
    }))), 
    isPlayerContextualMenuEnabled = l_t_0.optional(l_t_0.boolean)
});
v27.defaultProps = {
    user = {
        username = ""
    }, 
    openPlayerProfile = v28, 
    isLuobu = false, 
    index = 1, 
    buttons = nil, 
    isPlayerContextualMenuEnabled = false, 
    trustedConnection = false
};
v27.init = function(v29) --[[ Line: 82 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), v16 (copy), l_Roact_0 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (copy), l_FFlagFriendsPageUserListEnabled_0 (copy), v17 (copy)
    v29.state = {
        isFirstRender = true
    };
    v29.makeRelevancyInfo = l_memoize_0(v16);
    v29.playerTileRef = l_Roact_0.createRef();
    v29.openPlayerProfile = if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v29.props.isPlayerContextualMenuEnabled and function(_, _) --[[ Line: 89 ]]
        -- upvalues: v29 (copy)
        local l_user_0 = v29.props.user;
        return v29.props.openPlayerProfile(l_user_0);
    end or function(v33, v34) --[[ Line: 93 ]]
        -- upvalues: v29 (copy)
        local l_user_1 = v29.props.user;
        if v33 and v34 then
            return v29.props.openPlayerProfile(l_user_1.id, v29.props.index, l_user_1, v33, v34);
        else
            return v29.props.openPlayerProfile(l_user_1.id, v29.props.index, l_user_1);
        end;
    end;
    v29.openPlayerProfileForRelevancyInfo = if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else function(v36, v37) --[[ Line: 104 ]]
        -- upvalues: v29 (copy)
        return function() --[[ Line: 105 ]]
            -- upvalues: v29 (ref), v36 (copy), v37 (copy)
            return v29.openPlayerProfile(v36, v37);
        end;
    end;
    v29.checkAndSetSelected = function() --[[ Line: 110 ]]
        -- upvalues: v29 (copy)
        if v29.props.selected and v29.props.focusGuiObject then
            local v38 = v29.playerTileRef:getValue();
            if v38 then
                v29.props.focusGuiObject(v38);
            end;
        end;
    end;
    v29.getPresenceType = l_FFlagFriendsPageUserListEnabled_0 and function(v39) --[[ Line: 120 ]]
        -- upvalues: v17 (ref)
        local v40 = tostring(v39 or "");
        return string.gsub(v40, "PresenceType%.", "") or v17.Enums.PresenceTypes.Offline;
    end or nil;
    v29.openProfilePeekViewHandle = l_FFlagFriendsPageUserListEnabled_0 and function() --[[ Line: 127 ]]
        -- upvalues: v29 (copy)
        return v29.props.openPlayerProfileHandle(v29.props.user.id, v29.props.index);
    end or nil;
end;
v27.didMount = function(v41) --[[ Line: 133 ]] --[[ Name: didMount ]]
    if v41.props.pageLoadingTimeReport then
        v41.props.pageLoadingTimeReport();
    end;
    v41.checkAndSetSelected();
end;
v27.render = function(v42) --[[ Line: 141 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), v12 (copy), v13 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagFriendsPageUserListEnabled_0 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (copy), l_FFlagFriendsPageViewBtnEnabled_0 (copy), l_ButtonTypes_0 (copy), l_ButtonVariant_0 (copy), v11 (copy), v25 (copy), l_React_0 (copy), v20 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_Roact_0 (copy), l_PlayerTile_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local l_user_2 = v42.props.user;
    local v44 = v14(l_user_2);
    local v45 = v12[v44];
    local v46 = v13[v44];
    local v47 = nil;
    local v48 = nil;
    local v49 = v42.playerTileRef:getValue();
    if v49 then
        v47 = v49.AbsoluteSize;
        v48 = v49.AbsolutePosition;
    else
        v42:setState({
            isFirstRender = false
        });
    end;
    return l_withStyle_0(function(v50) --[[ Line: 159 ]]
        -- upvalues: l_withLocalization_0 (ref), v45 (copy), l_FFlagFriendsPageUserListEnabled_0 (ref), v42 (copy), l_user_2 (copy), v46 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (ref), v47 (ref), v48 (ref), v44 (copy), l_FFlagFriendsPageViewBtnEnabled_0 (ref), l_ButtonTypes_0 (ref), l_ButtonVariant_0 (ref), v11 (ref), v25 (ref), l_React_0 (ref), v20 (ref), l_FFlagEnableBlackbirdCheckDev_0 (ref), l_Roact_0 (ref), l_PlayerTile_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref)
        return l_withLocalization_0({
            presenceText = v45, 
            accountDeletedText = "Feature.Friends.Action.AccountDeleted", 
            trustedText = "Feature.Friends.TrustedConnection.Label.Trusted"
        })(function(v51) --[[ Line: 164 ]]
            -- upvalues: l_FFlagFriendsPageUserListEnabled_0 (ref), v42 (ref), l_user_2 (ref), v46 (ref), l_FFlagFriendsPageAlwaysOpenPPV_0 (ref), v47 (ref), v48 (ref), v50 (copy), v44 (ref), l_FFlagFriendsPageViewBtnEnabled_0 (ref), l_ButtonTypes_0 (ref), l_ButtonVariant_0 (ref), v11 (ref), v25 (ref), l_React_0 (ref), v20 (ref), l_FFlagEnableBlackbirdCheckDev_0 (ref), l_Roact_0 (ref), l_PlayerTile_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref)
            local v52 = v51.presenceText or nil;
            local l_accountDeletedText_0 = v51.accountDeletedText;
            local l_trustedText_0 = v51.trustedText;
            if l_FFlagFriendsPageUserListEnabled_0 then
                local v55 = v42.makeRelevancyInfo(l_user_2, v52, v46, if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v42.openPlayerProfileForRelevancyInfo(v47, v48), v50.Theme, v42.props.index, v42.props.isLuobu, v50.Font, l_accountDeletedText_0, true);
                return v42.props.createRow({
                    onRowActivated = v42.openProfilePeekViewHandle, 
                    contextualInfo = v55 and {
                        text = v55.text, 
                        icon = v55.icon
                    }, 
                    presence = v42.getPresenceType(v44), 
                    primaryCta = if l_FFlagFriendsPageViewBtnEnabled_0 then {
                        type = l_ButtonTypes_0.View, 
                        onActivated = v42.openProfilePeekViewHandle, 
                        variant = l_ButtonVariant_0.Standard
                    } else nil
                });
            else
                local v56 = nil;
                local v57 = nil;
                if v42.props.userProfile then
                    v56 = v42.props.userProfile.names.combinedName;
                    v57 = v11.Formatters.formatUsername(v42.props.userProfile.names.username);
                    l_user_2.isDeleted = v42.props.userProfile.isDeleted;
                end;
                local v58 = if v56 then v56 else l_user_2.displayName;
                local v59 = if v57 then v57 else "@" .. l_user_2.username;
                local v60 = if not v25 then (if v42.props.trustedConnection then l_trustedText_0 .. " \226\128\162 " else "") .. v59 else v59;
                local v61 = if not v56 then nil else v42.makeRelevancyInfo(l_user_2, v52, v46, if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v42.openPlayerProfileForRelevancyInfo(v47, v48), v50.Theme, v42.props.index, v42.props.isLuobu, v50.Font, l_accountDeletedText_0, true);
                local v62 = v42.props.userProfile and v42.props.userProfile.isVerified;
                if v25 then
                    return l_React_0.createElement(v20, {
                        user = l_user_2, 
                        userPresence = v44, 
                        title = v58, 
                        subtitle = v60, 
                        relevancyInfo = v61, 
                        index = v42.props.index, 
                        openPlayerProfile = if l_FFlagFriendsPageAlwaysOpenPPV_0 then v42.props.openPlayerProfile(l_user_2.id, v42.props.index) else v42.openPlayerProfile(v47, v48, v58, v60, v61), 
                        playerTileRef = v42.playerTileRef, 
                        buttons = v42.props.buttons, 
                        isTrustedConnection = v42.props.trustedConnection, 
                        isVerified = v62, 
                        isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v42.props.isRobloxSubscriber else nil
                    });
                else
                    return l_Roact_0.createElement(l_PlayerTile_0, {
                        tileSize = UDim2.fromScale(1, 1), 
                        thumbnail = l_user_2.thumbnail, 
                        title = v58, 
                        subtitle = v60, 
                        hasVerifiedBadge = v62, 
                        onActivated = if l_FFlagFriendsPageAlwaysOpenPPV_0 then v42.props.openPlayerProfile(l_user_2.id, v42.props.index) else v42.openPlayerProfile(v47, v48, v58, v60, v61), 
                        forwardedRef = v42.playerTileRef, 
                        buttons = v42.props.buttons, 
                        Selectable = true, 
                        openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil, 
                        relevancyInfo = v61
                    });
                end;
            end;
        end);
    end);
end;
return v27;