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
local l_invalidPlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.invalidPlayIntent;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_CheckForUpdate_0 = require(l_Parent_0.RobloxAppUpdate).Thunks.CheckForUpdate;
local l_useGameProductInfoSelector_0 = require(l_Parent_0.GameProductInfoRodux).useGameProductInfoSelector;
local l_useGameInfosSelector_0 = require(l_Parent_0.GameInfosRodux).useGameInfosSelector;
local l_useGameIconSelector_0 = require(l_Parent_0.GameIconRodux).GameIcons.useGameIconSelector;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_Parent_0.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local v33 = require(l_Parent_0.PurchasePromptLite);
local l_ProductPurchaseSurface_0 = v33.Enums.ProductPurchaseSurface;
local l_getIsUserEligibleForUnifiedPurchaseFlow_0 = v33.getIsUserEligibleForUnifiedPurchaseFlow;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId;
local l_FFlagShipUnifiedPurchaseFlowToPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagShipUnifiedPurchaseFlowToPaidAccess;
local l_CreateExperienceInvite_0 = require(l_Parent_0.Squads).Thunks.CreateExperienceInvite;
local l_SquadExternalContractContext_0 = require(l_Parent_0.SquadsCore).SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadExperienceInviteType_0 = require(l_Parent_0.SquadsCore).Enums.SquadExperienceInviteType;
local l_SquadExperienceInviteSource_0 = require(l_Parent_0.SquadsCore).Enums.SquadExperienceInviteSource;
local _ = require(l_Parent_0.PlayabilityRodux);
local l_game_EngineFeature_0 = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly");
local l_game_EngineFeature_1 = game:GetEngineFeature("CanPerformBinaryUpdateEnabled");
local v46 = game:DefineFastFlag("IncludeWaitingForPartyInCondition", false);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_FFlagEnableSquadRegroupExperimentation_0 = require(l_Parent_0.SharedFlags).FFlagEnableSquadRegroupExperimentation;
local l_FFlagLuaAppPlayableUxTreatment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayableUxTreatment;
local l_FFlagEnablePrivatePartyStartJoin_0 = require(l_Parent_0.SharedFlags).FFlagEnablePrivatePartyStartJoin;
local v51 = game:DefineFastFlag("LuaAppInvalidPlayIntent", false);
return function(v52, v53, v54, _, v56, v57, v58) --[[ Line: 67 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppUpdateService_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_useGameInfosSelector_0 (copy), l_useGameProductInfoSelector_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_useGameIconSelector_0 (copy), l_useRouteName_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v13 (copy), l_SquadExternalContractContext_0 (copy), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy), v9 (copy), l_FFlagLuaAppPlayableUxTreatment_0 (copy), v10 (copy), v8 (copy), v11 (copy), l_RoactNetworking_0 (copy), l_joinGamePlayButton_0 (copy), v5 (copy), v2 (copy), v6 (copy), l_game_EngineFeature_0 (copy), l_CheckForUpdate_0 (copy), l_game_EngineFeature_1 (copy), l_CloseCentralOverlay_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), v3 (copy), l_FFlagShipUnifiedPurchaseFlowToPaidAccess_0 (copy), v4 (copy), l_ProductPurchaseSurface_0 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy), v1 (copy), l_unlockPlayIntent_0 (copy), v51 (copy), l_invalidPlayIntent_0 (copy), l_CreateExperienceInvite_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), l_SquadExperienceInviteSource_0 (copy), l_FFlagEnablePrivatePartyStartJoin_0 (copy), l_SquadExperienceInviteType_0 (copy), v46 (copy)
    local v59 = l_useRoactService_0(l_RoactAnalytics_0);
    local v60 = l_useRoactService_0(l_AppUpdateService_0);
    local v61 = l_useRoactService_0(l_AppEventIngestService_0);
    local v62 = l_useDispatch_0();
    local v64 = l_useSelector_0(function(v63) --[[ Line: 81 ]]
        -- upvalues: v52 (copy)
        return v63.GameDetails[v52];
    end);
    local v65 = l_useGameInfosSelector_0(v52);
    local v66 = l_useGameProductInfoSelector_0(v52);
    local v68 = l_useSelector_0(function(v67) --[[ Line: 86 ]]
        -- upvalues: v52 (copy)
        return v67.PlayabilityStatus[v52];
    end);
    local v69 = nil;
    if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
        v69 = l_useGameIconSelector_0(v52);
    end;
    local v70 = l_useRouteName_0();
    local v71 = if l_GetFFlagIsSquadEnabled_0() then v13.useContext(l_SquadExternalContractContext_0) else nil;
    local v72 = v64 and v64.rootPlaceId or v65 and v65.placeId or nil;
    v58 = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and v58 ~= "0" then v58 or v72 else v72;
    local v73 = v64 and v64.name or v65 and v65.name or nil;
    local v74 = v9(v52, v58, v72, v53, v54, v56, v57);
    local v75 = nil;
    if l_FFlagLuaAppPlayableUxTreatment_0 then
        v75 = v10(v68, v52, v74);
    end;
    local v76 = v8(v68, v52, if l_FFlagLuaAppPlayableUxTreatment_0 then v75 else v74);
    local v77 = v11(v52, v74, v76);
    local v78 = l_useRoactService_0(l_RoactNetworking_0);
    return (v13.useCallback(function(v79, v80, v81) --[[ Line: 140 ]]
        -- upvalues: l_joinGamePlayButton_0 (ref), v59 (copy), v53 (copy), v72 (copy), v54 (copy), v5 (ref), v2 (ref), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (ref), v58 (ref), v52 (copy), v6 (ref), v77 (copy), v76 (copy), l_game_EngineFeature_0 (ref), v62 (copy), l_CheckForUpdate_0 (ref), v60 (copy), l_game_EngineFeature_1 (ref), v66 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), l_CloseCentralOverlay_0 (ref), l_FetchGamePlayabilityAndProductInfo_0 (ref), v78 (copy), v3 (ref), v73 (copy), v70 (copy), l_FFlagShipUnifiedPurchaseFlowToPaidAccess_0 (ref), v4 (ref), v69 (ref), l_ProductPurchaseSurface_0 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), v1 (ref), l_unlockPlayIntent_0 (ref), v61 (copy), v68 (copy), v51 (ref), l_invalidPlayIntent_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref), l_CreateExperienceInvite_0 (ref), v71 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_SquadExperienceInviteSource_0 (ref), l_FFlagEnablePrivatePartyStartJoin_0 (ref), l_SquadExperienceInviteType_0 (ref), v46 (ref)
        l_joinGamePlayButton_0(v59.InfluxDb, "playButtonClicked", {
            isUniversalApp = true, 
            referralSource = v53, 
            placeId = v72, 
            buttonState = v79 and v79 or "Invalid", 
            ctx = v54
        });
        if v53 == v5.ExperienceDetailsLink then
            v2(v59, {
                placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v58 else v72, 
                playButtonState = v79, 
                universeId = v52
            });
        end;
        if v79 == v6.Playable or v79 == v6.ActionNeeded then
            local v82 = nil;
            v82 = game:GetEngineFeature("VoiceChatSupported") and function() --[[ Line: 159 ]]
                -- upvalues: v77 (ref), v80 (copy)
                v77(v80);
            end or function() --[[ Line: 163 ]]
                -- upvalues: v76 (ref), v80 (copy)
                v76(v80);
            end;
            if l_game_EngineFeature_0 then
                v62(l_CheckForUpdate_0(v60, l_game_EngineFeature_1, v59, v82, {
                    ctx = v54
                }));
                return;
            else
                v82();
                return;
            end;
        elseif v79 == v6.PaidAccess then
            local v83 = v66 and v66.price or nil;
            local v84 = v66 and v66.productId or nil;
            local v85 = v66 and v66.sellerId or nil;
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
                local v86 = v66 and v66.universeId or nil;
                local function v87() --[[ Line: 182 ]] --[[ Name: onFlowComplete ]]
                    -- upvalues: v62 (ref), l_CloseCentralOverlay_0 (ref)
                    v62(l_CloseCentralOverlay_0());
                end;
                local function v88() --[[ Line: 185 ]] --[[ Name: onPurchaseSuccess ]]
                    -- upvalues: v62 (ref), l_FetchGamePlayabilityAndProductInfo_0 (ref), v78 (ref), v86 (copy)
                    v62(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v78, v86));
                end;
                local function _() --[[ Line: 188 ]] --[[ Name: initiateLegacyPurchaseFlow ]]
                    -- upvalues: v62 (ref), v3 (ref), v86 (copy), v73 (ref), v83 (copy), v84 (copy), v85 (copy), v70 (ref)
                    v62(v3(v86, v73, v83, v84, v85, {
                        v70
                    }));
                end;
                if l_FFlagShipUnifiedPurchaseFlowToPaidAccess_0 then
                    v62(v4({
                        productPayload = {
                            universeId = v86, 
                            kind = "Experience", 
                            experienceName = v73, 
                            experienceIconUrl = v69.url
                        }, 
                        purchaseCallbacks = {
                            onFlowComplete = v87, 
                            onPurchaseSuccess = v88
                        }, 
                        purchaseAnalyticsMetadata = {
                            surface = l_ProductPurchaseSurface_0.PaidAccess
                        }
                    }));
                    return;
                else
                    l_getIsUserEligibleForUnifiedPurchaseFlow_0(v78):andThen(function(v90) --[[ Line: 219 ]]
                        -- upvalues: v62 (ref), v4 (ref), v86 (copy), v73 (ref), v69 (ref), v87 (copy), v88 (copy), l_ProductPurchaseSurface_0 (ref), v3 (ref), v83 (copy), v84 (copy), v85 (copy), v70 (ref)
                        if v90 then
                            v62(v4({
                                productPayload = {
                                    universeId = v86, 
                                    kind = "Experience", 
                                    experienceName = v73, 
                                    experienceIconUrl = v69.url
                                }, 
                                purchaseCallbacks = {
                                    onFlowComplete = v87, 
                                    onPurchaseSuccess = v88
                                }, 
                                purchaseAnalyticsMetadata = {
                                    surface = l_ProductPurchaseSurface_0.PaidAccess
                                }
                            }));
                            return;
                        else
                            v62(v3(v86, v73, v83, v84, v85, {
                                v70
                            }));
                            return;
                        end;
                    end):catch(function(_) --[[ Line: 240 ]]
                        -- upvalues: v62 (ref), v3 (ref), v86 (copy), v73 (ref), v83 (copy), v84 (copy), v85 (copy), v70 (ref)
                        v62(v3(v86, v73, v83, v84, v85, {
                            v70
                        }));
                    end);
                    return;
                end;
            else
                v62(v3(v52, v73, v83, v84, v85, {
                    v70
                }));
                return;
            end;
        else
            if v79 == v6.FiatPaidAccess then
                if v72 and v66 and v66.fiatBasePriceId then
                    v62(v1.Fetch(v78, v72, v52, v66.fiatBasePriceId));
                    l_unlockPlayIntent_0(v61, {
                        universeId = v52, 
                        upsellName = "FiatPurchase", 
                        playabilityStatus = v68 and v68.playabilityStatus or nil
                    });
                    return;
                end;
            elseif v79 == v6.Loading then
                if v51 then
                    l_invalidPlayIntent_0(v54, {
                        universeId = v52, 
                        playButtonState = v79, 
                        playabilityStatus = v68 and v68.playabilityStatus or nil
                    });
                end;
                return;
            elseif l_GetFFlagIsSquadEnabled_0() and v79 == v6.PlayableWithParty then
                if v72 then
                    v62(l_CreateExperienceInvite_0(v72, v71, if l_FFlagEnableSquadRegroupExperimentation_0 then l_SquadExperienceInviteSource_0.Default else nil, if l_FFlagEnablePrivatePartyStartJoin_0 and v81 and v81.isPrivateParty then l_SquadExperienceInviteType_0.PlayWithPartyInPrivatePartyServer else nil));
                    return;
                end;
            elseif v46 and v79 == v6.WaitingForParty then
                if v51 then
                    l_invalidPlayIntent_0(v54, {
                        universeId = v52, 
                        playButtonState = v79, 
                        playabilityStatus = v68 and v68.playabilityStatus or nil
                    });
                end;
                return;
            elseif v79 == v6.UnplayableOther then
                if v51 then
                    l_invalidPlayIntent_0(v54, {
                        universeId = v52, 
                        playButtonState = v79, 
                        playabilityStatus = v68 and v68.playabilityStatus or nil
                    });
                end;
                return;
            else
                error((("invalid play button state %*!"):format(v79)));
            end;
            return;
        end;
    end, {
        v59, 
        v60, 
        l_game_EngineFeature_1, 
        v52, 
        if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v58 else nil, 
        v72, 
        v73, 
        v53, 
        v54, 
        v77, 
        v76, 
        v66, 
        v70, 
        if l_GetFFlagIsSquadEnabled_0() then v71 else nil, 
        if v51 then v68 else nil
    }));
end;