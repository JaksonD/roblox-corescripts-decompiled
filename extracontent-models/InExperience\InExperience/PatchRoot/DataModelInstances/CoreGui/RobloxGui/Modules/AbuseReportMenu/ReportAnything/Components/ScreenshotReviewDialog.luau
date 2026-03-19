local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local l_ButtonStack_0 = v1.App.Button.ButtonStack;
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local l_HeaderBar_0 = v1.App.Bar.HeaderBar;
local l_IconButton_0 = v1.App.Button.IconButton;
local l_IconSize_0 = v1.App.ImageSet.Enum.IconSize;
local l_ImageSetButton_0 = v1.Core.ImageSet.ImageSetButton;
local l_Images_0 = v1.App.ImageSet.Images;
local l_useStyle_0 = v1.Core.Style.useStyle;
local l_Button_0 = v1.App.Button.Button;
local l_StandardButtonSize_0 = v1.App.Button.Enum.StandardButtonSize;
local l_Parent_0 = script.Parent.Parent;
local v14 = require(l_Parent_0.Resources.Assets);
local v15 = require(l_Parent_0.Components.Divider);
local v16 = require(l_Parent_0.Components.RestartScreenshotDialog);
local _ = require(l_Parent_0.Utility.ReportAnythingAnalytics);
local v18 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_usePreferredInput_0 = v18.usePreferredInput;
local v20 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusRoot_0 = v20.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v20.FocusNavigableSurfaceIdentifierEnum;
local v23 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_GetFFlagAvatarIdentificationSafeAreaFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarIdentificationSafeAreaFix;
local function v31(v25) --[[ Line: 60 ]] --[[ Name: ScreenshotReviewDialogSmallPortraitModeHeaderRight ]]
    -- upvalues: v2 (copy), v23 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v26, v27 = v2.useState(0);
    local v29 = v2.useCallback(function(v28) --[[ Line: 62 ]]
        -- upvalues: v27 (copy)
        v27(v28.AbsoluteSize.X);
    end, {
        v27
    });
    local v30 = v2.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v25 (copy)
        v25.setShowRestartDialog(true);
    end, {
        v25.setShowRestartDialog
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Text = v2.createElement("TextLabel", {
            LayoutOrder = -1, 
            Text = v23:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"), 
            Font = v25.font.Header2.Font, 
            TextColor3 = v25.theme.TextEmphasis.Color, 
            TextTransparency = v25.theme.TextEmphasis.Transparency, 
            TextSize = 20, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Size = UDim2.new(0, v25.viewportUISafeAreaWidth - v26 - 50, 1, 0), 
            BackgroundTransparency = 1
        }), 
        RetakeButton = v2.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            text = v23:FormatByKey("Feature.ReportAbuse.Action.Retake"), 
            fitContent = true, 
            standardSize = l_StandardButtonSize_0.XSmall, 
            onActivated = v30, 
            [v2.Change.AbsoluteSize] = v29
        })
    });
end;
return function(v32) --[[ Line: 106 ]] --[[ Name: ScreenshotReviewDialog ]]
    -- upvalues: l_usePreferredInput_0 (copy), v18 (copy), v23 (copy), v2 (copy), l_useStyle_0 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v16 (copy), l_ImageSetButton_0 (copy), v14 (copy), l_HeaderBar_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), v31 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy), v15 (copy), l_GetFFlagAvatarIdentificationSafeAreaFix_0 (copy), l_ButtonStack_0 (copy)
    local v33 = l_usePreferredInput_0() == v18.Input.Directional;
    if not v23 then
        return nil;
    else
        local v34 = 60;
        if v32.isSmallPortraitMode then
            v34 = 104;
        end;
        local v35 = v2.useCallback(function() --[[ Line: 118 ]]
            -- upvalues: v32 (copy)
            v32.reportAnythingAnalytics.incrementPreviewBack();
            v32.onBack();
        end, {
            v32.onBack, 
            v32.reportAnythingAnalytics
        });
        local v36 = v2.useCallback(function() --[[ Line: 123 ]]
            -- upvalues: v32 (copy)
            v32.reportAnythingAnalytics.incrementPreviewAttach();
            v32.onSkip();
        end, {
            v32.onSkip, 
            v32.reportAnythingAnalytics
        });
        local v37, v38 = v2.useState(false);
        local v39 = v2.useCallback(function() --[[ Line: 130 ]]
            -- upvalues: v32 (copy), v38 (copy)
            v32.reportAnythingAnalytics.incrementRetake();
            v38(true);
        end, {
            v38, 
            v32.reportAnythingAnalytics
        });
        local v40 = v2.useCallback(function() --[[ Line: 135 ]]
            -- upvalues: v32 (copy)
            v32.reportAnythingAnalytics.setRetakeAbandon();
            v32.onRestart();
        end, {
            v32.onRestart, 
            v32.reportAnythingAnalytics
        });
        local v41 = v2.useCallback(function() --[[ Line: 140 ]]
            -- upvalues: v32 (copy)
            v32.reportAnythingAnalytics.incrementHighlightScene();
            v32.onNextPage();
        end, {
            v32.onNextPage, 
            v32.reportAnythingAnalytics
        });
        local v42 = l_useStyle_0();
        local l_Theme_0 = v42.Theme;
        local l_Font_0 = v42.Font;
        local v45 = if v32.viewportUISafeAreaHeight >= 800 then UDim2.new(0, 800, 0, 800) else UDim2.new(1, 0, 1, 0);
        return v2.createElement("TextButton", {
            Selectable = false, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 10, 
            Text = "", 
            [v2.Event.Activated] = v35
        }, {
            Container = v2.createElement("Frame", {
                Size = if v32.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else v45, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BackgroundTransparency = 0, 
                ZIndex = 10
            }, {
                RestartDialog = v37 and v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    FocusNavigationCoreScriptsWrapper = v2.createElement(l_FocusRoot_0, {
                        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
                        isIsolated = true, 
                        isAutoFocusRoot = true
                    }, {
                        DialogBody = v2.createElement(v16, {
                            ZIndex = 3, 
                            isSmallPortraitMode = v32.isSmallPortraitMode, 
                            onCancel = function() --[[ Line: 185 ]] --[[ Name: onCancel ]]
                                -- upvalues: v38 (copy)
                                v38(false);
                            end, 
                            onRestart = v40
                        })
                    })
                }), 
                RestartDialogMask = v37 and v2.createElement(l_ImageSetButton_0, {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 0.2, 
                    BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    Active = true, 
                    AutoButtonColor = false, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Image = v14.Images.RoundedRect.Image, 
                    ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    ImageTransparency = 1, 
                    ScaleType = v14.Images.RoundedRect.ScaleType, 
                    SliceCenter = v14.Images.RoundedRect.SliceCenter
                }, {}), 
                ScreenshotDialog = v2.createElement(l_ImageSetButton_0, {
                    Active = true, 
                    Selectable = false, 
                    Size = UDim2.fromScale(1, 1), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v14.Images.RoundedRect.Image, 
                    ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                    ScaleType = v14.Images.RoundedRect.ScaleType, 
                    SliceCenter = v14.Images.RoundedRect.SliceCenter
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    HeaderAndContent = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 1, -v34), 
                        BackgroundTransparency = 1
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Header = v2.createElement("Frame", {
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = Color3.fromHex("#4F545F"), 
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 48)
                        }, {
                            Bar = v2.createElement(l_HeaderBar_0, {
                                backgroundTransparency = 1, 
                                barHeight = 48, 
                                margin = 12, 
                                renderLeft = function() --[[ Line: 245 ]] --[[ Name: renderLeft ]]
                                    -- upvalues: v2 (ref), l_IconButton_0 (ref), l_IconSize_0 (ref), l_Images_0 (ref), v35 (copy)
                                    return v2.createElement(l_IconButton_0, {
                                        iconSize = l_IconSize_0.Medium, 
                                        icon = l_Images_0["icons/navigation/pushBack"], 
                                        onActivated = v35
                                    });
                                end, 
                                renderRight = function() --[[ Line: 253 ]] --[[ Name: renderRight ]]
                                    -- upvalues: v32 (copy), v2 (ref), v31 (ref), v39 (copy), l_Font_0 (copy), l_Theme_0 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), v23 (ref), l_StandardButtonSize_0 (ref)
                                    if v32.isSmallPortraitMode then
                                        return v2.createElement(v31, {
                                            onActivated = v39, 
                                            font = l_Font_0, 
                                            theme = l_Theme_0, 
                                            viewportUISafeAreaWidth = v32.viewportUISafeAreaWidth
                                        });
                                    else
                                        return v2.createElement(l_Button_0, {
                                            buttonType = l_ButtonType_0.Secondary, 
                                            text = v23:FormatByKey("Feature.ReportAbuse.Action.Retake"), 
                                            fitContent = true, 
                                            standardSize = l_StandardButtonSize_0.XSmall, 
                                            onActivated = v39
                                        });
                                    end;
                                end, 
                                title = if v32.isSmallPortraitMode then nil else v23:FormatByKey("Feature.SettingsHub.Label.SceneCaptured"), 
                                isSecondary = v32.isSmallPortraitMode
                            })
                        }), 
                        Divider = v2.createElement(v15, {
                            LayoutOrder = 2
                        }), 
                        ScreenshotBody = v2.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            LayoutOrder = 3, 
                            Size = UDim2.new(1, 0, 1, -60), 
                            ZIndex = 10
                        }, {
                            Padding = v2.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 16)
                            }), 
                            Layout = v2.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            ScreenshotContainer = v2.createElement("Frame", {
                                Size = UDim2.new(1, 0, 1, -32), 
                                BackgroundTransparency = 2, 
                                LayoutOrder = 1
                            }, {
                                Padding = v2.createElement("UIPadding", {
                                    PaddingTop = UDim.new(0, 12), 
                                    PaddingBottom = UDim.new(0, 12), 
                                    PaddingLeft = UDim.new(0, 16), 
                                    PaddingRight = UDim.new(0, 16)
                                }), 
                                Screenshot = v2.createElement("Frame", {
                                    Size = UDim2.new(1, 0, 1, 0), 
                                    Position = UDim2.fromScale(0.5, 0.5), 
                                    AnchorPoint = Vector2.new(0.5, 0.5), 
                                    BorderSizePixel = 2, 
                                    BorderMode = if l_GetFFlagAvatarIdentificationSafeAreaFix_0() then Enum.BorderMode.Outline else Enum.BorderMode.Inset, 
                                    BorderColor3 = Color3.fromRGB(255, 255, 255), 
                                    LayoutOrder = 1
                                }, {
                                    UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                                        AspectRatio = v32.imageAspectRatio
                                    }), 
                                    ScreenshotImage = v2.createElement(l_ImageSetButton_0, {
                                        Active = true, 
                                        Selectable = not v33 or false, 
                                        Size = UDim2.fromScale(1, 1), 
                                        Image = v32.screenshot, 
                                        ZIndex = 1, 
                                        AnchorPoint = Vector2.new(0.5, 0.5), 
                                        Position = UDim2.fromScale(0.5, 0.5), 
                                        BackgroundTransparency = 1, 
                                        ScaleType = Enum.ScaleType.Fit, 
                                        SliceCenter = v14.Images.RoundedRect.SliceCenter, 
                                        [v2.Event.Activated] = v41
                                    })
                                })
                            }), 
                            Description = v2.createElement("TextLabel", {
                                Text = v23:FormatByKey("Feature.ReportAbuse.Message.ProblemNotInScene"), 
                                Font = l_Font_0.Header1.Font, 
                                LayoutOrder = 2, 
                                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                                TextSize = v32.isSmallPortraitMode and 12 or 20, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                TextWrapped = true, 
                                Size = UDim2.new(1, -24, 0, v32.isSmallPortraitMode and 24 or 40), 
                                BackgroundTransparency = 1
                            })
                        })
                    }), 
                    Footer = v2.createElement("Frame", {
                        BackgroundTransparency = 0, 
                        Size = UDim2.new(1, 0, 0, v34), 
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
                            Size = if v32.isSmallPortraitMode then UDim2.new(1, 0, 1, 0) else UDim2.new(0, v32.isSmallPortraitMode and 400 or 612, 1, 0), 
                            BackgroundTransparency = 1
                        }, {
                            Padding = v2.createElement("UIPadding", {
                                PaddingTop = UDim.new(0, 12), 
                                PaddingBottom = UDim.new(0, 12), 
                                PaddingLeft = UDim.new(0, 16), 
                                PaddingRight = UDim.new(0, 16)
                            }), 
                            ActionButtons = v2.createElement(l_ButtonStack_0, {
                                forcedFillDirection = if v32.isSmallPortraitMode then Enum.FillDirection.Vertical else nil, 
                                marginBetween = 8, 
                                buttons = {
                                    {
                                        buttonType = l_ButtonType_0.Secondary, 
                                        props = {
                                            onActivated = v36, 
                                            text = v23:FormatByKey("Feature.ReportAbuse.Action.AttachScreenshot")
                                        }
                                    }, 
                                    if v33 then nil else {
                                        buttonType = l_ButtonType_0.PrimarySystem, 
                                        props = {
                                            onActivated = v41, 
                                            text = v23:FormatByKey("Feature.ReportAbuse.Action.HighlightScene")
                                        }
                                    }
                                }
                            })
                        })
                    })
                })
            })
        });
    end;
end;