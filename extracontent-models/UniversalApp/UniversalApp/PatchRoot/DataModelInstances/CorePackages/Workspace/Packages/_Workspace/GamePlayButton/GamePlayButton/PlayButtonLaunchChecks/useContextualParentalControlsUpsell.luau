local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local v2 = require(l_script_FirstAncestor_0.FetchGamePlayButtonData);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local l_FetchUserSettingsAndOptions_0 = require(l_Parent_0.GameDetailRodux).FetchUserSettingsAndOptions;
local v13 = require(l_Parent_0.Dash);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_OpenCloseOnlyInteractiveAlert_0 = require(l_Parent_0.DiscoveryRouting).OpenCloseOnlyInteractiveAlert;
local l_OpenUpsellModal_0 = require(l_Parent_0.DiscoveryRouting).OpenUpsellModal;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_OpenAmpWizardContainer_0 = require(l_Parent_0.AmpUpsell).OpenAmpWizardContainer;
local l_authButtonClick_0 = require(l_Parent_0.AuthAnalytics).Events.authButtonClick;
local v24 = require(l_Parent_0.LoggingProtocol);
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.DiscoveryTypes).PlayabilityStatusEnum;
local l_unlockPlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.unlockPlayIntent;
local v27 = game:DefineFastInt("UnknownUpsellErrorEventHundredthsPercent", 0);
local v28 = game:DefineFastString("LuaAppUpsellMaturityRatingToSettingMapping", "mild=NinePlus,moderate=ThirteenPlus,restricted=SeventeenPlus,unrated=ThirteenPlus");
local l_FFlagLuaAppParentUpsellPolicy_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppParentUpsellPolicy;
local v30 = {
    SelfUpdateSetting = "SelfUpdateSetting", 
    ParentalConsent = "ParentalConsent", 
    ContentAgeRestrictionVerification = "ContentAgeRestrictionVerification"
};
local function v36(v31) --[[ Line: 48 ]] --[[ Name: parseContentMaturityMappingString ]]
    if v31 == "" then
        return {};
    else
        local v32 = {};
        for _, v34 in (string.split(v31, ",")) do
            local v35 = string.split(v34, "=");
            if #v35 == 2 and v35[1] ~= "" and v35[2] ~= "" then
                v32[v35[1]] = v35[2];
            else
                error((("Invalid content maturity mapping string %*"):format(v31)));
            end;
        end;
        return v32;
    end;
end;
local v40 = (function(v37) --[[ Line: 69 ]] --[[ Name: safeParseContentMaturityMappingString ]]
    -- upvalues: v36 (copy), l_flaggedMutedError_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 70 ]]
        -- upvalues: v36 (ref), v37 (copy)
        return (v36(v37));
    end);
    if not l_status_0 then
        l_flaggedMutedError_0("ExperienceParentalControlsUpsellContentMaturityMappingParsingError", (("Error parsing content maturity mapping string %*, error is: %*"):format(v37, l_result_0)));
        return {};
    else
        return l_result_0;
    end;
end)(v28);
return function(v41, v42) --[[ Line: 89 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_OpenAmpWizardContainer_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_OpenUpsellModal_0 (copy), l_OpenCloseOnlyInteractiveAlert_0 (copy), l_NavigateBack_0 (copy), l_CloseCentralOverlay_0 (copy), v2 (copy), l_authButtonClick_0 (copy), l_unlockPlayIntent_0 (copy), l_PlayabilityStatusEnum_0 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_useAppPolicy_0 (copy), l_FetchUserSettingsAndOptions_0 (copy), l_flaggedMutedError_0 (copy), v40 (copy), v24 (copy), v27 (copy), v13 (copy), v30 (copy)
    local v43 = l_useRoactService_0(l_RoactNetworking_0);
    local v44 = l_useRoactService_0(l_AppEventIngestService_0);
    local v45 = l_useDispatch_0();
    local v49 = l_useSelector_0(function(v46) --[[ Line: 97 ]]
        -- upvalues: v41 (copy), l_GameInfosReducer_0 (ref)
        local v47 = v46.AgeRecommendations[v41];
        if v47 and v47.summary and v47.summary.ageRecommendation and v47.summary.ageRecommendation.contentMaturity then
            return v47.summary.ageRecommendation.contentMaturity;
        else
            local v48 = v46.Personalization[l_GameInfosReducer_0.key][v41];
            if v48 and v48.contentMaturity then
                return v48.contentMaturity;
            else
                return nil;
            end;
        end;
    end);
    local v50 = l_useLocalization_0({
        unplayableTitleText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Label.Title", 
        unplayableBodyText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Label.Body", 
        unplayableButtonText = "Feature.ExperienceDetails.RestrictedUnplayableModal.Action.Ok", 
        askYourParentTitleText = "Feature.ExperienceDetails.AskYourParentModal.Label.Title", 
        askYourParentBodyText = "Feature.ExperienceDetails.AskYourParentModal.Label.Body", 
        askYourParentActionButtonText = "Feature.ExperienceDetails.AskYourParentModal.Action.AskNow", 
        askYourParentCancelButtonText = "Feature.ExperienceDetails.AskYourParentModal.Action.Cancel", 
        consoleSelfUpdateSettingTitleText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Label.Title", 
        consoleSelfUpdateSettingBodyText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Label.Body", 
        consoleSelfUpdateSettingButtonText = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Console.Action.Ok"
    });
    local v55 = v4.useCallback(function(v51, v52, v53, v54) --[[ Line: 133 ]]
        -- upvalues: v45 (copy), l_OpenAmpWizardContainer_0 (ref)
        v45(l_OpenAmpWizardContainer_0(v51, v52, v53, v54));
    end, {
        v45
    });
    local v60 = v4.useCallback(function(v56, v57, v58, v59) --[[ Line: 140 ]]
        -- upvalues: v45 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v45(l_NavigateDown_0({
            name = l_AppPage_0.AccountSettingsUpsell, 
            extraProps = {
                featureName = v56, 
                localizationStrings = v57, 
                onCloseModal = v58, 
                onCancelled = v59
            }
        }, true));
    end, {
        v45
    });
    local v68 = v4.useCallback(function(v61, v62, v63, v64, v65, v66, v67) --[[ Line: 155 ]]
        -- upvalues: v45 (copy), l_OpenUpsellModal_0 (ref)
        v45(l_OpenUpsellModal_0(v61, v62, v63, v64, v65, v66, v67));
    end, {
        v45
    });
    local v74 = v4.useCallback(function(v69, v70, v71, v72, v73) --[[ Line: 179 ]]
        -- upvalues: v45 (copy), l_OpenCloseOnlyInteractiveAlert_0 (ref)
        v45(l_OpenCloseOnlyInteractiveAlert_0(v69, v70, v71, v72, v73));
    end, {
        v45
    });
    local v75 = v4.useCallback(function() --[[ Line: 183 ]]
        -- upvalues: v45 (copy), l_NavigateBack_0 (ref)
        v45(l_NavigateBack_0(true));
    end, {
        v45
    });
    local v76 = v4.useCallback(function() --[[ Line: 187 ]]
        -- upvalues: v45 (copy), l_CloseCentralOverlay_0 (ref)
        v45(l_CloseCentralOverlay_0());
    end, {
        v45
    });
    local v77 = v4.useCallback(function() --[[ Line: 191 ]]
        -- upvalues: v45 (copy), v2 (ref), v43 (copy), v41 (copy)
        v45(v2.Fetch(v43, v41, true));
    end, {
        v45, 
        v43, 
        v41
    });
    local v78 = v4.useCallback(function() --[[ Line: 195 ]]
        -- upvalues: v75 (copy), v77 (copy)
        v75();
        v77();
    end, {
        v75, 
        v77
    });
    local v79 = v4.useCallback(function() --[[ Line: 202 ]]
        -- upvalues: v76 (copy), l_authButtonClick_0 (ref), v77 (copy)
        v76();
        l_authButtonClick_0("gameJoinContentMaturityLock", "cancelAskParent");
        v77();
    end, {
        v76, 
        v77
    });
    local v81 = v4.useCallback(function(v80) --[[ Line: 211 ]]
        -- upvalues: v76 (copy), l_authButtonClick_0 (ref), v55 (copy), v75 (copy)
        v76();
        l_authButtonClick_0("gameJoinContentMaturityLock", "askParent");
        v55("CanChangeSetting", v75, {
            contentAgeRestriction = v80
        }, "gameJoinContentMaturityLock");
    end, {
        v55, 
        v75, 
        v76
    });
    local v83 = v4.useCallback(function(v82) --[[ Line: 222 ]]
        -- upvalues: l_unlockPlayIntent_0 (ref), v44 (copy), v41 (copy), l_PlayabilityStatusEnum_0 (ref)
        l_unlockPlayIntent_0(v44, {
            universeId = v41, 
            upsellName = v82, 
            playabilityStatus = l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls
        });
    end, {
        v44, 
        v41
    });
    local v84 = nil;
    if l_FFlagLuaAppParentUpsellPolicy_0 then
        v84 = l_useAppPolicy_0(function(v85) --[[ Line: 232 ]]
            return v85.getShouldShowVpcPlayButtonUpsells();
        end);
    end;
    local v87 = l_useAppPolicy_0(function(v86) --[[ Line: 237 ]]
        return v86.getWebViewSupport();
    end);
    return (v4.useCallback(function(v88) --[[ Line: 241 ]]
        -- upvalues: l_FFlagLuaAppParentUpsellPolicy_0 (ref), v84 (ref), v42 (copy), v83 (copy), l_FetchUserSettingsAndOptions_0 (ref), v43 (copy), v49 (copy), l_flaggedMutedError_0 (ref), v40 (ref), v24 (ref), v27 (ref), v41 (copy), v13 (ref), v30 (ref), v87 (copy), v74 (copy), v50 (copy), v76 (copy), v60 (copy), v78 (copy), v68 (copy), v81 (copy), v79 (copy), v55 (copy), v77 (copy)
        if l_FFlagLuaAppParentUpsellPolicy_0 and not v84 then
            v42(v88);
            v83("GameLaunch");
            return;
        else
            l_FetchUserSettingsAndOptions_0(v43):andThen(function(v89) --[[ Line: 250 ]]
                -- upvalues: v49 (ref), l_flaggedMutedError_0 (ref), v42 (ref), v88 (copy), v83 (ref), v40 (ref), v24 (ref), v27 (ref), v41 (ref), v13 (ref), v30 (ref), v87 (ref), v74 (ref), v50 (ref), v76 (ref), v60 (ref), v78 (ref), v68 (ref), v81 (ref), v79 (ref), v55 (ref), v77 (ref)
                local l_contentAgeRestriction_0 = v89.contentAgeRestriction;
                if not l_contentAgeRestriction_0 or not v49 then
                    l_flaggedMutedError_0("ExperienceParentalControlsUpsellUnknownContentMaturityRating", (("Unknown content maturity rating %* or age restriction setting %* for Contextual Parental Controls upsell on play button click"):format(v49, l_contentAgeRestriction_0)));
                    v42(v88);
                    v83("GameLaunch");
                    return;
                else
                    assert(v49, "Content maturity rating must be present to show correct upsell");
                    if not v40[v49] then
                        v24.default:logRobloxTelemetryEvent({
                            eventName = "ExperienceParentalControlsUpsellUnexpectedContentMaturityRating", 
                            backends = {
                                v24.TelemetryBackends.Points
                            }, 
                            throttlingPercentage = v27, 
                            lastUpdated = {
                                25, 
                                8, 
                                26
                            }, 
                            description = "Unexpected content maturity rating for Contextual Parental Controls upsell on play button click"
                        }, {
                            v24.default.StandardizedFields.addOsInfo
                        }, {
                            eventName = "ExperienceParentalControlsUpsellUnexpectedContentMaturityRating", 
                            contentMaturityRating = v49, 
                            universeId = v41
                        });
                        v42(v88);
                        v83("GameLaunch");
                        return;
                    else
                        local v91 = v40[v49];
                        local v93 = v13.find(l_contentAgeRestriction_0.options, function(v92) --[[ Line: 293 ]]
                            -- upvalues: v91 (copy)
                            return v92 and v92.option and v92.option.optionValue == v91 or false;
                        end);
                        if v93 then
                            local l_requirement_0 = v93.requirement;
                            if l_requirement_0 == v30.SelfUpdateSetting then
                                if not v87 then
                                    v74(v50.consoleSelfUpdateSettingTitleText, v50.consoleSelfUpdateSettingBodyText, v76, v50.consoleSelfUpdateSettingButtonText, true);
                                else
                                    v60("gameJoinContentMaturityLock", {
                                        title = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Title", 
                                        message = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Body", 
                                        buttonCancel = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.Cancel", 
                                        buttonSettings = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.GoToSettings"
                                    }, v78, v78);
                                end;
                            elseif l_requirement_0 == v30.ParentalConsent then
                                v68(v50.askYourParentTitleText, v50.askYourParentBodyText, v50.askYourParentActionButtonText, v50.askYourParentCancelButtonText, function() --[[ Line: 324 ]]
                                    -- upvalues: v81 (ref), v93 (copy)
                                    v81(v93.option.optionValue);
                                end, v79, v79);
                            elseif l_requirement_0 == v30.ContentAgeRestrictionVerification then
                                v55("ShouldNotPromptSeventeenPlusSettingVerifications", v77, nil, nil);
                            else
                                l_flaggedMutedError_0("ExperienceParentalControlsUnknownUpsellRequirement", (("Unknown requirement %* for ContentAgeRestriction option %* on play button click"):format(l_requirement_0, v93)));
                                v42(v88);
                            end;
                            v83(l_requirement_0 or "GameLaunch");
                            return;
                        else
                            v74(v50.unplayableTitleText, v50.unplayableBodyText, v76, v50.unplayableButtonText, true);
                            v83("RestrictedUnplayableOptionNotFound");
                            return;
                        end;
                    end;
                end;
            end, function() --[[ Line: 362 ]]
                -- upvalues: v42 (ref), v88 (copy), v83 (ref)
                v42(v88);
                v83("GameLaunch");
            end);
            return;
        end;
    end, {
        v43, 
        v41, 
        v42, 
        v49, 
        v45, 
        v60, 
        v55, 
        v74, 
        v68, 
        v81, 
        v78, 
        v79, 
        v76, 
        v83, 
        v50.unplayableTitleText, 
        v50.unplayableBodyText, 
        v50.unplayableButtonText, 
        v50.askYourParentTitleText, 
        v50.askYourParentBodyText, 
        v50.askYourParentActionButtonText, 
        v50.askYourParentCancelButtonText, 
        v50.consoleSelfUpdateSettingTitleText, 
        v50.consoleSelfUpdateSettingBodyText, 
        v50.consoleSelfUpdateSettingButtonText, 
        v84, 
        v87
    }));
end;