local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.UIBlox);
local l_OpenTypeSupport_0 = v5.Utility.OpenTypeSupport;
local l_PlayerTile_0 = v5.App.Tile.PlayerTile;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v9 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_Enums_0 = require(l_Parent_0.FriendsNetworking).Enums;
local l_getDeepValue_0 = v9.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_useLastInputMode_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMode;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_Parent_0.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = require(l_Parent_0.UserLib).Utils.Constants;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v21 = require(script.Parent.useContextualInfo);
local v22 = require(script.Parent.useSearchTileButtons);
local v23 = require(script.Parent.useProfileNames);
local v24 = require(script.Parent.useRelationshipSelector);
local v25 = require(l_Parent_0.Responsive);
local v26 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v28 = require(l_script_FirstAncestor_0.Components.RoundCTAButton);
local v29 = require(l_script_FirstAncestor_0.Common.Constants);
local _ = require(l_Parent_0.GraphQLServer);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_FFlagBlendedSerpUserPresenceInLineEnabled_0 = require(l_Parent_0.SharedFlags).FFlagBlendedSerpUserPresenceInLineEnabled;
local l_FFlagUserSearchAddFocusActionsSupport_0 = require(l_Parent_0.SharedFlags).FFlagUserSearchAddFocusActionsSupport;
local l_FFlagPPVEnabledOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagPPVEnabledOnConsole;
local l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields;
local l_RODUX_KEY_0 = v29.RODUX_KEY;
local v37 = require(l_script_FirstAncestor_0.Utils.PresenceHelpers);
local l_UserTileEventHandlers_0 = require(l_Parent_0.UserTile).UserTileEventHandlers;
local function _(v39, v40) --[[ Line: 82 ]]
    -- upvalues: l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy)
    if v40 then
        return l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v39)));
    else
        return l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v39), l_Constants_0.RbxthumbTypes.Avatar, 720);
    end;
end;
return function(v42) --[[ Line: 90 ]]
    -- upvalues: l_FFlagUserSearchAddFocusActionsSupport_0 (copy), v3 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v24 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_useLastInputMode_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_RODUX_KEY_0 (copy), v21 (copy), l_FFlagPPVEnabledOnConsole_0 (copy), v25 (copy), v4 (copy), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (copy), l_HttpService_0 (copy), l_SetCentralOverlay_0 (copy), l_Enums_0 (copy), v26 (copy), v22 (copy), v23 (copy), v37 (copy), l_PlayerTile_0 (copy), l_FFlagBlendedSerpUserPresenceInLineEnabled_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), l_UserTileEventHandlers_0 (copy), v28 (copy)
    local v43 = if l_FFlagUserSearchAddFocusActionsSupport_0 then v3.useRef(nil) else nil;
    local l_user_0 = v42.user;
    local v45 = l_useStyle_0();
    local v46 = l_useDispatch_0();
    local v47 = v24(l_user_0.id);
    local v48 = v42.enablePresenceIndicator and not v42.shouldUseCompactTiles;
    local l_Size_125_0 = v45.Tokens.Global.Size_125;
    local v51 = l_useUserExperiment_0({
        l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer
    }, function(v50) --[[ Line: 102 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v50[l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer] or {}).userPresenceIndicator == "showPresenceInLine";
    end, false);
    local v52 = l_useLastInputMode_0();
    local v54 = l_useSelector_0(function(v53) --[[ Line: 112 ]]
        -- upvalues: l_getDeepValue_0 (ref), l_RODUX_KEY_0 (ref), l_user_0 (copy)
        return l_getDeepValue_0(v53, string.format("%s.Presence.byUserId.%s", l_RODUX_KEY_0, l_user_0.id)) or {};
    end);
    local v55, v56 = v21({
        userId = l_user_0.id, 
        previousUsernames = l_user_0.previousUsernames, 
        searchKeyword = v42.searchParameters.searchKeyword, 
        profileInsight = v42.profileInsight, 
        shouldUseCompactTiles = v42.shouldUseCompactTiles, 
        userPresence = v54
    });
    local v57 = if l_FFlagPPVEnabledOnConsole_0 then nil else v25.usePreferredInput() == v25.Input.Directional;
    local v58 = if l_FFlagPPVEnabledOnConsole_0 then nil else v57;
    local v59 = if l_FFlagUserSearchAddFocusActionsSupport_0 then v25.usePreferredInput() == v25.Input.Directional else nil;
    local function v62(v60, v61) --[[ Line: 135 ]]
        -- upvalues: v42 (copy), v4 (ref), l_user_0 (copy), v56 (copy), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (ref), l_HttpService_0 (ref)
        if v42.fireAnalyticsEvent then
            v42.fireAnalyticsEvent(v60, v4.Dictionary.join({
                playerId = l_user_0.id, 
                tilePos = v42.index, 
                contextualInfoType = v56, 
                hasEmphasis = v42.hasEmphasis, 
                rowInSort = v42.rowInSort, 
                positionInRow = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v42.positionInRow else nil, 
                feedRowNumber = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v42.feedRowNumber else nil, 
                interactionUuid = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then l_HttpService_0:GenerateGUID(false) else nil
            }, v61 or {}));
        end;
    end;
    local function v63() --[[ Line: 155 ]]
        -- upvalues: v58 (copy), l_FFlagPPVEnabledOnConsole_0 (ref), v46 (copy), l_SetCentralOverlay_0 (ref), l_user_0 (copy), v47 (copy), l_Enums_0 (ref), v42 (copy), v56 (copy), v55 (copy), v62 (copy), v26 (ref)
        if v58 and not l_FFlagPPVEnabledOnConsole_0 then
            v46(l_SetCentralOverlay_0("PlayerContextualMenu", {
                subjectUserId = l_user_0.id, 
                robloxFriendshipStatus = v47.status, 
                friendshipOriginSourceType = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue()
            }));
        else
            v42.luaAppNavigation.navigateToUserInfo({
                userId = l_user_0.id, 
                index = v42.index, 
                hasEmphasis = v42.hasEmphasis, 
                contextualInfoType = v56, 
                contextualInfoDisplay = v55
            });
        end;
        v62(v26.PlayerTileClick);
    end;
    local v64 = v22({
        userId = l_user_0.id, 
        index = v42.index, 
        contextualInfoType = v56, 
        shouldUseCompactTiles = v42.shouldUseCompactTiles, 
        userPresence = v54, 
        subpage = v42.subpage, 
        shouldAddFocusEventName = if l_FFlagUserSearchAddFocusActionsSupport_0 then v59 else nil
    }, v62);
    local v65 = v55 and {
        text = v55.text, 
        fontStyle = v45.Font.CaptionBody, 
        icon = if v42.shouldUseCompactTiles then nil else v55.icon, 
        horizontalAlignment = if v42.shouldUseCompactTiles then Enum.HorizontalAlignment.Center else nil, 
        textXAlignment = if v42.shouldUseCompactTiles then Enum.TextXAlignment.Center else nil
    } or nil;
    local v66 = v23({
        userId = l_user_0.id
    });
    local function v70(v67, v68) --[[ Line: 199 ]]
        -- upvalues: v37 (ref), v45 (copy)
        if not v68 or not v68.combinedName then
            return "";
        elseif not v67 or not v37.isUserOnline(v67.userPresenceType) then
            return v68.combinedName;
        else
            local l_Color_0 = v45.Theme.OnlineStatus.Color;
            return ("<font color=\"rgb(%*,%*,%*)\">\226\151\143 </font>"):format(math.round(l_Color_0.R * 255), math.round(l_Color_0.G * 255), (math.round(l_Color_0.B * 255))) .. v68.combinedName;
        end;
    end;
    local l_createElement_0 = v3.createElement;
    local v72 = "Frame";
    local v73 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0)
    };
    local v74 = {};
    local l_createElement_1 = v3.createElement;
    local v76 = "Frame";
    local v77 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        ZIndex = 1
    };
    local v78 = {};
    local l_createElement_2 = v3.createElement;
    local l_l_PlayerTile_0_0 = l_PlayerTile_0;
    local v81 = {
        buttonRef = if l_FFlagUserSearchAddFocusActionsSupport_0 then v43 else nil, 
        tileSize = v42.size, 
        title = if not not v48 or v51 or l_FFlagBlendedSerpUserPresenceInLineEnabled_0 then v70(v54, v66) else v66 and v66.combinedName, 
        subtitle = v66 and v66.username
    };
    local l_id_0 = l_user_0.id;
    v81.thumbnail = if v42.shouldUseCompactTiles then l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(l_id_0))) else l_getRbxthumbWithTypeSizeAndOptions_0(tostring(l_id_0), l_Constants_0.RbxthumbTypes.Avatar, 720);
    v81.onActivated = v63;
    v81.buttons = if l_FFlagUserSearchAddFocusActionsSupport_0 then if v59 or v42.shouldUseCompactTiles then nil else v64 else if v42.shouldUseCompactTiles or v52 == "Focus" then nil else v64;
    v81.relevancyInfo = v65;
    v81.Selectable = true;
    v81.horizontalAlignment = if v42.shouldUseCompactTiles then Enum.HorizontalAlignment.Center else nil;
    v81.isCircular = v42.shouldUseCompactTiles;
    v81.thumbnailFrameSize = if v42.shouldUseCompactTiles then UDim2.new(1, -l_Size_125_0, 1, -l_Size_125_0) else nil;
    v81.openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil;
    v78.Tile = l_createElement_2(l_l_PlayerTile_0_0, v81);
    v78.UserTileEventHandlers = if l_FFlagUserSearchAddFocusActionsSupport_0 and v59 then v3.createElement(l_UserTileEventHandlers_0, {
        buttons = v64, 
        onTileActivated = v63, 
        tileRef = v43
    }) else nil;
    v74.UserTile = l_createElement_1(v76, v77, v78);
    v74.UserTileRoundCTAButton = if not (v42.shouldUseCompactTiles and v64 and #v64 > 0) or l_FFlagUserSearchAddFocusActionsSupport_0 and v59 then nil else v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        Size = UDim2.fromOffset(v45.Tokens.Global.Size_450, v45.Tokens.Global.Size_450), 
        AnchorPoint = Vector2.new(1, 1), 
        Position = UDim2.fromOffset(v42.size.X.Offset - v45.Tokens.Global.Size_125, v42.size.X.Offset - v45.Tokens.Global.Size_125)
    }, {
        RoundCTAButton = v3.createElement(v28, {
            searchTileButtonProps = v64[1], 
            playerTileSize = v42.size
        })
    });
    return l_createElement_0(v72, v73, v74);
end;