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
local l_OpenPlayButtonUpsellDialog_0 = require(l_Parent_0.DiscoveryRouting).OpenPlayButtonUpsellDialog;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_OpenAmpWizardContainer_0 = require(l_Parent_0.AmpUpsell).OpenAmpWizardContainer;
local l_authButtonClick_0 = require(l_Parent_0.AuthAnalytics).Events.authButtonClick;
local v25 = require(l_Parent_0.LoggingProtocol);
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.DiscoveryTypes).PlayabilityStatusEnum;
local l_unlockPlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.unlockPlayIntent;
local v28 = game:DefineFastInt("UnknownUpsellErrorEventHundredthsPercent", 0);
local v29 = game:DefineFastString("LuaAppUpsellMaturityRatingToSettingMapping", "mild=NinePlus,moderate=ThirteenPlus,restricted=SeventeenPlus,unrated=ThirteenPlus");
local l_FFlagLuaAppParentUpsellPolicy_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppParentUpsellPolicy;
local l_FFlagLuaAppPlayButtonUpsellLinking_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayButtonUpsellLinking;
local v32 = {
    SelfUpdateSetting = "SelfUpdateSetting", 
    ParentalConsent = "ParentalConsent", 
    ContentAgeRestrictionVerification = "ContentAgeRestrictionVerification"
};
local function v38(v33) --[[ Line: 50 ]] --[[ Name: parseContentMaturityMappingString ]]
    if v33 == "" then
        return {};
    else
        local v34 = {};
        for _, v36 in (string.split(v33, ",")) do
            local v37 = string.split(v36, "=");
            if #v37 == 2 and v37[1] ~= "" and v37[2] ~= "" then
                v34[v37[1]] = v37[2];
            else
                error((("Invalid content maturity mapping string %*"):format(v33)));
            end;
        end;
        return v34;
    end;
end;
local v42 = (function(v39) --[[ Line: 71 ]] --[[ Name: safeParseContentMaturityMappingString ]]
    -- upvalues: v38 (copy), l_flaggedMutedError_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 72 ]]
        -- upvalues: v38 (ref), v39 (copy)
        return (v38(v39));
    end);
    if not l_status_0 then
        l_flaggedMutedError_0("ExperienceParentalControlsUpsellContentMaturityMappingParsingError", (("Error parsing content maturity mapping string %*, error is: %*"):format(v39, l_result_0)));
        return {};
    else
        return l_result_0;
    end;
end)(v29);
return function(v43, v44) --[[ Line: 91 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppEventIngestService_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_OpenAmpWizardContainer_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_FFlagLuaAppPlayButtonUpsellLinking_0 (copy), l_OpenPlayButtonUpsellDialog_0 (copy), l_OpenUpsellModal_0 (copy), l_OpenCloseOnlyInteractiveAlert_0 (copy), l_NavigateBack_0 (copy), l_CloseCentralOverlay_0 (copy), v2 (copy), l_authButtonClick_0 (copy), l_unlockPlayIntent_0 (copy), l_PlayabilityStatusEnum_0 (copy), l_FFlagLuaAppParentUpsellPolicy_0 (copy), l_useAppPolicy_0 (copy), l_FetchUserSettingsAndOptions_0 (copy), l_flaggedMutedError_0 (copy), v42 (copy), v25 (copy), v28 (copy), v13 (copy), v32 (copy)
    local v45 = l_useRoactService_0(l_RoactNetworking_0);
    local v46 = l_useRoactService_0(l_AppEventIngestService_0);
    local v47 = l_useDispatch_0();
    local v51 = l_useSelector_0(function(v48) --[[ Line: 99 ]]
        -- upvalues: v43 (copy), l_GameInfosReducer_0 (ref)
        local v49 = v48.AgeRecommendations[v43];
        if v49 and v49.summary and v49.summary.ageRecommendation and v49.summary.ageRecommendation.contentMaturity then
            return v49.summary.ageRecommendation.contentMaturity;
        else
            local v50 = v48.Personalization[l_GameInfosReducer_0.key][v43];
            if v50 and v50.contentMaturity then
                return v50.contentMaturity;
            else
                return nil;
            end;
        end;
    end);
    local v52 = l_useLocalization_0({
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
    local v57 = v4.useCallback(function(v53, v54, v55, v56) --[[ Line: 135 ]]
        -- upvalues: v47 (copy), l_OpenAmpWizardContainer_0 (ref)
        v47(l_OpenAmpWizardContainer_0(v53, v54, v55, v56));
    end, {
        v47
    });
    local v62 = v4.useCallback(function(v58, v59, v60, v61) --[[ Line: 142 ]]
        -- upvalues: v47 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v47(l_NavigateDown_0({
            name = l_AppPage_0.AccountSettingsUpsell, 
            extraProps = {
                featureName = v58, 
                localizationStrings = v59, 
                onCloseModal = v60, 
                onCancelled = v61
            }
        }, true));
    end, {
        v47
    });
    local v70 = v4.useCallback(function(v63, v64, v65, v66, v67, v68, v69) --[[ Line: 157 ]]
        -- upvalues: l_FFlagLuaAppPlayButtonUpsellLinking_0 (ref), v47 (copy), l_OpenPlayButtonUpsellDialog_0 (ref), l_OpenUpsellModal_0 (ref)
        if l_FFlagLuaAppPlayButtonUpsellLinking_0 then
            v47(l_OpenPlayButtonUpsellDialog_0(v63, v64, v65, v66, v67, v68, v69));
            return;
        else
            v47(l_OpenUpsellModal_0(v63, v64, v65, v66, v67, v68, v69));
            return;
        end;
    end, {
        v47
    });
    local v76 = v4.useCallback(function(v71, v72, v73, v74, v75) --[[ Line: 195 ]]
        -- upvalues: v47 (copy), l_OpenCloseOnlyInteractiveAlert_0 (ref)
        v47(l_OpenCloseOnlyInteractiveAlert_0(v71, v72, v73, v74, v75));
    end, {
        v47
    });
    local v77 = v4.useCallback(function() --[[ Line: 199 ]]
        -- upvalues: v47 (copy), l_NavigateBack_0 (ref)
        v47(l_NavigateBack_0(true));
    end, {
        v47
    });
    local v78 = v4.useCallback(function() --[[ Line: 203 ]]
        -- upvalues: v47 (copy), l_CloseCentralOverlay_0 (ref)
        v47(l_CloseCentralOverlay_0());
    end, {
        v47
    });
    local v79 = v4.useCallback(function() --[[ Line: 207 ]]
        -- upvalues: v47 (copy), v2 (ref), v45 (copy), v43 (copy)
        v47(v2.Fetch(v45, v43, true));
    end, {
        v47, 
        v45, 
        v43
    });
    local v80 = v4.useCallback(function() --[[ Line: 211 ]]
        -- upvalues: v77 (copy), v79 (copy)
        v77();
        v79();
    end, {
        v77, 
        v79
    });
    local v81 = v4.useCallback(function() --[[ Line: 218 ]]
        -- upvalues: v78 (copy), l_authButtonClick_0 (ref), v79 (copy)
        v78();
        l_authButtonClick_0("gameJoinContentMaturityLock", "cancelAskParent");
        v79();
    end, {
        v78, 
        v79
    });
    local v83 = v4.useCallback(function(v82) --[[ Line: 227 ]]
        -- upvalues: v78 (copy), l_authButtonClick_0 (ref), v57 (copy), v77 (copy)
        v78();
        l_authButtonClick_0("gameJoinContentMaturityLock", "askParent");
        v57("CanChangeSetting", v77, {
            contentAgeRestriction = v82
        }, "gameJoinContentMaturityLock");
    end, {
        v57, 
        v77, 
        v78
    });
    local v85 = v4.useCallback(function(v84) --[[ Line: 238 ]]
        -- upvalues: l_unlockPlayIntent_0 (ref), v46 (copy), v43 (copy), l_PlayabilityStatusEnum_0 (ref)
        l_unlockPlayIntent_0(v46, {
            universeId = v43, 
            upsellName = v84, 
            playabilityStatus = l_PlayabilityStatusEnum_0.ContextualPlayabilityAgeRecommendationParentalControls
        });
    end, {
        v46, 
        v43
    });
    local v86 = nil;
    if l_FFlagLuaAppParentUpsellPolicy_0 then
        v86 = l_useAppPolicy_0(function(v87) --[[ Line: 248 ]]
            return v87.getShouldShowVpcPlayButtonUpsells();
        end);
    end;
    local v89 = l_useAppPolicy_0(function(v88) --[[ Line: 253 ]]
        return v88.getWebViewSupport();
    end);
    return (v4.useCallback(function(v90) --[[ Line: 257 ]]
        -- upvalues: l_FFlagLuaAppParentUpsellPolicy_0 (ref), v86 (ref), v44 (copy), v85 (copy), l_FetchUserSettingsAndOptions_0 (ref), v45 (copy), v51 (copy), l_flaggedMutedError_0 (ref), v42 (ref), v25 (ref), v28 (ref), v43 (copy), v13 (ref), v32 (ref), v89 (copy), v76 (copy), v52 (copy), v78 (copy), v62 (copy), v80 (copy), v70 (copy), v83 (copy), v81 (copy), v57 (copy), v79 (copy)
        if l_FFlagLuaAppParentUpsellPolicy_0 and not v86 then
            v44(v90);
            v85("GameLaunch");
            return;
        else
            l_FetchUserSettingsAndOptions_0(v45):andThen(function(v91) --[[ Line: 266 ]]
                -- upvalues: v51 (ref), l_flaggedMutedError_0 (ref), v44 (ref), v90 (copy), v85 (ref), v42 (ref), v25 (ref), v28 (ref), v43 (ref), v13 (ref), v32 (ref), v89 (ref), v76 (ref), v52 (ref), v78 (ref), v62 (ref), v80 (ref), v70 (ref), v83 (ref), v81 (ref), v57 (ref), v79 (ref)
                local l_contentAgeRestriction_0 = v91.contentAgeRestriction;
                if not l_contentAgeRestriction_0 or not v51 then
                    l_flaggedMutedError_0("ExperienceParentalControlsUpsellUnknownContentMaturityRating", (("Unknown content maturity rating %* or age restriction setting %* for Contextual Parental Controls upsell on play button click"):format(v51, l_contentAgeRestriction_0)));
                    v44(v90);
                    v85("GameLaunch");
                    return;
                else
                    assert(v51, "Content maturity rating must be present to show correct upsell");
                    if not v42[v51] then
                        v25.default:logRobloxTelemetryEvent({
                            eventName = "ExperienceParentalControlsUpsellUnexpectedContentMaturityRating", 
                            backends = {
                                v25.TelemetryBackends.Points
                            }, 
                            throttlingPercentage = v28, 
                            lastUpdated = {
                                25, 
                                8, 
                                26
                            }, 
                            description = "Unexpected content maturity rating for Contextual Parental Controls upsell on play button click"
                        }, {
                            v25.default.StandardizedFields.addOsInfo
                        }, {
                            eventName = "ExperienceParentalControlsUpsellUnexpectedContentMaturityRating", 
                            contentMaturityRating = v51, 
                            universeId = v43
                        });
                        v44(v90);
                        v85("GameLaunch");
                        return;
                    else
                        local v93 = v42[v51];
                        local v95 = v13.find(l_contentAgeRestriction_0.options, function(v94) --[[ Line: 309 ]]
                            -- upvalues: v93 (copy)
                            return v94 and v94.option and v94.option.optionValue == v93 or false;
                        end);
                        if v95 then
                            local l_requirement_0 = v95.requirement;
                            if l_requirement_0 == v32.SelfUpdateSetting then
                                if not v89 then
                                    v76(v52.consoleSelfUpdateSettingTitleText, v52.consoleSelfUpdateSettingBodyText, v78, v52.consoleSelfUpdateSettingButtonText, true);
                                else
                                    v62("gameJoinContentMaturityLock", {
                                        title = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Title", 
                                        message = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Label.Body", 
                                        buttonCancel = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.Cancel", 
                                        buttonSettings = "Feature.ExperienceDetails.UpdateMaturitySettingModal.Action.GoToSettings"
                                    }, v80, v80);
                                end;
                            elseif l_requirement_0 == v32.ParentalConsent then
                                v70(v52.askYourParentTitleText, v52.askYourParentBodyText, v52.askYourParentActionButtonText, v52.askYourParentCancelButtonText, function() --[[ Line: 340 ]]
                                    -- upvalues: v83 (ref), v95 (copy)
                                    v83(v95.option.optionValue);
                                end, v81, v81);
                            elseif l_requirement_0 == v32.ContentAgeRestrictionVerification then
                                v57("ShouldNotPromptSeventeenPlusSettingVerifications", v79, nil, nil);
                            else
                                l_flaggedMutedError_0("ExperienceParentalControlsUnknownUpsellRequirement", (("Unknown requirement %* for ContentAgeRestriction option %* on play button click"):format(l_requirement_0, v95)));
                                v44(v90);
                            end;
                            v85(l_requirement_0 or "GameLaunch");
                            return;
                        else
                            v76(v52.unplayableTitleText, v52.unplayableBodyText, v78, v52.unplayableButtonText, true);
                            v85("RestrictedUnplayableOptionNotFound");
                            return;
                        end;
                    end;
                end;
            end, function() --[[ Line: 378 ]]
                -- upvalues: v44 (ref), v90 (copy), v85 (ref)
                v44(v90);
                v85("GameLaunch");
            end);
            return;
        end;
    end, {
        v45, 
        v43, 
        v44, 
        v51, 
        v47, 
        v62, 
        v57, 
        v76, 
        v70, 
        v83, 
        v80, 
        v81, 
        v78, 
        v85, 
        v52.unplayableTitleText, 
        v52.unplayableBodyText, 
        v52.unplayableButtonText, 
        v52.askYourParentTitleText, 
        v52.askYourParentBodyText, 
        v52.askYourParentActionButtonText, 
        v52.askYourParentCancelButtonText, 
        v52.consoleSelfUpdateSettingTitleText, 
        v52.consoleSelfUpdateSettingBodyText, 
        v52.consoleSelfUpdateSettingButtonText, 
        v86, 
        v89
    }));
end;