local l_TeleportService_0 = game:GetService("TeleportService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Parent_0 = script:FindFirstAncestor("InExperienceDetailsPrompt").Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SignalsReact);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v6 = require(l_Parent_0.DataHydration);
local l_Game_0 = v6.Game;
local l_VotesUtils_0 = l_Game_0.VotesUtils;
local l_EnumGameDetailErrorTypes_0 = require(l_Parent_0.DiscoveryTypes).EnumGameDetailErrorTypes;
local v10 = require(l_Parent_0.DiscoveryAnalytics);
local l_fireInExperienceDetailsPromptClosedEvent_0 = v10.Events.fireInExperienceDetailsPromptClosedEvent;
local l_fireInExperienceDetailsPromptPlayButtonClickedEvent_0 = v10.Events.fireInExperienceDetailsPromptPlayButtonClickedEvent;
local l_fireInExperienceDetailsPromptLoadedEvent_0 = v10.Events.fireInExperienceDetailsPromptLoadedEvent;
local v14 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v14.FocusNavigableSurfaceIdentifierEnum;
local l_useFocusRoot_0 = v14.useFocusRoot;
local v17 = require(script.Parent.InExperienceDetailsPrompt);
local l_FFlagLuaAppIedpOverlayAndNavigationFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix;
local l_FFlagLuaAppIedpFixPlayButton_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIedpFixPlayButton;
local v20 = l_FFlagLuaAppIedpOverlayAndNavigationFix_0 and "InExperienceDetailsPromptClose" or nil;
local function _(v21, v22) --[[ Line: 39 ]] --[[ Name: getGameDetailErrorType ]]
    -- upvalues: v6 (copy), l_EnumGameDetailErrorTypes_0 (copy)
    if v21 == v6.DataStatus.Failed then
        return l_EnumGameDetailErrorTypes_0.NetworkError;
    elseif v22 and v22.isUnavailable == true then
        return l_EnumGameDetailErrorTypes_0.ExperienceUnavailable;
    else
        return nil;
    end;
end;
return function(v24) --[[ Line: 54 ]] --[[ Name: InExperienceDetailsPromptContainer ]]
    -- upvalues: l_Game_0 (copy), v4 (copy), v6 (copy), l_EnumGameDetailErrorTypes_0 (copy), l_useFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v3 (copy), l_TeleportService_0 (copy), l_fireInExperienceDetailsPromptClosedEvent_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_fireInExperienceDetailsPromptPlayButtonClickedEvent_0 (copy), l_FFlagLuaAppIedpOverlayAndNavigationFix_0 (copy), v20 (copy), l_ContextActionService_0 (copy), l_fireInExperienceDetailsPromptLoadedEvent_0 (copy), v17 (copy), l_VotesUtils_0 (copy), l_FFlagLuaAppIedpFixPlayButton_0 (copy)
    local v25 = l_Game_0.getGameInfoStore(false);
    local v26 = l_Game_0.getAgeRecommendationStore(false);
    local v27 = l_Game_0.getPlayabilityStore(false);
    local v28 = l_Game_0.getVotesStore(false);
    local v29 = v25.getAndFetchGameInfo(v24.universeId);
    local v30 = v26.getAndFetchAgeRecommendation(v24.universeId);
    local v31 = v27.getAndFetchPlayability(v24.universeId);
    local v32 = v28.getAndFetchVote(v24.universeId);
    local v33 = v4.useSignalState(v29.data);
    local v34 = v4.useSignalState(v30.data);
    local v35 = v4.useSignalState(v31.data);
    local v36 = v4.useSignalState(v32.data);
    local v37 = v4.useSignalState(v29.status);
    local v38 = v4.useSignalState(v31.status);
    local v39 = if v33 and v33.rootPlaceId then tonumber(v33.rootPlaceId) else nil;
    local v40 = if v37 == v6.DataStatus.Failed then l_EnumGameDetailErrorTypes_0.NetworkError else if v33 and v33.isUnavailable == true then l_EnumGameDetailErrorTypes_0.ExperienceUnavailable else nil;
    local v41 = l_useFocusRoot_0({
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
        isIsolated = true, 
        isAutoFocusRoot = true
    });
    local v45 = v3.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: v39 (copy), v24 (copy), l_TeleportService_0 (ref), l_fireInExperienceDetailsPromptClosedEvent_0 (ref), v37 (copy), v6 (ref), v38 (copy), v35 (copy), v40 (copy), l_DiscoveryEventErrorLogger_0 (ref), l_fireInExperienceDetailsPromptPlayButtonClickedEvent_0 (ref)
        if v39 then
            v24.onClose();
            l_TeleportService_0:PromptExperienceDetailsCompleted(Enum.PromptExperienceDetailsResult.TeleportAttempted);
            l_TeleportService_0:Teleport(v39);
            local l_l_fireInExperienceDetailsPromptClosedEvent_0_0 = l_fireInExperienceDetailsPromptClosedEvent_0;
            local v43 = {
                targetUniverseId = v24.universeId, 
                targetRootPlaceId = v39, 
                closeReason = Enum.PromptExperienceDetailsResult.TeleportAttempted.Name
            };
            local v44 = false;
            if v37 ~= v6.DataStatus.NotReady then
                v44 = v38 ~= v6.DataStatus.NotReady;
            end;
            v43.isFullyLoaded = v44;
            v43.isPlayable = v35 and v35.isPlayable;
            v43.playabilityStatus = v35 and v35.playabilityStatus;
            v43.gameInfoErrorType = v40;
            l_l_fireInExperienceDetailsPromptClosedEvent_0_0(v43);
        else
            l_DiscoveryEventErrorLogger_0.reportError("InExperienceDetailsPromptContainerOnJoinMissingRootPlaceId", "Missing valid root place id for universe id", {
                universeId = v24.universeId, 
                rootPlaceId = v39
            });
        end;
        l_fireInExperienceDetailsPromptPlayButtonClickedEvent_0({
            targetUniverseId = v24.universeId, 
            targetRootPlaceId = v39, 
            playabilityRetrievalStatus = v38
        });
    end, {
        v24.onClose, 
        v39, 
        v24.universeId, 
        v37, 
        v38, 
        v35, 
        v40
    });
    local v46 = v35 and v35.isPlayable;
    local v47 = v35 and v35.playabilityStatus;
    local v51 = v3.useCallback(function() --[[ Line: 127 ]]
        -- upvalues: v24 (copy), l_TeleportService_0 (ref), l_fireInExperienceDetailsPromptClosedEvent_0 (ref), v39 (copy), v40 (copy), v46 (copy), v47 (copy), v37 (copy), v6 (ref), v38 (copy)
        v24.onClose();
        l_TeleportService_0:PromptExperienceDetailsCompleted(Enum.PromptExperienceDetailsResult.PromptClosed);
        local l_l_fireInExperienceDetailsPromptClosedEvent_0_1 = l_fireInExperienceDetailsPromptClosedEvent_0;
        local v49 = {
            targetUniverseId = v24.universeId, 
            targetRootPlaceId = v39, 
            gameInfoErrorType = v40, 
            closeReason = Enum.PromptExperienceDetailsResult.PromptClosed.Name, 
            isPlayable = v46, 
            playabilityStatus = v47
        };
        local v50 = false;
        if v37 ~= v6.DataStatus.NotReady then
            v50 = v38 ~= v6.DataStatus.NotReady;
        end;
        v49.isFullyLoaded = v50;
        l_l_fireInExperienceDetailsPromptClosedEvent_0_1(v49);
    end, {
        v24.onClose, 
        v24.universeId, 
        v39, 
        v40, 
        v46, 
        v47, 
        v37, 
        v38
    });
    local v52 = nil;
    if l_FFlagLuaAppIedpOverlayAndNavigationFix_0 then
        v52 = v3.useRef(nil);
        v3.useEffect(function() --[[ Line: 157 ]]
            -- upvalues: v20 (ref), v52 (ref), l_DiscoveryEventErrorLogger_0 (ref), v24 (copy), l_ContextActionService_0 (ref)
            l_ContextActionService_0:BindCoreAction(v20, function(v53, v54) --[[ Line: 158 ]]
                -- upvalues: v20 (ref), v52 (ref), l_DiscoveryEventErrorLogger_0 (ref), v24 (ref)
                if v53 == v20 and v54 == Enum.UserInputState.Begin then
                    if v52.current and v52.current.close then
                        v52.current.close();
                    else
                        l_DiscoveryEventErrorLogger_0.reportError("InExperienceDetailsPromptCloseError", "SheetRef containing close function is not defined", {
                            sheetRef = v52, 
                            universeId = v24.universeId
                        });
                    end;
                end;
                return Enum.ContextActionResult.Pass;
            end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape, Enum.KeyCode.ButtonStart);
            return function() --[[ Line: 183 ]]
                -- upvalues: l_ContextActionService_0 (ref), v20 (ref)
                l_ContextActionService_0:UnbindCoreAction(v20);
            end;
        end, {
            v24.universeId
        });
    end;
    local v55 = v3.useRef(false);
    v3.useEffect(function() --[[ Line: 191 ]]
        -- upvalues: v55 (copy), v37 (copy), v6 (ref), v38 (copy), l_fireInExperienceDetailsPromptLoadedEvent_0 (ref), v24 (copy), v39 (copy), v46 (copy), v47 (copy), v40 (copy)
        if not v55.current and v37 ~= v6.DataStatus.NotReady and v38 ~= v6.DataStatus.NotReady then
            l_fireInExperienceDetailsPromptLoadedEvent_0({
                targetUniverseId = v24.universeId, 
                gameInfoRetrievalStatus = v37, 
                playabilityRetrievalStatus = v38, 
                targetRootPlaceId = v39, 
                isPlayable = v46, 
                playabilityStatus = v47, 
                gameInfoErrorType = v40
            });
            v55.current = true;
        end;
    end, {
        v24.universeId, 
        v37, 
        v38, 
        v39, 
        v46, 
        v47, 
        v40
    });
    return v3.createElement(v17, {
        name = v33 and v33.name, 
        imageUri = v33 and ("rbxthumb://type=GameIcon&id=%*&w=150&h=150"):format(v24.universeId), 
        creator = v33 and v33.creator, 
        ageRecommendation = v34, 
        rating = v36 and l_VotesUtils_0.getRatingDisplayText(v36), 
        playability = v35, 
        errorType = v40, 
        rootPlaceId = if l_FFlagLuaAppIedpFixPlayButton_0 then v39 else nil, 
        onJoin = v45, 
        onClose = v51, 
        focusRootRef = v41, 
        sheetRef = if l_FFlagLuaAppIedpOverlayAndNavigationFix_0 then v52 else nil, 
        playabilityRetrievalStatus = v38
    });
end;