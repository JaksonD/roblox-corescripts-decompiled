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
local l_FFlagFriendsPageViewBtnWidth_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageViewBtnWidth;
local v28 = l_Roact_0.PureComponent:extend("FriendTile");
local function v29() --[[ Line: 42 ]]
    return function() --[[ Line: 43 ]]

    end;
end;
v28.validateProps = l_t_0.strictInterface({
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
v28.defaultProps = {
    user = {
        username = ""
    }, 
    openPlayerProfile = v29, 
    isLuobu = false, 
    index = 1, 
    buttons = nil, 
    isPlayerContextualMenuEnabled = false, 
    trustedConnection = false
};
v28.init = function(v30) --[[ Line: 86 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), v16 (copy), l_Roact_0 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (copy), l_FFlagFriendsPageUserListEnabled_0 (copy), v17 (copy)
    v30.state = {
        isFirstRender = true
    };
    v30.makeRelevancyInfo = l_memoize_0(v16);
    v30.playerTileRef = l_Roact_0.createRef();
    v30.openPlayerProfile = if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v30.props.isPlayerContextualMenuEnabled and function(_, _) --[[ Line: 93 ]]
        -- upvalues: v30 (copy)
        local l_user_0 = v30.props.user;
        return v30.props.openPlayerProfile(l_user_0);
    end or function(v34, v35) --[[ Line: 97 ]]
        -- upvalues: v30 (copy)
        local l_user_1 = v30.props.user;
        if v34 and v35 then
            return v30.props.openPlayerProfile(l_user_1.id, v30.props.index, l_user_1, v34, v35);
        else
            return v30.props.openPlayerProfile(l_user_1.id, v30.props.index, l_user_1);
        end;
    end;
    v30.openPlayerProfileForRelevancyInfo = if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else function(v37, v38) --[[ Line: 108 ]]
        -- upvalues: v30 (copy)
        return function() --[[ Line: 109 ]]
            -- upvalues: v30 (ref), v37 (copy), v38 (copy)
            return v30.openPlayerProfile(v37, v38);
        end;
    end;
    v30.checkAndSetSelected = function() --[[ Line: 114 ]]
        -- upvalues: v30 (copy)
        if v30.props.selected and v30.props.focusGuiObject then
            local v39 = v30.playerTileRef:getValue();
            if v39 then
                v30.props.focusGuiObject(v39);
            end;
        end;
    end;
    v30.getPresenceType = l_FFlagFriendsPageUserListEnabled_0 and function(v40) --[[ Line: 124 ]]
        -- upvalues: v17 (ref)
        local v41 = tostring(v40 or "");
        return string.gsub(v41, "PresenceType%.", "") or v17.Enums.PresenceTypes.Offline;
    end or nil;
    v30.openProfilePeekViewHandle = l_FFlagFriendsPageUserListEnabled_0 and function() --[[ Line: 131 ]]
        -- upvalues: v30 (copy)
        return v30.props.openPlayerProfileHandle(v30.props.user.id, v30.props.index);
    end or nil;
end;
v28.didMount = function(v42) --[[ Line: 137 ]] --[[ Name: didMount ]]
    if v42.props.pageLoadingTimeReport then
        v42.props.pageLoadingTimeReport();
    end;
    v42.checkAndSetSelected();
end;
v28.render = function(v43) --[[ Line: 145 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), v12 (copy), v13 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagFriendsPageUserListEnabled_0 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (copy), l_FFlagFriendsPageViewBtnEnabled_0 (copy), l_ButtonTypes_0 (copy), l_ButtonVariant_0 (copy), l_FFlagFriendsPageViewBtnWidth_0 (copy), v11 (copy), v25 (copy), l_React_0 (copy), v20 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_Roact_0 (copy), l_PlayerTile_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local l_user_2 = v43.props.user;
    local v45 = v14(l_user_2);
    local v46 = v12[v45];
    local v47 = v13[v45];
    local v48 = nil;
    local v49 = nil;
    local v50 = v43.playerTileRef:getValue();
    if v50 then
        v48 = v50.AbsoluteSize;
        v49 = v50.AbsolutePosition;
    else
        v43:setState({
            isFirstRender = false
        });
    end;
    return l_withStyle_0(function(v51) --[[ Line: 163 ]]
        -- upvalues: l_withLocalization_0 (ref), v46 (copy), l_FFlagFriendsPageUserListEnabled_0 (ref), v43 (copy), l_user_2 (copy), v47 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (ref), v48 (ref), v49 (ref), v45 (copy), l_FFlagFriendsPageViewBtnEnabled_0 (ref), l_ButtonTypes_0 (ref), l_ButtonVariant_0 (ref), l_FFlagFriendsPageViewBtnWidth_0 (ref), v11 (ref), v25 (ref), l_React_0 (ref), v20 (ref), l_FFlagEnableBlackbirdCheckDev_0 (ref), l_Roact_0 (ref), l_PlayerTile_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref)
        return l_withLocalization_0({
            presenceText = v46, 
            accountDeletedText = "Feature.Friends.Action.AccountDeleted", 
            trustedText = "Feature.Friends.TrustedConnection.Label.Trusted"
        })(function(v52) --[[ Line: 168 ]]
            -- upvalues: l_FFlagFriendsPageUserListEnabled_0 (ref), v43 (ref), l_user_2 (ref), v47 (ref), l_FFlagFriendsPageAlwaysOpenPPV_0 (ref), v48 (ref), v49 (ref), v51 (copy), v45 (ref), l_FFlagFriendsPageViewBtnEnabled_0 (ref), l_ButtonTypes_0 (ref), l_ButtonVariant_0 (ref), l_FFlagFriendsPageViewBtnWidth_0 (ref), v11 (ref), v25 (ref), l_React_0 (ref), v20 (ref), l_FFlagEnableBlackbirdCheckDev_0 (ref), l_Roact_0 (ref), l_PlayerTile_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref)
            local v53 = v52.presenceText or nil;
            local l_accountDeletedText_0 = v52.accountDeletedText;
            local l_trustedText_0 = v52.trustedText;
            if l_FFlagFriendsPageUserListEnabled_0 then
                local v56 = v43.makeRelevancyInfo(l_user_2, v53, v47, if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v43.openPlayerProfileForRelevancyInfo(v48, v49), v51.Theme, v43.props.index, v43.props.isLuobu, v51.Font, l_accountDeletedText_0, true);
                return v43.props.createRow({
                    onRowActivated = v43.openProfilePeekViewHandle, 
                    contextualInfo = v56 and {
                        text = v56.text, 
                        icon = v56.icon
                    }, 
                    presence = v43.getPresenceType(v45), 
                    primaryCta = if l_FFlagFriendsPageViewBtnEnabled_0 then {
                        type = l_ButtonTypes_0.View, 
                        onActivated = v43.openProfilePeekViewHandle, 
                        variant = l_ButtonVariant_0.Standard, 
                        minWidth = l_FFlagFriendsPageViewBtnWidth_0 and 64 or nil, 
                        maxWidth = l_FFlagFriendsPageViewBtnWidth_0 and 90 or nil
                    } else nil
                });
            else
                local v57 = nil;
                local v58 = nil;
                if v43.props.userProfile then
                    v57 = v43.props.userProfile.names.combinedName;
                    v58 = v11.Formatters.formatUsername(v43.props.userProfile.names.username);
                    l_user_2.isDeleted = v43.props.userProfile.isDeleted;
                end;
                local v59 = if v57 then v57 else l_user_2.displayName;
                local v60 = if v58 then v58 else "@" .. l_user_2.username;
                local v61 = if not v25 then (if v43.props.trustedConnection then l_trustedText_0 .. " \226\128\162 " else "") .. v60 else v60;
                local v62 = if not v57 then nil else v43.makeRelevancyInfo(l_user_2, v53, v47, if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v43.openPlayerProfileForRelevancyInfo(v48, v49), v51.Theme, v43.props.index, v43.props.isLuobu, v51.Font, l_accountDeletedText_0, true);
                local v63 = v43.props.userProfile and v43.props.userProfile.isVerified;
                if v25 then
                    return l_React_0.createElement(v20, {
                        user = l_user_2, 
                        userPresence = v45, 
                        title = v59, 
                        subtitle = v61, 
                        relevancyInfo = v62, 
                        index = v43.props.index, 
                        openPlayerProfile = if l_FFlagFriendsPageAlwaysOpenPPV_0 then v43.props.openPlayerProfile(l_user_2.id, v43.props.index) else v43.openPlayerProfile(v48, v49, v59, v61, v62), 
                        playerTileRef = v43.playerTileRef, 
                        buttons = v43.props.buttons, 
                        isTrustedConnection = v43.props.trustedConnection, 
                        isVerified = v63, 
                        isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v43.props.isRobloxSubscriber else nil
                    });
                else
                    return l_Roact_0.createElement(l_PlayerTile_0, {
                        tileSize = UDim2.fromScale(1, 1), 
                        thumbnail = l_user_2.thumbnail, 
                        title = v59, 
                        subtitle = v61, 
                        hasVerifiedBadge = v63, 
                        onActivated = if l_FFlagFriendsPageAlwaysOpenPPV_0 then v43.props.openPlayerProfile(l_user_2.id, v43.props.index) else v43.openPlayerProfile(v48, v49, v59, v61, v62), 
                        forwardedRef = v43.playerTileRef, 
                        buttons = v43.props.buttons, 
                        Selectable = true, 
                        openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil, 
                        relevancyInfo = v62
                    });
                end;
            end;
        end);
    end);
end;
return v28;