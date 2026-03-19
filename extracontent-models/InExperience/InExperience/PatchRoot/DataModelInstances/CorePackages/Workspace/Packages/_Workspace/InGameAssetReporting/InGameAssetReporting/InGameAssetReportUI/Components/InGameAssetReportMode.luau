local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_ScreenshotManager_0 = require(l_Parent_0.Screenshot).ScreenshotManager;
local v9 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Constants);
local v10 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.AnalyticsReducer);
local v11 = require(l_script_FirstAncestor_0.Analysis.SceneAnalysis);
local v12 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportSubmitDialog);
local v13 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportErrorModal);
local v14 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportCompleteModal);
local v15 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportLandscapeHeader);
local v16 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.InGameAssetReportPortraitHeaderFooter);
local v17 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Components.ScreenshotHighlighter);
local v18 = require(l_script_FirstAncestor_0.Utility.buildReport);
local v19 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.InGameAssetReportAnalytics);
local function v21(v20) --[[ Line: 43 ]]
    return v20.point;
end;
local function v23(v22) --[[ Line: 47 ]]
    return v22.interpretationResult;
end;
return function(v24) --[[ Line: 51 ]]
    -- upvalues: v6 (copy), v10 (copy), v9 (copy), v11 (copy), l_ExperienceStateCaptureService_0 (copy), l_ScreenshotManager_0 (copy), v5 (copy), v23 (copy), v19 (copy), v21 (copy), v18 (copy), l_Players_0 (copy), l_UserInputService_0 (copy), l_withLocalization_0 (copy), v16 (copy), v15 (copy), v17 (copy), v13 (copy), v12 (copy), v14 (copy)
    local v25, v26 = v6.useState({});
    local v27, v28 = v6.useState({});
    local v29, v30 = v6.useState(false);
    local v31, v32 = v6.useState(false);
    local v33, v34 = v6.useState(false);
    local v35, v36 = v6.useState("");
    local v37, v38 = v6.useState(nil);
    local v39, v40 = v6.useState(nil);
    local v41, v42 = v6.useState(true);
    local v43, v44 = v6.useReducer(v10, v9.AnalyticsInitialState);
    local v45, v46 = v6.useState(nil);
    local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
    local v48 = v24.getIsSmallPortraitMode(l_ViewportSize_0);
    v6.useEffect(function() --[[ Line: 70 ]]
        -- upvalues: v44 (copy), v9 (ref)
        v44({
            type = v9.AnalyticsActions.AccumulateForTimeSpent, 
            accumulated_time_ms = workspace:GetServerTimeNow() * 1000
        });
        v44({
            type = v9.AnalyticsActions.SetPlaceId, 
            place_id = game.PlaceId
        });
    end, {});
    local v56 = v6.useCallback(function(v49, v50) --[[ Line: 82 ]]
        -- upvalues: v11 (ref), l_ViewportSize_0 (copy), l_ExperienceStateCaptureService_0 (ref), v25 (copy), v35 (copy), l_ScreenshotManager_0 (ref), v36 (copy), v26 (copy), v28 (copy), v44 (copy), v9 (ref)
        local v51 = {
            point = v49, 
            interpretationResult = v11.interpretAnnotation(v49 * l_ViewportSize_0, v50 * math.max(l_ViewportSize_0.X, l_ViewportSize_0.Y), function() --[[ Line: 88 ]]

            end)
        };
        v51.signalConnection = l_ExperienceStateCaptureService_0.ItemSelectedInCaptureMode:Once(function(v52) --[[ Line: 92 ]]
            -- upvalues: v51 (copy)
            v51.engineSignalItem = v52;
        end);
        for _, v54 in ipairs(v25) do
            v54.signalConnection:Disconnect();
        end;
        if #v25 == 0 and v35 == "" then
            l_ScreenshotManager_0:TakeScreenshotWithCallback(v36, nil);
        end;
        local v55 = table.clone(v25);
        table.insert(v55, v51);
        v26(v55);
        v28({});
        v44({
            type = v9.AnalyticsActions.IncremementAnnotationCount
        });
        task.defer(v51.interpretationResult.raycastComputation);
    end, {
        v25, 
        v26, 
        v28, 
        v35
    });
    local v59 = v6.useCallback(function() --[[ Line: 119 ]]
        -- upvalues: v25 (copy), v27 (copy), v28 (copy), v26 (copy), v44 (copy), v9 (ref)
        if #v25 > 0 then
            local v57 = table.clone(v25);
            local v58 = table.clone(v27);
            table.insert(v58, table.remove(v57));
            v28(v58);
            v26(v57);
            v44({
                type = v9.AnalyticsActions.IncremementAnnotationUndoCount
            });
        end;
    end, {
        v26, 
        v25, 
        v28, 
        v27
    });
    local v62 = v6.useCallback(function() --[[ Line: 136 ]]
        -- upvalues: v27 (copy), v25 (copy), v28 (copy), v26 (copy), v44 (copy), v9 (ref)
        if #v27 > 0 then
            local v60 = table.clone(v25);
            local v61 = table.clone(v27);
            table.insert(v60, table.remove(v61));
            v28(v61);
            v26(v60);
            v44({
                type = v9.AnalyticsActions.IncremementAnnotationRedoCount
            });
        end;
    end, {
        v25, 
        v27
    });
    local v69 = v6.useCallback(function() --[[ Line: 155 ]]
        -- upvalues: v25 (copy), v35 (copy), l_ScreenshotManager_0 (ref), v36 (copy), v5 (ref), v11 (ref), v40 (copy), v23 (ref), v38 (copy), v30 (copy), v44 (copy), v9 (ref), l_ViewportSize_0 (copy), v48 (copy)
        if #v25 == 0 and v35 == "" then
            l_ScreenshotManager_0:TakeScreenshotWithCallback(v36, nil);
        end;
        local v64 = v5.List.map(v25, function(v63) --[[ Line: 161 ]]
            return v63.engineSignalItem;
        end);
        local v65 = v11.interpretInstanceListForGUIObjects(v64);
        local v66 = v11.extractItemsFromInterpretations({
            v65
        }, function() --[[ Line: 167 ]]

        end);
        v40(v66);
        task.defer(v66.computation);
        local v67 = v5.List.map(v25, v23);
        local v68 = v11.extractItemsFromInterpretations(v67, function() --[[ Line: 173 ]]

        end);
        v38(v68);
        v30(true);
        v44({
            type = v9.AnalyticsActions.SetViewportInformation, 
            viewport_size_x = l_ViewportSize_0.X, 
            viewport_size_y = l_ViewportSize_0.Y, 
            is_portrait_mode = v48
        });
        v44({
            type = v9.AnalyticsActions.IncrementNextCount
        });
        task.defer(v68.computation);
    end, {
        v25, 
        v30, 
        v38, 
        v35, 
        l_ViewportSize_0, 
        v48
    });
    local v70 = v6.useCallback(function() --[[ Line: 191 ]]
        -- upvalues: v19 (ref), v43 (copy), v24 (copy)
        v19(v43, 2);
        v24.backAction();
    end, {
        v24.backAction, 
        v43
    });
    local v71 = v5.List.map(v25, v21);
    local v76 = v6.useCallback(function(v72, v73, v74) --[[ Line: 203 ]]
        -- upvalues: v30 (copy), v32 (copy), v44 (copy), v9 (ref), v37 (copy), v25 (copy), v18 (ref), l_Players_0 (ref), v35 (copy), v71 (copy), v39 (copy)
        v30(false);
        v32(true);
        v44({
            type = v9.AnalyticsActions.SetExtractionResults, 
            results = v37, 
            final_annotation_count = #v25
        });
        v44({
            type = v9.AnalyticsActions.SetReasonSelection, 
            reason_selection = v72
        });
        v44({
            type = v9.AnalyticsActions.SetSurfaceSelection, 
            surface_selection = v73
        });
        v44({
            type = v9.AnalyticsActions.SetCommentAdded, 
            comment_added = #v74 > 0
        });
        local v75 = v18(l_Players_0.LocalPlayer.UserId, v35, v37, v72, v73, v74, v71, v39);
        if v75 then
            l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, v75);
        end;
    end, {
        v37, 
        v39, 
        v30, 
        v32, 
        v35, 
        v25, 
        v71
    });
    local v77 = v6.useCallback(function() --[[ Line: 255 ]]
        -- upvalues: v38 (copy), v30 (copy)
        v38(nil);
        v30(false);
    end, {
        v30, 
        v38
    });
    local v78 = v6.useCallback(function() --[[ Line: 261 ]]
        -- upvalues: v32 (copy), v19 (ref), v43 (copy), v24 (copy)
        v32(false);
        v19(v43, 1);
        v24.onReportComplete();
    end, {
        v24.onReportComplete, 
        v25, 
        v32, 
        v43
    });
    local v81 = v6.useCallback(function() --[[ Line: 268 ]]
        -- upvalues: v25 (copy), v34 (copy)
        for _, v80 in ipairs(v25) do
            v80.signalConnection:Disconnect();
        end;
        v34(true);
    end, {
        v34, 
        v25
    });
    local v82 = v6.useCallback(function() --[[ Line: 279 ]]
        -- upvalues: v34 (copy)
        v34(false);
    end, {});
    local v83 = v6.useCallback(function() --[[ Line: 283 ]]
        -- upvalues: v41 (copy), v42 (copy), v44 (copy), v9 (ref), v29 (copy), v26 (copy), v28 (copy)
        if v41 then
            v42(false);
        else
            v44({
                type = v9.AnalyticsActions.SetDidUserResize, 
                did_user_resize = true
            });
        end;
        if not v29 then
            v26({});
            v28({});
        end;
    end, {
        v41, 
        v29
    });
    local v84 = #v25 > 0;
    local v85 = #v27 > 0;
    v6.useEffect(function() --[[ Line: 305 ]]
        -- upvalues: v45 (copy), l_UserInputService_0 (ref), v70 (copy), v46 (copy)
        if v45 then
            v45:Disconnect();
        end;
        local v87 = l_UserInputService_0.InputEnded:Connect(function(v86) --[[ Line: 310 ]]
            -- upvalues: v70 (ref)
            if v86.KeyCode == Enum.KeyCode.Escape then
                v70();
            end;
        end);
        v46(v87);
    end, {
        v70
    });
    return l_withLocalization_0({
        mainTitle = "Feature.ReportAbuse.Label.HighlightProblem", 
        next = "Feature.ReportAbuse.Action.Next"
    })(function(v88) --[[ Line: 322 ]]
        -- upvalues: v6 (ref), v83 (copy), v48 (copy), v16 (ref), v70 (copy), v59 (copy), v62 (copy), v85 (copy), v84 (copy), v25 (copy), v15 (ref), v69 (copy), v17 (ref), v71 (copy), v56 (copy), v81 (copy), v33 (copy), v13 (ref), l_ViewportSize_0 (copy), v82 (copy), v29 (copy), v12 (ref), v76 (copy), v77 (copy), v44 (copy), v31 (copy), v14 (ref), v78 (copy)
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
                InGameAssetReportModeHeader = if v48 then v6.createElement(v16.PortraitModeHeader, {
                    titleText = v88.mainTitle, 
                    nextText = v88.next, 
                    backAction = v70, 
                    undoAnnotationPoints = v59, 
                    redoAnnotationPoints = v62, 
                    isRedoEnabled = v85, 
                    isUndoEnabled = v84, 
                    annotationPoints = v25
                }) else v6.createElement(v15, {
                    titleText = v88.mainTitle, 
                    nextText = v88.next, 
                    nextAction = v69, 
                    backAction = v70, 
                    undoAnnotationPoints = v59, 
                    redoAnnotationPoints = v62, 
                    isRedoEnabled = v85, 
                    isUndoEnabled = v84, 
                    annotationPoints = v25
                })
            }), 
            Footer = if v48 then v6.createElement("TextButton", {
                Size = UDim2.new(1, 0, 0, 60), 
                Position = UDim2.new(0, 0, 1, -60), 
                ZIndex = 2, 
                BackgroundTransparency = 1, 
                AutoButtonColor = false
            }, {
                InGameAssetReportModeFooter = v6.createElement(v16.PortraitModeFooter, {
                    nextAction = v69, 
                    annotationPoints = v25, 
                    nextText = v88.next
                })
            }) else nil, 
            ScreenshotAnnotation = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 1
            }, {
                Highlighter = v6.createElement(v17, {
                    annotationPoints = v71, 
                    handleNewAnnotationPoint = v56, 
                    onExceedMaxAnnotationLimit = v81, 
                    ZIndex = 2
                }, {})
            }), 
            ErrorStateModal = if v33 then v6.createElement(v13, {
                screenSize = l_ViewportSize_0, 
                onBack = v82
            }) else nil, 
            SubmitDialog = if v29 then v6.createElement(v12, {
                screenSize = l_ViewportSize_0, 
                onSubmit = v76, 
                onBack = v77, 
                analyticsDispatch = v44
            }) else nil, 
            ReportCompleteModal = if v31 then v6.createElement(v14, {
                screenSize = l_ViewportSize_0, 
                onClose = v78
            }) else nil
        });
    end);
end;