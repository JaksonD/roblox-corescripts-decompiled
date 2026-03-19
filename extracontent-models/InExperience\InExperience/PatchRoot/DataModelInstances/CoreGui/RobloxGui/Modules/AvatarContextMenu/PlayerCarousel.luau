local v0 = {};
v0.__index = v0;
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_TweenService_0 = game:GetService("TweenService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = Color3.fromRGB(0, 162, 255);
local v6 = Color3.fromRGB(0, 0, 0);
local l_AvatarContextMenu_0 = l_CoreGui_0:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("AvatarContextMenu");
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = {};
local v12 = {};
local function v19() --[[ Line: 34 ]] --[[ Name: getSortedCarouselButtons ]]
    -- upvalues: v8 (ref)
    local v13 = {};
    local v14 = {};
    for v15, v16 in ipairs(v8:GetChildren()) do
        if v16:IsA("GuiObject") and v16.Name ~= "_CarouselDivider" then
            table.insert(v14, v16);
            v13[v16] = v15;
        end;
    end;
    table.sort(v14, function(v17, v18) --[[ Line: 43 ]]
        -- upvalues: v13 (copy)
        if v17.LayoutOrder == v18.LayoutOrder then
            return v13[v17] < v13[v18];
        else
            return v17.LayoutOrder < v18.LayoutOrder;
        end;
    end);
    return v14;
end;
local function v34(v20) --[[ Line: 52 ]] --[[ Name: CreateMenuCarousel ]]
    -- upvalues: v8 (ref), v9 (ref), v10 (ref), v19 (copy), v6 (copy), l_GuiService_0 (copy), v5 (copy), v11 (ref), l_UserInputService_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "PlayerCarousel";
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_Frame_0.Size = UDim2.new(1, 0, 0.28, 0);
    l_Frame_0.ClipsDescendants = true;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "InnerFrame";
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_Frame_1.Size = UDim2.new(0.8, 0, 1, 0);
    l_Frame_1.ClipsDescendants = true;
    l_Frame_1.Active = true;
    l_Frame_1.Parent = l_Frame_0;
    v8 = Instance.new("Frame");
    v8.Name = "SelectedPlayer";
    v8.AnchorPoint = Vector2.new(0.5, 0.5);
    v8.BackgroundTransparency = 1;
    v8.Position = UDim2.new(0.5, 0, 0.5, 0);
    v8.Size = UDim2.new(0, 100, 1, -10);
    v8.Parent = l_Frame_1;
    v9 = Instance.new("UIPageLayout");
    v9.EasingDirection = Enum.EasingDirection.Out;
    v9.EasingStyle = Enum.EasingStyle.Quad;
    v9.Padding = UDim.new(0, 5);
    v9.TweenTime = 0.25;
    v9.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    v9.VerticalAlignment = Enum.VerticalAlignment.Center;
    v9.TouchInputEnabled = false;
    v9.Circular = true;
    v9.SortOrder = Enum.SortOrder.LayoutOrder;
    local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_0.DominantAxis = Enum.DominantAxis.Height;
    l_UIAspectRatioConstraint_0.Parent = v8;
    v10 = Instance.new("BindableEvent");
    v10.Name = "PlayerChanged";
    local v24 = nil;
    v9:GetPropertyChangedSignal("CurrentPage"):Connect(function() --[[ Line: 98 ]]
        -- upvalues: v9 (ref), v19 (ref), v24 (ref), v6 (ref), l_GuiService_0 (ref), v5 (ref), v10 (ref), v11 (ref)
        if v9.CurrentPage then
            if v9.CurrentPage.Name == "_CarouselDivider" then
                local v25 = v19();
                if v24 == v25[1] then
                    v9:Previous();
                else
                    v9:Next();
                end;
            else
                v9.CurrentPage.BackgroundColor3 = v6;
                v24 = v9.CurrentPage;
            end;
        end;
        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject.Parent == v9.Parent then
            l_GuiService_0.SelectedCoreObject.BackgroundColor3 = v5;
        end;
        l_GuiService_0.SelectedCoreObject = v9.CurrentPage;
        if v9.CurrentPage then
            v10:Fire(v11[v9.CurrentPage]);
        end;
    end);
    v9.Parent = v8;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "NextButton";
    l_ImageButton_0.Image = v20.ScrollRightImage;
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.AnchorPoint = Vector2.new(1, 0.5);
    l_ImageButton_0.Position = UDim2.new(1, -5, 0.5, 0);
    l_ImageButton_0.Size = UDim2.new(0.3, 0, 0.3, 0);
    l_ImageButton_0.Selectable = false;
    l_ImageButton_0.Parent = l_Frame_0;
    local l_UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_1.DominantAxis = Enum.DominantAxis.Width;
    l_UIAspectRatioConstraint_1.Parent = l_ImageButton_0;
    local v28 = l_ImageButton_0:Clone();
    v28.Name = "PrevButton";
    if v20.ScrollLeftImage ~= "" then
        v28.Image = v20.ScrollLeftImage;
    else
        v28.Rotation = 180;
    end;
    v28.AnchorPoint = Vector2.new(0, 0.5);
    v28.Position = UDim2.new(0, 5, 0.5, 0);
    v28.Selectable = false;
    v28.Parent = l_Frame_0;
    local function _(v29) --[[ Line: 146 ]] --[[ Name: moveChangePage ]]
        -- upvalues: v9 (ref)
        if v29 then
            v9:Next();
            return;
        else
            v9:Previous();
            return;
        end;
    end;
    l_ImageButton_0.MouseButton1Click:Connect(function() --[[ Line: 154 ]]
        -- upvalues: v9 (ref)
        v9:Next();
    end);
    v28.MouseButton1Click:Connect(function() --[[ Line: 155 ]]
        -- upvalues: v9 (ref)
        v9:Previous();
    end);
    local function v32() --[[ Line: 159 ]] --[[ Name: checkButtonVisibility ]]
        -- upvalues: l_UserInputService_0 (ref), v28 (copy), v8 (ref), l_ImageButton_0 (copy)
        local v31 = l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch;
        v28.Visible = not v31 and #v8:GetChildren() > 3;
        l_ImageButton_0.Visible = not v31 and #v8:GetChildren() > 3;
    end;
    local v33 = l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch;
    v28.Visible = not v33 and #v8:GetChildren() > 3;
    l_ImageButton_0.Visible = not v33 and #v8:GetChildren() > 3;
    l_UserInputService_0.LastInputTypeChanged:Connect(v32);
    return l_Frame_0;
end;
v0.UpdateGuiTheme = function(v35, v36) --[[ Line: 170 ]] --[[ Name: UpdateGuiTheme ]]
    v35.rbxGui.NextButton.Image = v36.ScrollRightImage;
    if v36.ScrollLeftImage ~= "" then
        v35.rbxGui.PrevButton.Image = v36.ScrollLeftImage;
        return;
    else
        v35.rbxGui.PrevButton.Image = v36.ScrollRightImage;
        v35.rbxGui.PrevButton.Rotation = 180;
        return;
    end;
end;
v0.FadeTowardsEdges = function(_) --[[ Line: 181 ]] --[[ Name: FadeTowardsEdges ]]
    -- upvalues: v9 (ref), v19 (copy)
    if not v9.CurrentPage then
        return;
    else
        local v38 = v19();
        local v39 = 0;
        for v40, v41 in ipairs(v38) do
            if v41 == v9.CurrentPage then
                v39 = v40;
                break;
            end;
        end;
        for v42, v43 in ipairs(v38) do
            local v44 = math.min((v39 - v42) % #v38, (v42 - v39) % #v38);
            if v44 >= 2 then
                v43.ImageTransparency = 0.7;
            elseif v44 == 1 then
                v43.ImageTransparency = 0.4;
            else
                v43.ImageTransparency = 0;
            end;
        end;
        return;
    end;
end;
v0.AddCarouselDivider = function(_) --[[ Line: 209 ]] --[[ Name: AddCarouselDivider ]]
    -- upvalues: v8 (ref)
    local l__CarouselDivider_0 = v8:FindFirstChild("_CarouselDivider");
    if l__CarouselDivider_0 then
        l__CarouselDivider_0:Destroy();
    end;
    if #v8:GetChildren() - 1 < 5 then
        return;
    else
        l__CarouselDivider_0 = Instance.new("Frame");
        l__CarouselDivider_0.Name = "_CarouselDivider";
        l__CarouselDivider_0.Size = UDim2.new(1, 0, 1, 0);
        l__CarouselDivider_0.BackgroundTransparency = 1;
        l__CarouselDivider_0.Parent = v8;
        l__CarouselDivider_0.LayoutOrder = 1000000;
        local l_Frame_2 = Instance.new("Frame");
        l_Frame_2.Name = "line";
        l_Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
        l_Frame_2.BorderSizePixel = 0;
        l_Frame_2.Position = UDim2.new(0.25, 0, 0, -3);
        l_Frame_2.Size = UDim2.new(0, 2, 1, 6);
        l_Frame_2.Parent = l__CarouselDivider_0;
        local v48 = l_Frame_2:Clone();
        v48.Position = UDim2.new(0.5, 0, 0, -3);
        v48.Parent = l__CarouselDivider_0;
        local v49 = l_Frame_2:Clone();
        v49.Position = UDim2.new(0.75, 0, 0, -3);
        v49.Parent = l__CarouselDivider_0;
        return;
    end;
end;
v0.RemovePlayerEntry = function(v50, v51) --[[ Line: 244 ]] --[[ Name: RemovePlayerEntry ]]
    -- upvalues: v12 (ref), v11 (ref), v9 (ref)
    local v52 = v12[v51];
    if v52 then
        v12[v51] = nil;
        v11[v52] = nil;
        v52:Destroy();
        if v9 then
            v9:ApplyLayout();
        end;
        v50:FadeTowardsEdges();
    end;
end;
v0.ClearPlayerEntries = function(_) --[[ Line: 259 ]] --[[ Name: ClearPlayerEntries ]]
    -- upvalues: v11 (ref), v12 (ref)
    for v54 in pairs(v11) do
        v54:Destroy();
    end;
    v11 = {};
    v12 = {};
end;
v0.CreatePlayerEntry = function(_, v56, v57) --[[ Line: 268 ]] --[[ Name: CreatePlayerEntry ]]
    -- upvalues: v12 (ref), v6 (copy), v5 (copy), l_TweenService_0 (copy), v11 (ref), v9 (ref), v8 (ref), l_AvatarContextMenu_0 (copy), l_GuiService_0 (copy)
    local v58 = v12[v56];
    if v58 then
        v58.LayoutOrder = v57;
        return;
    else
        local l_ImageButton_1 = Instance.new("ImageButton");
        l_ImageButton_1.Name = v56.Name;
        l_ImageButton_1.BorderSizePixel = 0;
        l_ImageButton_1.LayoutOrder = v57;
        l_ImageButton_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
        l_ImageButton_1.BackgroundTransparency = 0;
        l_ImageButton_1.Size = UDim2.new(1, 0, 1, 0);
        l_ImageButton_1.SelectionLost:connect(function() --[[ Line: 283 ]]
            -- upvalues: l_ImageButton_1 (copy), v6 (ref)
            l_ImageButton_1.BackgroundColor3 = v6;
        end);
        l_ImageButton_1.SelectionGained:connect(function() --[[ Line: 284 ]]
            -- upvalues: l_ImageButton_1 (copy), v5 (ref)
            l_ImageButton_1.BackgroundColor3 = v5;
        end);
        local v60 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true);
        local v61 = nil;
        v61 = l_TweenService_0:Create(l_ImageButton_1, v60, {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        });
        v61:Play();
        v11[l_ImageButton_1] = v56;
        v12[v56] = l_ImageButton_1;
        l_ImageButton_1.MouseButton1Click:Connect(function() --[[ Line: 298 ]]
            -- upvalues: v9 (ref), l_ImageButton_1 (copy)
            v9:JumpTo(l_ImageButton_1);
        end);
        l_ImageButton_1.Parent = v8;
        spawn(function() --[[ Line: 304 ]]
            -- upvalues: l_AvatarContextMenu_0 (ref), l_ImageButton_1 (copy), v56 (copy), v61 (ref), l_GuiService_0 (ref), v5 (ref), v6 (ref)
            l_ImageButton_1.Image = require(l_AvatarContextMenu_0:WaitForChild("ContextMenuUtil")):GetHeadshotForPlayer(v56);
            v61:Cancel();
            v61 = nil;
            if l_ImageButton_1 == l_GuiService_0.SelectedCoreObject then
                l_ImageButton_1.BackgroundColor3 = v5;
                return;
            else
                l_ImageButton_1.BackgroundColor3 = v6;
                return;
            end;
        end);
        return;
    end;
end;
v0.SwitchToPlayerEntry = function(v62, v63, v64) --[[ Line: 317 ]] --[[ Name: SwitchToPlayerEntry ]]
    -- upvalues: v12 (ref), v9 (ref)
    if not v63 then
        return;
    else
        local v65 = v12[v63];
        if not v65 then
            v62:CreatePlayerEntry(v63, 0);
            v65 = v12[v63];
        end;
        if v64 then
            v9.TweenTime = 0;
        end;
        v9:JumpTo(v65);
        spawn(function() --[[ Line: 330 ]]
            -- upvalues: v9 (ref)
            v9.TweenTime = 0.25;
        end);
        return;
    end;
end;
v0.OffsetPlayerEntry = function(_, v67) --[[ Line: 335 ]] --[[ Name: OffsetPlayerEntry ]]
    -- upvalues: v9 (ref)
    if v67 == 0 then
        return;
    elseif v67 > 0 then
        v9:Next();
        return;
    else
        v9:Previous();
        return;
    end;
end;
v0.GetSelectedPlayer = function(_) --[[ Line: 345 ]] --[[ Name: GetSelectedPlayer ]]
    -- upvalues: v11 (ref), v9 (ref)
    return v11[v9.CurrentPage];
end;
v0.new = function(v69) --[[ Line: 349 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v34 (copy), v10 (ref)
    local v70 = setmetatable({}, v0);
    v70.rbxGui = v34(v69);
    v70.PlayerChanged = v10.Event;
    v10.Event:Connect(function() --[[ Line: 355 ]]
        -- upvalues: v70 (copy)
        v70:FadeTowardsEdges();
    end);
    return v70;
end;
return v0;