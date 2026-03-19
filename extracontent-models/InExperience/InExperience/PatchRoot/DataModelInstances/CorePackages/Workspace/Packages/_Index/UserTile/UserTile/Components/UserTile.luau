local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Components.TitleStack);
local v5 = require(l_script_FirstAncestor_0.Components.Avatar);
local v6 = require(l_script_FirstAncestor_0.Components.AvatarPile);
local l_View_0 = v3.View;
local l_ControlState_0 = v3.Enums.ControlState;
local l_Enums_0 = v3.Enums;
local v10 = require(script.Parent.Parent.Enums.LayoutMode);
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagUserTileShowShimmerWhenLoading);
local v13 = game:DefineFastFlag("UserTileAddSizeProp", false);
local l_FFlagAppChatUserTileCustomTitleTruncation_0 = require(l_Parent_0.SharedFlags).FFlagAppChatUserTileCustomTitleTruncation;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagCleanupTCIndicatorRing);
local l_FFlagUserTileTextTCIndicator_0 = require(l_Parent_0.SharedFlags).FFlagUserTileTextTCIndicator;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_FFlagUserTileShowBadges_0 = require(l_Parent_0.SharedFlags).FFlagUserTileShowBadges;
return function(v19) --[[ Line: 55 ]] --[[ Name: UserTile ]]
    -- upvalues: v2 (copy), l_ControlState_0 (copy), l_View_0 (copy), v10 (copy), l_Enums_0 (copy), v13 (copy), v6 (copy), v5 (copy), v12 (copy), v15 (copy), v4 (copy), l_FFlagUserTileShowBadges_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_FFlagAppChatUserTileCustomTitleTruncation_0 (copy), l_FFlagUserTileTextTCIndicator_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy)
    local v20, v21 = v2.useState(false);
    local v22 = v19.onActivated ~= nil;
    local v24 = v2.useCallback(function(v23) --[[ Line: 58 ]]
        -- upvalues: v21 (copy), v22 (copy), l_ControlState_0 (ref)
        v21(v22 and (v23 == l_ControlState_0.Hover or v23 == l_ControlState_0.Pressed));
    end, {
        v19.onActivated
    });
    return v2.createElement(l_View_0, {
        tag = {
            ["size-full"] = true, 
            ["col align-x-center gap-small"] = v19.layoutMode == v10.compact, 
            ["row align-y-center gap-medium"] = v19.layoutMode == v10.wide
        }, 
        selection = {
            Selectable = v19.selectable
        }, 
        onStateChanged = v24, 
        onActivated = v19.onActivated, 
        stateLayer = {
            affordance = l_Enums_0.StateLayerAffordance.None
        }
    }, {
        AvatarThumbnail = if v13 then v2.createElement(l_View_0, {
            tag = "size-full aspect-1-1", 
            Size = v19.avatarSize, 
            LayoutOrder = 1
        }, {
            AvatarComponent = if v19.facePileSecondUserId then v2.createElement(v6, {
                layoutOrder = 1, 
                primaryUserId = v19.userId, 
                secondUserId = v19.facePileSecondUserId, 
                userPresenceType = v19.userPresenceType, 
                ZIndex = 2, 
                hover = v20
            }) else v2.createElement(v5, {
                avatarThumbnailUrl = if v12 then v19.avatarThumbnailUrl else nil, 
                layoutOrder = 1, 
                userId = v19.userId, 
                isTrustedConnection = v19.isTrustedConnection, 
                userPresenceType = v19.userPresenceType, 
                triggerAnimation = if v15 then nil else v19.triggerAnimation, 
                altSurfaceBackground = if v15 then nil else v19.altSurfaceBackground, 
                ZIndex = 2, 
                hover = v20
            })
        }) else if v19.facePileSecondUserId then v2.createElement(v6, {
            layoutOrder = 1, 
            primaryUserId = v19.userId, 
            secondUserId = v19.facePileSecondUserId, 
            userPresenceType = v19.userPresenceType, 
            ZIndex = 2, 
            hover = v20
        }) else v2.createElement(v5, {
            avatarThumbnailUrl = if v12 then v19.avatarThumbnailUrl else nil, 
            layoutOrder = 1, 
            userId = v19.userId, 
            isTrustedConnection = v19.isTrustedConnection, 
            userPresenceType = v19.userPresenceType, 
            triggerAnimation = if v15 then nil else v19.triggerAnimation, 
            altSurfaceBackground = if v15 then nil else v19.altSurfaceBackground, 
            ZIndex = 2, 
            hover = v20
        }), 
        TitleStack = v2.createElement(v4, {
            layoutOrder = 2, 
            title = v19.title, 
            isVerified = if l_FFlagUserTileShowBadges_0 then v19.isVerified else nil, 
            isPremium = if l_FFlagUserTileShowBadges_0 then v19.isPremium else nil, 
            isRobloxAdmin = if l_FFlagUserTileShowBadges_0 then v19.isRobloxAdmin else nil, 
            subtitle = v19.subtitle, 
            contextualInfo = v19.contextualInfo, 
            layoutMode = v19.layoutMode, 
            titleStyle = v19.titleStyle, 
            subtitleStyle = v19.subtitleStyle, 
            contextualInfoStyle = v19.contextualInfoStyle, 
            ZIndex = 1, 
            titleIcon = v19.titleIcon, 
            onSubtitleClicked = if l_FFlagProfilePlatformNewProfileHeader_0 then v19.onSubtitleClicked else nil, 
            isTitleLoading = if v12 then v19.isTitleLoading else nil, 
            isSubtitleLoading = if v12 then v19.isSubtitleLoading else nil, 
            isContextualInfoLoading = if v12 then v19.isContextualInfoLoading else nil, 
            customTextTruncation = if l_FFlagAppChatUserTileCustomTitleTruncation_0 then v19.customTextTruncation else nil, 
            isTrustedConnection = if l_FFlagUserTileTextTCIndicator_0 then v19.isTrustedConnection else nil, 
            trustedConnectionIndicatorEnabled = if l_FFlagUserTileTextTCIndicator_0 then v19.trustedConnectionIndicatorEnabled else nil, 
            isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v19.isRobloxSubscriber else nil
        })
    });
end;