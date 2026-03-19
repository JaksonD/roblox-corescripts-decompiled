local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v7 = require(l_Parent_0.React);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_ScreenshotManager_0 = require(l_Parent_0.Screenshot).ScreenshotManager;
local v10 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v10.clearTimeout;
local l_setTimeout_0 = v10.setTimeout;
local v13 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Constants);
local v14 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.AnalyticsReducer);
local v15 = require(l_script_FirstAncestor_0.Analysis.SceneAnalysis);
local v16 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportSubmitDialog);
local v17 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportCompleteModal);
local v18 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetIPInfringementErrorModal);
local v19 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportIPInfringementModal);
local v20 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.PreciseSelection.ReportPreciseSelectionLandscapeHeader);
local v21 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.PreciseSelection.ReportPreciseSelectionPortraitHeaderFooter);
local v22 = require(l_script_FirstAncestor_0.Utility.buildReport);
local v23 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.InGameAssetReportAnalytics);
local v24 = require(l_script_FirstAncestor_0.Utility.getHighlightModeVariant);
local v25 = game:DefineFastFlag("PreciseSelectionBugfixesEnabled", false);
local l_FFlagPrefillPreciseSelectionChoices_0 = require(l_Parent_0.SharedFlags).FFlagPrefillPreciseSelectionChoices;
local l_FFlagReportIPInfringement_0 = require(l_Parent_0.SharedFlags).FFlagReportIPInfringement;
local v28 = string.gsub(l_ContentProvider_0.BaseUrl:lower(), "/m.", "/www.");
local v29 = string.gsub(string.gsub(v28, "http:", "https:"), "https://www", "https://apis") .. "rights-management-api/rights/v1/snapshots";
return function(v30) --[[ Line: 57 ]]
    -- upvalues: v7 (copy), v14 (copy), v13 (copy), l_setTimeout_0 (copy), l_clearTimeout_0 (copy), v25 (copy), l_ScreenshotManager_0 (copy), v15 (copy), v23 (copy), l_ExperienceStateCaptureService_0 (copy), l_UserInputService_0 (copy), l_FFlagReportIPInfringement_0 (copy), l_HttpService_0 (copy), v29 (copy), v24 (copy), v22 (copy), l_Players_0 (copy), l_withLocalization_0 (copy), v21 (copy), v20 (copy), v16 (copy), l_FFlagPrefillPreciseSelectionChoices_0 (copy), v17 (copy), v19 (copy), v18 (copy)
    local v31, v32 = v7.useState(false);
    local v33, v34 = v7.useState(false);
    local v35, v36 = v7.useState(false);
    local v37, v38 = v7.useState("");
    local v39, v40 = v7.useState(nil);
    local v41, v42 = v7.useState(true);
    local v43, v44 = v7.useReducer(v14, v13.AnalyticsInitialState);
    local v45, v46 = v7.useState(nil);
    local v47, v48 = v7.useState(nil);
    local v49, v50 = v7.useState(nil);
    local v51, v52 = v7.useState(false);
    local v53, v54 = v7.useState(nil);
    local v55, v56 = v7.useState("");
    local v57, v58 = v7.useState(nil);
    local v59, v60 = v7.useState(false);
    local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
    local v62 = v30.getIsSmallPortraitMode(l_ViewportSize_0);
    v7.useEffect(function() --[[ Line: 79 ]]
        -- upvalues: v44 (copy), v13 (ref), v54 (copy), l_setTimeout_0 (ref), v52 (copy)
        v44({
            type = v13.AnalyticsActions.AccumulateForTimeSpent, 
            accumulated_time_ms = workspace:GetServerTimeNow() * 1000
        });
        v44({
            type = v13.AnalyticsActions.SetPlaceId, 
            place_id = game.PlaceId
        });
        v54(l_setTimeout_0(function() --[[ Line: 88 ]]
            -- upvalues: v52 (ref)
            v52(true);
        end, 10000));
    end, {
        v52, 
        v54
    });
    local v63 = v7.useCallback(function() --[[ Line: 93 ]]
        -- upvalues: v52 (copy), v53 (copy), l_clearTimeout_0 (ref)
        v52(false);
        if v53 then
            l_clearTimeout_0(v53);
        end;
    end, {
        v52, 
        v53
    });
    local v64 = v7.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v25 (ref), v37 (copy), l_ScreenshotManager_0 (ref), v38 (copy), v63 (copy), v32 (copy), v44 (copy), v13 (ref), l_ViewportSize_0 (copy), v62 (copy)
        if v25 then
            if v37 == "" then
                l_ScreenshotManager_0:TakeScreenshotWithCallback(v38, nil);
            end;
        elseif not v37 then
            l_ScreenshotManager_0:TakeScreenshotWithCallback(v38, nil);
        end;
        v63();
        v32(true);
        v44({
            type = v13.AnalyticsActions.SetViewportInformation, 
            viewport_size_x = l_ViewportSize_0.X, 
            viewport_size_y = l_ViewportSize_0.Y, 
            is_portrait_mode = v62
        });
        v44({
            type = v13.AnalyticsActions.IncrementNextCount
        });
    end, {
        v32, 
        v38, 
        v37, 
        l_ViewportSize_0, 
        v62, 
        v44, 
        v63
    });
    local v65 = v7.useCallback(function() --[[ Line: 141 ]]
        -- upvalues: v40 (copy), v15 (ref), v49 (copy), v64 (copy)
        v40(v15.interpretAndExtractItemsFromInstanceForPreciseSelection(v49));
        v64();
    end, {
        v64, 
        v40, 
        v49
    });
    local v66 = v7.useCallback(function() --[[ Line: 147 ]]
        -- upvalues: v23 (ref), v43 (copy), v30 (copy)
        v23(v43, 2);
        v30.backAction();
    end, {
        v30.backAction, 
        v43
    });
    v7.useEffect(function() --[[ Line: 155 ]]
        -- upvalues: v47 (copy), l_ExperienceStateCaptureService_0 (ref), v50 (copy), v44 (copy), v13 (ref), v25 (ref), v63 (copy), l_UserInputService_0 (ref), v40 (copy), v15 (ref), v64 (copy), v48 (copy)
        if v47 then
            v47:Disconnect();
        end;
        local v68 = l_ExperienceStateCaptureService_0.ItemSelectedInCaptureMode:Connect(function(v67) --[[ Line: 159 ]]
            -- upvalues: v50 (ref), v44 (ref), v13 (ref), v25 (ref), v63 (ref), l_UserInputService_0 (ref), v40 (ref), v15 (ref), v64 (ref)
            v50(v67);
            if v67 then
                v44({
                    type = v13.AnalyticsActions.IncremementAnnotationCount
                });
                if v25 then
                    v63();
                end;
            end;
            if l_UserInputService_0.PreferredInput ~= Enum.PreferredInput.Touch then
                v40(v15.interpretAndExtractItemsFromInstanceForPreciseSelection(v67));
                v64();
            end;
        end);
        v48(v68);
    end, {
        v50, 
        v48, 
        v64, 
        v40, 
        v44, 
        v63
    });
    local v90 = v7.useCallback(function(v69, v70, v71) --[[ Line: 192 ]]
        -- upvalues: l_FFlagReportIPInfringement_0 (ref), v39 (copy), v58 (copy), v13 (ref), v37 (copy), l_HttpService_0 (ref), v29 (ref), v56 (copy), v36 (copy), v32 (copy), v34 (copy), v44 (copy), v24 (ref), v22 (ref), l_Players_0 (ref)
        if l_FFlagReportIPInfringement_0 and v69 == "ip infringement" then
            if not v39 or not v39.extractedAssets then
                v58(v13.IpErrorCodes.ClientNoAssetsExtracted);
                return;
            else
                local v72 = {};
                for v73, v74 in pairs(v39.extractedAssets) do
                    for _, v76 in ipairs(v74) do
                        local v77 = if v73 == "Package" then v76.id else v76;
                        if v77 then
                            local v78 = string.match(v77, "%d+");
                            if v78 and v78 ~= "" then
                                table.insert(v72, {
                                    content_type = "Asset", 
                                    content_id = v78
                                });
                            end;
                        end;
                    end;
                end;
                if #v72 > 0 then
                    local v79 = {
                        screenshot_id = v37, 
                        universe_id = game.GameId, 
                        contents = v72
                    };
                    local v80 = l_HttpService_0:JSONEncode(v79);
                    l_HttpService_0:RequestInternal({
                        Url = v29, 
                        Method = "POST", 
                        Headers = {
                            ["Content-Type"] = "application/json", 
                            Accept = "application/json"
                        }, 
                        Body = v80
                    }):Start(function(_, v82) --[[ Line: 235 ]]
                        -- upvalues: l_HttpService_0 (ref), v56 (ref), v36 (ref), v58 (ref), v13 (ref)
                        if v82.StatusCode == 200 then
                            local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v82.Body);
                            if l_status_0 and l_result_0 and l_result_0.code then
                                v56(l_result_0.code);
                                v36(true);
                                return;
                            else
                                v58(v13.IpErrorCodes.Unknown);
                                return;
                            end;
                        else
                            local l_Unknown_0 = v13.IpErrorCodes.Unknown;
                            local l_status_1, l_result_1 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v82.Body);
                            if l_status_1 and l_result_1 and l_result_1.app_error_code and l_result_1.app_error_code ~= "" then
                                l_Unknown_0 = l_result_1.app_error_code;
                            end;
                            v58(l_Unknown_0);
                            return;
                        end;
                    end);
                    return;
                else
                    v58(v13.IpErrorCodes.ClientNoAssetsExtracted);
                    return;
                end;
            end;
        else
            v32(false);
            v34(true);
            v44({
                type = v13.AnalyticsActions.SetExtractionResults, 
                results = v39, 
                final_annotation_count = 0
            });
            v44({
                type = v13.AnalyticsActions.SetReasonSelection, 
                reason_selection = v69
            });
            v44({
                type = v13.AnalyticsActions.SetSurfaceSelection, 
                surface_selection = v70
            });
            v44({
                type = v13.AnalyticsActions.SetCommentAdded, 
                comment_added = #v71 > 0
            });
            local v88 = v24();
            v44({
                type = v13.AnalyticsActions.SetVariant, 
                variant = v88
            });
            local v89 = v22(l_Players_0.LocalPlayer.UserId, v37, v39, v69, v70, v71, {}, nil, v88);
            if v89 then
                l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, v89);
            end;
            return;
        end;
    end, {
        v39, 
        v32, 
        v34, 
        v37, 
        v58, 
        v36, 
        v56, 
        v44
    });
    local v91 = v7.useCallback(function() --[[ Line: 321 ]]
        -- upvalues: v40 (copy), v32 (copy), l_ExperienceStateCaptureService_0 (ref)
        v40(nil);
        v32(false);
        l_ExperienceStateCaptureService_0:ResetHighlight();
    end, {
        v32, 
        v40
    });
    local v92 = v7.useCallback(function() --[[ Line: 328 ]]
        -- upvalues: v34 (copy), v23 (ref), v43 (copy), v30 (copy)
        v34(false);
        v23(v43, 1);
        v30.onReportComplete();
    end, {
        v30.onReportComplete, 
        v34, 
        v43
    });
    local v93 = v7.useCallback(function() --[[ Line: 334 ]]
        -- upvalues: v41 (copy), v42 (copy), v44 (copy), v13 (ref)
        if v41 then
            v42(false);
            return;
        else
            v44({
                type = v13.AnalyticsActions.SetDidUserResize, 
                did_user_resize = true
            });
            return;
        end;
    end, {
        v41, 
        v31, 
        v44, 
        v42
    });
    v7.useEffect(function() --[[ Line: 347 ]]
        -- upvalues: v45 (copy), l_UserInputService_0 (ref), v66 (copy), v46 (copy)
        if v45 then
            v45:Disconnect();
        end;
        local v95 = l_UserInputService_0.InputEnded:Connect(function(v94) --[[ Line: 352 ]]
            -- upvalues: v66 (ref)
            if v94.KeyCode == Enum.KeyCode.Escape then
                v66();
            end;
        end);
        v46(v95);
    end, {
        v66, 
        v46
    });
    local v96 = v7.useCallback(function() --[[ Line: 361 ]]
        -- upvalues: v58 (copy)
        v58(nil);
    end, {});
    local v102 = v7.useCallback(function() --[[ Line: 368 ]]
        -- upvalues: v60 (copy), l_HttpService_0 (ref), v37 (copy), v29 (ref), v56 (copy), v58 (copy), v36 (copy), v13 (ref)
        v60(true);
        local v97 = l_HttpService_0:JSONEncode({
            screenshot_id = v37, 
            universe_id = game.GameId, 
            contents = {}
        });
        l_HttpService_0:RequestInternal({
            Url = v29, 
            Method = "POST", 
            Headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }, 
            Body = v97
        }):Start(function(_, v99) --[[ Line: 387 ]]
            -- upvalues: v60 (ref), l_HttpService_0 (ref), v56 (ref), v58 (ref), v36 (ref), v13 (ref)
            v60(false);
            if v99.StatusCode == 200 then
                local l_status_2, l_result_2 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v99.Body);
                if l_status_2 and l_result_2 and l_result_2.code then
                    v56(l_result_2.code);
                    v58(nil);
                    v36(true);
                    return;
                end;
            end;
            v58(v13.IpErrorCodes.Unknown);
        end);
    end, {
        v37, 
        v56, 
        v58, 
        v36, 
        v60
    });
    return l_withLocalization_0({
        mainTitle = "Feature.ReportAbuse.Label.HighlightProblemPrecise", 
        next = "Feature.ReportAbuse.Action.Next", 
        coachmarkTitle = "Feature.ReportAbuse.Label.CantSelectTitle", 
        coachmarkText = "Feature.ReportAbuse.Label.CantSelectSubtitle"
    })(function(v103) --[[ Line: 415 ]]
        -- upvalues: v7 (ref), v93 (copy), v62 (copy), v21 (ref), v66 (copy), v20 (ref), v65 (copy), v51 (copy), v63 (copy), v31 (copy), v16 (ref), l_ViewportSize_0 (copy), v90 (copy), v91 (copy), v44 (copy), l_FFlagPrefillPreciseSelectionChoices_0 (ref), v39 (copy), v33 (copy), v17 (ref), v92 (copy), l_FFlagReportIPInfringement_0 (ref), v35 (copy), v19 (ref), v55 (copy), v57 (copy), v18 (ref), v96 (copy), v102 (copy), v59 (copy)
        return v7.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v7.Change.AbsoluteSize] = v93
        }, {
            Header = v7.createElement("TextButton", {
                Size = UDim2.new(1, 0, 0, 72), 
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                AutoButtonColor = false
            }, {
                Layout = v7.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                InGameAssetReportModeHeader = if v62 then v7.createElement(v21.PortraitModeHeader, {
                    titleText = v103.mainTitle, 
                    nextText = v103.next, 
                    backAction = v66
                }) else v7.createElement(v20, {
                    titleText = v103.mainTitle, 
                    nextText = v103.next, 
                    nextAction = v65, 
                    backAction = v66, 
                    coachmarkTitle = v103.coachmarkTitle, 
                    coachmarkText = v103.coachmarkText, 
                    isCoachmarkOpen = v51, 
                    onCoachmarkClose = v63
                })
            }), 
            Footer = if v62 then v7.createElement("TextButton", {
                Size = UDim2.new(1, 0, 0, 60), 
                Position = UDim2.new(0, 0, 1, -60), 
                ZIndex = 2, 
                BackgroundTransparency = 1, 
                AutoButtonColor = false
            }, {
                InGameAssetReportModeFooter = v7.createElement(v21.PortraitModeFooter, {
                    nextAction = v65, 
                    nextText = v103.next, 
                    isCoachmarkOpen = v51, 
                    onCoachmarkClose = v63, 
                    coachmarkTitle = v103.coachmarkTitle, 
                    coachmarkText = v103.coachmarkText
                })
            }) else nil, 
            SubmitDialog = if v31 then v7.createElement(v16, {
                screenSize = l_ViewportSize_0, 
                onSubmit = v90, 
                onBack = v91, 
                analyticsDispatch = v44, 
                extractionResult = if l_FFlagPrefillPreciseSelectionChoices_0 then v39 else nil
            }) else nil, 
            ReportCompleteModal = if v33 then v7.createElement(v17, {
                screenSize = l_ViewportSize_0, 
                onClose = v92
            }) else nil, 
            IPInfringementModal = if l_FFlagReportIPInfringement_0 and v35 then v7.createElement(v19, {
                screenSize = l_ViewportSize_0, 
                reportCode = v55, 
                onClose = v92
            }) else nil, 
            ErrorModal = if l_FFlagReportIPInfringement_0 and v57 ~= nil then v7.createElement(v18, {
                screenSize = l_ViewportSize_0, 
                onBack = v96, 
                errorCode = v57, 
                onReportExperience = v102, 
                isReportExperienceLoading = v59
            }) else nil
        });
    end);
end;