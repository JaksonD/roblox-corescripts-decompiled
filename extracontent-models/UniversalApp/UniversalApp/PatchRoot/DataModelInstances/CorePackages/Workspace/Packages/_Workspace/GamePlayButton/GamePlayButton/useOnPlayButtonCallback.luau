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
local l_SquadExperienceInviteType_0 = require(l_Parent_0.SquadsCore).Enums.SquadExperienceInviteType;
local l_SquadExperienceInviteSource_0 = require(l_Parent_0.SquadsCore).Enums.SquadExperienceInviteSource;
local _ = require(l_Parent_0.PlayabilityRodux);
local l_game_EngineFeature_0 = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly");
local l_game_EngineFeature_1 = game:GetEngineFeature("CanPerformBinaryUpdateEnabled");
local v45 = game:DefineFastFlag("IncludeWaitingForPartyInCondition", false);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_FFlagEnableSquadRegroupExperimentation_0 = require(l_Parent_0.SharedFlags).FFlagEnableSquadRegroupExperimentation;
local l_FFlagLuaAppPlayableUxTreatment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayableUxTreatment;
local l_FFlagEnablePrivatePartyStartJoin_0 = require(l_Parent_0.SharedFlags).FFlagEnablePrivatePartyStartJoin;
return function(v50, v51, v52, _, v54, v55, v56) --[[ Line: 65 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppUpdateService_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_useGameInfosSelector_0 (copy), l_useGameProductInfoSelector_0 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_useGameIconSelector_0 (copy), l_useRouteName_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v13 (copy), l_SquadExternalContractContext_0 (copy), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy), v9 (copy), l_FFlagLuaAppPlayableUxTreatment_0 (copy), v10 (copy), v8 (copy), v11 (copy), l_RoactNetworking_0 (copy), l_joinGamePlayButton_0 (copy), v5 (copy), v2 (copy), v6 (copy), l_game_EngineFeature_0 (copy), l_CheckForUpdate_0 (copy), l_game_EngineFeature_1 (copy), l_CloseCentralOverlay_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), v3 (copy), l_FFlagShipUnifiedPurchaseFlowToPaidAccess_0 (copy), v4 (copy), l_ProductPurchaseSurface_0 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy), v1 (copy), l_unlockPlayIntent_0 (copy), l_CreateExperienceInvite_0 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (copy), l_SquadExperienceInviteSource_0 (copy), l_FFlagEnablePrivatePartyStartJoin_0 (copy), l_SquadExperienceInviteType_0 (copy), v45 (copy)
    local v57 = l_useRoactService_0(l_RoactAnalytics_0);
    local v58 = l_useRoactService_0(l_AppUpdateService_0);
    local v59 = l_useRoactService_0(l_AppEventIngestService_0);
    local v60 = l_useDispatch_0();
    local v62 = l_useSelector_0(function(v61) --[[ Line: 79 ]]
        -- upvalues: v50 (copy)
        return v61.GameDetails[v50];
    end);
    local v63 = l_useGameInfosSelector_0(v50);
    local v64 = l_useGameProductInfoSelector_0(v50);
    local v66 = l_useSelector_0(function(v65) --[[ Line: 84 ]]
        -- upvalues: v50 (copy)
        return v65.PlayabilityStatus[v50];
    end);
    local v67 = nil;
    if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
        v67 = l_useGameIconSelector_0(v50);
    end;
    local v68 = l_useRouteName_0();
    local v69 = if l_GetFFlagIsSquadEnabled_0() then v13.useContext(l_SquadExternalContractContext_0) else nil;
    local v70 = v62 and v62.rootPlaceId or v63 and v63.placeId or nil;
    v56 = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and v56 ~= "0" then v56 or v70 else v70;
    local v71 = v62 and v62.name or v63 and v63.name or nil;
    local v72 = v9(v50, v56, v70, v51, v52, v54, v55);
    local v73 = nil;
    if l_FFlagLuaAppPlayableUxTreatment_0 then
        v73 = v10(v66, v50, v72);
    end;
    local v74 = v8(v66, v50, if l_FFlagLuaAppPlayableUxTreatment_0 then v73 else v72);
    local v75 = v11(v50, v72, v74);
    local v76 = l_useRoactService_0(l_RoactNetworking_0);
    return (v13.useCallback(function(v77, v78, v79) --[[ Line: 138 ]]
        -- upvalues: l_joinGamePlayButton_0 (ref), v57 (copy), v51 (copy), v70 (copy), v52 (copy), v5 (ref), v2 (ref), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (ref), v56 (ref), v50 (copy), v6 (ref), v75 (copy), v74 (copy), l_game_EngineFeature_0 (ref), v60 (copy), l_CheckForUpdate_0 (ref), v58 (copy), l_game_EngineFeature_1 (ref), v64 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), l_CloseCentralOverlay_0 (ref), l_FetchGamePlayabilityAndProductInfo_0 (ref), v76 (copy), v3 (ref), v71 (copy), v68 (copy), l_FFlagShipUnifiedPurchaseFlowToPaidAccess_0 (ref), v4 (ref), v67 (ref), l_ProductPurchaseSurface_0 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), v1 (ref), l_unlockPlayIntent_0 (ref), v59 (copy), v66 (copy), l_GetFFlagIsSquadEnabled_0 (ref), l_CreateExperienceInvite_0 (ref), v69 (copy), l_FFlagEnableSquadRegroupExperimentation_0 (ref), l_SquadExperienceInviteSource_0 (ref), l_FFlagEnablePrivatePartyStartJoin_0 (ref), l_SquadExperienceInviteType_0 (ref), v45 (ref)
        l_joinGamePlayButton_0(v57.InfluxDb, "playButtonClicked", {
            isUniversalApp = true, 
            referralSource = v51, 
            placeId = v70, 
            buttonState = v77 and v77 or "Invalid", 
            ctx = v52
        });
        if v51 == v5.ExperienceDetailsLink then
            v2(v57, {
                placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v56 else v70, 
                playButtonState = v77, 
                universeId = v50
            });
        end;
        if v77 == v6.Playable or v77 == v6.ActionNeeded then
            local v80 = nil;
            v80 = game:GetEngineFeature("VoiceChatSupported") and function() --[[ Line: 157 ]]
                -- upvalues: v75 (ref), v78 (copy)
                v75(v78);
            end or function() --[[ Line: 161 ]]
                -- upvalues: v74 (ref), v78 (copy)
                v74(v78);
            end;
            if l_game_EngineFeature_0 then
                v60(l_CheckForUpdate_0(v58, l_game_EngineFeature_1, v57, v80, {
                    ctx = v52
                }));
                return;
            else
                v80();
                return;
            end;
        elseif v77 == v6.PaidAccess then
            local v81 = v64 and v64.price or nil;
            local v82 = v64 and v64.productId or nil;
            local v83 = v64 and v64.sellerId or nil;
            if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
                local v84 = v64 and v64.universeId or nil;
                local function v85() --[[ Line: 180 ]] --[[ Name: onFlowComplete ]]
                    -- upvalues: v60 (ref), l_CloseCentralOverlay_0 (ref)
                    v60(l_CloseCentralOverlay_0());
                end;
                local function v86() --[[ Line: 183 ]] --[[ Name: onPurchaseSuccess ]]
                    -- upvalues: v60 (ref), l_FetchGamePlayabilityAndProductInfo_0 (ref), v76 (ref), v84 (copy)
                    v60(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v76, v84));
                end;
                local function _() --[[ Line: 186 ]] --[[ Name: initiateLegacyPurchaseFlow ]]
                    -- upvalues: v60 (ref), v3 (ref), v84 (copy), v71 (ref), v81 (copy), v82 (copy), v83 (copy), v68 (ref)
                    v60(v3(v84, v71, v81, v82, v83, {
                        v68
                    }));
                end;
                if l_FFlagShipUnifiedPurchaseFlowToPaidAccess_0 then
                    v60(v4({
                        productPayload = {
                            universeId = v84, 
                            kind = "Experience", 
                            experienceName = v71, 
                            experienceIconUrl = v67.url
                        }, 
                        purchaseCallbacks = {
                            onFlowComplete = v85, 
                            onPurchaseSuccess = v86
                        }, 
                        purchaseAnalyticsMetadata = {
                            surface = l_ProductPurchaseSurface_0.PaidAccess
                        }
                    }));
                    return;
                else
                    l_getIsUserEligibleForUnifiedPurchaseFlow_0(v76):andThen(function(v88) --[[ Line: 217 ]]
                        -- upvalues: v60 (ref), v4 (ref), v84 (copy), v71 (ref), v67 (ref), v85 (copy), v86 (copy), l_ProductPurchaseSurface_0 (ref), v3 (ref), v81 (copy), v82 (copy), v83 (copy), v68 (ref)
                        if v88 then
                            v60(v4({
                                productPayload = {
                                    universeId = v84, 
                                    kind = "Experience", 
                                    experienceName = v71, 
                                    experienceIconUrl = v67.url
                                }, 
                                purchaseCallbacks = {
                                    onFlowComplete = v85, 
                                    onPurchaseSuccess = v86
                                }, 
                                purchaseAnalyticsMetadata = {
                                    surface = l_ProductPurchaseSurface_0.PaidAccess
                                }
                            }));
                            return;
                        else
                            v60(v3(v84, v71, v81, v82, v83, {
                                v68
                            }));
                            return;
                        end;
                    end):catch(function(_) --[[ Line: 238 ]]
                        -- upvalues: v60 (ref), v3 (ref), v84 (copy), v71 (ref), v81 (copy), v82 (copy), v83 (copy), v68 (ref)
                        v60(v3(v84, v71, v81, v82, v83, {
                            v68
                        }));
                    end);
                    return;
                end;
            else
                v60(v3(v50, v71, v81, v82, v83, {
                    v68
                }));
                return;
            end;
        else
            if v77 == v6.FiatPaidAccess then
                if v70 and v64 and v64.fiatBasePriceId then
                    v60(v1.Fetch(v76, v70, v50, v64.fiatBasePriceId));
                    l_unlockPlayIntent_0(v59, {
                        universeId = v50, 
                        upsellName = "FiatPurchase", 
                        playabilityStatus = v66 and v66.playabilityStatus or nil
                    });
                    return;
                end;
            elseif v77 == v6.Loading then
                return;
            elseif l_GetFFlagIsSquadEnabled_0() and v77 == v6.PlayableWithParty then
                if v70 then
                    v60(l_CreateExperienceInvite_0(v70, v69, if l_FFlagEnableSquadRegroupExperimentation_0 then l_SquadExperienceInviteSource_0.Default else nil, if l_FFlagEnablePrivatePartyStartJoin_0 and v79 and v79.isPrivateParty then l_SquadExperienceInviteType_0.PlayWithPartyInPrivatePartyServer else nil));
                    return;
                end;
            elseif v45 and v77 == v6.WaitingForParty then
                return;
            elseif v77 == v6.UnplayableOther then
                return;
            else
                error((("invalid play button state %*!"):format(v77)));
            end;
            return;
        end;
    end, {
        v57, 
        v58, 
        l_game_EngineFeature_1, 
        v50, 
        if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v56 else nil, 
        v70, 
        v71, 
        v51, 
        v52, 
        v75, 
        v74, 
        v64, 
        v68, 
        if l_GetFFlagIsSquadEnabled_0() then v69 else nil
    }));
end;