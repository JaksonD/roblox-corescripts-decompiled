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
local v26 = l_Roact_0.PureComponent:extend("FriendTile");
local function v27() --[[ Line: 37 ]]
    return function() --[[ Line: 38 ]]

    end;
end;
v26.validateProps = l_t_0.strictInterface({
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
    isLuobu = l_t_0.optional(l_t_0.boolean), 
    buttons = l_t_0.optional(l_t_0.array(l_t_0.strictInterface({
        icon = l_t_0.optional(l_t_0.string), 
        onActivated = l_t_0.optional(l_t_0.callback), 
        isSecondary = l_t_0.optional(l_t_0.boolean), 
        isDisabled = l_t_0.optional(l_t_0.boolean)
    }))), 
    isPlayerContextualMenuEnabled = l_t_0.optional(l_t_0.boolean)
});
v26.defaultProps = {
    user = {
        username = ""
    }, 
    openPlayerProfile = v27, 
    isLuobu = false, 
    index = 1, 
    buttons = nil, 
    isPlayerContextualMenuEnabled = false, 
    trustedConnection = false
};
v26.init = function(v28) --[[ Line: 80 ]] --[[ Name: init ]]
    -- upvalues: l_memoize_0 (copy), v16 (copy), l_Roact_0 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (copy), l_FFlagFriendsPageUserListEnabled_0 (copy), v17 (copy)
    v28.state = {
        isFirstRender = true
    };
    v28.makeRelevancyInfo = l_memoize_0(v16);
    v28.playerTileRef = l_Roact_0.createRef();
    v28.openPlayerProfile = if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v28.props.isPlayerContextualMenuEnabled and function(_, _) --[[ Line: 87 ]]
        -- upvalues: v28 (copy)
        local l_user_0 = v28.props.user;
        return v28.props.openPlayerProfile(l_user_0);
    end or function(v32, v33) --[[ Line: 91 ]]
        -- upvalues: v28 (copy)
        local l_user_1 = v28.props.user;
        if v32 and v33 then
            return v28.props.openPlayerProfile(l_user_1.id, v28.props.index, l_user_1, v32, v33);
        else
            return v28.props.openPlayerProfile(l_user_1.id, v28.props.index, l_user_1);
        end;
    end;
    v28.openPlayerProfileForRelevancyInfo = if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else function(v35, v36) --[[ Line: 102 ]]
        -- upvalues: v28 (copy)
        return function() --[[ Line: 103 ]]
            -- upvalues: v28 (ref), v35 (copy), v36 (copy)
            return v28.openPlayerProfile(v35, v36);
        end;
    end;
    v28.checkAndSetSelected = function() --[[ Line: 108 ]]
        -- upvalues: v28 (copy)
        if v28.props.selected and v28.props.focusGuiObject then
            local v37 = v28.playerTileRef:getValue();
            if v37 then
                v28.props.focusGuiObject(v37);
            end;
        end;
    end;
    v28.getPresenceType = l_FFlagFriendsPageUserListEnabled_0 and function(v38) --[[ Line: 118 ]]
        -- upvalues: v17 (ref)
        local v39 = tostring(v38 or "");
        return string.gsub(v39, "PresenceType%.", "") or v17.Enums.PresenceTypes.Offline;
    end or nil;
    v28.openProfilePeekViewHandle = l_FFlagFriendsPageUserListEnabled_0 and function() --[[ Line: 125 ]]
        -- upvalues: v28 (copy)
        return v28.props.openPlayerProfileHandle(v28.props.user.id, v28.props.index);
    end or nil;
end;
v26.didMount = function(v40) --[[ Line: 131 ]] --[[ Name: didMount ]]
    if v40.props.pageLoadingTimeReport then
        v40.props.pageLoadingTimeReport();
    end;
    v40.checkAndSetSelected();
end;
v26.render = function(v41) --[[ Line: 139 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), v12 (copy), v13 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagFriendsPageUserListEnabled_0 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (copy), l_FFlagFriendsPageViewBtnEnabled_0 (copy), l_ButtonTypes_0 (copy), l_ButtonVariant_0 (copy), v11 (copy), v25 (copy), l_React_0 (copy), v20 (copy), l_Roact_0 (copy), l_PlayerTile_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local l_user_2 = v41.props.user;
    local v43 = v14(l_user_2);
    local v44 = v12[v43];
    local v45 = v13[v43];
    local v46 = nil;
    local v47 = nil;
    local v48 = v41.playerTileRef:getValue();
    if v48 then
        v46 = v48.AbsoluteSize;
        v47 = v48.AbsolutePosition;
    else
        v41:setState({
            isFirstRender = false
        });
    end;
    return l_withStyle_0(function(v49) --[[ Line: 157 ]]
        -- upvalues: l_withLocalization_0 (ref), v44 (copy), l_FFlagFriendsPageUserListEnabled_0 (ref), v41 (copy), l_user_2 (copy), v45 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (ref), v46 (ref), v47 (ref), v43 (copy), l_FFlagFriendsPageViewBtnEnabled_0 (ref), l_ButtonTypes_0 (ref), l_ButtonVariant_0 (ref), v11 (ref), v25 (ref), l_React_0 (ref), v20 (ref), l_Roact_0 (ref), l_PlayerTile_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref)
        return l_withLocalization_0({
            presenceText = v44, 
            accountDeletedText = "Feature.Friends.Action.AccountDeleted", 
            trustedText = "Feature.Friends.TrustedConnection.Label.Trusted"
        })(function(v50) --[[ Line: 162 ]]
            -- upvalues: l_FFlagFriendsPageUserListEnabled_0 (ref), v41 (ref), l_user_2 (ref), v45 (ref), l_FFlagFriendsPageAlwaysOpenPPV_0 (ref), v46 (ref), v47 (ref), v49 (copy), v43 (ref), l_FFlagFriendsPageViewBtnEnabled_0 (ref), l_ButtonTypes_0 (ref), l_ButtonVariant_0 (ref), v11 (ref), v25 (ref), l_React_0 (ref), v20 (ref), l_Roact_0 (ref), l_PlayerTile_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref)
            local v51 = v50.presenceText or nil;
            local l_accountDeletedText_0 = v50.accountDeletedText;
            local l_trustedText_0 = v50.trustedText;
            if l_FFlagFriendsPageUserListEnabled_0 then
                local v54 = v41.makeRelevancyInfo(l_user_2, v51, v45, if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v41.openPlayerProfileForRelevancyInfo(v46, v47), v49.Theme, v41.props.index, v41.props.isLuobu, v49.Font, l_accountDeletedText_0, true);
                return v41.props.createRow({
                    onRowActivated = v41.openProfilePeekViewHandle, 
                    contextualInfo = v54 and {
                        text = v54.text, 
                        icon = v54.icon
                    }, 
                    presence = v41.getPresenceType(v43), 
                    primaryCta = if l_FFlagFriendsPageViewBtnEnabled_0 then {
                        type = l_ButtonTypes_0.View, 
                        onActivated = v41.openProfilePeekViewHandle, 
                        variant = l_ButtonVariant_0.Standard
                    } else nil
                });
            else
                local v55 = nil;
                local v56 = nil;
                if v41.props.userProfile then
                    v55 = v41.props.userProfile.names.combinedName;
                    v56 = v11.Formatters.formatUsername(v41.props.userProfile.names.username);
                    l_user_2.isDeleted = v41.props.userProfile.isDeleted;
                end;
                local v57 = if v55 then v55 else l_user_2.displayName;
                local v58 = if v56 then v56 else "@" .. l_user_2.username;
                local v59 = if not v25 then (if v41.props.trustedConnection then l_trustedText_0 .. " \226\128\162 " else "") .. v58 else v58;
                local v60 = if not v55 then nil else v41.makeRelevancyInfo(l_user_2, v51, v45, if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v41.openPlayerProfileForRelevancyInfo(v46, v47), v49.Theme, v41.props.index, v41.props.isLuobu, v49.Font, l_accountDeletedText_0, true);
                local v61 = v41.props.userProfile and v41.props.userProfile.isVerified;
                if v25 then
                    return l_React_0.createElement(v20, {
                        user = l_user_2, 
                        userPresence = v43, 
                        title = v57, 
                        subtitle = v59, 
                        relevancyInfo = v60, 
                        index = v41.props.index, 
                        openPlayerProfile = if l_FFlagFriendsPageAlwaysOpenPPV_0 then v41.props.openPlayerProfile(l_user_2.id, v41.props.index) else v41.openPlayerProfile(v46, v47, v57, v59, v60), 
                        playerTileRef = v41.playerTileRef, 
                        buttons = v41.props.buttons, 
                        isTrustedConnection = v41.props.trustedConnection, 
                        isVerified = v61
                    });
                else
                    return l_Roact_0.createElement(l_PlayerTile_0, {
                        tileSize = UDim2.fromScale(1, 1), 
                        thumbnail = l_user_2.thumbnail, 
                        title = v57, 
                        subtitle = v59, 
                        hasVerifiedBadge = v61, 
                        onActivated = if l_FFlagFriendsPageAlwaysOpenPPV_0 then v41.props.openPlayerProfile(l_user_2.id, v41.props.index) else v41.openPlayerProfile(v46, v47, v57, v59, v60), 
                        forwardedRef = v41.playerTileRef, 
                        buttons = v41.props.buttons, 
                        Selectable = true, 
                        openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil, 
                        relevancyInfo = v60
                    });
                end;
            end;
        end);
    end);
end;
return v26;