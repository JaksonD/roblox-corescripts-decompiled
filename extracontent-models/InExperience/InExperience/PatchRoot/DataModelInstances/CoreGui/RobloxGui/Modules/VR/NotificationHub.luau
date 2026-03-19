local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_Panel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D;
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local _ = CFrame.Angles(-0.08726646259971647, 0, 0) * CFrame.new(0, 4, 0) * CFrame.Angles(-0.2617993877991494, 0, 0);
local v9 = Color3.new(0.3058823529411765, 0.32941176470588235, 0.3764705882352941);
local v10 = Color3.new(0.3215686274509804, 0.396078431372549, 0.5529411764705883);
local v11 = Color3.new(0.0784313725490196, 0.0784313725490196, 0.0784313725490196);
local v12 = Color3.new(0.2, 0.2, 0.2);
local v13 = l_Create_0("ImageLabel")({
    BackgroundTransparency = 1, 
    Image = ""
});
local v14 = Color3.new(1, 1, 1);
local v15 = {
    ModuleName = "Notifications", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = true, 
    UnreadCountChanged = function(...) --[[ Line: 79 ]]

    end, 
    SetVisible = nil
};
l_VRHub_0:RegisterModule(v15);
local v16 = l_Panel3D_0.Get("Notifications");
local v17 = nil;
local v18 = l_Panel3D_0.Get("NotificationDetails");
local v19 = nil;
local function _() --[[ Line: 88 ]] --[[ Name: IsDeveloperGroupEnabled ]]
    return false;
end;
local v21 = {};
local v22 = {};
local v23 = {
    __index = v21
};
local l_v22_0 = v22 --[[ copy: 22 -> 35 ]];
local l_v23_0 = v23 --[[ copy: 23 -> 36 ]];
v21.new = function(v26, v27, v28) --[[ Line: 96 ]] --[[ Name: new ]]
    -- upvalues: l_v22_0 (copy), l_Create_0 (copy), v9 (copy), v14 (copy), v11 (copy), l_v23_0 (copy)
    local v29 = {};
    table.insert(l_v22_0, v29);
    v29.zeroCF = v26.localCF;
    v29.zOffset = 0;
    v29.isPopping = false;
    v29.isAnimating = false;
    v29.tweener = nil;
    v29.panel = v26;
    v29.SetPopOut = nil;
    v29.panel.OnMouseEnter = function() --[[ Line: 106 ]]
        -- upvalues: l_v22_0 (ref), v29 (copy)
        for _, v31 in pairs(l_v22_0) do
            if v31 ~= v29 then
                v31:SetPopOut(false);
            end;
        end;
        v29:SetPopOut(true);
    end;
    v29.titlebar = l_Create_0("ImageLabel")({
        Parent = v27, 
        Name = "TitlebarBackground", 
        Position = UDim2.new(0, -1, 0, -1), 
        Size = UDim2.new(1, 2, 0, 74), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ImageColor3 = v9, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10)
    });
    v29.titleText = l_Create_0("TextLabel")({
        Parent = v29.titlebar, 
        Name = "TitleText", 
        Position = UDim2.new(0, 1, 0, 1), 
        Size = UDim2.new(1, -2, 1, -2), 
        Text = v28, 
        TextColor3 = v14, 
        Font = Enum.Font.SourceSans, 
        FontSize = Enum.FontSize.Size36, 
        BackgroundTransparency = 1
    });
    v29.content = l_Create_0("ImageLabel")({
        Parent = v27, 
        Name = "ContentFrame", 
        Position = UDim2.new(0, -1, 0, 74), 
        Size = UDim2.new(1, 2, 1, -76), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ImageColor3 = v11, 
        ImageTransparency = 0.5, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10)
    });
    return (setmetatable(v29, l_v23_0));
end;
v21.SetTitle = function(v32, v33) --[[ Line: 163 ]] --[[ Name: SetTitle ]]
    v32.titleText.Text = v33;
end;
v21.AddCloseButton = function(v34, v35) --[[ Line: 167 ]] --[[ Name: AddCloseButton ]]
    -- upvalues: l_Create_0 (copy)
    v34.closeButton = l_Create_0("ImageButton")({
        Parent = v34.titlebar, 
        Name = "CloseButton", 
        Position = UDim2.new(0, 22, 0, 22), 
        Size = UDim2.new(0, 32, 0, 32), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Keyboard/close_button_icon.png", 
        SelectionImageObject = l_Create_0("ImageButton")({
            Name = "CloseButtonHover", 
            Position = UDim2.new(0, -11, 0, -11), 
            Size = UDim2.new(1, 22, 1, 22), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png"
        })
    });
    v34.closeButton.MouseButton1Click:connect(v35);
end;
v21.TweenZOffsetTo = function(v36, v37, v38, v39, v40) --[[ Line: 189 ]] --[[ Name: TweenZOffsetTo ]]
    -- upvalues: v4 (copy)
    if v36.tweener and not v36.tweener:IsFinished() then
        v36.tweener:Cancel();
    end;
    v36.tweener = v4:TweenProperty(v36, "zOffset", v36.zOffset, v37, v38, v39, v40);
end;
v21.AnimateOut = function(v41, v42) --[[ Line: 196 ]] --[[ Name: AnimateOut ]]
    -- upvalues: v4 (copy)
    v41.isAnimating = true;
    v41:TweenZOffsetTo(-100, 0.25, v4:GetEaseInOutQuad(), function() --[[ Line: 198 ]]
        -- upvalues: v42 (copy), v41 (copy)
        if v42 then
            v42();
        end;
        v41.isAnimating = false;
    end);
end;
v21.AnimateIn = function(v43, v44) --[[ Line: 204 ]] --[[ Name: AnimateIn ]]
    -- upvalues: v4 (copy)
    v43.zOffset = -100;
    v43:OnUpdate(0);
    v43.isAnimating = true;
    v43:TweenZOffsetTo(0, 0.25, v4:GetEaseInOutQuad(), function() --[[ Line: 208 ]]
        -- upvalues: v44 (copy), v43 (copy)
        if v44 then
            v44();
        end;
        v43.isAnimating = false;
    end);
end;
v21.SetPopOut = function(v45, v46) --[[ Line: 214 ]] --[[ Name: SetPopOut ]]
    -- upvalues: v4 (copy)
    if v45.isAnimating then
        return;
    elseif v46 then
        v45.isPopping = true;
        v45:TweenZOffsetTo(0.25, 0.25, v4:GetEaseInOutQuad(), function() --[[ Line: 221 ]]
            -- upvalues: v45 (copy)
            v45.isPopping = false;
        end);
        return;
    else
        v45.isPopping = true;
        v45:TweenZOffsetTo(0, 0.25, v4:GetEaseInOutQuad(), function() --[[ Line: 226 ]]
            -- upvalues: v45 (copy)
            v45.isPopping = false;
        end);
        return;
    end;
end;
v21.OnUpdate = function(v47, _) --[[ Line: 232 ]] --[[ Name: OnUpdate ]]
    -- upvalues: v9 (copy), v10 (copy)
    v47.panel.localCF = v47.zeroCF * CFrame.new(0, 0, v47.zOffset);
    v47.panel.needsLocalPositionUpdate = v47.isAnimating or v47.isPopping;
    if v47.isPopping then
        local v49 = math.max(0, (math.min(1, v47.zOffset / 0.25)));
        v47.titlebar.ImageColor3 = v9:lerp(v10, v49);
    end;
end;
v16:SetType(l_Panel3D_0.Type.Standard);
v16:SetVisible(false);
v16:SetCanFade(false);
v16:ResizeStuds(2.277333324, 3.5, 150);
v22 = l_Create_0("TextButton")({
    Parent = v16:GetGUI(), 
    Name = "NotificationsListFrame", 
    Position = UDim2.new(0, 0, 0, 0), 
    Size = UDim2.new(1, -4, 1, 0), 
    BackgroundTransparency = 1, 
    Text = "", 
    Selectable = true, 
    SelectionImageObject = v13
});
v17 = v21.new(v16, v22, "Notifications");
v17:AddCloseButton(function() --[[ Line: 263 ]]
    -- upvalues: v15 (copy)
    v15:SetVisible(false);
end);
v16.OnUpdate = function(_, v51) --[[ Line: 266 ]] --[[ Name: OnUpdate ]]
    -- upvalues: v17 (ref)
    v17:OnUpdate(v51);
end;
v18:SetType(l_Panel3D_0.Type.Standard);
v18:SetVisible(false);
v18:SetCanFade(false);
v18:ResizeStuds(3.4159999859999997, 3.5, 150);
v22 = l_Create_0("TextButton")({
    Parent = v18:GetGUI(), 
    Name = "NotificationsDetailFrame", 
    Position = UDim2.new(0, 0, 0, 0), 
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundTransparency = 1, 
    Text = "", 
    Selectable = true, 
    SelectionImageObject = v13
});
v19 = v21.new(v18, v22, "Friend Requests");
v18.OnUpdate = function(_, v53) --[[ Line: 291 ]] --[[ Name: OnUpdate ]]
    -- upvalues: v19 (ref)
    v19:OnUpdate(v53);
end;
v22 = {};
v23 = {};
local function v56(v54, v55) --[[ Line: 298 ]] --[[ Name: groupSort ]]
    return v54.order < v55.order;
end;
local v57 = nil;
local function v72() --[[ Line: 303 ]] --[[ Name: layoutNotificationsGroups ]]
    -- upvalues: v23 (copy), v16 (copy), v57 (ref)
    local v58 = 20;
    for _, v60 in ipairs(v23) do
        if #v60.notifications > 0 then
            local v61 = (math.min(3, #v60.notifications) - 1) * 20 + 80;
            v60.frame.Position = UDim2.new(0.07500000000000001, 0, 0, v58);
            v60.frame.Size = UDim2.new(0.85, -40, 0, v61);
            v58 = v58 + v61 + 20;
            if v60.notificationsDirty then
                v60.notificationsDirty = false;
                local v62 = 0;
                local v63 = 0;
                local v64 = #v60.notifications;
                if v64 > 0 then
                    local v65 = math.max(1, v64 - 3 + 1);
                    for v66 = 1, v64 do
                        local v67 = v60.notifications[v66];
                        if v65 <= v66 then
                            v67.frame.Visible = true;
                            v67.frame.Position = UDim2.new(0, v62, 0, v62);
                            v62 = v62 + 20;
                            local _ = v16:SetSubpanelDepth(v67.frame, v63);
                            v63 = v63 + 0.25;
                        else
                            v67.frame.Visible = false;
                        end;
                    end;
                    if v57 == v60 then
                        v65 = math.max(1, v64 - 2 + 1);
                        local v69 = 0;
                        for v70 = 1, v64 do
                            local v71 = v60.notifications[v70];
                            if v65 <= v70 then
                                v71.detailsFrame.Visible = true;
                                v71.detailsFrame.Position = UDim2.new(0, 20, v69, 20);
                                v71.detailsFrame.Size = UDim2.new(1, -40, 0.5, -40);
                                v69 = v69 + 0.5;
                            else
                                v71.detailsFrame.Visible = false;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local v73 = {};
local v74 = {
    __index = v73
};
local l_v74_0 = v74 --[[ copy: 28 -> 37 ]];
v73.new = function(v76, v77, v78) --[[ Line: 362 ]] --[[ Name: new ]]
    -- upvalues: l_v74_0 (copy), l_Create_0 (copy), v17 (ref), v22 (copy), v23 (copy)
    local v79 = setmetatable({}, l_v74_0);
    v79.key = v76;
    v79.title = v77;
    v79.order = v78;
    v79.notifications = {};
    v79.notificationsDirty = false;
    v79.frame = l_Create_0("Frame")({
        Parent = v17.content, 
        Name = "NotificationGroup", 
        BackgroundTransparency = 1
    });
    v79.detailsFrame = l_Create_0("Frame")({
        Parent = nil, 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    });
    v22[v76] = v79;
    table.insert(v23, v79);
    return v79;
end;
v73.Deactivate = function(v80) --[[ Line: 389 ]] --[[ Name: Deactivate ]]
    -- upvalues: v18 (copy)
    v80.detailsFrame.Parent = nil;
    for _, v82 in pairs(v80.detailsFrame:GetChildren()) do
        v18:RemoveSubpanel(v82);
    end;
end;
v73.SwitchTo = function(v83) --[[ Line: 396 ]] --[[ Name: SwitchTo ]]
    -- upvalues: v19 (ref), v22 (copy), v57 (ref)
    v19:SetTitle(v83.title);
    for _, v85 in pairs(v22) do
        if v85 ~= v83 then
            v85:Deactivate();
        end;
    end;
    v83.detailsFrame.Parent = v19.content;
    v57 = v83;
    v83.notificationsDirty = true;
end;
v73.BringNotificationToFront = function(v86, v87) --[[ Line: 409 ]] --[[ Name: BringNotificationToFront ]]
    -- upvalues: v57 (ref), v72 (copy)
    if v57 ~= v86 then
        v86:SwitchTo();
    end;
    if #v86.notifications ~= 0 and v87 == v86.notifications[#v86.notifications] then
        v72();
        return;
    else
        for v88, v89 in ipairs(v86.notifications) do
            if v89 == v87 then
                table.remove(v86.notifications, v88);
                break;
            end;
        end;
        table.insert(v86.notifications, v87);
        v86.notificationsDirty = true;
        v72();
        return;
    end;
end;
v73.RemoveNotification = function(v90, v91) --[[ Line: 432 ]] --[[ Name: RemoveNotification ]]
    -- upvalues: v16 (copy), v18 (copy), v72 (copy)
    for v92, v93 in ipairs(v90.notifications) do
        if v93 == v91 then
            table.remove(v90.notifications, v92);
            v16:RemoveSubpanel(v91.frame);
            v18:RemoveSubpanel(v91.detailsFrame);
            v91.detailsFrame:Destroy();
            v91.frame:Destroy();
            v90.notificationsDirty = true;
            v72();
            return;
        end;
    end;
end;
v73.GetTopNotification = function(v94) --[[ Line: 448 ]] --[[ Name: GetTopNotification ]]
    local v95 = #v94.notifications;
    if v95 <= 0 then
        return nil;
    else
        return v94.notifications[v95];
    end;
end;
v73.new("Friends", "Friends", 1);
v73.new("BadgeAwards", "Badges", 2);
v73.new("PlayerPoints", "Points", 3);
if false then
    v73.new("Developer", "Other", 4);
end;
table.sort(v23, v56);
v74 = function(v96, ...) --[[ Line: 465 ]] --[[ Name: doCallback ]]
    if not v96 then
        return;
    elseif type(v96) == "function" then
        v96(...);
        return;
    elseif v96:IsA("BindableEvent") then
        v96:Fire(...);
        return;
    elseif v96:IsA("BindableFunction") then
        v96:Invoke(...);
        return;
    else
        return;
    end;
end;
local v97 = {};
local v98 = {
    __index = v97
};
local l_v98_0 = v98 --[[ copy: 30 -> 38 ]];
v97.new = function(v100, v101) --[[ Line: 487 ]] --[[ Name: new ]]
    -- upvalues: l_v98_0 (copy), l_Create_0 (copy), v13 (copy), v12 (copy), v14 (copy), v18 (copy), v74 (copy), v72 (copy)
    local v102 = setmetatable({}, l_v98_0);
    v102.group = v100;
    v102.frame = l_Create_0("ImageButton")({
        Parent = v100.frame, 
        Size = UDim2.new(1, 0, 0, 80), 
        SelectionImageObject = v13, 
        BackgroundTransparency = 1
    });
    v102.frame.MouseButton1Click:connect(function() --[[ Line: 498 ]]
        -- upvalues: v102 (copy)
        v102:OnClicked();
    end);
    v102.background = l_Create_0("ImageLabel")({
        Parent = v102.frame, 
        Position = UDim2.new(0, -1, 0, -1), 
        Size = UDim2.new(1, 2, 1, 2), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/vr/rectBackgroundWhite.png", 
        ImageColor3 = v12, 
        ImageTransparency = 0.1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10)
    });
    v102.imageBackground = l_Create_0("ImageLabel")({
        Parent = v102.frame, 
        Position = UDim2.new(0, 5, 0, 5), 
        Size = UDim2.new(0, 70, 0, 70), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/VR/circleWhite.png", 
        ImageColor3 = v101.imgBackgroundColor or Color3.new(1, 1, 1)
    });
    v102.image = l_Create_0("ImageLabel")({
        Parent = v102.imageBackground, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Image = v101.Image
    });
    local l_Text_0 = v101.Text;
    if v101.Title and v101.Text then
        l_Text_0 = ("%s\n%s"):format(v101.Title, v101.Text);
    end;
    v102.text = l_Create_0("TextLabel")({
        Parent = v102.frame, 
        Position = UDim2.new(0, 80, 0, 0), 
        Size = UDim2.new(1, -80, 1, 0), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Text = l_Text_0, 
        TextWrapped = true, 
        Font = Enum.Font.SourceSans, 
        FontSize = Enum.FontSize.Size18, 
        TextColor3 = v14
    });
    v102.detailsFrame = l_Create_0("Frame")({
        Parent = v100.detailsFrame, 
        BackgroundTransparency = 1
    });
    v102.detailsFrame.MouseEnter:connect(function() --[[ Line: 558 ]]
        -- upvalues: v18 (ref), v102 (copy)
        v18:SetSubpanelDepth(v102.detailsFrame, 0.25);
    end);
    v102.detailsFrame.MouseLeave:connect(function() --[[ Line: 561 ]]
        -- upvalues: v18 (ref), v102 (copy)
        v18:SetSubpanelDepth(v102.detailsFrame, 0);
    end);
    v102.detailsBackground = l_Create_0("ImageLabel")({
        Parent = v102.detailsFrame, 
        Position = UDim2.new(0, -1, 0, -1), 
        Size = UDim2.new(1, 2, 1, 2), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ImageColor3 = Color3.new(0.2, 0.2, 0.2), 
        ImageTransparency = 0.1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10)
    });
    v102.detailsIconBackground = l_Create_0("ImageLabel")({
        Parent = v102.detailsFrame, 
        Position = UDim2.new(0, 20, 0, 10), 
        Size = UDim2.new(0, 80, 0, 80), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/VR/circleWhite.png", 
        ImageColor3 = v101.imgBackgroundColor or Color3.new(1, 1, 1)
    });
    v102.detailsIcon = l_Create_0("ImageLabel")({
        Parent = v102.detailsIconBackground, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Image = v101.Image
    });
    local v104 = v101.DetailText or v101.Title;
    v102.detailsText = l_Create_0("TextLabel")({
        Parent = v102.detailsFrame, 
        Position = UDim2.new(0, 110, 0, 10), 
        Size = UDim2.new(1, -120, 0, 90), 
        BackgroundTransparency = 1, 
        Text = v104, 
        TextWrapped = true, 
        TextColor3 = v14, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Font = Enum.Font.SourceSansBold, 
        FontSize = Enum.FontSize.Size36
    });
    local function v110(v105, v106, v107) --[[ Line: 614 ]] --[[ Name: createButton ]]
        -- upvalues: l_Create_0 (ref), v102 (copy), v13 (ref), v14 (ref)
        local v108 = l_Create_0("ImageButton")({
            Parent = v102.detailsFrame, 
            Position = UDim2.new(v105, 0, 0.55, 0), 
            Size = UDim2.new(v106, 0, 0.29, 0), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png", 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            SelectionImageObject = v13
        });
        local v109 = l_Create_0("TextLabel")({
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, -6), 
            BackgroundTransparency = 1, 
            Text = v107, 
            TextColor3 = v14, 
            Font = Enum.Font.SourceSansBold, 
            FontSize = Enum.FontSize.Size24
        });
        v109.Parent = v108;
        v108.SelectionGained:connect(function() --[[ Line: 640 ]]
            -- upvalues: v108 (copy)
            v108.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png";
        end);
        v108.SelectionLost:connect(function() --[[ Line: 643 ]]
            -- upvalues: v108 (copy)
            v108.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png";
        end);
        return v108, v109;
    end;
    if v101.Button1Text and v101.Button2Text then
        local v111, v112 = v110(0.07, 0.415, v101.Button1Text);
        v102.detailsButton1 = v111;
        v102.detailsButton1Text = v112;
        v111, v112 = v110(0.511, 0.415, v101.Button2Text);
        v102.detailsButton2 = v111;
        v102.detailsButton2Text = v112;
        v102.detailsButton1.MouseButton1Click:connect(function() --[[ Line: 653 ]]
            -- upvalues: v74 (ref), v101 (copy), v102 (copy)
            v74(v101.Callback, v101.Button1Text);
            v102:Dismiss();
        end);
        v102.detailsButton2.MouseButton1Click:connect(function() --[[ Line: 657 ]]
            -- upvalues: v74 (ref), v101 (copy), v102 (copy)
            v74(v101.Callback, v101.Button2Text);
            v102:Dismiss();
        end);
    elseif not v101.button2Text then
        local v113, v114 = v110(0.07, 0.86, v101.Button1Text or "Dismiss");
        v102.detailsButton1 = v113;
        v102.detailsButton1Text = v114;
        v102.detailsButton1.MouseButton1Click:connect(function() --[[ Line: 664 ]]
            -- upvalues: v74 (ref), v101 (copy), v102 (copy)
            v74(v101.Callback, v101.Button1Text);
            v102:Dismiss();
        end);
    end;
    table.insert(v100.notifications, v102);
    v100.notificationsDirty = true;
    v72();
    return v102;
end;
v97.OnClicked = function(v115) --[[ Line: 677 ]] --[[ Name: OnClicked ]]
    -- upvalues: v72 (copy)
    v115.group:SwitchTo();
    v72();
end;
v97.Dismiss = function(v116) --[[ Line: 685 ]] --[[ Name: Dismiss ]]
    v116.group:RemoveNotification(v116);
end;
v98 = {};
local v117 = false;
local v118 = 0;
do
    local l_v117_0, l_v118_0 = v117, v118;
    l_RobloxGui_0:WaitForChild("SendNotificationInfo").Event:connect(function(v121) --[[ Line: 697 ]]
        -- upvalues: v22 (copy), v97 (copy), l_v117_0 (ref), l_v118_0 (ref), v15 (copy)
        local v122 = v121.GroupName and v22[v121.GroupName];
        if not v122 then
            if false then
                v122 = v22.Developer;
            else
                return;
            end;
        end;
        v97.new(v122, v121);
        if not l_v117_0 then
            l_v118_0 = l_v118_0 + 1;
            v15.UnreadCountChanged(l_v118_0);
        end;
    end);
    local function v126(_, v124, _) --[[ Line: 716 ]] --[[ Name: onMenuCloseShortcut ]]
        -- upvalues: v15 (copy)
        if v124 == Enum.UserInputState.Begin then
            v15:SetVisible(false);
        end;
    end;
    v15.VisibilityStateChanged = l_Create_0("BindableEvent")({
        Name = "VisibilityStateChanged"
    });
    v15.GetNumberOfPendingNotifications = function(_) --[[ Line: 726 ]] --[[ Name: GetNumberOfPendingNotifications ]]
        -- upvalues: v98 (copy)
        return #v98;
    end;
    v15.IsVisible = function(_) --[[ Line: 730 ]] --[[ Name: IsVisible ]]
        -- upvalues: l_v117_0 (ref)
        return l_v117_0;
    end;
    v15.SetVisible = function(_, v130) --[[ Line: 734 ]] --[[ Name: SetVisible ]]
        -- upvalues: l_v117_0 (ref), l_Panel3D_0 (copy), l_v118_0 (ref), v15 (copy), v16 (copy), v17 (ref), v18 (copy), v19 (ref), l_ContextActionService_0 (copy), v126 (copy), l_VRHub_0 (copy)
        if l_v117_0 == v130 then
            return;
        else
            l_v117_0 = v130;
            l_Panel3D_0.Get("Topbar3D"):SetCanFade(not v130);
            if v130 then
                l_v118_0 = 0;
                v15.UnreadCountChanged(l_v118_0);
                v16.localCF = CFrame.new(-1.7079999929999998, 0, 0);
                v17.zeroCF = v16.localCF;
                v17:AnimateIn(nil);
                v18.localCF = CFrame.new(1.138666662, 0, 0);
                v19.zeroCF = v18.localCF;
                v19:AnimateIn(nil);
                v16:SetVisible(true);
                v18:SetVisible(true);
                l_ContextActionService_0:BindCoreAction("NotificationsMenuCloseShortcut", v126, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart);
                l_VRHub_0:FireModuleOpened(v15.ModuleName);
            else
                spawn(function() --[[ Line: 766 ]]
                    -- upvalues: v17 (ref), v16 (ref), v19 (ref), v18 (ref)
                    v17:AnimateOut(function() --[[ Line: 767 ]]
                        -- upvalues: v16 (ref)
                        v16:SetVisible(false);
                    end);
                    v19:AnimateOut(function() --[[ Line: 770 ]]
                        -- upvalues: v18 (ref)
                        v18:SetVisible(false);
                    end);
                end);
                l_ContextActionService_0:UnbindCoreAction("NotificationsMenuCloseShortcut");
                l_VRHub_0:FireModuleClosed(v15.ModuleName);
            end;
            v15.VisibilityStateChanged:Fire(v130);
            return;
        end;
    end;
    l_VRHub_0.ModuleOpened.Event:connect(function(v131, _, _, _) --[[ Line: 788 ]]
        -- upvalues: v15 (copy)
        if v131 ~= v15.ModuleName then
            v15:SetVisible(false);
        end;
    end);
end;
return v15;