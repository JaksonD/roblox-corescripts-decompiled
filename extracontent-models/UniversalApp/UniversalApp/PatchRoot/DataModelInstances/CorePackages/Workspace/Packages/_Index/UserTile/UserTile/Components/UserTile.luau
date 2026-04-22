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
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagCleanupTCIndicatorRing);
local l_FFlagUserTileTextTCIndicator_0 = require(l_Parent_0.SharedFlags).FFlagUserTileTextTCIndicator;
local l_FFlagEnableBlackbirdCheck_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheck;
local l_FFlagUserTileShowBadges_0 = require(l_Parent_0.SharedFlags).FFlagUserTileShowBadges;
local l_FFlagEnableMobileGameJoinCard_0 = require(l_Parent_0.SharedFlags).FFlagEnableMobileGameJoinCard;
local l_FFlagUserTileAddContextualInfoIcon_0 = require(l_Parent_0.SharedFlags).FFlagUserTileAddContextualInfoIcon;
local l_FFlagUserTilePassOnStateChanged_0 = require(l_Parent_0.SharedFlags).FFlagUserTilePassOnStateChanged;
return function(v20) --[[ Line: 59 ]] --[[ Name: UserTile ]]
    -- upvalues: v2 (copy), l_ControlState_0 (copy), l_FFlagUserTilePassOnStateChanged_0 (copy), l_View_0 (copy), v10 (copy), l_Enums_0 (copy), v6 (copy), v5 (copy), v12 (copy), v13 (copy), v4 (copy), l_FFlagUserTileShowBadges_0 (copy), l_FFlagUserTileAddContextualInfoIcon_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_FFlagEnableMobileGameJoinCard_0 (copy), l_FFlagUserTileTextTCIndicator_0 (copy), l_FFlagEnableBlackbirdCheck_0 (copy)
    local v21, v22 = v2.useState(false);
    local v23 = v20.onActivated ~= nil;
    local v25 = v2.useCallback(function(v24) --[[ Line: 62 ]]
        -- upvalues: v22 (copy), v23 (copy), l_ControlState_0 (ref), v20 (copy)
        v22(v23 and (v24 == l_ControlState_0.Hover or v24 == l_ControlState_0.Pressed));
        if v20.onStateChanged then
            v20.onStateChanged(v24);
        end;
    end, {
        v20.onActivated, 
        if l_FFlagUserTilePassOnStateChanged_0 then v20.onStateChanged else nil
    });
    return v2.createElement(l_View_0, {
        tag = {
            ["size-full"] = true, 
            ["col align-x-center gap-small"] = v20.layoutMode == v10.compact, 
            ["row align-y-center gap-medium"] = v20.layoutMode == v10.wide
        }, 
        selection = {
            Selectable = v20.selectable
        }, 
        onStateChanged = v25, 
        onActivated = v20.onActivated, 
        stateLayer = {
            affordance = l_Enums_0.StateLayerAffordance.None
        }
    }, {
        AvatarThumbnail = v2.createElement(l_View_0, {
            tag = "size-full aspect-1-1", 
            Size = v20.avatarSize, 
            LayoutOrder = 1
        }, {
            AvatarComponent = if v20.facePileSecondUserId then v2.createElement(v6, {
                layoutOrder = 1, 
                primaryUserId = v20.userId, 
                secondUserId = v20.facePileSecondUserId, 
                userPresenceType = v20.userPresenceType, 
                ZIndex = 2, 
                hover = v21
            }) else v2.createElement(v5, {
                avatarThumbnailUrl = if v12 then v20.avatarThumbnailUrl else nil, 
                layoutOrder = 1, 
                userId = v20.userId, 
                isTrustedConnection = v20.isTrustedConnection, 
                userPresenceType = v20.userPresenceType, 
                triggerAnimation = if v13 then nil else v20.triggerAnimation, 
                altSurfaceBackground = if v13 then nil else v20.altSurfaceBackground, 
                ZIndex = 2, 
                hover = v21, 
                backplateStyle = v20.backplateStyle
            })
        }), 
        TitleStack = v2.createElement(v4, {
            layoutOrder = 2, 
            title = v20.title, 
            isVerified = if l_FFlagUserTileShowBadges_0 then v20.isVerified else nil, 
            isPremium = if l_FFlagUserTileShowBadges_0 then v20.isPremium else nil, 
            isRobloxAdmin = if l_FFlagUserTileShowBadges_0 then v20.isRobloxAdmin else nil, 
            subtitle = v20.subtitle, 
            contextualInfo = v20.contextualInfo, 
            contextualInfoIcon = if l_FFlagUserTileAddContextualInfoIcon_0 then v20.contextualInfoIcon else nil, 
            layoutMode = v20.layoutMode, 
            titleStyle = v20.titleStyle, 
            subtitleStyle = v20.subtitleStyle, 
            contextualInfoStyle = v20.contextualInfoStyle, 
            ZIndex = 1, 
            titleIcon = v20.titleIcon, 
            onSubtitleClicked = if not not l_FFlagProfilePlatformNewProfileHeader_0 or l_FFlagEnableMobileGameJoinCard_0 then v20.onSubtitleClicked else nil, 
            isTitleLoading = if v12 then v20.isTitleLoading else nil, 
            isSubtitleLoading = if v12 then v20.isSubtitleLoading else nil, 
            isContextualInfoLoading = if v12 then v20.isContextualInfoLoading else nil, 
            customTextTruncation = v20.customTextTruncation, 
            isTrustedConnection = if l_FFlagUserTileTextTCIndicator_0 then v20.isTrustedConnection else nil, 
            trustedConnectionIndicatorEnabled = if l_FFlagUserTileTextTCIndicator_0 then v20.trustedConnectionIndicatorEnabled else nil, 
            isRobloxSubscriber = if l_FFlagEnableBlackbirdCheck_0 then v20.isRobloxSubscriber else nil
        })
    });
end;