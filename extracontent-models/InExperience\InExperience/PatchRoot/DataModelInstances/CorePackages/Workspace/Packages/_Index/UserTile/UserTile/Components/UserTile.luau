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
local l_FFlagUserTileShowBadges_0 = require(l_Parent_0.SharedFlags).FFlagUserTileShowBadges;
return function(v18) --[[ Line: 53 ]] --[[ Name: UserTile ]]
    -- upvalues: v2 (copy), l_ControlState_0 (copy), l_View_0 (copy), v10 (copy), l_Enums_0 (copy), v13 (copy), v6 (copy), v5 (copy), v12 (copy), v15 (copy), v4 (copy), l_FFlagUserTileShowBadges_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_FFlagAppChatUserTileCustomTitleTruncation_0 (copy), l_FFlagUserTileTextTCIndicator_0 (copy)
    local v19, v20 = v2.useState(false);
    local v21 = v18.onActivated ~= nil;
    local v23 = v2.useCallback(function(v22) --[[ Line: 56 ]]
        -- upvalues: v20 (copy), v21 (copy), l_ControlState_0 (ref)
        v20(v21 and (v22 == l_ControlState_0.Hover or v22 == l_ControlState_0.Pressed));
    end, {
        v18.onActivated
    });
    return v2.createElement(l_View_0, {
        tag = {
            ["size-full"] = true, 
            ["col align-x-center gap-small"] = v18.layoutMode == v10.compact, 
            ["row align-y-center gap-medium"] = v18.layoutMode == v10.wide
        }, 
        selection = {
            Selectable = v18.selectable
        }, 
        onStateChanged = v23, 
        onActivated = v18.onActivated, 
        stateLayer = {
            affordance = l_Enums_0.StateLayerAffordance.None
        }
    }, {
        AvatarThumbnail = if v13 then v2.createElement(l_View_0, {
            tag = "size-full aspect-1-1", 
            Size = v18.avatarSize, 
            LayoutOrder = 1
        }, {
            AvatarComponent = if v18.facePileSecondUserId then v2.createElement(v6, {
                layoutOrder = 1, 
                primaryUserId = v18.userId, 
                secondUserId = v18.facePileSecondUserId, 
                ZIndex = 2, 
                hover = v19
            }) else v2.createElement(v5, {
                avatarThumbnailUrl = if v12 then v18.avatarThumbnailUrl else nil, 
                layoutOrder = 1, 
                userId = v18.userId, 
                isTrustedConnection = v18.isTrustedConnection, 
                userPresenceType = v18.userPresenceType, 
                triggerAnimation = if v15 then nil else v18.triggerAnimation, 
                altSurfaceBackground = if v15 then nil else v18.altSurfaceBackground, 
                ZIndex = 2, 
                hover = v19
            })
        }) else if v18.facePileSecondUserId then v2.createElement(v6, {
            layoutOrder = 1, 
            primaryUserId = v18.userId, 
            secondUserId = v18.facePileSecondUserId, 
            ZIndex = 2, 
            hover = v19
        }) else v2.createElement(v5, {
            avatarThumbnailUrl = if v12 then v18.avatarThumbnailUrl else nil, 
            layoutOrder = 1, 
            userId = v18.userId, 
            isTrustedConnection = v18.isTrustedConnection, 
            userPresenceType = v18.userPresenceType, 
            triggerAnimation = if v15 then nil else v18.triggerAnimation, 
            altSurfaceBackground = if v15 then nil else v18.altSurfaceBackground, 
            ZIndex = 2, 
            hover = v19
        }), 
        TitleStack = v2.createElement(v4, {
            layoutOrder = 2, 
            title = v18.title, 
            isVerified = if l_FFlagUserTileShowBadges_0 then v18.isVerified else nil, 
            isPremium = if l_FFlagUserTileShowBadges_0 then v18.isPremium else nil, 
            isRobloxAdmin = if l_FFlagUserTileShowBadges_0 then v18.isRobloxAdmin else nil, 
            subtitle = v18.subtitle, 
            contextualInfo = v18.contextualInfo, 
            layoutMode = v18.layoutMode, 
            titleStyle = v18.titleStyle, 
            subtitleStyle = v18.subtitleStyle, 
            contextualInfoStyle = v18.contextualInfoStyle, 
            ZIndex = 1, 
            titleIcon = v18.titleIcon, 
            onSubtitleClicked = if l_FFlagProfilePlatformNewProfileHeader_0 then v18.onSubtitleClicked else nil, 
            isTitleLoading = if v12 then v18.isTitleLoading else nil, 
            isSubtitleLoading = if v12 then v18.isSubtitleLoading else nil, 
            isContextualInfoLoading = if v12 then v18.isContextualInfoLoading else nil, 
            customTextTruncation = if l_FFlagAppChatUserTileCustomTitleTruncation_0 then v18.customTextTruncation else nil, 
            isTrustedConnection = if l_FFlagUserTileTextTCIndicator_0 then v18.isTrustedConnection else nil, 
            trustedConnectionIndicatorEnabled = if l_FFlagUserTileTextTCIndicator_0 then v18.trustedConnectionIndicatorEnabled else nil
        })
    });
end;