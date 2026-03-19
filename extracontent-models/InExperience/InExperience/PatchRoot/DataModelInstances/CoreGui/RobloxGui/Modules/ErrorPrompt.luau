local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TweenService_0 = game:GetService("TweenService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_VRService_0 = game:GetService("VRService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_MouseIconOverrideService_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Constants;
local v14 = require(l_RobloxGui_0.Modules.Shimmer);
local v15 = require(l_RobloxGui_0.Modules.Flags.GetFFlagDisplayChannelNameOnErrorPrompt);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_FFlag_0 = settings():GetFFlag("LocalizeErrorCodeString");
local v18 = TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, 0);
local v19 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
local function _(v20, v21, v22) --[[ Line: 34 ]] --[[ Name: attemptTranslate ]]
    -- upvalues: v19 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 35 ]]
        -- upvalues: v19 (ref), v20 (copy), v22 (copy)
        return v19:Format(v20, v22);
    end);
    return l_status_0 and l_result_0 or v21;
end;
local v26 = {
    Default = function() --[[ Line: 43 ]]
        -- upvalues: l_Create_0 (copy), l_Constants_0 (copy)
        return l_Create_0("Frame")({
            Name = "ErrorPrompt", 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Constants_0.COLORS.FLINT, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, l_Constants_0.ERROR_PROMPT_MAX_WIDTH.Default, 0, l_Constants_0.ERROR_PROMPT_HEIGHT.Default), 
            Visible = false, 
            AutoLocalize = false, 
            ZIndex = 8; 
            l_Create_0("UIListLayout")({
                Name = "PromptLayout", 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            l_Create_0("UIScale")({
                Name = "PromptScale", 
                Scale = 0
            }), 
            l_Create_0("Frame")({
                Name = "TitleFrame", 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, l_Constants_0.ERROR_TITLE_FRAME_HEIGHT.Default), 
                BorderSizePixel = 0, 
                ZIndex = 8; 
                l_Create_0("UIPadding")({
                    Name = "TitleFramePadding", 
                    PaddingBottom = UDim.new(0, 11), 
                    PaddingTop = UDim.new(0, 11)
                }), 
                l_Create_0("TextLabel")({
                    Name = "ErrorTitle", 
                    TextColor3 = l_Constants_0.COLORS.WHITE, 
                    TextSize = 25, 
                    Size = UDim2.new(1, 0, 0, 28), 
                    BackgroundTransparency = 1, 
                    Font = Enum.Font.SourceSansSemibold, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    ZIndex = 8
                })
            }), 
            l_Create_0("Frame")({
                Name = "SplitLine", 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -2 * l_Constants_0.SIDE_PADDING, 0, l_Constants_0.SPLIT_LINE_THICKNESS), 
                BackgroundColor3 = l_Constants_0.COLORS.PUMICE, 
                BorderSizePixel = 0, 
                ZIndex = 8
            }), 
            l_Create_0("Frame")({
                Name = "MessageArea", 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 1, -l_Constants_0.ERROR_TITLE_FRAME_HEIGHT.Default - l_Constants_0.SPLIT_LINE_THICKNESS), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = 8; 
                l_Create_0("UIPadding")({
                    Name = "MessageAreaPadding", 
                    PaddingBottom = UDim.new(0, l_Constants_0.SIDE_PADDING), 
                    PaddingLeft = UDim.new(0, l_Constants_0.SIDE_PADDING), 
                    PaddingRight = UDim.new(0, l_Constants_0.SIDE_PADDING), 
                    PaddingTop = UDim.new(0, l_Constants_0.SIDE_PADDING)
                }), 
                l_Create_0("Frame")({
                    Name = "ErrorFrame", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    ZIndex = 8; 
                    l_Create_0("UIListLayout")({
                        Name = "ErrorFrameLayout", 
                        Padding = UDim.new(0, l_Constants_0.LAYOUT_PADDING), 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    l_Create_0("TextLabel")({
                        Name = "ErrorMessage", 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 1, -l_Constants_0.BUTTON_HEIGHT - l_Constants_0.LAYOUT_PADDING), 
                        TextSize = 20, 
                        TextColor3 = l_Constants_0.COLORS.PUMICE, 
                        ZIndex = 8, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        Font = Enum.Font.SourceSans
                    }), 
                    l_Create_0("Frame")({
                        Name = "ButtonArea", 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, l_Constants_0.BUTTON_HEIGHT), 
                        ZIndex = 8, 
                        LayoutOrder = 2, 
                        SelectionGroup = true, 
                        SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorRight = Enum.SelectionBehavior.Stop; 
                        l_Create_0("UIGridLayout")({
                            Name = "ButtonLayout", 
                            CellPadding = UDim2.new(0, l_Constants_0.BUTTON_CELL_PADDING, 0, 0), 
                            CellSize = UDim2.new(1, 0, 0, l_Constants_0.BUTTON_HEIGHT), 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        })
                    })
                })
            })
        });
    end
};
local v30 = {
    Default = function(v27, v28, v29) --[[ Line: 159 ]]
        -- upvalues: l_Create_0 (copy), l_Constants_0 (copy)
        return l_Create_0("ImageButton")({
            Name = v27 .. "Button", 
            BackgroundTransparency = 1, 
            ImageColor3 = v29 and l_Constants_0.COLORS.WHITE or l_Constants_0.COLORS.PUMICE, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            Image = v29 and l_Constants_0.PRIMARY_BUTTON_TEXTURE or l_Constants_0.SECONDARY_BUTTON_TEXTURE, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            LayoutOrder = v28, 
            ZIndex = 8; 
            l_Create_0("TextLabel")({
                Name = "ButtonText", 
                Text = v27, 
                Size = UDim2.new(1, 0, 1, 0), 
                TextColor3 = v29 and l_Constants_0.COLORS.SLATE or l_Constants_0.COLORS.PUMICE, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Font = Enum.Font.SourceSans, 
                TextSize = 20, 
                ZIndex = 8
            })
        });
    end
};
local v31 = {};
v31.__index = v31;
v31.new = function(v32, v33) --[[ Line: 197 ]] --[[ Name: new ]]
    -- upvalues: v31 (copy), v26 (copy), l_TweenService_0 (copy), v18 (copy), l_VRService_0 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    local v34 = setmetatable({}, v31);
    v34._frame = v32 and v26[v32]() or v26.Default();
    v34._isOpen = false;
    v34._openAnimation = l_TweenService_0:Create(v34._frame.PromptScale, v18, {
        Scale = 1
    });
    v34._closeAnimation = l_TweenService_0:Create(v34._frame.PromptScale, v18, {
        Scale = 0
    });
    v34._buttonCount = 0;
    v34._playAnimation = true;
    v34._hideErrorCode = false;
    v34._menuIsOpenKey = "ErrorPrompt";
    if v33 then
        if v33.PlayAnimation ~= nil then
            v34._playAnimation = v33.PlayAnimation;
        end;
        if v33.HideErrorCode ~= nil then
            v34._hideErrorCode = v33.HideErrorCode;
        end;
        if v33.MenuIsOpenKey ~= nil then
            v34._menuIsOpenKey = v33.MenuIsOpenKey;
        end;
        v34._frame.MessageArea.ErrorFrame.ErrorMessage.TextScaled = v33.MessageTextScaled or false;
    end;
    if not l_VRService_0.VREnabled and l_UserInputService_0.GamepadEnabled then
        l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 230 ]]
            -- upvalues: v34 (copy), l_GuiService_0 (ref)
            if v34._isOpen and l_GuiService_0.SelectedCoreObject == nil then
                l_GuiService_0:Select(v34._frame.MessageArea.ErrorFrame.ButtonArea);
            end;
        end);
    end;
    return v34;
end;
local function v38(_, _, _) --[[ Line: 240 ]] --[[ Name: sinkInput ]]
    return Enum.ContextActionResult.Sink;
end;
v31._open = function(v39, v40, v41, v42) --[[ Line: 244 ]] --[[ Name: _open ]]
    -- upvalues: l_RobloxGui_0 (copy), l_MouseIconOverrideService_0 (copy), l_GuiService_0 (copy), l_VRService_0 (copy), l_UserInputService_0 (copy), l_ContextActionService_0 (copy), v38 (copy)
    v39:setErrorText(v40, v41, v42);
    v39:_resizeHeight(l_RobloxGui_0.AbsoluteSize.Y);
    if not v39._isOpen then
        l_MouseIconOverrideService_0.push("ErrorPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow);
        l_GuiService_0:SetMenuIsOpen(true, v39._menuIsOpenKey);
        v39._frame.Visible = true;
        v39._isOpen = true;
        if v39._playAnimation then
            v39._openAnimation:Play();
            v39._openAnimation.Completed:wait();
            v39._frame.PromptScale.Scale = 1;
        else
            v39._frame.PromptScale.Scale = 1;
        end;
    end;
    if v39._isOpen and (l_VRService_0.VREnabled or l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad) then
        l_GuiService_0:Select(v39._frame.MessageArea.ErrorFrame.ButtonArea);
    end;
    l_ContextActionService_0:BindCoreAction("ErrorPromptAction", v38, false, Enum.KeyCode.ButtonSelect, Enum.KeyCode.ButtonStart);
end;
v31._close = function(v43) --[[ Line: 266 ]] --[[ Name: _close ]]
    -- upvalues: l_MouseIconOverrideService_0 (copy), l_GuiService_0 (copy), l_ContextActionService_0 (copy)
    if v43._isOpen then
        l_MouseIconOverrideService_0.pop("ErrorPromptOverride");
        l_GuiService_0:SetMenuIsOpen(false, v43._menuIsOpenKey);
        v43._isOpen = false;
        if v43._playAnimation then
            v43._closeAnimation:Play();
            v43._closeAnimation.Completed:wait();
        else
            v43._frame.PromptScale.Scale = 0;
        end;
        v43._frame.Visible = false;
        l_ContextActionService_0:UnbindCoreAction("ErrorPromptAction");
    end;
end;
v31.setParent = function(v44, v45) --[[ Line: 282 ]] --[[ Name: setParent ]]
    v44._frame.Parent = v45;
end;
v31.setErrorText = function(v46, v47, v48, v49) --[[ Line: 286 ]] --[[ Name: setErrorText ]]
    -- upvalues: l_RunService_0 (copy), l_FFlag_0 (copy), v19 (copy), v15 (copy)
    local l_ErrorMessage_0 = v46._frame.MessageArea.ErrorFrame.ErrorMessage;
    local l_l_RunService_0_RobloxClientChannel_0 = l_RunService_0:GetRobloxClientChannel();
    if v46._hideErrorCode then
        l_ErrorMessage_0.Text = v47;
        return;
    elseif l_FFlag_0 then
        local v52 = -1;
        if v48 then
            v52 = v48.Value;
        end;
        local v53 = ("Error Code: %d"):format(v52);
        local v54 = {
            ERROR_CODE = tostring(v52)
        };
        local l_pcall_0 = pcall;
        local v56 = "InGame.ConnectionError.Message.ErrorCode";
        local l_v54_0 = v54 --[[ copy: 9 -> 13 ]];
        local v58;
        l_pcall_0, v58 = l_pcall_0(function() --[[ Line: 35 ]]
            -- upvalues: v19 (ref), v56 (copy), l_v54_0 (copy)
            return v19:Format(v56, l_v54_0);
        end);
        local v59 = l_pcall_0 and v58 or v53;
        v54 = nil;
        if v15() and v49 and l_l_RunService_0_RobloxClientChannel_0 then
            v54 = ("%s\n(%s, %s)"):format(v47, v59, v19:Format("InGame.ConnectionError.Message.ChannelName", {
                CHANNEL_NAME = l_l_RunService_0_RobloxClientChannel_0
            }) or ("Channel: %s"):format(l_l_RunService_0_RobloxClientChannel_0));
        end;
        if not v54 then
            v54 = ("%s\n(%s)"):format(v47, v59);
        end;
        l_ErrorMessage_0.Text = v54;
        return;
    elseif not v48 then
        l_ErrorMessage_0.Text = ("%s\n(Error Code: -1)"):format(v47);
        return;
    else
        l_ErrorMessage_0.Text = ("%s\n(Error Code: %d)"):format(v47, v48.Value);
        return;
    end;
end;
v31.setErrorTitle = function(v60, v61, v62) --[[ Line: 325 ]] --[[ Name: setErrorTitle ]]
    -- upvalues: v19 (copy)
    if not v61 then
        return;
    else
        local l_ErrorTitle_0 = v60._frame.TitleFrame.ErrorTitle;
        if v62 then
            local l_pcall_1 = pcall;
            local v65 = nil;
            local v66;
            l_pcall_1, v66 = l_pcall_1(function() --[[ Line: 35 ]]
                -- upvalues: v19 (ref), v62 (copy), v65 (copy)
                return v19:Format(v62, v65);
            end);
            l_ErrorTitle_0.Text = l_pcall_1 and v66 or v61;
            return;
        else
            l_ErrorTitle_0.Text = v61;
            return;
        end;
    end;
end;
v31.onErrorChanged = function(v67, v68, v69, v70) --[[ Line: 337 ]] --[[ Name: onErrorChanged ]]
    if v68 == "" then
        v67:_close();
        return;
    else
        if v68 ~= "" then
            v67:_open(v68, v69, v70);
        end;
        return;
    end;
end;
v31._relayout = function(v71) --[[ Line: 346 ]] --[[ Name: _relayout ]]
    -- upvalues: l_Constants_0 (copy)
    local l_ButtonArea_0 = v71._frame.MessageArea.ErrorFrame.ButtonArea;
    if v71._buttonCount == 0 then
        l_ButtonArea_0.Visible = false;
        return;
    else
        local v73 = (v71._frame.Size.X.Offset - (v71._buttonCount - 1) * l_Constants_0.BUTTON_CELL_PADDING - 2 * l_Constants_0.SIDE_PADDING) / v71._buttonCount;
        l_ButtonArea_0.Visible = true;
        l_ButtonArea_0.ButtonLayout.CellSize = UDim2.new(0, v73, 0, l_Constants_0.BUTTON_HEIGHT);
        return;
    end;
end;
v31.clearButtons = function(v74) --[[ Line: 358 ]] --[[ Name: clearButtons ]]
    local l_ButtonArea_1 = v74._frame.MessageArea.ErrorFrame.ButtonArea;
    if v74._primaryShimmer then
        v74._primaryShimmer = nil;
    end;
    local l_l_ButtonArea_1_Children_0 = l_ButtonArea_1:GetChildren();
    for _, v78 in pairs(l_l_ButtonArea_1_Children_0) do
        if v78.name ~= "ButtonLayout" then
            v78:Destroy();
        end;
    end;
end;
v31.updateButtons = function(v79, v80, v81) --[[ Line: 391 ]] --[[ Name: updateButtons ]]
    -- upvalues: v19 (copy), v30 (copy), v14 (copy)
    if not v80 then
        v80 = {};
    end;
    if not v81 then
        v81 = "Default";
    end;
    v79:clearButtons();
    local l_ButtonArea_2 = v79._frame.MessageArea.ErrorFrame.ButtonArea;
    local v83 = 0;
    for _, v85 in pairs(v80) do
        local l_Text_0 = v85.Text;
        if v85.LocalizationKey then
            local l_LocalizationKey_0 = v85.LocalizationKey;
            local l_Text_1 = v85.Text;
            local l_pcall_2 = pcall;
            local v90 = nil;
            local l_l_LocalizationKey_0_0 = l_LocalizationKey_0 --[[ copy: 11 -> 16 ]];
            local v92;
            l_pcall_2, v92 = l_pcall_2(function() --[[ Line: 35 ]]
                -- upvalues: v19 (ref), l_l_LocalizationKey_0_0 (copy), v90 (copy)
                return v19:Format(l_l_LocalizationKey_0_0, v90);
            end);
            l_Text_0 = l_pcall_2 and v92 or l_Text_1;
        end;
        local v93 = v30[v81](l_Text_0, v85.LayoutOrder, v85.Primary);
        if v85.Primary then
            v79._primaryShimmer = v14.new(v93, "PrimaryButton");
        end;
        v93.Parent = l_ButtonArea_2;
        v93.Activated:connect(v85.Callback);
        v83 = v83 + 1;
    end;
    if v79._buttonCount ~= v83 then
        v79._buttonCount = v83;
        v79:_relayout();
    end;
end;
v31.primaryShimmerPlay = function(v94) --[[ Line: 425 ]] --[[ Name: primaryShimmerPlay ]]
    if v94._primaryShimmer then
        v94._primaryShimmer:play();
    end;
end;
v31.primaryShimmerStop = function(v95) --[[ Line: 431 ]] --[[ Name: primaryShimmerStop ]]
    if v95._primaryShimmer then
        v95._primaryShimmer:stop();
    end;
end;
v31.resizeWidthAndHeight = function(v96, v97, v98) --[[ Line: 437 ]] --[[ Name: resizeWidthAndHeight ]]
    v96:_resizeWidth(v97);
    v96:_resizeHeight(v98);
    v96:_relayout();
end;
v31._resizeWidth = function(v99, v100) --[[ Line: 443 ]] --[[ Name: _resizeWidth ]]
    -- upvalues: l_Constants_0 (copy)
    local l_Offset_0 = v99._frame.Size.X.Offset;
    local v102 = v100 - 2 * l_Constants_0.SIDE_MARGIN;
    if l_Constants_0.ERROR_PROMPT_MAX_WIDTH.Default < v102 then
        if l_Offset_0 == l_Constants_0.ERROR_PROMPT_MAX_WIDTH.Default then
            return;
        else
            v102 = l_Constants_0.ERROR_PROMPT_MAX_WIDTH.Default;
        end;
    end;
    if v102 < l_Constants_0.ERROR_PROMPT_MIN_WIDTH.Default then
        if l_Offset_0 == l_Constants_0.ERROR_PROMPT_MIN_WIDTH.Default then
            return;
        else
            v102 = l_Constants_0.ERROR_PROMPT_MIN_WIDTH.Default;
        end;
    end;
    v99._frame.Size = UDim2.new(0, v102, 0, v99._frame.Size.Y.Offset);
end;
v31._resizeHeight = function(v103, v104) --[[ Line: 466 ]] --[[ Name: _resizeHeight ]]
    -- upvalues: l_Constants_0 (copy), l_TextService_0 (copy)
    local l_ErrorMessage_1 = v103._frame.MessageArea.ErrorFrame.ErrorMessage;
    local v106 = Vector2.new(v103._frame.Size.X.Offset - 2 * l_Constants_0.SIDE_PADDING, 1000);
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_ErrorMessage_1.Text, l_ErrorMessage_1.TextSize, l_ErrorMessage_1.Font, v106);
    local v108 = math.max(math.min(l_Constants_0.ERROR_TITLE_FRAME_HEIGHT.Default + l_l_TextService_0_TextSize_0.Y + l_Constants_0.SPLIT_LINE_THICKNESS + l_Constants_0.BUTTON_HEIGHT + l_Constants_0.LAYOUT_PADDING + 2 * l_Constants_0.SIDE_PADDING + 1, v104 - 2 * l_Constants_0.VERTICAL_MARGIN), l_Constants_0.ERROR_PROMPT_MIN_HEIGHT.Default);
    v103._frame.Size = UDim2.new(0, v103._frame.Size.X.Offset, 0, v108);
end;
return v31;