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
local l_Url_0 = v4.Url;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_useTokens_0 = v3.Hooks.useTokens;
local v21 = game:DefineFastFlag("AdoptStyleTokens", false);
local v22 = game:DefineFastFlag("AllowQrEnlargeUniversally", false);
local v23 = game:DefineFastFlag("ConsoleCloseAffordanceFix", false);
local v24 = game:DefineFastInt("SelfieQrTimeoutSeconds", 120);
local v25 = game:DefineFastString("DebugAvatarGenerationStaticApiKey", "NOT_SET");
local v26 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v29(v27) --[[ Line: 51 ]] --[[ Name: SelfieQRCodeView ]]
    -- upvalues: l_useTokens_0 (copy), v8 (copy), v21 (copy), l_DisplayQRCode_0 (copy), v7 (copy), l_Image_0 (copy)
    local v28 = l_useTokens_0();
    return v8.createElement("Frame", {
        Size = v27.outerSize, 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = if v21 then v28.Color.Extended.White.White_0.Color3 else Color3.fromRGB(255, 255, 255), 
        ClipsDescendants = true
    }, {
        QRContainer = v8.createElement("Frame", {
            Size = UDim2.fromOffset(v27.sideLength, v27.sideLength), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = if v21 then v28.Color.None.Transparency else 1
        }, {
            DisplayQRCode = v8.createElement(l_DisplayQRCode_0, {
                toEncode = v27.url, 
                ecLevel = v7.ECLevels.EC_LEVEL_4, 
                sideLength = v27.sideLength
            })
        }), 
        LogoContainer = v8.createElement("Frame", {
            Size = UDim2.new(0.3, 0, 0.3, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = if v21 then v28.Color.Extended.Black.Black_0.Color3 else Color3.fromRGB(0, 0, 0), 
            ZIndex = 10, 
            ClipsDescendants = true
        }, {
            Corner = v8.createElement("UICorner", {
                CornerRadius = UDim.new(0.125, 0)
            }), 
            Icon = v8.createElement(l_Image_0, {
                Size = if v21 then UDim2.fromScale(1, 1) else UDim2.new(0.75, 0, 0.75, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = if v21 then nil else 1, 
                Image = v21 and "rbxasset://textures/ui/LuaApp/ExternalSite/roblox@3x.png" or "icons/logo/block", 
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
local function v34(v30, v31) --[[ Line: 117 ]] --[[ Name: getJobStatus ]]
    -- upvalues: v25 (copy), v6 (copy)
    return v30(v31, "GET", {
        headers = {
            ["X-Static-Api-Key"] = v25
        }
    }):andThen(function(v32) --[[ Line: 119 ]]
        -- upvalues: v6 (ref)
        local l_responseBody_0 = v32.responseBody;
        if not l_responseBody_0 then
            return v6.reject("Invalid response from getJobStatus");
        else
            return l_responseBody_0;
        end;
    end);
end;
return function(v35) --[[ Line: 130 ]]
    -- upvalues: v8 (copy), v10 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v24 (copy), l_AvatarCreationService_0 (copy), v34 (copy), l_Url_0 (copy), l_DialogSize_0 (copy), v23 (copy), v9 (copy), v26 (copy), l_FocusNavigationEventNameEnum_0 (copy), v21 (copy), v22 (copy), v29 (copy), l_Dialog_0 (copy)
    local v36, v37 = v8.useState(false);
    local v38 = v10.usePreferredInput() == v10.Input.Directional;
    local v39, v40 = v8.useState(false);
    local v41 = l_useRoactService_0(l_RoactNetworking_0);
    local v42 = l_useTokens_0();
    local v43 = l_useLocalization_0({
        title = {
            "AvatarGeneration.SelfieConsent.QRTitle"; 
            fontStart = "<font weight=\"heavy\" size=\"24\">", 
            fontEnd = "</font>"
        }, 
        body = {
            "AvatarGeneration.SelfieConsent.QRBody"; 
            fontStart = "<font size=\"18\">", 
            fontEnd = "</font>"
        }
    });
    v8.useEffect(function() --[[ Line: 151 ]]
        -- upvalues: v24 (ref), v35 (copy), l_AvatarCreationService_0 (ref), v34 (ref), v41 (copy), l_Url_0 (ref)
        local v44 = nil;
        local v45 = task.delay(v24, function() --[[ Line: 153 ]]
            -- upvalues: v35 (ref), l_AvatarCreationService_0 (ref)
            v35.displaySelfieQRCode(false);
            l_AvatarCreationService_0:HandleSelfieQRResult(false, "job not completed within time limit");
        end);
        local function v46(v47) --[[ Line: 158 ]] --[[ Name: poll ]]
            -- upvalues: v34 (ref), v41 (ref), v35 (ref), l_AvatarCreationService_0 (ref), v44 (ref), v46 (copy)
            v34(v41, v47):andThen(function(v48) --[[ Line: 160 ]]
                -- upvalues: v35 (ref), l_AvatarCreationService_0 (ref), v44 (ref), v46 (ref), v47 (copy)
                if v48.status == "done" then
                    local v49 = v48.fileIds and v48.fileIds[1];
                    v35.displaySelfieQRCode(false);
                    l_AvatarCreationService_0:HandleSelfieQRResult(true, v49);
                    return;
                elseif v48.status == "cancelled" or v48.status == "error" then
                    v35.displaySelfieQRCode(false);
                    l_AvatarCreationService_0:HandleSelfieQRResult(false, "job polling failed");
                    return;
                else
                    v44 = task.delay(1, function() --[[ Line: 169 ]]
                        -- upvalues: v46 (ref), v47 (ref)
                        v46(v47);
                    end);
                    return;
                end;
            end):catch(function(_) --[[ Line: 174 ]]
                -- upvalues: v35 (ref), l_AvatarCreationService_0 (ref)
                v35.displaySelfieQRCode(false);
                l_AvatarCreationService_0:HandleSelfieQRResult(false, "job polling failed");
            end);
        end;
        v46((string.format("%sml-runtime-gateway/v0.2/jobs/%s", l_Url_0.APIS_URL, v35.jobId)));
        return function() --[[ Line: 183 ]]
            -- upvalues: v44 (ref), v45 (copy)
            if v44 then
                task.cancel(v44);
            end;
            if v45 then
                task.cancel(v45);
            end;
        end;
    end, {});
    local v51 = {
        size = l_DialogSize_0.Medium, 
        ZIndex = 2
    };
    if not v38 then
        v51.onClose = function(_) --[[ Line: 199 ]]
            -- upvalues: v35 (copy), l_AvatarCreationService_0 (ref)
            v35.displaySelfieQRCode(false);
            l_AvatarCreationService_0:HandleSelfieQRResult(false, "QR code closed before job completed");
        end;
    end;
    local v53 = if v23 then v9.useEventMap(v26) else nil;
    local v56 = v8.useCallback(function(v54) --[[ Line: 206 ]]
        -- upvalues: v36 (copy), v37 (copy), v35 (copy), l_AvatarCreationService_0 (ref)
        local l_eventData_0 = v54.eventData;
        if l_eventData_0 and l_eventData_0.UserInputState == Enum.UserInputState.End then
            v54:cancel();
            if v36 then
                v37(false);
                return;
            else
                v35.displaySelfieQRCode(false);
                l_AvatarCreationService_0:HandleSelfieQRResult(false, "QR code closed before job completed");
            end;
        end;
    end, {
        v36, 
        v35.displaySelfieQRCode
    });
    local v57 = if v23 then v9.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v56, nil, v53) else nil;
    if v36 then
        return v8.createElement("Frame", {
            ref = if v23 then v57 else nil, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = if v21 then v42.Color.Extended.Black.Black_60.Color3 else Color3.fromRGB(0, 0, 0), 
            BackgroundTransparency = if v21 then v42.Color.Extended.Black.Black_60.Transparency else 0.4, 
            ZIndex = 7
        }, {
            InvisibleCloseButton = v8.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = if v21 then v42.Color.ActionUtility.Background.Transparency else 1, 
                Text = "", 
                ZIndex = not v23 and 5 or nil, 
                [v8.Event.Activated] = if (not v22 or v38) and v23 then nil else function() --[[ Line: 251 ]]
                    -- upvalues: v37 (copy)
                    v37(false);
                end
            }), 
            QRCodeArea = v8.createElement(v29, {
                url = v35.url, 
                sideLength = 500, 
                outerSize = UDim2.fromOffset(600, 600)
            })
        });
    else
        return v8.createElement("Frame", {
            ref = if v23 then v57 else nil, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = if v21 then v42.Color.Extended.Black.Black_0.Color3 else Color3.fromRGB(0, 0, 0), 
            BackgroundTransparency = if v21 then v42.Color.None.Transparency else 1, 
            ZIndex = 0
        }, {
            InvisibleCloseButton = if not v23 then v8.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = if v21 then v42.Color.ActionUtility.Background.Transparency else 1, 
                Text = "", 
                ZIndex = 1, 
                [v8.Event.Activated] = function() --[[ Line: 283 ]]
                    -- upvalues: v35 (copy), l_AvatarCreationService_0 (ref)
                    v35.displaySelfieQRCode(false);
                    l_AvatarCreationService_0:HandleSelfieQRResult(false, "QR code close before job completed");
                end
            }) else nil, 
            Dialog = v8.createElement(l_Dialog_0.Root, v51, {
                DialogContent = v8.createElement(l_Dialog_0.Content, nil, {
                    Layout = v8.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = if v21 then UDim.new(0, v42.Padding.Small) else UDim.new(0, 10)
                    }), 
                    TopSpacer = v8.createElement("Frame", {
                        Size = if v21 then UDim2.new(0, 0, 0, v42.Gap.XXLarge + 20) else UDim2.new(0, 0, 0, 50), 
                        BackgroundTransparency = if v21 then v42.Color.None.Transparency else 1, 
                        LayoutOrder = 0
                    }), 
                    HoverFrame = v8.createElement("TextButton", {
                        Text = "", 
                        Size = UDim2.fromOffset(350, 350), 
                        BackgroundTransparency = if v21 then v42.Color.ActionUtility.Background.Transparency else 1, 
                        AutoButtonColor = false, 
                        LayoutOrder = 1, 
                        [v8.Event.MouseEnter] = function() --[[ Line: 314 ]]
                            -- upvalues: v22 (ref), v38 (copy), v40 (copy)
                            if v22 or v38 then
                                v40(true);
                            end;
                        end, 
                        [v8.Event.MouseLeave] = function() --[[ Line: 319 ]]
                            -- upvalues: v40 (copy)
                            v40(false);
                        end, 
                        [v8.Event.Activated] = function() --[[ Line: 322 ]]
                            -- upvalues: v22 (ref), v38 (copy), v37 (copy)
                            if v22 or v38 then
                                v37(true);
                            end;
                        end
                    }, {
                        Border = v8.createElement("UIStroke", {
                            Color = if v21 then v42.Color.Extended.White.White_0.Color3 else Color3.fromRGB(255, 255, 255), 
                            Thickness = 3, 
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                            LineJoinMode = Enum.LineJoinMode.Round, 
                            Transparency = if v21 then v39 and v42.Color.ActionEmphasis.Foreground.Transparency or v42.Color.ActionEmphasis.Border.Transparency else v39 and 0 or 1
                        }), 
                        Corner = v8.createElement("UICorner", {
                            CornerRadius = UDim.new(0.075, 0)
                        }), 
                        Constraint = v8.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1, 
                            AspectType = Enum.AspectType.ScaleWithParentSize, 
                            DominantAxis = Enum.DominantAxis.Width
                        }), 
                        QRCodeArea = v8.createElement(v29, {
                            url = v35.url, 
                            sideLength = 275, 
                            outerSize = UDim2.new(0.975, 0, 0.975, 0)
                        })
                    }), 
                    BottomSpacer = v8.createElement("Frame", {
                        Size = if v21 then UDim2.fromOffset(0, v42.Gap.Large) else UDim2.new(0, 0, 0, 30), 
                        BackgroundTransparency = if v21 then v42.Color.None.Transparency else 1, 
                        LayoutOrder = 2
                    }), 
                    TitleText = v8.createElement(l_Dialog_0.Text, {
                        Text = v43.title, 
                        LayoutOrder = 3, 
                        Font = Enum.Font.SourceSansBold
                    }), 
                    DialogText = v8.createElement(l_Dialog_0.Text, {
                        Text = v43.body, 
                        LayoutOrder = 4
                    })
                })
            })
        });
    end;
end;