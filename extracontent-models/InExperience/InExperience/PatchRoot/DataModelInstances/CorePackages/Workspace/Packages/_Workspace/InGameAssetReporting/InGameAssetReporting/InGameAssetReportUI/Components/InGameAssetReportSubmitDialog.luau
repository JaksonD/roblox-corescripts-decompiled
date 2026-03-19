local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Localization);
local v3 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v5 = require(l_Parent_0.DsaIllegalContentReporting);
local l_isShowUKOSAIllegalContentReportingLink_0 = v5.isShowUKOSAIllegalContentReportingLink;
local l_OSAReportLink_0 = v5.OSAReportLink;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_DefaultDualDropdownDialog_0 = require(l_Parent_0.GenericAbuseReporting).UXFlows.DefaultDualDropdownDialog;
local l_DefaultDualDropdownDialogV2_0 = require(l_Parent_0.GenericAbuseReporting).UXFlows.DefaultDualDropdownDialogV2;
local v11 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Constants);
local v12 = require(l_script_FirstAncestor_0.Utility.getPreselectedSurfaceValue);
local _ = require(l_script_FirstAncestor_0.Analysis.SceneAnalysis);
local l_FFlagPrefillPreciseSelectionChoices_0 = require(l_Parent_0.SharedFlags).FFlagPrefillPreciseSelectionChoices;
local l_FFlagReportIPInfringement_0 = require(l_Parent_0.SharedFlags).FFlagReportIPInfringement;
return function(v16) --[[ Line: 35 ]] --[[ Name: InGameAssetReportSubmitDialog ]]
    -- upvalues: l_FFlagPrefillPreciseSelectionChoices_0 (copy), l_useLocalization_0 (copy), v12 (copy), v3 (copy), v11 (copy), l_FFlagReportIPInfringement_0 (copy), l_DefaultDualDropdownDialogV2_0 (copy), l_DefaultDualDropdownDialog_0 (copy), l_isShowUKOSAIllegalContentReportingLink_0 (copy), l_View_0 (copy), l_OSAReportLink_0 (copy)
    local v17 = nil;
    if l_FFlagPrefillPreciseSelectionChoices_0 then
        v17 = l_useLocalization_0({
            title = "Feature.ReportAbuse.Title.SelectInSceneFinishYourReport", 
            problemBullying = "Feature.ReportAbuse.Problem.Bullying", 
            problemBullyingDesc = "Feature.ReportAbuse.ProblemDescription.Bullying", 
            problemCheating = "Feature.ReportAbuse.Problem.Cheating", 
            problemCheatingDesc = "Feature.ReportAbuse.ProblemDescription.Cheating", 
            problemDating = "Feature.ReportAbuse.Problem.Dating", 
            problemDatingDesc = "Feature.ReportAbuse.ProblemDescription.Dating", 
            problemHate = "Feature.ReportAbuse.Problem.Hate", 
            problemHateDesc = "Feature.ReportAbuse.ProblemDescription.Hate", 
            problemLinks = "Feature.ReportAbuse.Problem.Links", 
            problemLinksDesc = "Feature.ReportAbuse.ProblemDescription.Links", 
            problemPersonal = "Feature.ReportAbuse.Problem.Personal", 
            problemPersonalDesc = "Feature.ReportAbuse.ProblemDescription.Personal", 
            problemScamming = "Feature.ReportAbuse.Problem.Scamming", 
            problemScammingDesc = "Feature.ReportAbuse.ProblemDescription.Scamming", 
            problemSwearing = "Feature.ReportAbuse.Problem.Swearing", 
            problemSwearingDesc = "Feature.ReportAbuse.ProblemDescription.Swearing", 
            problemViolence = "Feature.ReportAbuse.Problem.Violence", 
            problemViolenceDesc = "Feature.ReportAbuse.ProblemDescription.Violence", 
            surfaceAvatar = "Feature.ReportAbuse.ProblemSurface.Avatar", 
            surfaceDrawing = "Feature.ReportAbuse.ProblemSurface.DrawingOrCreation", 
            surfaceExperience = "Feature.ReportAbuse.ProblemSurface.Experience", 
            surfaceItem = "Feature.ReportAbuse.ProblemSurface.ItemOrAsset", 
            surfaceMovement = "Feature.ReportAbuse.ProblemSurface.Movement", 
            surfaceMusic = "Feature.ReportAbuse.ProblemSurface.MusicOrSoundEffect", 
            surfaceTextChat = "Feature.ReportAbuse.ProblemSurface.TextChat", 
            surfaceUsername = "Feature.ReportAbuse.ProblemSurface.Username", 
            problemIPInfringement = "Feature.ReportAbuse.Problem.IpInfringement", 
            problemIPInfringementDesc = "Feature.ReportAbuse.ProblemDescription.IpInfringement"
        });
    end;
    if l_FFlagPrefillPreciseSelectionChoices_0 then
        local v18 = v12(v16.extractionResult);
        local v19 = if v18 == "avatar" then v17.surfaceAvatar else if v18 == "item" then v17.surfaceItem else if v18 == "text" then v17.surfaceTextChat else nil;
        v3.useEffect(function() --[[ Line: 79 ]]
            -- upvalues: v19 (copy), v16 (copy), v11 (ref)
            if v19 then
                v16.analyticsDispatch({
                    type = v11.AnalyticsActions.SetPrefilledSurfaceSelection, 
                    prefilled_surface_selection = v19
                });
            end;
        end, {
            v19
        });
        local v20 = v3.useMemo(function() --[[ Line: 88 ]]
            -- upvalues: v17 (ref), l_FFlagReportIPInfringement_0 (ref)
            return {
                {
                    value = "bullying", 
                    label = v17.problemBullying, 
                    description = v17.problemBullyingDesc
                }, 
                {
                    value = "exploiting", 
                    label = v17.problemCheating, 
                    description = v17.problemCheatingDesc
                }, 
                {
                    value = "dating", 
                    label = v17.problemDating, 
                    description = v17.problemDatingDesc
                }, 
                {
                    value = "hate", 
                    label = v17.problemHate, 
                    description = v17.problemHateDesc
                }, 
                {
                    value = "offsite links", 
                    label = v17.problemLinks, 
                    description = v17.problemLinksDesc
                }, 
                {
                    value = "personal question", 
                    label = v17.problemPersonal, 
                    description = v17.problemPersonalDesc
                }, 
                {
                    value = "scamming", 
                    label = v17.problemScamming, 
                    description = v17.problemScammingDesc
                }, 
                {
                    value = "swearing", 
                    label = v17.problemSwearing, 
                    description = v17.problemSwearingDesc
                }, 
                {
                    value = "violence", 
                    label = v17.problemViolence, 
                    description = v17.problemViolenceDesc
                }, 
                if l_FFlagReportIPInfringement_0 then {
                    value = "ip infringement", 
                    label = v17.problemIPInfringement, 
                    description = v17.problemIPInfringementDesc
                } else nil
            };
        end, {
            v17.problemBullying, 
            v17.problemBullyingDesc, 
            v17.problemCheating, 
            v17.problemCheatingDesc, 
            v17.problemDating, 
            v17.problemDatingDesc, 
            v17.problemHate, 
            v17.problemHateDesc, 
            v17.problemLinks, 
            v17.problemLinksDesc, 
            v17.problemPersonal, 
            v17.problemPersonalDesc, 
            v17.problemScamming, 
            v17.problemScammingDesc, 
            v17.problemSwearing, 
            v17.problemSwearingDesc, 
            v17.problemViolence, 
            v17.problemViolenceDesc, 
            v17.problemIPInfringement, 
            v17.problemIPInfringementDesc
        });
        local v21 = v3.useMemo(function() --[[ Line: 142 ]]
            -- upvalues: v17 (ref)
            return {
                {
                    value = "avatar", 
                    label = v17.surfaceAvatar
                }, 
                {
                    value = "drawing", 
                    label = v17.surfaceDrawing
                }, 
                {
                    value = "experience", 
                    label = v17.surfaceExperience
                }, 
                {
                    value = "item", 
                    label = v17.surfaceItem
                }, 
                {
                    value = "movement", 
                    label = v17.surfaceMovement
                }, 
                {
                    value = "music", 
                    label = v17.surfaceMusic
                }, 
                {
                    value = "text", 
                    label = v17.surfaceTextChat
                }, 
                {
                    value = "username", 
                    label = v17.surfaceUsername
                }
            };
        end, {
            v17.surfaceAvatar, 
            v17.surfaceDrawing, 
            v17.surfaceExperience, 
            v17.surfaceItem, 
            v17.surfaceMovement, 
            v17.surfaceMusic, 
            v17.surfaceTextChat, 
            v17.surfaceUsername
        });
        local v25 = v3.useMemo(function() --[[ Line: 164 ]]
            -- upvalues: v18 (copy), v21 (copy)
            local v22 = nil;
            if v18 ~= nil and v21 ~= nil then
                for v23 = 1, #v21 do
                    local v24 = v21[v23];
                    if v24 and v24.value == v18 then
                        v22 = v24;
                        break;
                    end;
                end;
            end;
            return {
                surface = v22
            };
        end, {
            v18, 
            v21
        });
        return v3.createElement(l_DefaultDualDropdownDialogV2_0, {
            title = v17.title, 
            problems = v20, 
            surfaces = v21, 
            preselected = v25, 
            onClose = v16.onBack, 
            onSubmit = v16.onSubmit
        });
    else
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ZIndex = 10
        }, {
            SubmitReportDialog = v3.createElement(l_DefaultDualDropdownDialog_0, {
                analyticsContext = "Test", 
                localizationKeys = {
                    formTitle = "Feature.ReportAbuse.Title.SelectInSceneFinishYourReport", 
                    formSubmit = "Feature.ReportAbuse.Action.Submit"
                }, 
                onSubmitProps = {
                    hasNextSteps = true, 
                    onProceedToNextStep = v16.onSubmit
                }, 
                onCloseProps = {
                    hasPreviousSteps = false, 
                    onAbandon = v16.onBack
                }, 
                footerContent = function() --[[ Line: 208 ]] --[[ Name: footerContent ]]
                    -- upvalues: l_isShowUKOSAIllegalContentReportingLink_0 (ref), v3 (ref), l_View_0 (ref), l_OSAReportLink_0 (ref)
                    if l_isShowUKOSAIllegalContentReportingLink_0() then
                        return v3.createElement(l_View_0, {
                            tag = "size-full-0 auto-y"
                        }, {
                            OSALink = v3.createElement(l_OSAReportLink_0)
                        });
                    else
                        return nil;
                    end;
                end, 
                reportProblems = {
                    {
                        localizationKey = "Feature.ReportAbuse.Problem.Bullying", 
                        value = "bullying", 
                        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Bullying"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.Problem.Cheating", 
                        value = "exploiting", 
                        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Cheating"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.Problem.Dating", 
                        value = "dating", 
                        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Dating"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.Problem.Hate", 
                        value = "hate", 
                        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Hate"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.Problem.Links", 
                        value = "offsite links", 
                        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Links"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.Problem.Personal", 
                        value = "personal question", 
                        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Personal"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.Problem.Scamming", 
                        value = "scamming", 
                        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Scamming"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.Problem.Swearing", 
                        value = "swearing", 
                        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Swearing"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.Problem.Violence", 
                        value = "violence", 
                        descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Violence"
                    }
                }, 
                reportSurfaces = {
                    {
                        localizationKey = "Feature.ReportAbuse.ProblemSurface.Avatar", 
                        value = "avatar"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.ProblemSurface.DrawingOrCreation", 
                        value = "drawing"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.ProblemSurface.Experience", 
                        value = "experience"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.ProblemSurface.ItemOrAsset", 
                        value = "item"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.ProblemSurface.Movement", 
                        value = "movement"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.ProblemSurface.MusicOrSoundEffect", 
                        value = "music"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.ProblemSurface.TextChat", 
                        value = "text"
                    }, 
                    {
                        localizationKey = "Feature.ReportAbuse.ProblemSurface.Username", 
                        value = "username"
                    }
                }
            })
        });
    end;
end;