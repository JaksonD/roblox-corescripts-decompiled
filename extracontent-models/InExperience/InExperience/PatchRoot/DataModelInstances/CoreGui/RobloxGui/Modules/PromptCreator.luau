local v0 = {};
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_TenFootInterface_0 = require(l_Modules_0:WaitForChild("TenFootInterface"));
local l_VR_0 = l_Modules_0:WaitForChild("VR");
local l_Dialog_0 = require(l_VR_0:WaitForChild("Dialog"));
local v11 = nil;
getViewportSize = function() --[[ Line: 28 ]] --[[ Name: getViewportSize ]]
    while not game.Workspace.CurrentCamera do
        game.Workspace.Changed:Wait();
    end;
    assert(game.Workspace.CurrentCamera, "");
    while game.Workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or game.Workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) do
        game.Workspace.CurrentCamera.Changed:Wait();
    end;
    return game.Workspace.CurrentCamera.ViewportSize;
end;
local v12 = l_TenFootInterface_0:IsEnabled();
local v13 = false;
local v14 = false;
if l_UserInputService_0.TouchEnabled == true then
    v14 = l_UserInputService_0.MouseEnabled == false;
end;
local v15 = v14 and getViewportSize().Y <= 370;
local v16 = v14 and not v15;
local v17 = false;
local v18 = false;
local v19 = false;
local v20 = false;
local v21 = false;
local v22 = {
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
local v23 = nil;
local v24 = nil;
local v25 = UDim2.new(0, 438, 0, 300);
local v26 = UDim2.new(0.5, -219, 0, -300);
local v27 = UDim2.new(0.5, -219, 0.5, -150);
if v12 or v13 then
    v25 = UDim2.new(1, 0, 0, 690);
    v26 = UDim2.new(0, 0, 0, -690);
    v27 = UDim2.new(0, 0, 0.5, -345);
elseif v15 then
    v25 = UDim2.new(0.9, 0, 0.9, 0);
    v26 = UDim2.new(0.05, 0, -0.9, 0);
    v27 = UDim2.new(0.05, 0, 0.05, 0);
elseif v16 then
    v25 = UDim2.new(0, 400, 0, 305);
    v26 = UDim2.new(0.5, -200, 0, -305);
    v27 = UDim2.new(0.5, -200, 0.5, -152);
end;
local v28 = 52;
if v15 then
    v28 = 44;
end;
local v29 = 24;
if v12 or v13 then
    v29 = 42;
end;
local function v36(v30, v31, v32, v33, v34) --[[ Line: 119 ]] --[[ Name: createFrame ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = v30;
    l_Frame_0.Size = v31;
    l_Frame_0.Position = v32 or UDim2.new(0, 0, 0, 0);
    l_Frame_0.BackgroundTransparency = v33;
    l_Frame_0.BackgroundColor3 = v34 or Color3.new();
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.ZIndex = 8;
    return l_Frame_0;
end;
local function v44(v37, v38, v39, v40, v41, v42) --[[ Line: 132 ]] --[[ Name: createTextLabel ]]
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = v37;
    l_TextLabel_0.Size = v38 or UDim2.new(0, 0, 0, 0);
    l_TextLabel_0.Position = v39;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Font = v40;
    l_TextLabel_0.TextSize = v41;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.Text = v42;
    l_TextLabel_0.ZIndex = 8;
    return l_TextLabel_0;
end;
local function v57(v45, v46, v47, v48, v49, v50, v51) --[[ Line: 147 ]] --[[ Name: createScrollingTextLabel ]]
    -- upvalues: v44 (copy), l_TextService_0 (copy)
    local v52 = v44(v45, v46, v47, v48, v49, v50);
    v52.TextXAlignment = Enum.TextXAlignment.Left;
    v52.TextYAlignment = Enum.TextYAlignment.Top;
    v52.TextWrapped = true;
    if l_TextService_0:GetTextSize(v50, v49, v48, Vector2.new(v46.X.Offset, 10000)).Y > v46.Y.Offset then
        local v53 = Vector2.new(v46.X.Offset - (v51 + 20), 10000);
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v50, v49, v48, v53);
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Name = "ScrollingTextParent";
        l_Frame_1.BackgroundTransparency = 1;
        l_Frame_1.BackgroundColor3 = Color3.new(1, 1, 1);
        l_Frame_1.BorderSizePixel = 0;
        l_Frame_1.Position = v47;
        l_Frame_1.Size = v46 - UDim2.new(0, v51 * 2, 0, 0);
        local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
        l_ScrollingFrame_0.Selectable = true;
        l_ScrollingFrame_0.Name = "ScrollingFrame";
        l_ScrollingFrame_0.BackgroundTransparency = 1;
        l_ScrollingFrame_0.BackgroundColor3 = Color3.new(1, 1, 1);
        l_ScrollingFrame_0.BorderSizePixel = 0;
        l_ScrollingFrame_0.Position = UDim2.new(0, 0, 0, 0);
        l_ScrollingFrame_0.Size = v46;
        l_ScrollingFrame_0.CanvasSize = UDim2.new(0, v53.X - v51 * 2, 0, l_l_TextService_0_TextSize_0.Y);
        l_ScrollingFrame_0.ScrollBarThickness = v51;
        l_ScrollingFrame_0.SelectionImageObject = Instance.new("ImageLabel");
        l_ScrollingFrame_0.SelectionImageObject.Name = "EmptySelectionImage";
        l_ScrollingFrame_0.SelectionImageObject.BackgroundTransparency = 1;
        l_ScrollingFrame_0.SelectionImageObject.Image = "";
        l_ScrollingFrame_0.Active = false;
        l_ScrollingFrame_0.SelectionGained:connect(function() --[[ Line: 183 ]]
            -- upvalues: l_Frame_1 (copy)
            l_Frame_1.BackgroundTransparency = 0.15;
        end);
        l_ScrollingFrame_0.SelectionLost:connect(function() --[[ Line: 187 ]]
            -- upvalues: l_Frame_1 (copy)
            l_Frame_1.BackgroundTransparency = 1;
        end);
        v52.Position = UDim2.new(0, 10, 0, 0);
        v52.Size = UDim2.new(0, v53.X, 0, l_l_TextService_0_TextSize_0.Y);
        v52.Parent = l_ScrollingFrame_0;
        l_ScrollingFrame_0.Parent = l_Frame_1;
        return l_Frame_1;
    else
        return v52;
    end;
end;
local function _(v58, v59, v60, v61, v62) --[[ Line: 204 ]] --[[ Name: createImageLabel ]]
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = v58;
    l_ImageLabel_0.Size = v59;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Position = v60;
    l_ImageLabel_0.Image = v61;
    if v62 then
        v62(l_ImageLabel_0);
    end;
    return l_ImageLabel_0;
end;
local function v74(v65, v66, v67, v68, v69, v70, v71) --[[ Line: 219 ]] --[[ Name: createImageButtonWithText ]]
    -- upvalues: v44 (copy), v29 (ref)
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = v65;
    l_ImageButton_0.Size = v66;
    l_ImageButton_0.Position = v67;
    l_ImageButton_0.Image = v68;
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.AutoButtonColor = false;
    l_ImageButton_0.ZIndex = 8;
    l_ImageButton_0.Modal = true;
    l_ImageButton_0.Selectable = true;
    l_ImageButton_0.SelectionImageObject = Instance.new("ImageLabel");
    l_ImageButton_0.SelectionImageObject.Name = "EmptySelectionImage";
    l_ImageButton_0.SelectionImageObject.BackgroundTransparency = 1;
    l_ImageButton_0.SelectionImageObject.Image = "";
    local v73 = v44(v65 .. "Text", UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), v71, v29, v70);
    v73.ZIndex = 9;
    v73.Parent = l_ImageButton_0;
    l_ImageButton_0.MouseEnter:connect(function() --[[ Line: 239 ]]
        -- upvalues: l_ImageButton_0 (copy), v69 (copy)
        l_ImageButton_0.Image = v69;
    end);
    l_ImageButton_0.MouseLeave:connect(function() --[[ Line: 242 ]]
        -- upvalues: l_ImageButton_0 (copy), v68 (copy)
        l_ImageButton_0.Image = v68;
    end);
    l_ImageButton_0.MouseButton1Click:connect(function() --[[ Line: 245 ]]
        -- upvalues: l_ImageButton_0 (copy), v68 (copy)
        l_ImageButton_0.Image = v68;
    end);
    l_ImageButton_0.SelectionGained:connect(function() --[[ Line: 248 ]]
        -- upvalues: l_ImageButton_0 (copy), v69 (copy)
        l_ImageButton_0.Image = v69;
    end);
    l_ImageButton_0.SelectionLost:connect(function() --[[ Line: 251 ]]
        -- upvalues: l_ImageButton_0 (copy), v68 (copy)
        l_ImageButton_0.Image = v68;
    end);
    return l_ImageButton_0;
end;
local v75 = v36("PromptDialog", v25, v26, 1, nil);
v75.Visible = false;
v75.Parent = l_RobloxGui_0;
v75.Active = true;
local v76 = v36("ContainerFrame", UDim2.new(1, 0, 1, 0), nil, 0.36, Color3.new(0, 0, 0));
v76.ZIndex = 8;
v76.Parent = v75;
AddDefaultsToPromptOptions = function(v77, v78) --[[ Line: 268 ]] --[[ Name: AddDefaultsToPromptOptions ]]
    for v79, v80 in pairs(v78) do
        if v77[v79] == nil then
            v77[v79] = v80;
        end;
    end;
end;
CreatePromptVRorConsole = function(v81) --[[ Line: 277 ]] --[[ Name: CreatePromptVRorConsole ]]
    -- upvalues: v76 (copy), v44 (copy), v36 (copy), v57 (copy), v74 (copy)
    local v82 = 90;
    if v81.ImageConsoleVR then
        local v83 = UDim2.new(0, 600, 0, 600);
        local v84 = UDim2.new(0, 100, 0, 45);
        local l_ImageConsoleVR_0 = v81.ImageConsoleVR;
        local l_FetchImageFunctionConsoleVR_0 = v81.FetchImageFunctionConsoleVR;
        local l_ImageLabel_1 = Instance.new("ImageLabel");
        l_ImageLabel_1.Name = "Image";
        l_ImageLabel_1.Size = v83;
        l_ImageLabel_1.BackgroundTransparency = 1;
        l_ImageLabel_1.Position = v84;
        l_ImageLabel_1.Image = l_ImageConsoleVR_0;
        if l_FetchImageFunctionConsoleVR_0 then
            l_FetchImageFunctionConsoleVR_0(l_ImageLabel_1);
        end;
        local l_l_ImageLabel_1_0 = l_ImageLabel_1;
        l_l_ImageLabel_1_0.ZIndex = 9;
        l_l_ImageLabel_1_0.Parent = v76;
        v82 = 800;
    end;
    local v89 = v44("WindowTitle", UDim2.new(0, 800, 0, 60), UDim2.new(0, v82, 0, 60), Enum.Font.SourceSansBold, 48, v81.WindowTitle);
    v89.TextXAlignment = Enum.TextXAlignment.Left;
    v89.TextYAlignment = Enum.TextYAlignment.Center;
    v89.Parent = v76;
    v89.ZIndex = 9;
    local v90 = v36("ColorStripe", UDim2.new(0, 832, 0, 4), UDim2.new(0, v82, 0, 120), 0, v81.StripeColor);
    v90.ZIndex = 9;
    v90.Parent = v76;
    v57("MainText", UDim2.new(0, 800, 0, 450), UDim2.new(0, v82, 0, 152), Enum.Font.SourceSansBold, 44, v81.MainText, 16).Parent = v76;
    local v91 = Rect.new(8, 8, 56, 56);
    local l_Slice_0 = Enum.ScaleType.Slice;
    local v93 = v74("ConfirmButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, v82, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v81.ConfirmationText, Enum.Font.SourceSans);
    v93.Parent = v76;
    v93.ScaleType = l_Slice_0;
    v93.SliceCenter = v91;
    v93.MouseButton1Click:connect(function() --[[ Line: 314 ]]
        OnPromptEnded(true);
    end);
    if v81.CancelActive then
        local v94 = v74("CancelButton", UDim2.new(0, 320, 0, 80), UDim2.new(0, v82 + 340, 1, -125), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v81.CancelText, Enum.Font.SourceSans);
        v94.Parent = v76;
        v94.ScaleType = l_Slice_0;
        v94.SliceCenter = v91;
        v94.MouseButton1Click:connect(function() --[[ Line: 326 ]]
            OnPromptEnded(false);
        end);
    end;
end;
CreatePromptPCorTablet = function(v95) --[[ Line: 332 ]] --[[ Name: CreatePromptPCorTablet ]]
    -- upvalues: v44 (copy), v28 (ref), v76 (copy), v36 (copy), v16 (copy), v57 (copy), v74 (copy)
    local v96 = v44("WindowTitle", UDim2.new(1, 0, 0, v28), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, v95.WindowTitle);
    v96.Parent = v76;
    v96.ZIndex = 9;
    local v97 = v36("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, v95.StripeColor);
    v97.Position = UDim2.new(0, 0, 0, v28);
    v97.ZIndex = 9;
    v97.Parent = v76;
    local v98 = nil;
    local v99 = nil;
    if v95.Image then
        local v100 = UDim2.new(0, 150, 0, 150);
        local v101 = UDim2.new(0, 15, 0, v28 + 17);
        local l_Image_0 = v95.Image;
        local l_FetchImageFunction_0 = v95.FetchImageFunction;
        local l_ImageLabel_2 = Instance.new("ImageLabel");
        l_ImageLabel_2.Name = "Image";
        l_ImageLabel_2.Size = v100;
        l_ImageLabel_2.BackgroundTransparency = 1;
        l_ImageLabel_2.Position = v101;
        l_ImageLabel_2.Image = l_Image_0;
        if l_FetchImageFunction_0 then
            l_FetchImageFunction_0(l_ImageLabel_2);
        end;
        v99 = l_ImageLabel_2;
        v99.ZIndex = 9;
        v99.Parent = v76;
        v98 = if v16 then v57("MainText", UDim2.new(0, 195, 0, 150), UDim2.new(0, 185, 0, v28 + 17), Enum.Font.SourceSansBold, 22, v95.MainText, 8) else v57("MainText", UDim2.new(0, 233, 0, 150), UDim2.new(0, 185, 0, v28 + 17), Enum.Font.SourceSansBold, 22, v95.MainText, 8);
    else
        v98 = if v16 then v57("MainText", UDim2.new(0, 360, 0, 150), UDim2.new(0, 20, 0, v28 + 17), Enum.Font.SourceSansBold, 22, v95.MainText, 8) else v57("MainText", UDim2.new(0, 398, 0, 150), UDim2.new(0, 20, 0, v28 + 17), Enum.Font.SourceSansBold, 22, v95.MainText, 8);
    end;
    v98.Parent = v76;
    local v105 = Rect.new(8, 8, 56, 56);
    local l_Slice_1 = Enum.ScaleType.Slice;
    local v107 = nil;
    v107 = if v16 then if v95.CancelActive then v74("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v95.ConfirmationText, Enum.Font.SourceSansBold) else v74("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v95.ConfirmationText, Enum.Font.SourceSans) else if v95.CancelActive then v74("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -138, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v95.ConfirmationText, Enum.Font.SourceSansBold) else v74("ConfirmButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, -64, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v95.ConfirmationText, Enum.Font.SourceSans);
    v107.Parent = v76;
    v107.ScaleType = l_Slice_1;
    v107.SliceCenter = v105;
    v107.MouseButton1Click:connect(function() --[[ Line: 398 ]]
        OnPromptEnded(true);
    end);
    if v95.CancelActive then
        local v108 = nil;
        v108 = if v16 then v74("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v95.CancelText, Enum.Font.SourceSans) else v74("CancelButton", UDim2.new(0, 128, 0, 38), UDim2.new(0.5, 10, 1, -53), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v95.CancelText, Enum.Font.SourceSans);
        v108.Parent = v76;
        v108.ScaleType = l_Slice_1;
        v108.SliceCenter = v105;
        v108.MouseButton1Click:connect(function() --[[ Line: 416 ]]
            OnPromptEnded(false);
        end);
        v108.NextSelectionLeft = v107;
        v107.NextSelectionRight = v108;
    end;
end;
CreatePromptPhone = function(v109) --[[ Line: 425 ]] --[[ Name: CreatePromptPhone ]]
    -- upvalues: v44 (copy), v28 (ref), v76 (copy), v36 (copy), v57 (copy), v74 (copy)
    local v110 = v44("WindowTitle", UDim2.new(1, 0, 0, v28), UDim2.new(0, 0, 0, 0), Enum.Font.SourceSansBold, 24, v109.WindowTitle);
    v110.Parent = v76;
    v110.ZIndex = 9;
    local v111 = v36("ColorStripe", UDim2.new(1, 0, 0, 2), nil, 0, v109.StripeColor);
    v111.Position = UDim2.new(0, 0, 0, v28);
    v111.ZIndex = 9;
    v111.Parent = v76;
    local v112 = nil;
    local v113 = nil;
    if v109.Image then
        local v114 = UDim2.new(0, 120, 0, 120);
        local v115 = UDim2.new(0, 15, 0, v28 + 17);
        local l_Image_1 = v109.Image;
        local l_FetchImageFunction_1 = v109.FetchImageFunction;
        local l_ImageLabel_3 = Instance.new("ImageLabel");
        l_ImageLabel_3.Name = "Image";
        l_ImageLabel_3.Size = v114;
        l_ImageLabel_3.BackgroundTransparency = 1;
        l_ImageLabel_3.Position = v115;
        l_ImageLabel_3.Image = l_Image_1;
        if l_FetchImageFunction_1 then
            l_FetchImageFunction_1(l_ImageLabel_3);
        end;
        v113 = l_ImageLabel_3;
        v113.ZIndex = 9;
        v113.Parent = v76;
        v112 = v57("MainText", UDim2.new(0, v76.AbsoluteSize.X - 175, 0, 120), UDim2.new(0, 155, 0, v28 + 17), Enum.Font.SourceSansBold, 20, v109.MainText, 8);
    else
        v112 = v57("MainText", UDim2.new(1, v76.AbsoluteSize.X - 40, 0, 120), UDim2.new(0, 20, 0, v28 + 17), Enum.Font.SourceSansBold, 20, v109.MainText, 8);
    end;
    v112.Parent = v76;
    local v119 = Rect.new(8, 8, 56, 56);
    local l_Slice_2 = Enum.ScaleType.Slice;
    local v121 = nil;
    v121 = if v109.CancelActive then v74("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -138, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v109.ConfirmationText, Enum.Font.SourceSansBold) else v74("ConfirmButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, -64, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v109.ConfirmationText, Enum.Font.SourceSans);
    v121.Parent = v76;
    v121.ScaleType = l_Slice_2;
    v121.SliceCenter = v119;
    v121.MouseButton1Click:connect(function() --[[ Line: 471 ]]
        OnPromptEnded(true);
    end);
    if v109.CancelActive then
        local v122 = v74("CancelButton", UDim2.new(0, 128, 0, 44), UDim2.new(0.5, 10, 1, -59), "rbxasset://textures/ui/VR/button.png", "rbxasset://textures/ui/VR/buttonSelected.png", v109.CancelText, Enum.Font.SourceSans);
        v122.Parent = v76;
        v122.ScaleType = l_Slice_2;
        v122.SliceCenter = v119;
        v122.MouseButton1Click:connect(function() --[[ Line: 482 ]]
            OnPromptEnded(false);
        end);
    end;
end;
CreatePromptFromOptions = function(v123) --[[ Line: 488 ]] --[[ Name: CreatePromptFromOptions ]]
    -- upvalues: v76 (copy), v13 (ref), v12 (copy), v15 (copy)
    v76:ClearAllChildren();
    if v13 or v12 then
        CreatePromptVRorConsole(v123);
        return;
    elseif v15 then
        CreatePromptPhone(v123);
        return;
    else
        CreatePromptPCorTablet(v123);
        return;
    end;
end;
SetSelectedObject = function() --[[ Line: 500 ]] --[[ Name: SetSelectedObject ]]
    -- upvalues: v76 (copy), l_GuiService_0 (copy)
    local l_CancelButton_0 = v76:FindFirstChild("CancelButton");
    if l_CancelButton_0 then
        l_GuiService_0.SelectedCoreObject = l_CancelButton_0;
        return;
    else
        local l_ConfirmButton_0 = v76:FindFirstChild("ConfirmButton");
        if l_ConfirmButton_0 then
            l_GuiService_0.SelectedCoreObject = l_ConfirmButton_0;
        end;
        return;
    end;
end;
OnTweenInFinished = function() --[[ Line: 512 ]] --[[ Name: OnTweenInFinished ]]
    -- upvalues: v18 (ref), v12 (copy)
    if v18 or v12 then
        SetSelectedObject();
    end;
end;
ShowPrompt = function() --[[ Line: 518 ]] --[[ Name: ShowPrompt ]]
    -- upvalues: v75 (copy), v12 (copy), l_UserInputService_0 (copy), v13 (ref), v27 (ref), v11 (ref)
    v75.Visible = true;
    if v12 then
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
    end;
    if v13 then
        v75.Position = v27;
        v11:SetContent(v75);
        v11:Show(true);
        DisableControllerMovement();
        return;
    else
        v75:TweenPosition(v27, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, OnTweenInFinished);
        DisableControllerMovement();
        EnableControllerInput();
        return;
    end;
end;
HidePrompt = function() --[[ Line: 535 ]] --[[ Name: HidePrompt ]]
    -- upvalues: v75 (copy), v17 (ref), l_GuiService_0 (copy), v19 (ref), v20 (ref), v21 (ref), v12 (copy), l_UserInputService_0 (copy), v13 (ref), v26 (ref), v11 (ref)
    local function v126() --[[ Line: 536 ]] --[[ Name: onClosed ]]
        -- upvalues: v75 (ref), v17 (ref), l_GuiService_0 (ref), v19 (ref), v20 (ref), v21 (ref), v12 (ref), l_UserInputService_0 (ref)
        v75.Visible = false;
        v17 = false;
        l_GuiService_0.CoreGuiNavigationEnabled = v19;
        l_GuiService_0.GuiNavigationEnabled = v20;
        l_GuiService_0.AutoSelectGuiEnabled = v21;
        l_GuiService_0.SelectedCoreObject = nil;
        if v12 then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
        end;
    end;
    if v13 then
        v75.Position = v26;
        v11:Close();
        v75.Visible = false;
        v17 = false;
        l_GuiService_0.CoreGuiNavigationEnabled = v19;
        l_GuiService_0.GuiNavigationEnabled = v20;
        l_GuiService_0.AutoSelectGuiEnabled = v21;
        l_GuiService_0.SelectedCoreObject = nil;
        if v12 then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            return;
        end;
    else
        v75:TweenPosition(v26, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.3, true, v126);
    end;
end;
DoCreatePrompt = function(v127) --[[ Line: 556 ]] --[[ Name: DoCreatePrompt ]]
    -- upvalues: v23 (ref), v22 (copy), v24 (ref)
    v23 = v127.PromptCompletedCallback;
    AddDefaultsToPromptOptions(v127, v22);
    v24 = v127;
    CreatePromptFromOptions(v127);
    ShowPrompt();
end;
OnPromptEnded = function(v128) --[[ Line: 564 ]] --[[ Name: OnPromptEnded ]]
    -- upvalues: v23 (ref), v24 (ref)
    if v23 then
        if v24.CancelActive then
            spawn(function() --[[ Line: 567 ]]
                -- upvalues: v23 (ref), v128 (copy)
                v23(v128);
            end);
        else
            spawn(function() --[[ Line: 569 ]]
                -- upvalues: v23 (ref)
                v23(true);
            end);
        end;
    end;
    HidePrompt();
    EnableControllerMovement();
    DisableControllerInput();
end;
NoOpFunc = function() --[[ Line: 579 ]] --[[ Name: NoOpFunc ]]

end;
EnableControllerMovement = function() --[[ Line: 581 ]] --[[ Name: EnableControllerMovement ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("doNothingThumbstick2PromptCreator");
    l_ContextActionService_0:UnbindCoreAction("doNothingAButtonPromptCreator");
end;
DisableControllerMovement = function() --[[ Line: 586 ]] --[[ Name: DisableControllerMovement ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:BindCoreAction("doNothingThumbstick2PromptCreator", NoOpFunc, false, Enum.KeyCode.Thumbstick2);
    l_ContextActionService_0:BindCoreAction("doNothingAButtonPromptCreator", NoOpFunc, false, Enum.KeyCode.ButtonA);
end;
EnableControllerInput = function() --[[ Line: 591 ]] --[[ Name: EnableControllerInput ]]
    -- upvalues: l_ContextActionService_0 (copy), v24 (ref), l_GuiService_0 (copy)
    l_ContextActionService_0:BindCoreAction("CoreScriptPromptCreatorCancel", function(_, v130, _) --[[ Line: 595 ]]
        -- upvalues: v24 (ref)
        if v130 ~= Enum.UserInputState.Begin then
            return;
        else
            if v24.CancelActive then
                OnPromptEnded(false);
            end;
            return;
        end;
    end, false, Enum.KeyCode.ButtonB);
    l_ContextActionService_0:BindCoreAction("CoreScriptPromptCreatorSelect", function(_, v133, _) --[[ Line: 608 ]]
        -- upvalues: l_GuiService_0 (ref)
        if v133 ~= Enum.UserInputState.Begin then
            return;
        else
            if l_GuiService_0.SelectedCoreObject == nil then
                SetSelectedObject();
            end;
            return;
        end;
    end, false, Enum.KeyCode.ButtonSelect);
end;
DisableControllerInput = function() --[[ Line: 620 ]] --[[ Name: DisableControllerInput ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("CoreScriptPromptCreatorCancel");
    l_ContextActionService_0:UnbindCoreAction("CoreScriptPromptCreatorSelect");
end;
valueInTable = function(v135, v136) --[[ Line: 625 ]] --[[ Name: valueInTable ]]
    for _, v138 in pairs(v136) do
        if v138 == v135 then
            return true;
        end;
    end;
    return false;
end;
OnInputChanged = function(v139) --[[ Line: 634 ]] --[[ Name: OnInputChanged ]]
    -- upvalues: v13 (ref), v18 (ref)
    local l_UserInputType_0 = v139.UserInputType;
    local l_UserInputType_1 = Enum.UserInputType;
    if not v13 and valueInTable(l_UserInputType_0, {
        l_UserInputType_1.Gamepad1, 
        l_UserInputType_1.Gamepad2, 
        l_UserInputType_1.Gamepad3, 
        l_UserInputType_1.Gamepad4
    }) then
        if v139.KeyCode == Enum.KeyCode.Thumbstick1 or v139.KeyCode == Enum.KeyCode.Thumbstick2 then
            if math.abs(v139.Position.X) > 0.1 or math.abs(v139.Position.Z) > 0.1 or math.abs(v139.Position.Y) > 0.1 then
                v18 = true;
                return;
            end;
        else
            v18 = true;
            return;
        end;
    else
        v18 = false;
    end;
end;
l_UserInputService_0.InputChanged:connect(OnInputChanged);
l_UserInputService_0.InputBegan:connect(OnInputChanged);
OnVREnabled = function(v142) --[[ Line: 653 ]] --[[ Name: OnVREnabled ]]
    -- upvalues: v11 (ref), l_Dialog_0 (copy), v75 (copy), v13 (ref), l_RobloxGui_0 (copy)
    if v142 then
        if not v11 then
            v11 = l_Dialog_0.new();
        end;
        v11:SetContent(v75);
        v13 = true;
        return;
    else
        v13 = false;
        if v11 then
            v11:SetContent(nil);
        end;
        v75.Parent = l_RobloxGui_0;
        return;
    end;
end;
spawn(function() --[[ Line: 669 ]]
    -- upvalues: l_UserInputService_0 (copy)
    OnVREnabled(l_UserInputService_0.VREnabled);
end);
l_UserInputService_0.Changed:connect(function(v143) --[[ Line: 673 ]]
    -- upvalues: l_UserInputService_0 (copy)
    if v143 == "VREnabled" then
        OnVREnabled(l_UserInputService_0.VREnabled);
    end;
end);
l_GuiService_0.Changed:connect(function(v144) --[[ Line: 679 ]]
    -- upvalues: v17 (ref), l_GuiService_0 (copy), v19 (ref), v20 (ref), v21 (ref)
    if v17 then
        if v144 == "CoreGuiNavigationEnabled" then
            if l_GuiService_0.CoreGuiNavigationEnabled ~= true then
                v19 = l_GuiService_0.CoreGuiNavigationEnabled;
                l_GuiService_0.CoreGuiNavigationEnabled = true;
                return;
            end;
        elseif v144 == "GuiNavigationEnabled" then
            if l_GuiService_0.GuiNavigationEnabled ~= false then
                v20 = l_GuiService_0.GuiNavigationEnabled;
                l_GuiService_0.GuiNavigationEnabled = false;
                return;
            end;
        elseif v144 == "AutoSelectGuiEnabled" and l_GuiService_0.AutoSelectGuiEnabled ~= false then
            v21 = l_GuiService_0.AutoSelectGuiEnabled;
            l_GuiService_0.AutoSelectGuiEnabled = false;
        end;
    end;
end);
SetupGamepadSelection = function() --[[ Line: 700 ]] --[[ Name: SetupGamepadSelection ]]
    -- upvalues: v19 (ref), l_GuiService_0 (copy), v20 (ref), v21 (ref)
    v19 = l_GuiService_0.CoreGuiNavigationEnabled;
    v20 = l_GuiService_0.GuiNavigationEnabled;
    v21 = l_GuiService_0.AutoSelectGuiEnabled;
    l_GuiService_0.SelectedCoreObject = nil;
    l_GuiService_0.CoreGuiNavigationEnabled = true;
    l_GuiService_0.GuiNavigationEnabled = false;
    l_GuiService_0.AutoSelectGuiEnabled = false;
end;
v0.CreatePrompt = function(_, v146) --[[ Line: 712 ]] --[[ Name: CreatePrompt ]]
    -- upvalues: v17 (ref)
    if v17 then
        return false;
    else
        v17 = true;
        SetupGamepadSelection();
        DoCreatePrompt(v146);
        return true;
    end;
end;
v0.IsCurrentlyPrompting = function(_) --[[ Line: 722 ]] --[[ Name: IsCurrentlyPrompting ]]
    -- upvalues: v17 (ref)
    return v17;
end;
return v0;