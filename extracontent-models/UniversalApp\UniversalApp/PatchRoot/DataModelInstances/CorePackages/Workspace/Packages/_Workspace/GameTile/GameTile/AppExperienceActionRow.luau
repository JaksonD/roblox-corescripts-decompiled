local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v4 = require(l_Parent_0.RoactServiceTags);
local l_AppSessionService_0 = v4.AppSessionService;
local l_RoactNetworking_0 = v4.RoactNetworking;
local v7 = require(l_Parent_0.Roact);
local v8 = require(l_Parent_0.RoactRodux);
local v9 = require(l_Parent_0.t);
local l_ButtonSize_0 = require(l_Parent_0.Foundation).Enums.ButtonSize;
local v11 = require(l_Parent_0.UIBlox);
local l_ExperienceActionRow_0 = v11.App.Tile.ExperienceActionRow;
local l_Images_0 = v11.App.ImageSet.Images;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local l_MenuDirection_0 = v11.App.Menu.MenuDirection;
local v16 = require(l_Parent_0.RobloxAppSessionization);
local l_SetGamePlaySession_0 = v16.SetGamePlaySession;
local l_SessionType_0 = v16.SessionType;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v20 = require(l_Parent_0.GamePlayButton);
local l_PlayButton_0 = v20.PlayButton;
local l_PlayButtonStates_0 = v20.PlayButtonStates;
local l_usePlayButtonState_0 = v20.usePlayButtonState;
local l_useOnPlaySquadButtonCallback_0 = v20.useOnPlaySquadButtonCallback;
local l_useOnPlayButtonCallback_0 = v20.useOnPlayButtonCallback;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_GamesProductInfoReducer_0 = require(l_Parent_0.GameProductInfoRodux).GamesProductInfoReducer;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagLuaAppEnablePlaySquadButton_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnablePlaySquadButton;
local l_FFlagLuaAppEnablePlayableStateWhenLoading_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnablePlayableStateWhenLoading;
local l_FFlagLuaAppUnifyPlayButtonTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonTile;
local l_FFlagLuaAppUnifyPlayButtonTileIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonTileIxp;
local l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppCustomSpawnNonNilCheck_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCustomSpawnNonNilCheck;
local v40 = require(l_script_FirstAncestor_0.GameTileExperimentation);
local v41 = l_FFlagLuaAppUnifyPlayButtonTile_0 and 40 or nil;
local v42 = v7.PureComponent:extend("AppExperienceActionRow");
v42.validateProps = v9.strictInterface({
    universeId = v9.string, 
    launchExperienceEventContext = v9.optional(v9.string), 
    referralSource = v9.optional(v9.string), 
    launchSource = v9.string, 
    reportExperienceLaunched = v9.optional(v9.callback), 
    entry = v9.table, 
    openGameDetails = v9.callback, 
    horizontalPadding = v9.optional(v9.number), 
    verticalPadding = v9.optional(v9.number), 
    height = v9.optional(v9.number), 
    fetchDelayInSeconds = v9.optional(v9.number), 
    index = v9.optional(v9.number), 
    showButtonText = v9.optional(v9.boolean), 
    width = if l_FFlagLuaAppUnifyPlayButtonTile_0 then v9.optional(v9.UDim) else nil, 
    placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v9.optional(v9.string) else nil, 
    launchDataOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v9.optional(v9.string) else nil, 
    price = v9.optional(v9.number), 
    centralOverlayType = v9.optional(v9.string), 
    closeCentralOverlay = v9.optional(v9.callback), 
    playButtonState = v9.string, 
    playabilityStatus = v9.optional(v9.table), 
    onPlayButtonActivated = v9.callback, 
    onPlaySquadButtonActivated = v9.optional(v9.callback), 
    sessionService = v9.optional(v9.union(v9.Instance, v9.table)), 
    isUnifiedGameTileEnabled = if l_FFlagLuaAppUnifyPlayButtonTile_0 then v9.optional(v9.boolean) else nil, 
    hasUnifiedPlayButtonIxp = if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then v9.optional(v9.boolean) else nil
});
local function _(v43) --[[ Line: 97 ]] --[[ Name: modifyPlayButtonState ]]
    -- upvalues: l_PlayButtonStates_0 (copy)
    if v43 == l_PlayButtonStates_0.Loading then
        return l_PlayButtonStates_0.Playable;
    else
        return v43;
    end;
end;
v42.init = function(v45) --[[ Line: 106 ]] --[[ Name: init ]]
    -- upvalues: l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (copy)
    v45.onPlayPressed = function() --[[ Line: 107 ]]
        -- upvalues: v45 (copy), l_SetGamePlaySession_0 (ref), l_SessionType_0 (ref)
        if v45:requiresPurchase() or v45:requiresFiatPurchase() then
            v45.props.openGameDetails();
            return;
        else
            if v45:isButtonEnabled() then
                l_SetGamePlaySession_0(v45.props.sessionService, l_SessionType_0.StructuralIdentifier.GamePlayFromHoverTile, true);
                local v46 = if v45.props.reportExperienceLaunched then v45.reportExperienceLaunched else nil;
                v45.props.onPlayButtonActivated(v45.props.playButtonState, v46);
            end;
            return;
        end;
    end;
    v45.reportExperienceLaunched = function() --[[ Line: 121 ]]
        -- upvalues: l_FFlagLuaAppUnifyPlayButtonTile_0 (ref), l_SetGamePlaySession_0 (ref), v45 (copy), l_SessionType_0 (ref)
        if l_FFlagLuaAppUnifyPlayButtonTile_0 then
            l_SetGamePlaySession_0(v45.props.sessionService, l_SessionType_0.StructuralIdentifier.GamePlayFromHoverTile, true);
        end;
        v45.props.reportExperienceLaunched(v45.props.entry, v45.props.referralSource, v45.props.launchSource, v45.props.launchExperienceEventContext, v45.props.index);
    end;
end;
v42.willUnmount = function(v47) --[[ Line: 136 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_CentralOverlayType_0 (copy)
    if l_FFlagLuaAppEnablePlaySquadButton_0 and v47.props.centralOverlayType == l_CentralOverlayType_0.GameDetailsSquad then
        v47.props.closeCentralOverlay();
    end;
end;
v42.render = function(v48) --[[ Line: 143 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagLuaAppUnifyPlayButtonTile_0 (copy), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (copy), l_FFlagLuaAppUnifyPlayButtonTileIxp_0 (copy), v40 (copy), l_withLocalization_0 (copy), v7 (copy), l_PlayButton_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_ButtonSize_0 (copy), v41 (copy), l_ExperienceActionRow_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy)
    if l_FFlagLuaAppUnifyPlayButtonTile_0 then
        local l_isUnifiedGameTileEnabled_0 = v48.props.isUnifiedGameTileEnabled;
        local v50 = l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 and v48.props.hasUnifiedPlayButtonIxp or l_FFlagLuaAppUnifyPlayButtonTileIxp_0 and v40.getIsPlayButtonMigrationEnabled();
        if l_isUnifiedGameTileEnabled_0 and (not l_FFlagLuaAppUnifyPlayButtonTileIxp_0 and not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v50) then
            local v51 = v48.props.horizontalPadding or 0;
            local v52 = v48.props.verticalPadding or 0;
            return l_withLocalization_0({
                buyText = "Feature.ExperienceDetails.PlayButtonText.Buy"
            })(function(v53) --[[ Line: 163 ]]
                -- upvalues: v7 (ref), l_PlayButton_0 (ref), v48 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), l_ButtonSize_0 (ref), v41 (ref), v51 (copy), v52 (copy)
                return v7.createElement(l_PlayButton_0, {
                    universeId = v48.props.universeId, 
                    placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v48.props.placeIdOverride else nil, 
                    referralSource = v48.props.referralSource, 
                    eventContext = v48.props.launchExperienceEventContext, 
                    launchSource = v48.props.launchSource, 
                    experienceJoinData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v48.props.launchDataOverride then {
                        launchData = v48.props.launchDataOverride
                    } else nil, 
                    reportExperienceLaunched = v48.reportExperienceLaunched, 
                    fiatText = v53.buyText, 
                    hideOptionalText = not v48.props.showButtonText, 
                    buttonSize = l_ButtonSize_0.Medium, 
                    isPlayableWhenLoading = true, 
                    onPurchaseRequiredCallback = v48.props.openGameDetails, 
                    fillBehavior = not v48.props.width and "Fill" or nil, 
                    width = v48.props.width, 
                    squadButtonHeight = UDim.new(0, v41), 
                    Position = UDim2.new(0, v51, 1, -v52 - v41)
                });
            end);
        end;
    end;
    return l_withLocalization_0({
        actionNeededText = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded", 
        unavailableText = "Feature.ExperienceDetails.PlayButtonText.Unavailable", 
        buyText = "Feature.ExperienceDetails.PlayButtonText.Buy"
    })(function(v54) --[[ Line: 194 ]]
        -- upvalues: v7 (ref), l_ExperienceActionRow_0 (ref), v48 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (ref)
        return v7.createElement(l_ExperienceActionRow_0, {
            isActionable = v48:isButtonEnabled(), 
            text = v48:getButtonText(v54), 
            icon = v48:getButtonIcon(), 
            buttonType = v48:getButtonType(), 
            onPlayPressed = v48.onPlayPressed, 
            onOverflowPressed = if l_FFlagLuaAppEnablePlaySquadButton_0 and v48:isOverflowButtonVisible() then v48.props.onPlaySquadButtonActivated else nil, 
            horizontalPadding = v48.props.horizontalPadding, 
            verticalPadding = v48.props.verticalPadding, 
            height = v48.props.height
        });
    end);
end;
v42.isOverflowButtonVisible = function(v55) --[[ Line: 211 ]] --[[ Name: isOverflowButtonVisible ]]
    -- upvalues: l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_PlayButtonStates_0 (copy)
    return l_FFlagLuaAppEnablePlaySquadButton_0 and (v55.props.playButtonState == l_PlayButtonStates_0.PlayableWithParty or v55.props.playButtonState == l_PlayButtonStates_0.WaitingForParty);
end;
v42.isButtonEnabled = function(v56) --[[ Line: 221 ]] --[[ Name: isButtonEnabled ]]
    -- upvalues: l_FFlagLuaAppEnablePlayableStateWhenLoading_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_PlayButtonStates_0 (copy)
    if l_FFlagLuaAppEnablePlayableStateWhenLoading_0 and v56.props.playabilityStatus == nil and l_GetFFlagIsSquadEnabled_0() and v56.props.playButtonState == l_PlayButtonStates_0.WaitingForParty then
        return false;
    else
        local v57 = true;
        if v56.props.playabilityStatus ~= nil then
            v57 = true;
            if v56.props.playButtonState ~= l_PlayButtonStates_0.Playable then
                v57 = true;
                if v56.props.playButtonState ~= l_PlayButtonStates_0.Loading then
                    v57 = l_GetFFlagIsSquadEnabled_0() and v56.props.playButtonState == l_PlayButtonStates_0.PlayableWithParty or v56:isActionNeeded() or v56:requiresPurchase() or v56:requiresFiatPurchase();
                end;
            end;
        end;
        return v57;
    end;
end;
v42.requiresFiatPurchase = function(v58) --[[ Line: 246 ]] --[[ Name: requiresFiatPurchase ]]
    -- upvalues: l_PlayButtonStates_0 (copy)
    return v58.props.playButtonState == l_PlayButtonStates_0.FiatPaidAccess;
end;
v42.requiresPurchase = function(v59) --[[ Line: 250 ]] --[[ Name: requiresPurchase ]]
    -- upvalues: l_PlayButtonStates_0 (copy)
    return v59.props.playButtonState == l_PlayButtonStates_0.PaidAccess;
end;
v42.isActionNeeded = function(v60) --[[ Line: 254 ]] --[[ Name: isActionNeeded ]]
    -- upvalues: l_PlayButtonStates_0 (copy)
    return v60.props.playButtonState == l_PlayButtonStates_0.ActionNeeded;
end;
v42.getButtonText = function(v61, v62) --[[ Line: 258 ]] --[[ Name: getButtonText ]]
    -- upvalues: l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_PlayButtonStates_0 (copy)
    if v61.props.showButtonText then
        if v61:isActionNeeded() then
            return v62.actionNeededText;
        elseif not v61:isButtonEnabled() then
            if l_FFlagLuaAppEnablePlaySquadButton_0 and v61.props.playButtonState == l_PlayButtonStates_0.WaitingForParty then
                return nil;
            else
                return v62.unavailableText;
            end;
        end;
    end;
    if v61:requiresPurchase() then
        return (tostring(v61.props.price or "--"));
    elseif v61:requiresFiatPurchase() then
        return v62.buyText;
    else
        return nil;
    end;
end;
v42.getButtonType = function(v63) --[[ Line: 283 ]] --[[ Name: getButtonType ]]
    -- upvalues: l_ButtonType_0 (copy)
    if v63:isActionNeeded() then
        return l_ButtonType_0.PrimarySystem;
    elseif not v63:isButtonEnabled() then
        return l_ButtonType_0.Secondary;
    else
        return l_ButtonType_0.PrimaryContextual;
    end;
end;
v42.getButtonIcon = function(v64) --[[ Line: 293 ]] --[[ Name: getButtonIcon ]]
    -- upvalues: l_Images_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_PlayButtonStates_0 (copy)
    if v64:isActionNeeded() then
        return l_Images_0["icons/status/private"];
    elseif v64:requiresPurchase() then
        return l_Images_0["icons/common/robux"];
    elseif v64:requiresFiatPurchase() then
        return nil;
    elseif not v64:isButtonEnabled() then
        if l_FFlagLuaAppEnablePlaySquadButton_0 and v64.props.playButtonState == l_PlayButtonStates_0.WaitingForParty then
            return l_Images_0["icons/common/play"];
        else
            return l_Images_0["icons/status/unavailable"];
        end;
    else
        return l_Images_0["icons/common/play"];
    end;
end;
local l_v42_0 = v42;
v42 = v8.connect(function(v66, v67) --[[ Line: 381 ]]
    -- upvalues: l_GamesProductInfoReducer_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy)
    local l_universeId_0 = v67.universeId;
    local v69 = if v66[l_GamesProductInfoReducer_0.key] then v66[l_GamesProductInfoReducer_0.key][l_universeId_0] else nil;
    return {
        price = if v69 ~= nil then v69.price else nil, 
        centralOverlayType = if l_FFlagLuaAppEnablePlaySquadButton_0 then v66.CentralOverlay.OverlayType else nil
    };
end, function(v70) --[[ Line: 390 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 392 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v70 (copy), l_CloseCentralOverlay_0 (ref)
            return v70(l_CloseCentralOverlay_0());
        end
    };
end)(function(v71) --[[ Line: 312 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_usePlayButtonState_0 (copy), l_FFlagLuaAppEnablePlayableStateWhenLoading_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppCustomSpawnNonNilCheck_0 (copy), l_useOnPlayButtonCallback_0 (copy), l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_useOnPlaySquadButtonCallback_0 (copy), l_MenuDirection_0 (copy), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), v2 (copy), l_PlayButtonStates_0 (copy), v7 (copy), l_v42_0 (copy)
    local v72 = l_useRoactService_0(l_RoactNetworking_0);
    local v73 = l_usePlayButtonState_0(v72, v71.universeId, v71.fetchDelayInSeconds, l_FFlagLuaAppEnablePlayableStateWhenLoading_0 and true or nil);
    local v74 = nil;
    if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then
        if l_FFlagLuaAppCustomSpawnNonNilCheck_0 then
            if v71.launchDataOverride then
                v74 = {
                    launchData = v71.launchDataOverride
                };
            end;
        else
            v74 = {};
            if v71.launchDataOverride then
                v74.launchData = v71.launchDataOverride;
            end;
        end;
    end;
    local v75 = l_useOnPlayButtonCallback_0(v71.universeId, v71.referralSource, v71.launchExperienceEventContext or "PlayButton", nil, v71.launchSource or "UnknownLaunchSource", if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v74 else nil, if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v71.placeIdOverride else nil);
    local v76 = if l_FFlagLuaAppEnablePlaySquadButton_0 then l_useOnPlaySquadButtonCallback_0(l_MenuDirection_0.Up, v73.playButtonState, v71.referralSource, v71.universeId) else nil;
    local v77 = nil;
    if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then
        v77 = l_useUserExperiment_0({
            l_AppUserLayers_0.PlayButtonUXExposureLayer
        }, function(v78) --[[ Line: 359 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            return (v78[l_AppUserLayers_0.PlayButtonUXExposureLayer] or {}).HasUnifiedPlayButton;
        end, true);
    end;
    local l_join_0 = v2.Dictionary.join;
    local l_v71_0 = v71;
    local v81 = {
        playabilityStatus = v73.playabilityStatus, 
        onPlayButtonActivated = v75, 
        onPlaySquadButtonActivated = v76
    };
    local v82;
    if l_FFlagLuaAppEnablePlayableStateWhenLoading_0 then
        v82 = v73.playButtonState;
    else
        local l_playButtonState_0 = v73.playButtonState;
        v82 = if l_playButtonState_0 == l_PlayButtonStates_0.Loading then l_PlayButtonStates_0.Playable else l_playButtonState_0;
    end;
    v81.playButtonState = v82;
    v81.hasUnifiedPlayButtonIxp = if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then v77 else nil;
    l_join_0 = l_join_0(l_v71_0, v81);
    return v7.createElement(l_v42_0, l_join_0);
end);
return (l_RoactServices_0.connect({
    sessionService = l_AppSessionService_0
})(v42));