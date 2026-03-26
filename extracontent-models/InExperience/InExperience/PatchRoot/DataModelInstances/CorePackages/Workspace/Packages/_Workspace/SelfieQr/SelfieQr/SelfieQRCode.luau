local l_AvatarCreationService_0 = game:GetService("AvatarCreationService");
local l_Parent_0 = script:FindFirstAncestor("SelfieQr").Parent;
local v2 = require(l_Parent_0.FocusNavigationUtils);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Http);
local v5 = require(l_Parent_0.Localization);
local v6 = require(l_Parent_0.Promise);
local v7 = require(l_Parent_0.QRCodeDisplay);
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.ReactFocusNavigation);
local v10 = require(l_Parent_0.Responsive);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_Dialog_0 = v3.Dialog;
local l_DialogSize_0 = v3.Enums.DialogSize;
local l_DisplayQRCode_0 = v7.DisplayQRCode;
local l_FocusNavigationEventNameEnum_0 = v2.FocusNavigationEventNameEnum;
local l_Image_0 = v3.Image;
local l_Icon_0 = v3.Icon;
local l_Url_0 = v4.Url;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_useTokens_0 = v3.Hooks.useTokens;
local v22 = game:DefineFastFlag("AdoptStyleTokens", false);
local v23 = game:DefineFastFlag("AllowQrEnlargeUniversally", false);
local v24 = game:DefineFastFlag("ConsoleCloseAffordanceFix", false);
local v25 = game:DefineFastFlag("EnableTimeoutUI", false);
local v26 = game:DefineFastInt("SelfieQrTimeoutSeconds", 120);
local v27 = game:DefineFastString("DebugAvatarGenerationStaticApiKey", "NOT_SET");
local v28 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v31(v29) --[[ Line: 55 ]] --[[ Name: SelfieQRCodeView ]]
    -- upvalues: l_useTokens_0 (copy), v8 (copy), v25 (copy), v22 (copy), l_DisplayQRCode_0 (copy), v7 (copy), l_Image_0 (copy)
    local v30 = l_useTokens_0();
    return v8.createElement("Frame", {
        Size = v29.outerSize, 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = if v25 and v29.errorOccurred then v30.Color.Extended.Gray.Gray_1000.Color3 else if v22 then v30.Color.Extended.White.White_0.Color3 else Color3.fromRGB(255, 255, 255), 
        ClipsDescendants = true
    }, {
        QRContainer = if v25 and v29.errorOccurred then nil else v8.createElement("Frame", {
            Size = UDim2.fromOffset(v29.sideLength, v29.sideLength), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = if v22 then v30.Color.None.Transparency else 1
        }, {
            DisplayQRCode = v8.createElement(l_DisplayQRCode_0, {
                toEncode = v29.url, 
                ecLevel = v7.ECLevels.EC_LEVEL_4, 
                sideLength = v29.sideLength
            })
        }), 
        LogoContainer = if v25 and v29.errorOccurred then nil else v8.createElement("Frame", {
            Size = UDim2.new(0.3, 0, 0.3, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = if v22 then v30.Color.Extended.Black.Black_0.Color3 else Color3.fromRGB(0, 0, 0), 
            ZIndex = 10, 
            ClipsDescendants = true
        }, {
            Corner = v8.createElement("UICorner", {
                CornerRadius = UDim.new(0.125, 0)
            }), 
            Icon = v8.createElement(l_Image_0, {
                Size = if v22 then UDim2.fromScale(1, 1) else UDim2.new(0.75, 0, 0.75, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = if v22 then nil else 1, 
                Image = v22 and "rbxasset://textures/ui/LuaApp/ExternalSite/roblox@3x.png" or "icons/logo/block", 
                ZIndex = 11
            }, {
                Corner = v8.createElement("UICorner", {
                    CornerRadius = UDim.new(0.125, 0)
                })
            })
        }), 
        Corner = v8.createElement("UICorner", {
            CornerRadius = UDim.new(0.065, 0)
        }), 
        Constraint = v8.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.ScaleWithParentSize, 
            DominantAxis = Enum.DominantAxis.Width
        })
    });
end;
local function v36(v32, v33) --[[ Line: 126 ]] --[[ Name: getJobStatus ]]
    -- upvalues: v27 (copy), v6 (copy)
    return v32(v33, "GET", {
        headers = {
            ["X-Static-Api-Key"] = v27
        }
    }):andThen(function(v34) --[[ Line: 128 ]]
        -- upvalues: v6 (ref)
        local l_responseBody_0 = v34.responseBody;
        if not l_responseBody_0 then
            return v6.reject("Invalid response from getJobStatus");
        else
            return l_responseBody_0;
        end;
    end);
end;
return function(v37) --[[ Line: 139 ]]
    -- upvalues: v8 (copy), v10 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v26 (copy), v25 (copy), l_AvatarCreationService_0 (copy), v36 (copy), l_Url_0 (copy), l_DialogSize_0 (copy), v24 (copy), v9 (copy), v28 (copy), l_FocusNavigationEventNameEnum_0 (copy), v22 (copy), v23 (copy), v31 (copy), l_Dialog_0 (copy), l_Icon_0 (copy), v3 (copy)
    local v38, v39 = v8.useState(false);
    local v40 = v10.usePreferredInput() == v10.Input.Directional;
    local v41, v42 = v8.useState(false);
    local v43, v44 = v8.useState(false);
    local v45 = l_useRoactService_0(l_RoactNetworking_0);
    local v46 = l_useTokens_0();
    local v47 = l_useLocalization_0({
        title = {
            "AvatarGeneration.SelfieConsent.QRTitle"; 
            fontStart = "<font weight=\"heavy\" size=\"24\">", 
            fontEnd = "</font>"
        }, 
        body = {
            "AvatarGeneration.SelfieConsent.QRBody"; 
            fontStart = "<font size=\"18\">", 
            fontEnd = "</font>"
        }, 
        errorTitle = {
            "AvatarGeneration.SelfieConsent.QRErrorTitle"; 
            fontStart = "<font weight=\"heavy\" size=\"24\">", 
            fontEnd = "</font>"
        }, 
        errorBody = {
            "AvatarGeneration.SelfieConsent.QRErrorBody"; 
            fontStart = "<font size=\"18\">", 
            fontEnd = "</font>"
        }
    });
    v8.useEffect(function() --[[ Line: 172 ]]
        -- upvalues: v26 (ref), v25 (ref), v44 (copy), v39 (copy), v42 (copy), v37 (copy), l_AvatarCreationService_0 (ref), v36 (ref), v45 (copy), l_Url_0 (ref)
        local v48 = nil;
        local v49 = task.delay(v26, function() --[[ Line: 174 ]]
            -- upvalues: v25 (ref), v44 (ref), v39 (ref), v42 (ref), v37 (ref), l_AvatarCreationService_0 (ref)
            if v25 then
                v44(true);
                v39(false);
                v42(false);
                return;
            else
                v37.displaySelfieQRCode(false);
                l_AvatarCreationService_0:HandleSelfieQRResult(false, "job not completed within time limit");
                return;
            end;
        end);
        local function v50(v51) --[[ Line: 185 ]] --[[ Name: poll ]]
            -- upvalues: v36 (ref), v45 (ref), v37 (ref), l_AvatarCreationService_0 (ref), v25 (ref), v44 (ref), v39 (ref), v42 (ref), v48 (ref), v50 (copy)
            v36(v45, v51):andThen(function(v52) --[[ Line: 187 ]]
                -- upvalues: v37 (ref), l_AvatarCreationService_0 (ref), v25 (ref), v44 (ref), v39 (ref), v42 (ref), v48 (ref), v50 (ref), v51 (copy)
                if v52.status == "done" then
                    local v53 = v52.fileIds and v52.fileIds[1];
                    v37.displaySelfieQRCode(false);
                    l_AvatarCreationService_0:HandleSelfieQRResult(true, v53);
                    return;
                elseif v52.status == "cancelled" or v52.status == "error" then
                    if v25 then
                        v44(true);
                        v39(false);
                        v42(false);
                        return;
                    else
                        v37.displaySelfieQRCode(false);
                        l_AvatarCreationService_0:HandleSelfieQRResult(false, "job polling failed");
                        return;
                    end;
                else
                    v48 = task.delay(1, function() --[[ Line: 202 ]]
                        -- upvalues: v50 (ref), v51 (ref)
                        v50(v51);
                    end);
                    return;
                end;
            end):catch(function(_) --[[ Line: 207 ]]
                -- upvalues: v25 (ref), v44 (ref), v39 (ref), v42 (ref), v37 (ref), l_AvatarCreationService_0 (ref)
                if v25 then
                    v44(true);
                    v39(false);
                    v42(false);
                    return;
                else
                    v37.displaySelfieQRCode(false);
                    l_AvatarCreationService_0:HandleSelfieQRResult(false, "job polling failed");
                    return;
                end;
            end);
        end;
        v50((string.format("%sml-runtime-gateway/v0.2/jobs/%s", l_Url_0.APIS_URL, v37.jobId)));
        return function() --[[ Line: 222 ]]
            -- upvalues: v48 (ref), v49 (copy)
            if v48 then
                task.cancel(v48);
            end;
            if v49 then
                task.cancel(v49);
            end;
        end;
    end, {});
    local v55 = {
        size = l_DialogSize_0.Medium, 
        ZIndex = 2
    };
    if not v40 then
        v55.onClose = function(_) --[[ Line: 238 ]]
            -- upvalues: v37 (copy), v25 (ref), l_AvatarCreationService_0 (ref)
            v37.displaySelfieQRCode(false);
            if v25 then
                l_AvatarCreationService_0:HandleSelfieQRResult(false, "QR code closed before job completed or session expired");
                return;
            else
                l_AvatarCreationService_0:HandleSelfieQRResult(false, "QR code closed before job completed");
                return;
            end;
        end;
    end;
    local v57 = if v24 then v9.useEventMap(v28) else nil;
    local v60 = v8.useCallback(function(v58) --[[ Line: 252 ]]
        -- upvalues: v38 (copy), v39 (copy), v37 (copy), v25 (ref), l_AvatarCreationService_0 (ref)
        local l_eventData_0 = v58.eventData;
        if l_eventData_0 and l_eventData_0.UserInputState == Enum.UserInputState.End then
            v58:cancel();
            if v38 then
                v39(false);
                return;
            else
                v37.displaySelfieQRCode(false);
                if v25 then
                    l_AvatarCreationService_0:HandleSelfieQRResult(false, "QR code closed before job completed or session expired");
                    return;
                else
                    l_AvatarCreationService_0:HandleSelfieQRResult(false, "QR code closed before job completed");
                end;
            end;
        end;
    end, {
        v38, 
        v37.displaySelfieQRCode
    });
    local v61 = if v24 then v9.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v60, nil, v57) else nil;
    if v38 then
        return v8.createElement("Frame", {
            ref = if v24 then v61 else nil, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = if v22 then v46.Color.Extended.Black.Black_60.Color3 else Color3.fromRGB(0, 0, 0), 
            BackgroundTransparency = if v22 then v46.Color.Extended.Black.Black_60.Transparency else 0.4, 
            ZIndex = 7
        }, {
            InvisibleCloseButton = v8.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = if v22 then v46.Color.ActionUtility.Background.Transparency else 1, 
                Text = "", 
                ZIndex = not v24 and 5 or nil, 
                [v8.Event.Activated] = if (not v23 or v40) and v24 then nil else function() --[[ Line: 304 ]]
                    -- upvalues: v39 (copy)
                    v39(false);
                end
            }), 
            QRCodeArea = v8.createElement(v31, {
                url = v37.url, 
                sideLength = 500, 
                outerSize = UDim2.fromOffset(600, 600), 
                errorOccurred = if v25 then v43 else nil
            })
        });
    else
        return v8.createElement("Frame", {
            ref = if v24 then v61 else nil, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = if v22 then v46.Color.Extended.Black.Black_0.Color3 else Color3.fromRGB(0, 0, 0), 
            BackgroundTransparency = if v22 then v46.Color.None.Transparency else 1, 
            ZIndex = 0
        }, {
            InvisibleCloseButton = if not v24 then v8.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = if v22 then v46.Color.ActionUtility.Background.Transparency else 1, 
                Text = "", 
                ZIndex = 1, 
                [v8.Event.Activated] = function() --[[ Line: 337 ]]
                    -- upvalues: v37 (copy), l_AvatarCreationService_0 (ref)
                    v37.displaySelfieQRCode(false);
                    l_AvatarCreationService_0:HandleSelfieQRResult(false, "QR code closed before job completed");
                end
            }) else nil, 
            Dialog = v8.createElement(l_Dialog_0.Root, v55, {
                DialogContent = v8.createElement(l_Dialog_0.Content, nil, {
                    Layout = v8.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = if v22 then UDim.new(0, v46.Padding.Small) else UDim.new(0, 10)
                    }), 
                    TopSpacer = v8.createElement("Frame", {
                        Size = if v22 then UDim2.new(0, 0, 0, v46.Gap.XXLarge + 20) else UDim2.new(0, 0, 0, 50), 
                        BackgroundTransparency = if v22 then v46.Color.None.Transparency else 1, 
                        LayoutOrder = 0
                    }), 
                    HoverFrame = v8.createElement("TextButton", {
                        Text = "", 
                        Size = UDim2.fromOffset(350, 350), 
                        BackgroundTransparency = if v22 then v46.Color.ActionUtility.Background.Transparency else 1, 
                        AutoButtonColor = false, 
                        LayoutOrder = 1, 
                        [v8.Event.MouseEnter] = function() --[[ Line: 368 ]]
                            -- upvalues: v25 (ref), v43 (copy), v23 (ref), v40 (copy), v42 (copy)
                            if v25 and v43 then
                                return;
                            else
                                if v23 or v40 then
                                    v42(true);
                                end;
                                return;
                            end;
                        end, 
                        [v8.Event.MouseLeave] = function() --[[ Line: 376 ]]
                            -- upvalues: v42 (copy)
                            v42(false);
                        end, 
                        [v8.Event.Activated] = function() --[[ Line: 379 ]]
                            -- upvalues: v25 (ref), v43 (copy), v23 (ref), v40 (copy), v39 (copy), v42 (copy)
                            if v25 and v43 then
                                return;
                            else
                                if v23 or v40 then
                                    v39(true);
                                    if v25 then
                                        v42(false);
                                    end;
                                end;
                                return;
                            end;
                        end
                    }, {
                        Border = v8.createElement("UIStroke", {
                            Color = if v22 then v46.Color.Extended.White.White_0.Color3 else Color3.fromRGB(255, 255, 255), 
                            Thickness = 3, 
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                            LineJoinMode = Enum.LineJoinMode.Round, 
                            Transparency = if v22 then v41 and v46.Color.ActionEmphasis.Foreground.Transparency or v46.Color.ActionEmphasis.Border.Transparency else v41 and 0 or 1
                        }), 
                        Corner = v8.createElement("UICorner", {
                            CornerRadius = UDim.new(0.075, 0)
                        }), 
                        Constraint = v8.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1, 
                            AspectType = Enum.AspectType.ScaleWithParentSize, 
                            DominantAxis = Enum.DominantAxis.Width
                        }), 
                        QRCodeArea = v8.createElement(v31, {
                            url = v37.url, 
                            sideLength = 275, 
                            outerSize = UDim2.new(0.975, 0, 0.975, 0), 
                            errorOccurred = if v25 then v43 else nil
                        })
                    }), 
                    BottomSpacer = v8.createElement("Frame", {
                        Size = if v22 then UDim2.fromOffset(0, v46.Gap.Large) else UDim2.new(0, 0, 0, 30), 
                        BackgroundTransparency = if v22 then v46.Color.None.Transparency else 1, 
                        LayoutOrder = 2
                    }), 
                    TextAndIconContainer = if v25 then v8.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v46.Size.Size_2000), 
                        BackgroundTransparency = v46.Color.None.Transparency, 
                        LayoutOrder = 3
                    }, {
                        Layout = v8.createElement("UIListLayout", {
                            FillDirection = if v43 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Top, 
                            Padding = UDim.new(0, v46.Gap.Medium)
                        }), 
                        WarningIcon = if v43 then v8.createElement(l_Icon_0, {
                            name = v3.Enums.IconName.TriangleExclamation, 
                            size = v46.Size.Size_700, 
                            BackgroundTransparency = v46.Color.None.Transparency, 
                            LayoutOrder = 1
                        }) else nil, 
                        TextContent = v8.createElement("Frame", {
                            Size = if v43 then UDim2.new(1, -48, 1, 0) else UDim2.fromScale(1, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = v46.Color.None.Transparency, 
                            LayoutOrder = 2
                        }, {
                            Layout = v8.createElement("UIListLayout", {
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                Padding = UDim.new(0, v46.Gap.Small)
                            }), 
                            TitleText = v8.createElement(l_Dialog_0.Text, {
                                Text = if v43 then v47.errorTitle else v47.title, 
                                LayoutOrder = 3, 
                                TextXAlignment = if v43 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center, 
                                Font = Enum.Font.SourceSansBold
                            }), 
                            DialogText = v8.createElement(l_Dialog_0.Text, {
                                Text = if v43 then v47.errorBody else "", 
                                LayoutOrder = 4, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            })
                        })
                    }) else nil, 
                    TitleText = if not v25 then v8.createElement(l_Dialog_0.Text, {
                        Text = v47.title, 
                        LayoutOrder = 3, 
                        Font = Enum.Font.SourceSansBold
                    }) else nil, 
                    DialogText = if not v25 then v8.createElement(l_Dialog_0.Text, {
                        Text = v47.body, 
                        LayoutOrder = 4
                    }) else nil
                })
            })
        });
    end;
end;