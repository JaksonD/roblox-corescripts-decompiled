local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local l_HttpService_0 = game:GetService("HttpService");
local v6 = require(l_Parent_0.React);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_ScreenshotManager_0 = require(l_Parent_0.Screenshot).ScreenshotManager;
local v9 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v9.clearTimeout;
local l_setTimeout_0 = v9.setTimeout;
local v12 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Constants);
local v13 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.AnalyticsReducer);
local v14 = require(l_script_FirstAncestor_0.Analysis.SceneAnalysis);
local v15 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportSubmitDialog);
local v16 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportCompleteModal);
local v17 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetGenericErrorModal);
local v18 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportIPInfringementModal);
local v19 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.PreciseSelection.ReportPreciseSelectionLandscapeHeader);
local v20 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.PreciseSelection.ReportPreciseSelectionPortraitHeaderFooter);
local v21 = require(l_script_FirstAncestor_0.Utility.buildReport);
local v22 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.InGameAssetReportAnalytics);
local v23 = require(l_script_FirstAncestor_0.Utility.getHighlightModeVariant);
local v24 = game:DefineFastFlag("PreciseSelectionBugfixesEnabled", false);
local l_FFlagPrefillPreciseSelectionChoices_0 = require(l_Parent_0.SharedFlags).FFlagPrefillPreciseSelectionChoices;
local l_FFlagReportIPInfringement_0 = require(l_Parent_0.SharedFlags).FFlagReportIPInfringement;
return function(v27) --[[ Line: 48 ]]
    -- upvalues: v6 (copy), v13 (copy), v12 (copy), l_setTimeout_0 (copy), l_clearTimeout_0 (copy), v24 (copy), l_ScreenshotManager_0 (copy), v14 (copy), v22 (copy), l_ExperienceStateCaptureService_0 (copy), l_UserInputService_0 (copy), l_FFlagReportIPInfringement_0 (copy), l_HttpService_0 (copy), v23 (copy), v21 (copy), l_Players_0 (copy), l_withLocalization_0 (copy), v20 (copy), v19 (copy), v15 (copy), l_FFlagPrefillPreciseSelectionChoices_0 (copy), v16 (copy), v18 (copy), v17 (copy)
    local v28, v29 = v6.useState(false);
    local v30, v31 = v6.useState(false);
    local v32, v33 = v6.useState(false);
    local v34, v35 = v6.useState("");
    local v36, v37 = v6.useState(nil);
    local v38, v39 = v6.useState(true);
    local v40, v41 = v6.useReducer(v13, v12.AnalyticsInitialState);
    local v42, v43 = v6.useState(nil);
    local v44, v45 = v6.useState(nil);
    local v46, v47 = v6.useState(nil);
    local v48, v49 = v6.useState(false);
    local v50, v51 = v6.useState(nil);
    local v52, v53 = v6.useState("");
    local v54, v55 = v6.useState(false);
    local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
    local v57 = v27.getIsSmallPortraitMode(l_ViewportSize_0);
    v6.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v41 (copy), v12 (ref), v51 (copy), l_setTimeout_0 (ref), v49 (copy)
        v41({
            type = v12.AnalyticsActions.AccumulateForTimeSpent, 
            accumulated_time_ms = workspace:GetServerTimeNow() * 1000
        });
        v41({
            type = v12.AnalyticsActions.SetPlaceId, 
            place_id = game.PlaceId
        });
        v51(l_setTimeout_0(function() --[[ Line: 78 ]]
            -- upvalues: v49 (ref)
            v49(true);
        end, 10000));
    end, {
        v49, 
        v51
    });
    local v58 = v6.useCallback(function() --[[ Line: 83 ]]
        -- upvalues: v49 (copy), v50 (copy), l_clearTimeout_0 (ref)
        v49(false);
        if v50 then
            l_clearTimeout_0(v50);
        end;
    end, {
        v49, 
        v50
    });
    local v59 = v6.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v24 (ref), v34 (copy), l_ScreenshotManager_0 (ref), v35 (copy), v58 (copy), v29 (copy), v41 (copy), v12 (ref), l_ViewportSize_0 (copy), v57 (copy)
        if v24 then
            if v34 == "" then
                l_ScreenshotManager_0:TakeScreenshotWithCallback(v35, nil);
            end;
        elseif not v34 then
            l_ScreenshotManager_0:TakeScreenshotWithCallback(v35, nil);
        end;
        v58();
        v29(true);
        v41({
            type = v12.AnalyticsActions.SetViewportInformation, 
            viewport_size_x = l_ViewportSize_0.X, 
            viewport_size_y = l_ViewportSize_0.Y, 
            is_portrait_mode = v57
        });
        v41({
            type = v12.AnalyticsActions.IncrementNextCount
        });
    end, {
        v29, 
        v35, 
        v34, 
        l_ViewportSize_0, 
        v57, 
        v41, 
        v58
    });
    local v60 = v6.useCallback(function() --[[ Line: 131 ]]
        -- upvalues: v37 (copy), v14 (ref), v46 (copy), v59 (copy)
        v37(v14.interpretAndExtractItemsFromInstanceForPreciseSelection(v46));
        v59();
    end, {
        v59, 
        v37, 
        v46
    });
    local v61 = v6.useCallback(function() --[[ Line: 137 ]]
        -- upvalues: v22 (ref), v40 (copy), v27 (copy)
        v22(v40, 2);
        v27.backAction();
    end, {
        v27.backAction, 
        v40
    });
    v6.useEffect(function() --[[ Line: 145 ]]
        -- upvalues: v44 (copy), l_ExperienceStateCaptureService_0 (ref), v47 (copy), v41 (copy), v12 (ref), v24 (ref), v58 (copy), l_UserInputService_0 (ref), v37 (copy), v14 (ref), v59 (copy), v45 (copy)
        if v44 then
            v44:Disconnect();
        end;
        local v63 = l_ExperienceStateCaptureService_0.ItemSelectedInCaptureMode:Connect(function(v62) --[[ Line: 149 ]]
            -- upvalues: v47 (ref), v41 (ref), v12 (ref), v24 (ref), v58 (ref), l_UserInputService_0 (ref), v37 (ref), v14 (ref), v59 (ref)
            v47(v62);
            if v62 then
                v41({
                    type = v12.AnalyticsActions.IncremementAnnotationCount
                });
                if v24 then
                    v58();
                end;
            end;
            if l_UserInputService_0.PreferredInput ~= Enum.PreferredInput.Touch then
                v37(v14.interpretAndExtractItemsFromInstanceForPreciseSelection(v62));
                v59();
            end;
        end);
        v45(v63);
    end, {
        v47, 
        v45, 
        v59, 
        v37, 
        v41, 
        v58
    });
    local v80 = v6.useCallback(function(v64, v65, v66) --[[ Line: 178 ]]
        -- upvalues: l_FFlagReportIPInfringement_0 (ref), v36 (copy), v34 (copy), l_HttpService_0 (ref), v53 (copy), v55 (copy), v33 (copy), v29 (copy), v31 (copy), v41 (copy), v12 (ref), v23 (ref), v21 (ref), l_Players_0 (ref)
        if l_FFlagReportIPInfringement_0 and v64 == "ip infringement" then
            local v67 = {};
            for _, v69 in pairs(v36.extractedAssets) do
                for _, v71 in ipairs(v69) do
                    local v72 = string.match(v71, "%d+");
                    if v72 and v72 ~= "" then
                        table.insert(v67, {
                            content_type = "Asset", 
                            content_id = v72
                        });
                    end;
                end;
            end;
            if #v67 > 0 then
                local v73 = {
                    screenshot_id = v34, 
                    universe_id = game.GameId, 
                    contents = v67, 
                    extractedAssets = v36.extractedAssets
                };
                local v74 = l_HttpService_0:JSONEncode(v73);
                l_HttpService_0:RequestInternal({
                    Url = "https://apis.roblox.com/rights-management-api/rights/v1/snapshots", 
                    Method = "POST", 
                    Headers = {
                        ["Content-Type"] = "application/json", 
                        Accept = "application/json"
                    }, 
                    Body = v74
                }):Start(function(_, v76) --[[ Line: 213 ]]
                    -- upvalues: l_HttpService_0 (ref), v53 (ref), v55 (ref)
                    if v76.StatusCode == 200 then
                        local v77 = l_HttpService_0:JSONDecode(v76.Body);
                        v53(v77.code or "");
                        return;
                    else
                        v55(true);
                        return;
                    end;
                end);
                v33(true);
                return;
            else
                v55(true);
                return;
            end;
        else
            v29(false);
            v31(true);
            v41({
                type = v12.AnalyticsActions.SetExtractionResults, 
                results = v36, 
                final_annotation_count = 0
            });
            v41({
                type = v12.AnalyticsActions.SetReasonSelection, 
                reason_selection = v64
            });
            v41({
                type = v12.AnalyticsActions.SetSurfaceSelection, 
                surface_selection = v65
            });
            v41({
                type = v12.AnalyticsActions.SetCommentAdded, 
                comment_added = #v66 > 0
            });
            local v78 = v23();
            v41({
                type = v12.AnalyticsActions.SetVariant, 
                variant = v78
            });
            local v79 = v21(l_Players_0.LocalPlayer.UserId, v34, v36, v64, v65, v66, {}, nil, v78);
            if v79 then
                l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, v79);
            end;
            return;
        end;
    end, {
        v36, 
        v29, 
        v31, 
        v34
    });
    local v81 = v6.useCallback(function() --[[ Line: 283 ]]
        -- upvalues: v37 (copy), v29 (copy), l_ExperienceStateCaptureService_0 (ref)
        v37(nil);
        v29(false);
        l_ExperienceStateCaptureService_0:ResetHighlight();
    end, {
        v29, 
        v37
    });
    local v82 = v6.useCallback(function() --[[ Line: 290 ]]
        -- upvalues: v31 (copy), v22 (ref), v40 (copy), v27 (copy)
        v31(false);
        v22(v40, 1);
        v27.onReportComplete();
    end, {
        v27.onReportComplete, 
        v31, 
        v40
    });
    local v83 = v6.useCallback(function() --[[ Line: 296 ]]
        -- upvalues: v38 (copy), v39 (copy), v41 (copy), v12 (ref)
        if v38 then
            v39(false);
            return;
        else
            v41({
                type = v12.AnalyticsActions.SetDidUserResize, 
                did_user_resize = true
            });
            return;
        end;
    end, {
        v38, 
        v28, 
        v41, 
        v39
    });
    v6.useEffect(function() --[[ Line: 309 ]]
        -- upvalues: v42 (copy), l_UserInputService_0 (ref), v61 (copy), v43 (copy)
        if v42 then
            v42:Disconnect();
        end;
        local v85 = l_UserInputService_0.InputEnded:Connect(function(v84) --[[ Line: 314 ]]
            -- upvalues: v61 (ref)
            if v84.KeyCode == Enum.KeyCode.Escape then
                v61();
            end;
        end);
        v43(v85);
    end, {
        v61, 
        v43
    });
    local v86 = v6.useCallback(function() --[[ Line: 323 ]]
        -- upvalues: v55 (copy)
        v55(false);
    end, {});
    return l_withLocalization_0({
        mainTitle = "Feature.ReportAbuse.Label.HighlightProblemPrecise", 
        next = "Feature.ReportAbuse.Action.Next", 
        coachmarkTitle = "Feature.ReportAbuse.Label.CantSelectTitle", 
        coachmarkText = "Feature.ReportAbuse.Label.CantSelectSubtitle"
    })(function(v87) --[[ Line: 332 ]]
        -- upvalues: v6 (ref), v83 (copy), v57 (copy), v20 (ref), v61 (copy), v19 (ref), v60 (copy), v48 (copy), v58 (copy), v28 (copy), v15 (ref), l_ViewportSize_0 (copy), v80 (copy), v81 (copy), v41 (copy), l_FFlagPrefillPreciseSelectionChoices_0 (ref), v36 (copy), v30 (copy), v16 (ref), v82 (copy), l_FFlagReportIPInfringement_0 (ref), v32 (copy), v18 (ref), v52 (copy), v54 (copy), v17 (ref), v86 (copy)
        return v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v6.Change.AbsoluteSize] = v83
        }, {
            Header = v6.createElement("TextButton", {
                Size = UDim2.new(1, 0, 0, 72), 
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                AutoButtonColor = false
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                InGameAssetReportModeHeader = if v57 then v6.createElement(v20.PortraitModeHeader, {
                    titleText = v87.mainTitle, 
                    nextText = v87.next, 
                    backAction = v61
                }) else v6.createElement(v19, {
                    titleText = v87.mainTitle, 
                    nextText = v87.next, 
                    nextAction = v60, 
                    backAction = v61, 
                    coachmarkTitle = v87.coachmarkTitle, 
                    coachmarkText = v87.coachmarkText, 
                    isCoachmarkOpen = v48, 
                    onCoachmarkClose = v58
                })
            }), 
            Footer = if v57 then v6.createElement("TextButton", {
                Size = UDim2.new(1, 0, 0, 60), 
                Position = UDim2.new(0, 0, 1, -60), 
                ZIndex = 2, 
                BackgroundTransparency = 1, 
                AutoButtonColor = false
            }, {
                InGameAssetReportModeFooter = v6.createElement(v20.PortraitModeFooter, {
                    nextAction = v60, 
                    nextText = v87.next, 
                    isCoachmarkOpen = v48, 
                    onCoachmarkClose = v58, 
                    coachmarkTitle = v87.coachmarkTitle, 
                    coachmarkText = v87.coachmarkText
                })
            }) else nil, 
            SubmitDialog = if v28 then v6.createElement(v15, {
                screenSize = l_ViewportSize_0, 
                onSubmit = v80, 
                onBack = v81, 
                analyticsDispatch = v41, 
                extractionResult = if l_FFlagPrefillPreciseSelectionChoices_0 then v36 else nil
            }) else nil, 
            ReportCompleteModal = if v30 then v6.createElement(v16, {
                screenSize = l_ViewportSize_0, 
                onClose = v82
            }) else nil, 
            IPInfringementModal = if l_FFlagReportIPInfringement_0 and v32 then v6.createElement(v18, {
                screenSize = l_ViewportSize_0, 
                reportCode = v52, 
                onClose = v82
            }) else nil, 
            ErrorModal = if v54 then v6.createElement(v17, {
                screenSize = l_ViewportSize_0, 
                onBack = v86
            }) else nil
        });
    end);
end;