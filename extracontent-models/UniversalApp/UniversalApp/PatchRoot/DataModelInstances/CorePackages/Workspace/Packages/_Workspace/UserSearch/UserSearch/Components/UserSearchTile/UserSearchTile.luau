local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local l_OpenTypeSupport_0 = v4.Utility.OpenTypeSupport;
local l_PlayerTile_0 = v4.App.Tile.PlayerTile;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v8 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_Enums_0 = require(l_Parent_0.FriendsNetworking).Enums;
local l_getDeepValue_0 = v8.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_useLastInputMode_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMode;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_Parent_0.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = require(l_Parent_0.UserLib).Utils.Constants;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v20 = require(script.Parent.useContextualInfo);
local v21 = require(script.Parent.useSearchTileButtons);
local v22 = require(script.Parent.useProfileNames);
local v23 = require(script.Parent.useRelationshipSelector);
local v24 = require(l_Parent_0.Responsive);
local v25 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v27 = require(l_script_FirstAncestor_0.Components.RoundCTAButton);
local v28 = require(l_script_FirstAncestor_0.Common.Constants);
local _ = require(l_Parent_0.GraphQLServer);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_FFlagBlendedSerpUserPresenceInLineEnabled_0 = require(l_Parent_0.SharedFlags).FFlagBlendedSerpUserPresenceInLineEnabled;
local l_FFlagUserSearchAddFocusActionsSupport_0 = require(l_Parent_0.SharedFlags).FFlagUserSearchAddFocusActionsSupport;
local l_FFlagPPVEnabledOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagPPVEnabledOnConsole;
local l_RODUX_KEY_0 = v28.RODUX_KEY;
local v35 = require(l_script_FirstAncestor_0.Utils.PresenceHelpers);
local l_UserTileEventHandlers_0 = require(l_Parent_0.UserTile).UserTileEventHandlers;
local function _(v37, v38) --[[ Line: 77 ]]
    -- upvalues: l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy)
    if v38 then
        return l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v37)));
    else
        return l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v37), l_Constants_0.RbxthumbTypes.Avatar, 720);
    end;
end;
return function(v40) --[[ Line: 85 ]]
    -- upvalues: l_FFlagUserSearchAddFocusActionsSupport_0 (copy), v2 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), v23 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_useLastInputMode_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_RODUX_KEY_0 (copy), v20 (copy), l_FFlagPPVEnabledOnConsole_0 (copy), v24 (copy), v3 (copy), l_SetCentralOverlay_0 (copy), l_Enums_0 (copy), v25 (copy), v21 (copy), v22 (copy), v35 (copy), l_PlayerTile_0 (copy), l_FFlagBlendedSerpUserPresenceInLineEnabled_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), l_UserTileEventHandlers_0 (copy), v27 (copy)
    local v41 = if l_FFlagUserSearchAddFocusActionsSupport_0 then v2.useRef(nil) else nil;
    local l_user_0 = v40.user;
    local v43 = l_useStyle_0();
    local v44 = l_useDispatch_0();
    local v45 = v23(l_user_0.id);
    local v46 = v40.enablePresenceIndicator and not v40.shouldUseCompactTiles;
    local l_Size_125_0 = v43.Tokens.Global.Size_125;
    local v49 = l_useUserExperiment_0({
        l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer
    }, function(v48) --[[ Line: 97 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v48[l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer] or {}).userPresenceIndicator == "showPresenceInLine";
    end, false);
    local v50 = l_useLastInputMode_0();
    local v52 = l_useSelector_0(function(v51) --[[ Line: 107 ]]
        -- upvalues: l_getDeepValue_0 (ref), l_RODUX_KEY_0 (ref), l_user_0 (copy)
        return l_getDeepValue_0(v51, string.format("%s.Presence.byUserId.%s", l_RODUX_KEY_0, l_user_0.id)) or {};
    end);
    local v53, v54 = v20({
        userId = l_user_0.id, 
        previousUsernames = l_user_0.previousUsernames, 
        searchKeyword = v40.searchParameters.searchKeyword, 
        profileInsight = v40.profileInsight, 
        shouldUseCompactTiles = v40.shouldUseCompactTiles, 
        userPresence = v52
    });
    local v55 = if l_FFlagPPVEnabledOnConsole_0 then nil else v24.usePreferredInput() == v24.Input.Directional;
    local v56 = if l_FFlagPPVEnabledOnConsole_0 then nil else v55;
    local v57 = if l_FFlagUserSearchAddFocusActionsSupport_0 then v24.usePreferredInput() == v24.Input.Directional else nil;
    local function v60(v58, v59) --[[ Line: 130 ]]
        -- upvalues: v40 (copy), v3 (ref), l_user_0 (copy), v54 (copy)
        if v40.fireAnalyticsEvent then
            v40.fireAnalyticsEvent(v58, v3.Dictionary.join({
                playerId = l_user_0.id, 
                tilePos = v40.index, 
                contextualInfoType = v54, 
                hasEmphasis = v40.hasEmphasis, 
                rowInSort = v40.rowInSort
            }, v59 or {}));
        end;
    end;
    local function v61() --[[ Line: 145 ]]
        -- upvalues: v56 (copy), l_FFlagPPVEnabledOnConsole_0 (ref), v44 (copy), l_SetCentralOverlay_0 (ref), l_user_0 (copy), v45 (copy), l_Enums_0 (ref), v40 (copy), v54 (copy), v53 (copy), v60 (copy), v25 (ref)
        if v56 and not l_FFlagPPVEnabledOnConsole_0 then
            v44(l_SetCentralOverlay_0("PlayerContextualMenu", {
                subjectUserId = l_user_0.id, 
                robloxFriendshipStatus = v45.status, 
                friendshipOriginSourceType = l_Enums_0.FriendshipOriginSourceType.PlayerSearch.rawValue()
            }));
        else
            v40.luaAppNavigation.navigateToUserInfo({
                userId = l_user_0.id, 
                index = v40.index, 
                hasEmphasis = v40.hasEmphasis, 
                contextualInfoType = v54, 
                contextualInfoDisplay = v53
            });
        end;
        v60(v25.PlayerTileClick);
    end;
    local v62 = v21({
        userId = l_user_0.id, 
        index = v40.index, 
        contextualInfoType = v54, 
        shouldUseCompactTiles = v40.shouldUseCompactTiles, 
        userPresence = v52, 
        subpage = v40.subpage, 
        shouldAddFocusEventName = if l_FFlagUserSearchAddFocusActionsSupport_0 then v57 else nil
    }, v60);
    local v63 = v53 and {
        text = v53.text, 
        fontStyle = v43.Font.CaptionBody, 
        icon = if v40.shouldUseCompactTiles then nil else v53.icon, 
        horizontalAlignment = if v40.shouldUseCompactTiles then Enum.HorizontalAlignment.Center else nil, 
        textXAlignment = if v40.shouldUseCompactTiles then Enum.TextXAlignment.Center else nil
    } or nil;
    local v64 = v22({
        userId = l_user_0.id
    });
    local function v68(v65, v66) --[[ Line: 189 ]]
        -- upvalues: v35 (ref), v43 (copy)
        if not v66 or not v66.combinedName then
            return "";
        elseif not v65 or not v35.isUserOnline(v65.userPresenceType) then
            return v66.combinedName;
        else
            local l_Color_0 = v43.Theme.OnlineStatus.Color;
            return ("<font color=\"rgb(%*,%*,%*)\">\226\151\143 </font>"):format(math.round(l_Color_0.R * 255), math.round(l_Color_0.G * 255), (math.round(l_Color_0.B * 255))) .. v66.combinedName;
        end;
    end;
    local l_createElement_0 = v2.createElement;
    local v70 = "Frame";
    local v71 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0)
    };
    local v72 = {};
    local l_createElement_1 = v2.createElement;
    local v74 = "Frame";
    local v75 = {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        ZIndex = 1
    };
    local v76 = {};
    local l_createElement_2 = v2.createElement;
    local l_l_PlayerTile_0_0 = l_PlayerTile_0;
    local v79 = {
        buttonRef = if l_FFlagUserSearchAddFocusActionsSupport_0 then v41 else nil, 
        tileSize = v40.size, 
        title = if not not v46 or v49 or l_FFlagBlendedSerpUserPresenceInLineEnabled_0 then v68(v52, v64) else v64 and v64.combinedName, 
        subtitle = v64 and v64.username
    };
    local l_id_0 = l_user_0.id;
    v79.thumbnail = if v40.shouldUseCompactTiles then l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(l_id_0))) else l_getRbxthumbWithTypeSizeAndOptions_0(tostring(l_id_0), l_Constants_0.RbxthumbTypes.Avatar, 720);
    v79.onActivated = v61;
    v79.buttons = if l_FFlagUserSearchAddFocusActionsSupport_0 then if v57 or v40.shouldUseCompactTiles then nil else v62 else if v40.shouldUseCompactTiles or v50 == "Focus" then nil else v62;
    v79.relevancyInfo = v63;
    v79.Selectable = true;
    v79.horizontalAlignment = if v40.shouldUseCompactTiles then Enum.HorizontalAlignment.Center else nil;
    v79.isCircular = v40.shouldUseCompactTiles;
    v79.thumbnailFrameSize = if v40.shouldUseCompactTiles then UDim2.new(1, -l_Size_125_0, 1, -l_Size_125_0) else nil;
    v79.openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil;
    v76.Tile = l_createElement_2(l_l_PlayerTile_0_0, v79);
    v76.UserTileEventHandlers = if l_FFlagUserSearchAddFocusActionsSupport_0 and v57 then v2.createElement(l_UserTileEventHandlers_0, {
        buttons = v62, 
        onTileActivated = v61, 
        tileRef = v41
    }) else nil;
    v72.UserTile = l_createElement_1(v74, v75, v76);
    v72.UserTileRoundCTAButton = if not (v40.shouldUseCompactTiles and v62 and #v62 > 0) or l_FFlagUserSearchAddFocusActionsSupport_0 and v57 then nil else v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        Size = UDim2.fromOffset(v43.Tokens.Global.Size_450, v43.Tokens.Global.Size_450), 
        AnchorPoint = Vector2.new(1, 1), 
        Position = UDim2.fromOffset(v40.size.X.Offset - v43.Tokens.Global.Size_125, v40.size.X.Offset - v43.Tokens.Global.Size_125)
    }, {
        RoundCTAButton = v2.createElement(v27, {
            searchTileButtonProps = v62[1], 
            playerTileSize = v40.size
        })
    });
    return l_createElement_0(v70, v71, v72);
end;