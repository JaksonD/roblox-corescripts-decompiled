local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local v1 = require(l_script_FirstAncestor_0.ApiPostPreparePurchase);
local v2 = require(l_script_FirstAncestor_0.GamePlayButtonShareLinkAnalytics);
local v3 = require(l_script_FirstAncestor_0.OpenCentralOverlayForPurchaseGame);
local v4 = require(l_script_FirstAncestor_0.OpenCentralOverlayForUnifiedPurchasePrompt);
local v5 = require(l_script_FirstAncestor_0.PlayButtonReferralSource);
local v6 = require(l_script_FirstAncestor_0.PlayButtonStates);
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local v8 = require(l_script_FirstAncestor_0.PlayButtonLaunchChecks.usePlayButtonLaunchAfterSeventeenPlusUpsell);
local v9 = require(l_script_FirstAncestor_0.PlayButtonLaunchChecks.usePlayButtonLaunchGame);
local v10 = require(l_script_FirstAncestor_0.PlayButtonLaunchChecks.usePlayButtonLaunchWithUxTreatment);
local v11 = require(l_script_FirstAncestor_0.PlayButtonLaunchChecks.useAgeVerificationOverlayCallback);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v13 = require(l_Parent_0.React);
local v14 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v14.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v14.Hooks.RoactRodux.useSelector;
local l_useRouteName_0 = require(l_Parent_0.Navigation).useRouteName;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v19 = require(l_Parent_0.RoactServiceTags);
local l_RoactAnalytics_0 = v19.RoactAnalytics;
local l_RoactNetworking_0 = v19.RoactNetworking;
local l_AppUpdateService_0 = v19.AppUpdateService;
local l_joinGamePlayButton_0 = require(l_Parent_0.DiscoveryAnalytics).Points.joinGamePlayButton;
local l_unlockPlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.unlockPlayIntent;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_CheckForUpdate_0 = require(l_Parent_0.RobloxAppUpdate).Thunks.CheckForUpdate;
local l_useGameProductInfoSelector_0 = require(l_Parent_0.GameProductInfoRodux).useGameProductInfoSelector;
local l_useGameInfosSelector_0 = require(l_Parent_0.GameInfosRodux).useGameInfosSelector;
local l_useGameIconSelector_0 = require(l_Parent_0.GameIconRodux).GameIcons.useGameIconSelector;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_Parent_0.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local v32 = require(l_Parent_0.PurchasePromptLite);
local l_ProductPurchaseSurface_0 = v32.Enums.ProductPurchaseSurface;
local l_getIsUserEligibleForUnifiedPurchaseFlow_0 = v32.getIsUserEligibleForUnifiedPurchaseFlow;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId;
local l_FFlagShipUnifiedPurchaseFlowToPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagShipUnifiedPurchaseFlowToPaidAccess;
local l_CreateExperienceInvite_0 = require(l_Parent_0.Squads).Thunks.CreateExperienceInvite;
local l_SquadExternalContractContext_0 = require(l_Parent_0.SquadsCore).SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadExperienceInviteSource_0 = require(l_Parent_0.SquadsCore).Enums.SquadExperienceInviteSource;
local _ = require(l_Parent_0.PlayabilityRodux);
local l_game_EngineFeature_0 = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly");
local l_game_EngineFeature_1 = game:GetEngineFeature("CanPerformBinaryUpdateEnabled");
local v44 = game:DefineFastFlag("IncludeWaitingForPartyInCondition", false);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_FFlagEnableSquadRegroupExperimentation_0 = require(l_Parent_0.SharedFlags).FFlagEnableSquadRegroupExperimentation;
local l_FFlagLuaAppPlayableUxTreatment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayableUxTreatment;
return function(v48, v49, v50, _, v52, v53, v54) --[[ Line: 59 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppUpdateService_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_useGameInfosSelector_0 (copy), l_useGameProductInfoSelector_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_useGameIconSelector_0 (copy), l_useRouteName_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v13 (copy), l_SquadExternalContractContext_0 (copy), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy), v9 (copy), l_FFlagLuaAppPlayableUxTreatment_0 (copy), v10 (copy), v8 (copy), v11 (copy), l_RoactNetworking_0 (copy), l_joinGamePlayButton_0 (copy), v5 (copy), v2 (copy), v6 (copy), l_game_EngineFeature_0 (copy), l_CheckForUpdate_0 (copy), l_game_EngineFeature_1 (copy), l_CloseCentralOverlay_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), v3 (copy), l_FFlagShipUnifiedPurchaseFlowToPaidAccess_0 (copy), v4 (copy), l_ProductPurchaseSurface_0 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy), v1 (copy), l_unlockPlayIntent_0 (copy), l_CreateExperienceInvite_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), l_SquadExperienceInviteSource_0 (copy), v44 (copy)
    local v55 = l_useRoactService_0(l_RoactAnalytics_0);
    local v56 = l_useRoactService_0(l_AppUpdateService_0);
    local v57 = l_useRoactService_0(l_AppEventIngestService_0);
    local v58 = l_useDispatch_0();
    local v60 = l_useSelector_0(function(v59) --[[ Line: 73 ]]
        -- upvalues: v48 (copy)
        return v59.GameDetails[v48];
    end);
    local v61 = l_useGameInfosSelector_0(v48);
    local v62 = l_useGameProductInfoSelector_0(v48);
    local v64 = l_useSelector_0(function(v63) --[[ Line: 78 ]]
        -- upvalues: v48 (copy)
        return v63.PlayabilityStatus[v48];
    end);
    local v65 = nil;
    if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
        v65 = l_useGameIconSelector_0(v48);
    end;
    local v66 = l_useRouteName_0();
    local v67 = if l_GetFFlagIsSquadEnabled_0() then v13.useContext(l_SquadExternalContractContext_0) else nil;
    local v68 = v60 and v60.rootPlaceId or v61 and v61.placeId or nil;
    v54 = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and v54 ~= "0" then v54 or v68 else v68;
    local v69 = v60 and v60.name or v61 and v61.name or nil;
    local v70 = v9(v48, v54, v68, v49, v50, v52, v53);
    local v71 = nil;
    if l_FFlagLuaAppPlayableUxTreatment_0 then
        v71 = v10(v64, v48, v70);
    end;
    local v72 = v8(v64, v48, if l_FFlagLuaAppPlayableUxTreatment_0 then v71 else v70);
    local v73 = v11(v48, v70, v72);
    local v74 = l_useRoactService_0(l_RoactNetworking_0);
    return (v13.useCallback(function(v75, v76) --[[ Line: 131 ]]
        -- upvalues: l_joinGamePlayButton_0 (ref), v55 (copy), v49 (copy), v68 (copy), v50 (copy), v5 (ref), v2 (ref), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (ref), v54 (ref), v48 (copy), v6 (ref), v73 (copy), v72 (copy), l_game_EngineFeature_0 (ref), v58 (copy), l_CheckForUpdate_0 (ref), v56 (copy), l_game_EngineFeature_1 (ref), v62 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), l_CloseCentralOverlay_0 (ref), l_FetchGamePlayabilityAndProductInfo_0 (ref), v74 (copy), v3 (ref), v69 (copy), v66 (copy), l_FFlagShipUnifiedPurchaseFlowToPaidAccess_0 (ref), v4 (ref), v65 (ref), l_ProductPurchaseSurface_0 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), v1 (ref), l_unlockPlayIntent_0 (ref), v57 (copy), v64 (copy), l_GetFFlagIsSquadEnabled_0 (ref), l_CreateExperienceInvite_0 (ref), v67 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_SquadExperienceInviteSource_0 (ref), v44 (ref)
        l_joinGamePlayButton_0(v55.InfluxDb, "playButtonClicked", {
            isUniversalApp = true, 
            referralSource = v49, 
            placeId = v68, 
            buttonState = v75 and v75 or "Invalid", 
            ctx = v50
        });
        if v49 == v5.ExperienceDetailsLink then
            v2(v55, {
                placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v54 else v68, 
                playButtonState = v75, 
                universeId = v48
            });
        end;
        if v75 == v6.Playable or v75 == v6.ActionNeeded then
            local v77 = nil;
            v77 = game:GetEngineFeature("VoiceChatSupported") and function() --[[ Line: 150 ]]
                -- upvalues: v73 (ref), v76 (copy)
                v73(v76);
            end or function() --[[ Line: 154 ]]
                -- upvalues: v72 (ref), v76 (copy)
                v72(v76);
            end;
            if l_game_EngineFeature_0 then
                v58(l_CheckForUpdate_0(v56, l_game_EngineFeature_1, v55, v77, {
                    ctx = v50
                }));
                return;
            else
                v77();
                return;
            end;
        elseif v75 == v6.PaidAccess then
            local v78 = v62 and v62.price or nil;
            local v79 = v62 and v62.productId or nil;
            local v80 = v62 and v62.sellerId or nil;
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
                local v81 = v62 and v62.universeId or nil;
                local function v82() --[[ Line: 173 ]] --[[ Name: onFlowComplete ]]
                    -- upvalues: v58 (ref), l_CloseCentralOverlay_0 (ref)
                    v58(l_CloseCentralOverlay_0());
                end;
                local function v83() --[[ Line: 176 ]] --[[ Name: onPurchaseSuccess ]]
                    -- upvalues: v58 (ref), l_FetchGamePlayabilityAndProductInfo_0 (ref), v74 (ref), v81 (copy)
                    v58(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v74, v81));
                end;
                local function _() --[[ Line: 179 ]] --[[ Name: initiateLegacyPurchaseFlow ]]
                    -- upvalues: v58 (ref), v3 (ref), v81 (copy), v69 (ref), v78 (copy), v79 (copy), v80 (copy), v66 (ref)
                    v58(v3(v81, v69, v78, v79, v80, {
                        v66
                    }));
                end;
                if l_FFlagShipUnifiedPurchaseFlowToPaidAccess_0 then
                    v58(v4({
                        productPayload = {
                            universeId = v81, 
                            kind = "Experience", 
                            experienceName = v69, 
                            experienceIconUrl = v65.url
                        }, 
                        purchaseCallbacks = {
                            onFlowComplete = v82, 
                            onPurchaseSuccess = v83
                        }, 
                        purchaseAnalyticsMetadata = {
                            surface = l_ProductPurchaseSurface_0.PaidAccess
                        }
                    }));
                    return;
                else
                    l_getIsUserEligibleForUnifiedPurchaseFlow_0(v74):andThen(function(v85) --[[ Line: 210 ]]
                        -- upvalues: v58 (ref), v4 (ref), v81 (copy), v69 (ref), v65 (ref), v82 (copy), v83 (copy), l_ProductPurchaseSurface_0 (ref), v3 (ref), v78 (copy), v79 (copy), v80 (copy), v66 (ref)
                        if v85 then
                            v58(v4({
                                productPayload = {
                                    universeId = v81, 
                                    kind = "Experience", 
                                    experienceName = v69, 
                                    experienceIconUrl = v65.url
                                }, 
                                purchaseCallbacks = {
                                    onFlowComplete = v82, 
                                    onPurchaseSuccess = v83
                                }, 
                                purchaseAnalyticsMetadata = {
                                    surface = l_ProductPurchaseSurface_0.PaidAccess
                                }
                            }));
                            return;
                        else
                            v58(v3(v81, v69, v78, v79, v80, {
                                v66
                            }));
                            return;
                        end;
                    end):catch(function(_) --[[ Line: 231 ]]
                        -- upvalues: v58 (ref), v3 (ref), v81 (copy), v69 (ref), v78 (copy), v79 (copy), v80 (copy), v66 (ref)
                        v58(v3(v81, v69, v78, v79, v80, {
                            v66
                        }));
                    end);
                    return;
                end;
            else
                v58(v3(v48, v69, v78, v79, v80, {
                    v66
                }));
                return;
            end;
        else
            if v75 == v6.FiatPaidAccess then
                if v68 and v62 and v62.fiatBasePriceId then
                    v58(v1.Fetch(v74, v68, v48, v62.fiatBasePriceId));
                    l_unlockPlayIntent_0(v57, {
                        universeId = v48, 
                        upsellName = "FiatPurchase", 
                        playabilityStatus = v64 and v64.playabilityStatus or nil
                    });
                    return;
                end;
            elseif v75 == v6.Loading then
                return;
            elseif l_GetFFlagIsSquadEnabled_0() and v75 == v6.PlayableWithParty then
                if v68 then
                    v58(l_CreateExperienceInvite_0(v68, v67, if l_FFlagEnableSquadRegroupExperimentation_0 then l_SquadExperienceInviteSource_0.Default else nil));
                    return;
                end;
            elseif v44 and v75 == v6.WaitingForParty then
                return;
            elseif v75 == v6.UnplayableOther then
                return;
            else
                error((("invalid play button state %*!"):format(v75)));
            end;
            return;
        end;
    end, {
        v55, 
        v56, 
        l_game_EngineFeature_1, 
        v48, 
        if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v54 else nil, 
        v68, 
        v69, 
        v49, 
        v50, 
        v73, 
        v72, 
        v62, 
        v66, 
        if l_GetFFlagIsSquadEnabled_0() then v67 else nil
    }));
end;