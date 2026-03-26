local v0 = {};
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_TenFootInterface_0 = require(l_Modules_0:WaitForChild("TenFootInterface"));
local l_VR_0 = l_Modules_0:WaitForChild("VR");
local l_Dialog_0 = require(l_VR_0:WaitForChild("Dialog"));
local v12 = nil;
getViewportSize = function() --[[ Line: 30 ]] --[[ Name: getViewportSize ]]
    while not game.Workspace.CurrentCamera do
        game.Workspace.Changed:Wait();
    end;
    assert(game.Workspace.CurrentCamera, "");
    while game.Workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or game.Workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) do
        game.Workspace.CurrentCamera.Changed:Wait();
    end;
    return game.Workspace.CurrentCamera.ViewportSize;
end;
local v13 = l_TenFootInterface_0:IsEnabled();
local v14 = false;
local v15 = false;
if l_UserInputService_0.TouchEnabled == true then
    v15 = l_UserInputService_0.MouseEnabled == false;
end;
local v16 = v15 and getViewportSize().Y <= 370;
local v17 = v15 and not v16;
local v18 = false;
local v19 = false;
local v20 = false;
local v21 = false;
local v22 = false;
local v23 = {
    WindowTitle = "Confirm", 
    MainText = "Is this okay?", 
    ConfirmationText = "Confirm", 
    CancelText = "Cancel", 
    CancelActive = true, 
    StripeColor = Color3.new(0.01, 0.72, 0.34), 
    Image = nil, 
    ImageConsoleVR = nil, 
    PromptCompletedCallback = nil
};
local v24 = nil;
local v25 = nil;
local v26 = UDim2.new(0, 438, 0, 300);
local v27 = UDim2.new(0.5, -219, 0, -300);
local v28 = UDim2.new(0.5, -219, 0.5, -150);
if v13 or v14 then
    v26 = UDim2.new(1, 0, 0, 690);
    v27 = UDim2.new(0, 0, 0, -690);
    v28 = UDim2.new(0, 0, 0.5, -345);
elseif v16 then
    v26 = UDim2.new(0.9, 0, 0.9, 0);
    v27 = UDim2.new(0.05, 0, -0.9, 0);
    v28 = UDim2.new(0.05, 0, 0.05, 0);
elseif v17 then
    v26 = UDim2.new(0, 400, 0, 305);
    v27 = UDim2.new(0.5, -200, 0, -305);
    v28 = UDim2.new(0.5, -200, 0.5, -152);
end;
local v29 = 52;
if v16 then
    v29 = 44;
end;
local v30 = 24;
if v13 or v14 then
    v30 = 42;
end;
local function v37(v31, v32, v33, v34, v35) --[[ Line: 121 ]] --[[ Name: createFrame ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = v31;
    l_Frame_0.Size = v32;
    l_Frame_0.Position = v33 or UDim2.new(0, 0, 0, 0);
    l_Frame_0.BackgroundTransparency = v34;
    l_Frame_0.BackgroundColor3 = v35 or Color3.new();
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.ZIndex = 8;
    return l_Frame_0;
end;
local function v45(v38, v39, v40, v41, v42, v43) --[[ Line: 134 ]] --[[ Name: createTextLabel ]]
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = v38;
    l_TextLabel_0.Size = v39 or UDim2.new(0, 0, 0, 0);
    l_TextLabel_0.Position = v40;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Font = v41;
    l_TextLabel_0.TextSize = v42;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.Text = v43;
    l_TextLabel_0.ZIndex = 8;
    return l_TextLabel_0;
end;
local function v58(v46, v47, v48, v49, v50, v51, v52) --[[ Line: 149 ]] --[[ Name: createScrollingTextLabel ]]
    -- upvalues: v45 (copy), l_TextService_0 (copy)
    local v53 = v45(v46, v47, v48, v49, v50, v51);
    v53.TextXAlignment = Enum.TextXAlignment.Left;
    v53.TextYAlignment = Enum.TextYAlignment.Top;
    v53.TextWrapped = true;
    if l_TextService_0:GetTextSize(v51, v50, v49, Vector2.new(v47.X.Offset, 10000)).Y > v47.Y.Offset then
        local v54 = Vector2.new(v47.X.Offset - (v52 + 20), 10000);
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v51, v50, v49, v54);
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Name = "ScrollingTextParent";
        l_Frame_1.BackgroundTransparency = 1;
        l_Frame_1.BackgroundColor3 = Color3.new(1, 1, 1);
        l_Frame_1.BorderSizePixel = 0;
        l_Frame_1.Position = v48;
        l_Frame_1.Size = v47 - UDim2.new(0, v52 * 2, 0, 0);
        local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
        l_ScrollingFrame_0.Selectable = true;
        l_ScrollingFrame_0.Name = "ScrollingFrame";
        l_ScrollingFrame_0.BackgroundTransparency = 1;
        l_ScrollingFrame_0.BackgroundColor3 = Color3.new(1, 1, 1);
        l_ScrollingFrame_0.BorderSizePixel = 0;
        l_ScrollingFrame_0.Position = UDim2.new(0, 0, 0, 0);
        l_ScrollingFrame_0.Size = v47;
        l_ScrollingFrame_0.CanvasSize = UDim2.new(0, v54.X - v52 * 2, 0, l_l_TextService_0_TextSize_0.Y);
        l_ScrollingFrame_0.ScrollBarThickness = v52;
        l_ScrollingFrame_0.SelectionImageObject = Instance.new("ImageLabel");
        l_ScrollingFrame_0.SelectionImageObject.Name = "EmptySelectionImage";
        l_ScrollingFrame_0.SelectionImageObject.BackgroundTransparency = 1;
        l_ScrollingFrame_0.SelectionImageObject.Image = "";
        l_ScrollingFrame_0.Active = false;
        l_ScrollingFrame_0.SelectionGained:connect(function() --[[ Line: 185 ]]
            -- upvalues: l_Frame_1 (copy)
            l_Frame_1.BackgroundTransparency = 0.15;
        end);
        l_ScrollingFrame_0.SelectionLost:connect(function() --[[ Line: 189 ]]
            -- upvalues: l_Frame_1 (copy)
            l_Frame_1.BackgroundTransparency = 1;
        end);
        v53.Position = UDim2.new(0, 10, 0, 0);
        v53.Size = UDim2.new(0, v54.X, 0, l_l_TextService_0_TextSize_0.Y);
        v53.Parent = l_ScrollingFrame_0;
        l_ScrollingFrame_0.Parent = l_Frame_1;
        return l_Frame_1;
    else
        return v53;
    end;
end;
local function _(v59, v60, v61, v62, v63) --[[ Line: 206 ]] --[[ Name: createImageLabel ]]
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = v59;
    l_ImageLabel_0.Size = v60;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Position = v61;
    l_ImageLabel_0.Image = v62;
    if v63 then
        v63(l_ImageLabel_0);
    end;
    return l_ImageLabel_0;
end;
local function v75(v66, v67, v68, v69, v70, v71, v72) --[[ Line: 221 ]] --[[ Name: createImageButtonWithText ]]
    -- upvalues: v45 (copy), v30 (ref)
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = v66;
    l_ImageButton_0.Size = v67;
    l_ImageButton_0.Position = v68;
    l_ImageButton_0.Image = v69;
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.AutoButtonColor = false;
    l_ImageButton_0.ZIndex = 8;
    l_ImageButton_0.Modal = true;
    l_ImageButton_0.Selectable = true;
    l_ImageButton_0.SelectionImageObject = Instance.new("ImageLabel");
    l_ImageButton_0.SelectionImageObject.Name = "EmptySelectionImage";
    l_ImageButton_0.SelectionImageObject.BackgroundTransparency = 1;
    l_ImageButton_0.SelectionImageObject.Image = "";
    local v74 = v45(v66 .. "Text", UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), v72, v30, v71);
    v74.ZIndex = 9;
    v74.Parent = l_ImageButton_0;
    l_ImageButton_0.MouseEnter:connect(function() --[[ Line: 241 ]]
        -- upvalues: l_ImageButton_0 (copy), v70 (copy)
        l_ImageButton_0.Image = v70;
    end);
    l_ImageButton_0.MouseLeave:connect(function() --[[ Line: 244 ]]
        -- upvalues: l_ImageButton_0 (copy), v69 (copy)
        l_ImageButton_0.Image = v69;
    end);
    l_ImageButton_0.MouseButton1Click:connect(function() --[[ Line: 247 ]]
        -- upvalues: l_ImageButton_0 (copy), v69 (copy)
        l_ImageButton_0.Image = v69;
    end);
    l_ImageButton_0.SelectionGained:connect(function() --[[ Line: 250 ]]
        -- upvalues: l_ImageButton_0 (copy), v70 (copy)
        l_ImageButton_0.Image = v70;
    end);
    l_ImageButton_0.SelectionLost:connect(function() --[[ Line: 253 ]]
        -- upvalues: l_ImageButton_0 (copy), v69 (copy)
        l_ImageButton_0.Image = v69;
    end);
    return l_ImageButton_0;
end;
local v76 = v37("PromptDialog", v26, v27, 1, nil);
v76.Visible = false;
v76.Parent = l_RobloxGui_0;
v76.Active = true;
local v77 = v37("ContainerFrame", UDim2.new(1, 0, 1, 0), nil, 0.36, Color3.new(0, 0, 0));
v77.ZIndex = 8;
v77.Parent = v76;
AddDefaultsToPromptOptions = function(v78, v79) --[[ Line: 270 ]] --[[ Name: AddDefaultsToPromptOptions ]]
    for v80, v81 in pairs(v79) do
        if v78[v80] == nil then
            v78[v80] = v81;
        end;
    end;
end;
CreatePromptVRorConsole = function(v82) --[[ Line: 279 ]] --[[ Name: CreatePromptVRorConsole ]]
    -- upvalues: v77 (copy), v45 (copy), v37 (copy), v58 (copy), v75 (copy)
    local v83 = 90;
    if v82.ImageConsoleVR then
        local v84 = UDim2.new(0, 600, 0, 600);
        local v85 = UDim2.new(0, 100, 0, 45);
        local l_ImageConsoleVR_0 = v82.ImageConsoleVR;
        local l_FetchImageFunctionConsoleVR_0 = v82.FetchImageFunctionConsoleVR;
        local l_ImageLabel_1 = Instance.new("ImageLabel");
        l_ImageLabel_1.Name = "Image";
        l_ImageLabel_1.Size = v84;
        l_ImageLabel_1.BackgroundTransparency = 1;
        l_ImageLabel_1.Position = v85;
        l_ImageLabel_1.Image = l_ImageConsoleVR_0;
        if l_FetchImageFunctionConsoleVR_0 then
            l_FetchImageFunctionConsoleVR_0(l_ImageLabel_1);
        end;
        local l_l_ImageLabel_1_0 = l_ImageLabel_1;
        l_l_ImageLabel_1_0.ZIndex = 9;
        l_l_ImageLabel_1_0.Parent = v77;
        v83 = 800;
    end;
    local v90 = v45("WindowTitle", UDim2.new(0, 800, 0, 60), UDim2.new(0, v83, 0, 60), Enum.Font.SourceSansBold, 48, v82.WindowTitle);
    v90.TextXAlignment = Enum.TextXAlignment.Left;
    v90.TextYAlignment = Enum.TextYAlignment.Center;
    v90.Parent = v77;
    v90.ZIndex = 9;
    local v91 = v37("ColorStripe", UDim2.new(0, 832, 0, 4), UDim2.new(0, v83, 0, 120), 0, v82.StripeColor);
    v91.ZIndex = 9;
    v91.Parent = v77;
    v58("MainText", UDim2.new(0, 800, 0, 450), UDim2.new(0, v83, 0, 152), Enum.Font.SourceSansBold, 44, v82.MainText, 16).Parent = v77;
    local v92 = Rect.new(8, 8, 56, 56);
    local l_Slice_0 = Enum.ScaleType.Slice;
    local v94 = v75("ConfirmButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, v83, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v82.ConfirmationText, Enum.Font.SourceSans);
    v94.Parent = v77;
    v94.ScaleType = l_Slice_0;
    v94.SliceCenter = v92;
    v94.MouseButton1Click:connect(function() --[[ Line: 316 ]]
        OnPromptEnded(true);
    end);
    if v82.CancelActive then
        local v95 = v75("CancelButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, v83 + 340, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v82.CancelText, Enum.Font.SourceSans);
        v95.Parent = v77;
        v95.ScaleType = l_Slice_0;
        v95.SliceCenter = v92;
        v95.MouseButton1Click:connect(function() --[[ Line: 328 ]]
            OnPromptEnded(false);
        end);
    end;
end;
CreatePromptPCorTablet = function(v96) --[[ Line: 334 ]] --[[ Name: CreatePromptPCorTablet ]]
    -- upvalues: v45 (copy), v29 (ref), v77 (copy), v37 (copy), v17 (copy), v58 (copy), v75 (copy)
    local v97 = v45("WindowTitle", UDim2.new(1, 0, 0, v29), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, v96.WindowTitle);
    v97.Parent = v77;
    v97.ZIndex = 9;
    local v98 = v37("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, v96.StripeColor);
    v98.Position = UDim2.new(0, 0, 0, v29);
    v98.ZIndex = 9;
    v98.Parent = v77;
    local v99 = nil;
    local v100 = nil;
    if v96.Image then
        local v101 = UDim2.new(0, 150, 0, 150);
        local v102 = UDim2.new(0, 15, 0, v29 + 17);
        local l_Image_0 = v96.Image;
        local l_FetchImageFunction_0 = v96.FetchImageFunction;
        local l_ImageLabel_2 = Instance.new("ImageLabel");
        l_ImageLabel_2.Name = "Image";
        l_ImageLabel_2.Size = v101;
        l_ImageLabel_2.BackgroundTransparency = 1;
        l_ImageLabel_2.Position = v102;
        l_ImageLabel_2.Image = l_Image_0;
        if l_FetchImageFunction_0 then
            l_FetchImageFunction_0(l_ImageLabel_2);
        end;
        v100 = l_ImageLabel_2;
        v100.ZIndex = 9;
        v100.Parent = v77;
        v99 = if v17 then v58("MainText", UDim2.new(0, 195, 0, 150), UDim2.new(0, 185, 0, v29 + 17), Enum.Font.SourceSansBold, 22, v96.MainText, 8) else v58("MainText", UDim2.new(0, 233, 0, 150), UDim2.new(0, 185, 0, v29 + 17), Enum.Font.SourceSansBold, 22, v96.MainText, 8);
    else
        v99 = if v17 then v58("MainText", UDim2.new(0, 360, 0, 150), UDim2.new(0, 20, 0, v29 + 17), Enum.Font.SourceSansBold, 22, v96.MainText, 8) else v58("MainText", UDim2.new(0, 398, 0, 150), UDim2.new(0, 20, 0, v29 + 17), Enum.Font.SourceSansBold, 22, v96.MainText, 8);
    end;
    v99.Parent = v77;
    local v106 = Rect.new(8, 8, 56, 56);
    local l_Slice_1 = Enum.ScaleType.Slice;
    local v108 = nil;
    v108 = if v17 then if v96.CancelActive then v75("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v96.ConfirmationText, Enum.Font.SourceSansBold) else v75("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v96.ConfirmationText, Enum.Font.SourceSans) else if v96.CancelActive then v75("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -138, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v96.ConfirmationText, Enum.Font.SourceSansBold) else v75("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -64, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v96.ConfirmationText, Enum.Font.SourceSans);
    v108.Parent = v77;
    v108.ScaleType = l_Slice_1;
    v108.SliceCenter = v106;
    v108.MouseButton1Click:connect(function() --[[ Line: 400 ]]
        OnPromptEnded(true);
    end);
    if v96.CancelActive then
        local v109 = nil;
        v109 = if v17 then v75("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v96.CancelText, Enum.Font.SourceSans) else v75("CancelButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, 10, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v96.CancelText, Enum.Font.SourceSans);
        v109.Parent = v77;
        v109.ScaleType = l_Slice_1;
        v109.SliceCenter = v106;
        v109.MouseButton1Click:connect(function() --[[ Line: 418 ]]
            OnPromptEnded(false);
        end);
        v109.NextSelectionLeft = v108;
        v108.NextSelectionRight = v109;
    end;
end;
CreatePromptPhone = function(v110) --[[ Line: 427 ]] --[[ Name: CreatePromptPhone ]]
    -- upvalues: v45 (copy), v29 (ref), v77 (copy), v37 (copy), v58 (copy), v75 (copy)
    local v111 = v45("WindowTitle", UDim2.new(1, 0, 0, v29), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, v110.WindowTitle);
    v111.Parent = v77;
    v111.ZIndex = 9;
    local v112 = v37("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, v110.StripeColor);
    v112.Position = UDim2.new(0, 0, 0, v29);
    v112.ZIndex = 9;
    v112.Parent = v77;
    local v113 = nil;
    local v114 = nil;
    if v110.Image then
        local v115 = UDim2.new(0, 120, 0, 120);
        local v116 = UDim2.new(0, 15, 0, v29 + 17);
        local l_Image_1 = v110.Image;
        local l_FetchImageFunction_1 = v110.FetchImageFunction;
        local l_ImageLabel_3 = Instance.new("ImageLabel");
        l_ImageLabel_3.Name = "Image";
        l_ImageLabel_3.Size = v115;
        l_ImageLabel_3.BackgroundTransparency = 1;
        l_ImageLabel_3.Position = v116;
        l_ImageLabel_3.Image = l_Image_1;
        if l_FetchImageFunction_1 then
            l_FetchImageFunction_1(l_ImageLabel_3);
        end;
        v114 = l_ImageLabel_3;
        v114.ZIndex = 9;
        v114.Parent = v77;
        v113 = v58("MainText", UDim2.new(0, v77.AbsoluteSize.X - 175, 0, 120), UDim2.new(0, 155, 0, v29 + 17), Enum.Font.SourceSansBold, 20, v110.MainText, 8);
    else
        v113 = v58("MainText", UDim2.new(1, v77.AbsoluteSize.X - 40, 0, 120), UDim2.new(0, 20, 0, v29 + 17), Enum.Font.SourceSansBold, 20, v110.MainText, 8);
    end;
    v113.Parent = v77;
    local v120 = Rect.new(8, 8, 56, 56);
    local l_Slice_2 = Enum.ScaleType.Slice;
    local v122 = nil;
    v122 = if v110.CancelActive then v75("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v110.ConfirmationText, Enum.Font.SourceSansBold) else v75("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v110.ConfirmationText, Enum.Font.SourceSans);
    v122.Parent = v77;
    v122.ScaleType = l_Slice_2;
    v122.SliceCenter = v120;
    v122.MouseButton1Click:connect(function() --[[ Line: 473 ]]
        OnPromptEnded(true);
    end);
    if v110.CancelActive then
        local v123 = v75("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v110.CancelText, Enum.Font.SourceSans);
        v123.Parent = v77;
        v123.ScaleType = l_Slice_2;
        v123.SliceCenter = v120;
        v123.MouseButton1Click:connect(function() --[[ Line: 484 ]]
            OnPromptEnded(false);
        end);
    end;
end;
CreatePromptFromOptions = function(v124) --[[ Line: 490 ]] --[[ Name: CreatePromptFromOptions ]]
    -- upvalues: v77 (copy), v14 (ref), v13 (copy), v16 (copy)
    v77:ClearAllChildren();
    if v14 or v13 then
        CreatePromptVRorConsole(v124);
        return;
    elseif v16 then
        CreatePromptPhone(v124);
        return;
    else
        CreatePromptPCorTablet(v124);
        return;
    end;
end;
SetSelectedObject = function() --[[ Line: 502 ]] --[[ Name: SetSelectedObject ]]
    -- upvalues: v77 (copy), l_GuiService_0 (copy)
    local l_CancelButton_0 = v77:FindFirstChild("CancelButton");
    if l_CancelButton_0 then
        l_GuiService_0.SelectedCoreObject = l_CancelButton_0;
        return;
    else
        local l_ConfirmButton_0 = v77:FindFirstChild("ConfirmButton");
        if l_ConfirmButton_0 then
            l_GuiService_0.SelectedCoreObject = l_ConfirmButton_0;
        end;
        return;
    end;
end;
OnTweenInFinished = function() --[[ Line: 514 ]] --[[ Name: OnTweenInFinished ]]
    -- upvalues: v19 (ref), v13 (copy)
    if v19 or v13 then
        SetSelectedObject();
    end;
end;
ShowPrompt = function() --[[ Line: 520 ]] --[[ Name: ShowPrompt ]]
    -- upvalues: v76 (copy), v13 (copy), l_UserInputService_0 (copy), v14 (ref), v28 (ref), v12 (ref), l_game_EngineFeature_0 (copy)
    v76.Visible = true;
    if v13 then
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
    end;
    if v14 then
        v76.Position = v28;
        v12:SetContent(v76);
        v12:Show(true);
        DisableControllerMovement();
        return;
    else
        if l_game_EngineFeature_0 then
            v76:TweenPositionInternal(v28, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, OnTweenInFinished);
        else
            v76:TweenPosition(v28, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, OnTweenInFinished);
        end;
        DisableControllerMovement();
        EnableControllerInput();
        return;
    end;
end;
HidePrompt = function() --[[ Line: 541 ]] --[[ Name: HidePrompt ]]
    -- upvalues: v76 (copy), v18 (ref), l_GuiService_0 (copy), v20 (ref), v21 (ref), v22 (ref), v13 (copy), l_UserInputService_0 (copy), v14 (ref), v27 (ref), v12 (ref), l_game_EngineFeature_0 (copy)
    local function v127() --[[ Line: 542 ]] --[[ Name: onClosed ]]
        -- upvalues: v76 (ref), v18 (ref), l_GuiService_0 (ref), v20 (ref), v21 (ref), v22 (ref), v13 (ref), l_UserInputService_0 (ref)
        v76.Visible = false;
        v18 = false;
        l_GuiService_0.CoreGuiNavigationEnabled = v20;
        l_GuiService_0.GuiNavigationEnabled = v21;
        l_GuiService_0.AutoSelectGuiEnabled = v22;
        l_GuiService_0.SelectedCoreObject = nil;
        if v13 then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
        end;
    end;
    if v14 then
        v76.Position = v27;
        v12:Close();
        v76.Visible = false;
        v18 = false;
        l_GuiService_0.CoreGuiNavigationEnabled = v20;
        l_GuiService_0.GuiNavigationEnabled = v21;
        l_GuiService_0.AutoSelectGuiEnabled = v22;
        l_GuiService_0.SelectedCoreObject = nil;
        if v13 then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            return;
        end;
    elseif l_game_EngineFeature_0 then
        v76:TweenPositionInternal(v27, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, v127);
        return;
    else
        v76:TweenPosition(v27, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, v127);
    end;
end;
DoCreatePrompt = function(v128) --[[ Line: 566 ]] --[[ Name: DoCreatePrompt ]]
    -- upvalues: v24 (ref), v23 (copy), v25 (ref)
    v24 = v128.PromptCompletedCallback;
    AddDefaultsToPromptOptions(v128, v23);
    v25 = v128;
    CreatePromptFromOptions(v128);
    ShowPrompt();
end;
OnPromptEnded = function(v129) --[[ Line: 574 ]] --[[ Name: OnPromptEnded ]]
    -- upvalues: v24 (ref), v25 (ref)
    if v24 then
        if v25.CancelActive then
            spawn(function() --[[ Line: 577 ]]
                -- upvalues: v24 (ref), v129 (copy)
                v24(v129);
            end);
        else
            spawn(function() --[[ Line: 579 ]]
                -- upvalues: v24 (ref)
                v24(true);
            end);
        end;
    end;
    HidePrompt();
    EnableControllerMovement();
    DisableControllerInput();
end;
NoOpFunc = function() --[[ Line: 589 ]] --[[ Name: NoOpFunc ]]

end;
EnableControllerMovement = function() --[[ Line: 591 ]] --[[ Name: EnableControllerMovement ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("doNothingThumbstick2PromptCreator");
    l_ContextActionService_0:UnbindCoreAction("doNothingAButtonPromptCreator");
end;
DisableControllerMovement = function() --[[ Line: 596 ]] --[[ Name: DisableControllerMovement ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:BindCoreAction("doNothingThumbstick2PromptCreator", NoOpFunc, false, Enum.KeyCode.Thumbstick2);
    l_ContextActionService_0:BindCoreAction("doNothingAButtonPromptCreator", NoOpFunc, false, Enum.KeyCode.ButtonA);
end;
EnableControllerInput = function() --[[ Line: 601 ]] --[[ Name: EnableControllerInput ]]
    -- upvalues: l_ContextActionService_0 (copy), v25 (ref), l_GuiService_0 (copy)
    l_ContextActionService_0:BindCoreAction("CoreScriptPromptCreatorCancel", function(_, v131, _) --[[ Line: 605 ]]
        -- upvalues: v25 (ref)
        if v131 ~= Enum.UserInputState.Begin then
            return;
        else
            if v25.CancelActive then
                OnPromptEnded(false);
            end;
            return;
        end;
    end, false, Enum.KeyCode.ButtonB);
    l_ContextActionService_0:BindCoreAction("CoreScriptPromptCreatorSelect", function(_, v134, _) --[[ Line: 618 ]]
        -- upvalues: l_GuiService_0 (ref)
        if v134 ~= Enum.UserInputState.Begin then
            return;
        else
            if l_GuiService_0.SelectedCoreObject == nil then
                SetSelectedObject();
            end;
            return;
        end;
    end, false, Enum.KeyCode.ButtonSelect);
end;
DisableControllerInput = function() --[[ Line: 630 ]] --[[ Name: DisableControllerInput ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("CoreScriptPromptCreatorCancel");
    l_ContextActionService_0:UnbindCoreAction("CoreScriptPromptCreatorSelect");
end;
valueInTable = function(v136, v137) --[[ Line: 635 ]] --[[ Name: valueInTable ]]
    for _, v139 in pairs(v137) do
        if v139 == v136 then
            return true;
        end;
    end;
    return false;
end;
OnInputChanged = function(v140) --[[ Line: 644 ]] --[[ Name: OnInputChanged ]]
    -- upvalues: v14 (ref), v19 (ref)
    local l_UserInputType_0 = v140.UserInputType;
    local l_UserInputType_1 = Enum.UserInputType;
    if not v14 and valueInTable(l_UserInputType_0, {
        l_UserInputType_1.Gamepad1, 
        l_UserInputType_1.Gamepad2, 
        l_UserInputType_1.Gamepad3, 
        l_UserInputType_1.Gamepad4
    }) then
        if v140.KeyCode == Enum.KeyCode.Thumbstick1 or v140.KeyCode == Enum.KeyCode.Thumbstick2 then
            if math.abs(v140.Position.X) > 0.1 or math.abs(v140.Position.Z) > 0.1 or math.abs(v140.Position.Y) > 0.1 then
                v19 = true;
                return;
            end;
        else
            v19 = true;
            return;
        end;
    else
        v19 = false;
    end;
end;
l_UserInputService_0.InputChanged:connect(OnInputChanged);
l_UserInputService_0.InputBegan:connect(OnInputChanged);
OnVREnabled = function(v143) --[[ Line: 663 ]] --[[ Name: OnVREnabled ]]
    -- upvalues: v12 (ref), l_Dialog_0 (copy), v76 (copy), v14 (ref), l_RobloxGui_0 (copy)
    if v143 then
        if not v12 then
            v12 = l_Dialog_0.new();
        end;
        v12:SetContent(v76);
        v14 = true;
        return;
    else
        v14 = false;
        if v12 then
            v12:SetContent(nil);
        end;
        v76.Parent = l_RobloxGui_0;
        return;
    end;
end;
spawn(function() --[[ Line: 679 ]]
    -- upvalues: l_UserInputService_0 (copy)
    OnVREnabled(l_UserInputService_0.VREnabled);
end);
l_UserInputService_0.Changed:connect(function(v144) --[[ Line: 683 ]]
    -- upvalues: l_UserInputService_0 (copy)
    if v144 == "VREnabled" then
        OnVREnabled(l_UserInputService_0.VREnabled);
    end;
end);
l_GuiService_0.Changed:connect(function(v145) --[[ Line: 689 ]]
    -- upvalues: v18 (ref), l_GuiService_0 (copy), v20 (ref), v21 (ref), v22 (ref)
    if v18 then
        if v145 == "CoreGuiNavigationEnabled" then
            if l_GuiService_0.CoreGuiNavigationEnabled ~= true then
                v20 = l_GuiService_0.CoreGuiNavigationEnabled;
                l_GuiService_0.CoreGuiNavigationEnabled = true;
                return;
            end;
        elseif v145 == "GuiNavigationEnabled" then
            if l_GuiService_0.GuiNavigationEnabled ~= false then
                v21 = l_GuiService_0.GuiNavigationEnabled;
                l_GuiService_0.GuiNavigationEnabled = false;
                return;
            end;
        elseif v145 == "AutoSelectGuiEnabled" and l_GuiService_0.AutoSelectGuiEnabled ~= false then
            v22 = l_GuiService_0.AutoSelectGuiEnabled;
            l_GuiService_0.AutoSelectGuiEnabled = false;
        end;
    end;
end);
SetupGamepadSelection = function() --[[ Line: 710 ]] --[[ Name: SetupGamepadSelection ]]
    -- upvalues: v20 (ref), l_GuiService_0 (copy), v21 (ref), v22 (ref)
    v20 = l_GuiService_0.CoreGuiNavigationEnabled;
    v21 = l_GuiService_0.GuiNavigationEnabled;
    v22 = l_GuiService_0.AutoSelectGuiEnabled;
    l_GuiService_0.SelectedCoreObject = nil;
    l_GuiService_0.CoreGuiNavigationEnabled = true;
    l_GuiService_0.GuiNavigationEnabled = false;
    l_GuiService_0.AutoSelectGuiEnabled = false;
end;
v0.CreatePrompt = function(_, v147) --[[ Line: 722 ]] --[[ Name: CreatePrompt ]]
    -- upvalues: v18 (ref)
    if v18 then
        return false;
    else
        v18 = true;
        SetupGamepadSelection();
        DoCreatePrompt(v147);
        return true;
    end;
end;
v0.IsCurrentlyPrompting = function(_) --[[ Line: 732 ]] --[[ Name: IsCurrentlyPrompting ]]
    -- upvalues: v18 (ref)
    return v18;
end;
return v0;