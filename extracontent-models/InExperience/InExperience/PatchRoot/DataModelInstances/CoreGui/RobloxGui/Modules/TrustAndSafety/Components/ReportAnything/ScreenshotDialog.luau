local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_ImageSetButton_0 = v1.Core.ImageSet.ImageSetButton;
local l_useStyle_0 = v1.Core.Style.useStyle;
local l_ButtonStack_0 = v1.App.Button.ButtonStack;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Resources.Assets);
local v10 = require(l_Parent_0.Dependencies);
local v11 = require(l_Parent_0.Components.DebugCanvas);
local v12 = require(l_Parent_0.Components.ReportAnything.ScreenshotHighlighter);
local v13 = require(l_Parent_0.Components.VirtualKeyboardMonitor);
local v14 = require(l_Parent_0.Components.ReportAnything.ScreenshotDialogPortraitModeHeader);
local v15 = require(l_Parent_0.Components.ReportAnything.ScreenshotDialogLandscapeModeHeader);
local v16 = require(l_Parent_0.Utility.AbuseReportBuilder);
local _ = require(l_Parent_0.Utility.ReportAnythingAnalytics);
local v18 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v19 = require(l_Parent_0.Flags.GetFFlagReportAnythingLocalizationEnabled);
local v20 = require(v10.Divider);
local function v22(v21) --[[ Line: 47 ]] --[[ Name: PortraitModeFooter ]]
    -- upvalues: v2 (copy), l_ButtonStack_0 (copy), l_ButtonType_0 (copy), v19 (copy), v18 (copy)
    return v2.createElement("Frame", {
        BackgroundTransparency = 0, 
        Size = UDim2.new(1, 0, 0, 60), 
        BackgroundColor3 = Color3.fromHex("#4F545F"), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        LayoutOrder = 4
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        Container = v2.createElement("Frame", {
            Size = UDim2.new(0, 400, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 32), 
                PaddingRight = UDim.new(0, 32)
            }), 
            ActionButtons = v2.createElement(l_ButtonStack_0, {
                marginBetween = 8, 
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function() --[[ Line: 76 ]] --[[ Name: onActivated ]]
                                -- upvalues: v21 (copy)
                                v21.reportAction(v21.annotationPoints);
                            end, 
                            text = if v19() then v18:FormatByKey("Feature.ReportAbuse.Action.Next") else "Next"
                        }
                    }
                }
            })
        })
    });
end;
return function(v23) --[[ Line: 90 ]] --[[ Name: ScreenshotDialog ]]
    -- upvalues: v2 (copy), l_useStyle_0 (copy), v13 (copy), v3 (copy), l_ImageSetButton_0 (copy), v9 (copy), v14 (copy), v15 (copy), v20 (copy), v11 (copy), v16 (copy), v12 (copy), v22 (copy)
    v2.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: v23 (copy)
        if v23.reportAnythingAnalytics then
            v23.reportAnythingAnalytics.incrementAnnotationPageSeen();
        end;
    end, {});
    local l_Theme_0 = l_useStyle_0().Theme;
    local v25 = v13.getInstance();
    local function v26() --[[ Line: 103 ]]
        -- upvalues: v25 (copy), v23 (copy)
        warn("OverlayActivated");
        if v25:isKeyboardJustOff() then
            return;
        else
            if v23.dismissAction then
                warn("Menu dismissed");
                v23.dismissAction();
            end;
            return;
        end;
    end;
    local v27, v28 = v2.useState(v3.Dictionary.join({}, v23.initialAnnotationPoints or {}));
    local v29, v30 = v2.useState({});
    local function _() --[[ Line: 120 ]] --[[ Name: updatePointsAndRerender ]]
        -- upvalues: v27 (copy), v28 (copy)
        local v31 = {};
        for v32, v33 in pairs(v27) do
            v31[v32] = v33;
        end;
        v28(v31);
    end;
    local function v39(_) --[[ Line: 128 ]]
        -- upvalues: v23 (copy), v27 (copy), v28 (copy), v30 (copy)
        if v23.reportAnythingAnalytics then
            v23.reportAnythingAnalytics.incrementAnnotationPlace();
        end;
        local v36 = {};
        for v37, v38 in pairs(v27) do
            v36[v37] = v38;
        end;
        v28(v36);
        v30({});
    end;
    local function v43() --[[ Line: 138 ]]
        -- upvalues: v27 (copy), v23 (copy), v29 (copy), v28 (copy)
        if #v27 > 0 then
            if v23.reportAnythingAnalytics then
                v23.reportAnythingAnalytics.incrementAnnotationUndo();
            end;
            table.insert(v29, 1, v27[#v27]);
            table.remove(v27, #v27);
            local v40 = {};
            for v41, v42 in pairs(v27) do
                v40[v41] = v42;
            end;
            v28(v40);
        end;
    end;
    local function v47() --[[ Line: 150 ]]
        -- upvalues: v29 (copy), v23 (copy), v27 (copy), v28 (copy)
        if #v29 > 0 then
            if v23.reportAnythingAnalytics then
                v23.reportAnythingAnalytics.incrementAnnotationRedo();
            end;
            table.insert(v27, v29[1]);
            table.remove(v29, 1);
            local v44 = {};
            for v45, v46 in pairs(v27) do
                v44[v45] = v46;
            end;
            v28(v44);
        end;
    end;
    local v48 = #v27 > 0;
    local v49 = #v29 > 0;
    return v2.createElement("TextButton", {
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.Overlay.Color, 
        BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        ZIndex = 10, 
        Text = "", 
        [v2.Event.Activated] = v26
    }, {
        ScreenshotDialog = v2.createElement(l_ImageSetButton_0, {
            Active = true, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Image = v9.Images.RoundedRect.Image, 
            ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
            ScaleType = v9.Images.RoundedRect.ScaleType, 
            SliceCenter = v9.Images.RoundedRect.SliceCenter
        }, {
            HeaderAndContent = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, v23.isSmallPortraitMode and -60 or 0), 
                BackgroundTransparency = 1
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Header = if v23.isSmallPortraitMode then v2.createElement(v14, {
                    titleText = v23.titleText, 
                    backAction = v23.backAction, 
                    undoAnnotationPoints = v43, 
                    redoAnnotationPoints = v47, 
                    isRedoEnabled = v49, 
                    isUndoEnabled = v48, 
                    annotationPoints = v27
                }) else v2.createElement(v15, {
                    titleText = v23.titleText, 
                    backAction = v23.backAction, 
                    reportAction = v23.reportAction, 
                    undoAnnotationPoints = v43, 
                    redoAnnotationPoints = v47, 
                    isRedoEnabled = v49, 
                    isUndoEnabled = v48, 
                    annotationPoints = v27
                }), 
                Divider = v2.createElement(v20, {
                    LayoutOrder = 2
                }), 
                ScreenshotAnnotation = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 1, -49), 
                    ZIndex = 1
                }, {
                    Container = v2.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        BackgroundTransparency = 1
                    }, {
                        UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                            AspectRatio = v23.imageAspectRatio
                        }), 
                        Padding = v2.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 16), 
                            PaddingBottom = UDim.new(0, 16), 
                            PaddingLeft = UDim.new(0, 16), 
                            PaddingRight = UDim.new(0, 16)
                        }), 
                        AnnotationLayer = v2.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, 0), 
                            BorderSizePixel = 2, 
                            BorderMode = Enum.BorderMode.Inset, 
                            BorderColor3 = Color3.fromRGB(255, 255, 255)
                        }, {
                            ScreenshotImage = v2.createElement("ImageLabel", {
                                Size = UDim2.fromScale(1, 1), 
                                Image = v23.screenshot, 
                                ZIndex = 1
                            }, {}), 
                            DebugCanvas = v2.createElement(v11, {
                                identifiedAvatars = v16.getIdentifiedAvatars(), 
                                identifiedAds = v16.getIdentifiedAds(), 
                                ZIndex = 2
                            }), 
                            Highlighter = v2.createElement(v12, {
                                annotationPoints = v27, 
                                handleAnnotationPoints = v39, 
                                setAnnotationCircleRadius = v16.setAnnotationCircleRadius, 
                                setAspectRatioDimensions = v16.setAspectRatioDimensions, 
                                ZIndex = 3
                            }, {})
                        })
                    })
                })
            }), 
            Footer = if v23.isSmallPortraitMode then v2.createElement(v22, {
                reportAction = v23.reportAction, 
                annotationPoints = v27
            }) else nil
        })
    });
end;