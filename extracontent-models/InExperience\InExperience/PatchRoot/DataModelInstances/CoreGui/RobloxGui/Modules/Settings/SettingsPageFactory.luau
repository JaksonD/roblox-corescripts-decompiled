local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_TweenService_0 = game:GetService("TweenService");
local v6 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v7 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v8 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_Create_0 = v8.Create;
local l_Signal_0 = v8.Signal;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v11 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v12 = require(script.Parent.Flags.GetFFlagFixIGMTabTransitions);
local v13 = require(script.Parent.Flags.FFlagIEMSettingsGroups);
local l_FFlagIEMFocusNavToButtons_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagIEMFocusNavToButtons;
local function v75() --[[ Line: 41 ]] --[[ Name: Initialize ]]
    -- upvalues: l_FFlagIEMFocusNavToButtons_0 (copy), l_Signal_0 (copy), l_Create_0 (copy), v6 (copy), v11 (copy), v7 (copy), l_GuiService_0 (copy), l_HttpService_0 (copy), v13 (copy), l_UserGameSettings_0 (copy), v12 (copy), l_TweenService_0 (copy)
    local v15 = {
        HubRef = nil, 
        LastSelectedObject = nil, 
        TabPosition = 0, 
        Active = false, 
        OpenStateChangedCount = 0, 
        ShouldShowBottomBar = true, 
        ShouldShowHubBar = true, 
        IsPageClipped = true, 
        SelectARow = nil
    };
    if l_FFlagIEMFocusNavToButtons_0 then
        v15.LastSelectableObjectsUpdated = l_Signal_0.new();
        v15.LastSelectableObjects = {};
        v15.PageNextSelectionDown = nil;
    end;
    local v16 = {};
    local v17 = false;
    v15.TabHeader = l_Create_0("TextButton")({
        Name = "Header", 
        Text = "", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.2, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        Selectable = not l_FFlagIEMFocusNavToButtons_0 and nil
    });
    if v6:IsSmallTouchScreen() then
        v15.TabHeader.Size = UDim2.new(0, 84, 1, 0);
    elseif v11 then
        v15.TabHeader.Size = UDim2.new(0, 220, 1, 0);
    end;
    v15.TabHeader.MouseButton1Click:connect(function() --[[ Line: 75 ]]
        -- upvalues: v15 (copy)
        if v15.HubRef then
            v15.HubRef:SwitchToPage(v15, true);
        end;
    end);
    local v18 = l_Create_0("TextLabel")({
        Name = "Icon", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0, 10, 0.5, -18), 
        Text = "", 
        TextColor3 = Color3.new(1, 1, 1), 
        TextScaled = true, 
        TextTransparency = 0.5, 
        Parent = v15.TabHeader
    });
    local _ = l_Create_0("UIAspectRatioConstraint")({
        Name = "AspectRatioConstraint", 
        AspectRatio = 1, 
        Parent = v18
    });
    local v20 = l_Create_0("TextLabel")({
        Name = "Title", 
        Text = "", 
        Font = v7.font(Enum.Font.SourceSansBold, "Button"), 
        TextColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1.05, 0, 1, 0), 
        Position = UDim2.new(1.2, v7.TabHeaderIconPadding, 0, -2), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextTransparency = 0.5
    });
    v20.TextSize = v7.textSize(24);
    local l_UITextSizeConstraint_0 = Instance.new("UITextSizeConstraint");
    l_UITextSizeConstraint_0.MaxTextSize = v7.textSize(24);
    v20.Parent = v18;
    if v6:IsPortrait() and v6:IsSmallTouchScreen() then
        l_UITextSizeConstraint_0.Parent = v20;
    end;
    if v6:IsSmallTouchScreen() then
        v20.TextSize = v7.textSize(18);
        l_UITextSizeConstraint_0.MaxTextSize = v7.textSize(18);
    elseif v11 then
        v20.TextSize = v7.textSize(48);
        l_UITextSizeConstraint_0.MaxTextSize = v7.textSize(48);
    end;
    local _ = l_Create_0("ImageLabel")({
        Name = "TabSelection", 
        Visible = false, 
        BackgroundColor3 = v7.color("TabSelection"), 
        BackgroundTransparency = v7.transparency("TabSelection"), 
        Size = UDim2.new(1, -2, 0, 2), 
        Position = UDim2.new(0, 3, 1, -2), 
        BorderSizePixel = 0, 
        Parent = v15.TabHeader
    });
    local v23 = l_Create_0("Frame")({
        Name = "TabLabel", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Parent = v15.TabHeader
    });
    l_Create_0("UIListLayout")({
        Name = "Layout", 
        FillDirection = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 10), 
        Parent = v23
    });
    v18.Parent = v23;
    v20.Parent = v23;
    v20.Size = UDim2.new(0, 0, 0, 0);
    v20.AutomaticSize = Enum.AutomaticSize.XY;
    local function v27() --[[ Line: 164 ]] --[[ Name: onResized ]]
        -- upvalues: v15 (copy), v6 (ref), v18 (copy), v11 (ref), v7 (ref), v23 (copy), v20 (copy)
        if not v15.TabHeader then
            return;
        else
            if v6:IsSmallTouchScreen() then
                v18.Size = UDim2.new(0, 34, 0, 28);
            elseif v11 then
                v18.Size = UDim2.new(0, 88, 0, 74);
            else
                local v24 = v7.getIconSize(v7.IconSize.Medium);
                v18.Size = UDim2.fromOffset(v24, v24);
            end;
            local v25 = v6:IsPortrait();
            local l_Layout_0 = v23.Layout;
            if v25 then
                if v6:IsSmallTouchScreen() then
                    v20.FontSize = v7.fontSize(Enum.FontSize.Size14);
                end;
                v18.Size = UDim2.new(0, 22, 0, 22);
                l_Layout_0.FillDirection = Enum.FillDirection.Vertical;
                l_Layout_0.Padding = UDim.new(0, 0);
            else
                if v6:IsSmallTouchScreen() then
                    v20.FontSize = v7.fontSize(Enum.FontSize.Size18);
                end;
                l_Layout_0.FillDirection = Enum.FillDirection.Horizontal;
                l_Layout_0.Padding = UDim.new(0, 10);
            end;
            v18.Size = UDim2.fromOffset(v18.Size.X.Offset * 0.6666666666666666, v18.Size.Y.Offset * 0.6666666666666666);
            return;
        end;
    end;
    v6:OnResized(v15.TabHeader, v27);
    v15.Page = l_Create_0("Frame")({
        Name = "Page", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    });
    l_Create_0("UIPadding")({
        PaddingLeft = UDim.new(0, 12), 
        PaddingRight = UDim.new(0, 11), 
        Parent = v15.Page
    });
    v15.PageListLayout = l_Create_0("UIListLayout")({
        Name = "RowListLayout", 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = UDim.new(0, 8), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Parent = v15.Page
    });
    l_GuiService_0:AddSelectionParent(l_HttpService_0:GenerateGUID(false), v15.Page);
    v15.Displayed = Instance.new("BindableEvent");
    v15.Displayed.Name = "Displayed";
    v15.Displayed.Event:connect(function() --[[ Line: 238 ]]
        -- upvalues: v15 (copy)
        if not v15.HubRef.Shield.Visible then
            return;
        else
            v15:SelectARow();
            return;
        end;
    end);
    v15.Hidden = Instance.new("BindableEvent");
    v15.Hidden.Event:connect(function() --[[ Line: 245 ]]
        -- upvalues: l_GuiService_0 (ref), v15 (copy)
        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v15.Page) then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end);
    v15.Hidden.Name = "Hidden";
    v15.getValueChangerFrame = function(_, v29) --[[ Line: 253 ]] --[[ Name: getValueChangerFrame ]]
        local _ = nil;
        if type(v29) ~= "table" then
            return v29;
        else
            return v29.SliderFrame and v29.SliderFrame or v29.SelectorFrame or v29.DropDownFrame;
        end;
    end;
    v15.SelectARow = function(_, v32) --[[ Line: 265 ]] --[[ Name: SelectARow ]]
        -- upvalues: l_GuiService_0 (ref), v15 (copy), v16 (copy), v13 (ref), l_FFlagIEMFocusNavToButtons_0 (ref)
        if v32 or not l_GuiService_0.SelectedCoreObject or not l_GuiService_0.SelectedCoreObject:IsDescendantOf(v15.Page) then
            if v15.LastSelectedObject then
                l_GuiService_0.SelectedCoreObject = v15.LastSelectedObject;
                return;
            elseif v16 and #v16 > 0 then
                local v33 = nil;
                if v13 then
                    local v34 = 1e999;
                    local l_ValueChanger_0 = v16[1].ValueChanger;
                    for _, v37 in v16 do
                        if v37.SelectionFrame and v37.SelectionFrame.LayoutOrder < v34 then
                            v34 = v37.SelectionFrame.LayoutOrder;
                            l_ValueChanger_0 = v37;
                        end;
                    end;
                    v33 = v15:getValueChangerFrame(l_ValueChanger_0.ValueChanger);
                else
                    v33 = v15:getValueChangerFrame(v16[1].ValueChanger);
                end;
                l_GuiService_0.SelectedCoreObject = v33;
                return;
            elseif l_FFlagIEMFocusNavToButtons_0 and v15.PageNextSelectionDown then
                l_GuiService_0.SelectedCoreObject = v15.PageNextSelectionDown;
            end;
        end;
    end;
    v15.Display = function(_, v39, v40) --[[ Line: 293 ]] --[[ Name: Display ]]
        -- upvalues: v15 (copy), v18 (copy), v20 (copy), l_UserGameSettings_0 (ref), v12 (ref), v17 (ref), l_TweenService_0 (ref)
        v15.OpenStateChangedCount = v15.OpenStateChangedCount + 1;
        if v15.TabHeader then
            v15.TabHeader.TabSelection.Visible = true;
            v18.TextTransparency = 0;
            v20.TextTransparency = 0;
        end;
        v15.Page.Parent = v39;
        v15.Page.Visible = true;
        local v41 = UDim2.new(0, 0, 0, 0);
        local function v42() --[[ Line: 306 ]]
            -- upvalues: l_UserGameSettings_0 (ref), v39 (copy), v12 (ref), v15 (ref), v41 (copy), v17 (ref)
            if l_UserGameSettings_0.ReducedMotion then
                v39.InnerCanvasGroupShow.Visible = false;
            end;
            if v12() then
                if l_UserGameSettings_0.ReducedMotion then
                    v39.InnerCanvasGroupShow.GroupTransparency = 0;
                end;
                v15.Page.Position = v41;
            end;
            v15.Page.Visible = true;
            v17 = true;
            v15.Displayed:Fire();
        end;
        if v40 then
            v15.Page.Position = v41;
            if l_UserGameSettings_0.ReducedMotion then
                v39.InnerCanvasGroupShow.Visible = false;
            end;
            if v12() then
                if l_UserGameSettings_0.ReducedMotion then
                    v39.InnerCanvasGroupShow.GroupTransparency = 0;
                end;
                v15.Page.Position = v41;
            end;
            v15.Page.Visible = true;
            v17 = true;
            v15.Displayed:Fire();
            return;
        elseif l_UserGameSettings_0.ReducedMotion then
            v15.Page.Position = v41;
            v39.InnerCanvasGroupShow.GroupTransparency = 1;
            v39.InnerCanvasGroupShow.Visible = true;
            v15.Page.Parent = v39.InnerCanvasGroupShow;
            v15.Page.Visible = true;
            local v43 = TweenInfo.new(0.25);
            local v44 = {
                GroupTransparency = 0
            };
            local v45 = l_TweenService_0:Create(v39.InnerCanvasGroupShow, v43, v44);
            v45:Play();
            v45.Completed:Connect(function() --[[ Line: 337 ]]
                -- upvalues: v15 (ref), v39 (copy), l_UserGameSettings_0 (ref), v12 (ref), v41 (copy), v17 (ref)
                v15.Page.Parent = v39;
                if l_UserGameSettings_0.ReducedMotion then
                    v39.InnerCanvasGroupShow.Visible = false;
                end;
                if v12() then
                    if l_UserGameSettings_0.ReducedMotion then
                        v39.InnerCanvasGroupShow.GroupTransparency = 0;
                    end;
                    v15.Page.Position = v41;
                end;
                v15.Page.Visible = true;
                v17 = true;
                v15.Displayed:Fire();
            end);
            return;
        else
            v15.Page:TweenPosition(v41, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, v42);
            return;
        end;
    end;
    v15.Hide = function(_, v47, v48, v49, v50, v51, v52) --[[ Line: 345 ]] --[[ Name: Hide ]]
        -- upvalues: v15 (copy), v18 (copy), v20 (copy), l_UserGameSettings_0 (ref), v17 (ref), l_TweenService_0 (ref)
        v15.OpenStateChangedCount = v15.OpenStateChangedCount + 1;
        if v15.TabHeader then
            v15.TabHeader.TabSelection.Visible = false;
            v18.TextTransparency = 0.5;
            v20.TextTransparency = 0.5;
        end;
        if v15.Page.Parent then
            local v53 = UDim2.new(1 * v47, 0, 0, 0);
            local function v54() --[[ Line: 356 ]]
                -- upvalues: l_UserGameSettings_0 (ref), v52 (copy), v51 (copy), v15 (ref), v48 (copy), v17 (ref)
                if l_UserGameSettings_0.ReducedMotion and v52 then
                    v51.InnerCanvasGroupHide.Visible = false;
                end;
                v15.Page.Visible = false;
                v15.Page.Position = UDim2.new(v15.TabPosition - v48, 0, 0, 0);
                v17 = false;
                v15.Hidden:Fire();
            end;
            local function v58() --[[ Line: 366 ]]
                -- upvalues: v49 (copy), v15 (ref), v53 (copy), l_UserGameSettings_0 (ref), v52 (copy), v51 (copy), v48 (copy), v17 (ref), l_TweenService_0 (ref), v54 (copy)
                if v49 then
                    v15.Page.Position = v53;
                    if l_UserGameSettings_0.ReducedMotion and v52 then
                        v51.InnerCanvasGroupHide.Visible = false;
                    end;
                    v15.Page.Visible = false;
                    v15.Page.Position = UDim2.new(v15.TabPosition - v48, 0, 0, 0);
                    v17 = false;
                    v15.Hidden:Fire();
                    return;
                elseif l_UserGameSettings_0.ReducedMotion and v52 then
                    v51.InnerCanvasGroupHide.GroupTransparency = 0;
                    v51.InnerCanvasGroupHide.Visible = true;
                    v15.Page.Parent = v51.InnerCanvasGroupHide;
                    local v55 = TweenInfo.new(0.25);
                    local v56 = {
                        GroupTransparency = 1
                    };
                    local v57 = l_TweenService_0:Create(v51.InnerCanvasGroupHide, v55, v56);
                    v57:Play();
                    v57.Completed:Connect(function() --[[ Line: 382 ]]
                        -- upvalues: v15 (ref), v51 (ref), v53 (ref), l_UserGameSettings_0 (ref), v52 (ref), v48 (ref), v17 (ref)
                        v15.Page.Parent = v51;
                        v15.Page.Position = v53;
                        if l_UserGameSettings_0.ReducedMotion and v52 then
                            v51.InnerCanvasGroupHide.Visible = false;
                        end;
                        v15.Page.Visible = false;
                        v15.Page.Position = UDim2.new(v15.TabPosition - v48, 0, 0, 0);
                        v17 = false;
                        v15.Hidden:Fire();
                    end);
                    return;
                else
                    v15.Page:TweenPosition(v53, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, v54);
                    return;
                end;
            end;
            if v50 then
                local l_OpenStateChangedCount_0 = v15.OpenStateChangedCount;
                delay(v50, function() --[[ Line: 394 ]]
                    -- upvalues: l_OpenStateChangedCount_0 (copy), v15 (ref), v58 (copy)
                    if l_OpenStateChangedCount_0 == v15.OpenStateChangedCount then
                        v58();
                    end;
                end);
                return;
            else
                v58();
            end;
        end;
    end;
    v15.GetDisplayed = function(_) --[[ Line: 405 ]] --[[ Name: GetDisplayed ]]
        -- upvalues: v17 (ref)
        return v17;
    end;
    v15.GetVisibility = function(_) --[[ Line: 409 ]] --[[ Name: GetVisibility ]]
        -- upvalues: v15 (copy)
        return v15.Page.Parent;
    end;
    v15.GetTabHeader = function(_) --[[ Line: 413 ]] --[[ Name: GetTabHeader ]]
        -- upvalues: v15 (copy)
        return v15.TabHeader;
    end;
    v15.GetRows = function(_) --[[ Line: 417 ]] --[[ Name: GetRows ]]
        -- upvalues: l_FFlagIEMFocusNavToButtons_0 (ref), v16 (copy)
        if not l_FFlagIEMFocusNavToButtons_0 then
            return;
        else
            return v16;
        end;
    end;
    v15.SetHub = function(_, v65) --[[ Line: 425 ]] --[[ Name: SetHub ]]
        -- upvalues: v15 (copy), v16 (copy)
        v15.HubRef = v65;
        for _, v67 in next, v16 do
            if type(v67.ValueChanger) == "table" then
                v67.ValueChanger.HubRef = v15.HubRef;
            end;
        end;
    end;
    v15.GetSize = function(_) --[[ Line: 435 ]] --[[ Name: GetSize ]]
        -- upvalues: v15 (copy)
        return v15.Page.AbsoluteSize;
    end;
    v15.AddRow = function(_, v70, v71, v72, v73) --[[ Line: 439 ]] --[[ Name: AddRow ]]
        -- upvalues: v16 (copy), v15 (copy)
        v16[#v16 + 1] = {
            SelectionFrame = v70, 
            Label = v71, 
            ValueChanger = v72
        };
        local v74 = 0;
        if v70 then
            v74 = v70.Size.Y.Offset;
        end;
        if v73 then
            v15.Page.Size = UDim2.new(1, 0, 0, v15.Page.Size.Y.Offset + v74 + v73);
        else
            v15.Page.Size = UDim2.new(1, 0, 0, v15.Page.Size.Y.Offset + v74);
        end;
        if v15.HubRef and type(v72) == "table" then
            v72.HubRef = v15.HubRef;
        end;
    end;
    return v15;
end;
return {
    CreateNewPage = function(_) --[[ Line: 465 ]] --[[ Name: CreateNewPage ]]
        -- upvalues: v75 (copy)
        return (v75());
    end
};