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
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local function v76() --[[ Line: 43 ]] --[[ Name: Initialize ]]
    -- upvalues: l_FFlagIEMFocusNavToButtons_0 (copy), l_Signal_0 (copy), l_Create_0 (copy), v6 (copy), v11 (copy), v7 (copy), l_GuiService_0 (copy), l_HttpService_0 (copy), v13 (copy), l_UserGameSettings_0 (copy), v12 (copy), l_TweenService_0 (copy), l_game_EngineFeature_0 (copy)
    local v16 = {
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
        v16.LastSelectableObjectsUpdated = l_Signal_0.new();
        v16.LastSelectableObjects = {};
        v16.PageNextSelectionDown = nil;
    end;
    local v17 = {};
    local v18 = false;
    v16.TabHeader = l_Create_0("TextButton")({
        Name = "Header", 
        Text = "", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.2, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        Selectable = not l_FFlagIEMFocusNavToButtons_0 and nil
    });
    if v6:IsSmallTouchScreen() then
        v16.TabHeader.Size = UDim2.new(0, 84, 1, 0);
    elseif v11 then
        v16.TabHeader.Size = UDim2.new(0, 220, 1, 0);
    end;
    v16.TabHeader.MouseButton1Click:connect(function() --[[ Line: 77 ]]
        -- upvalues: v16 (copy)
        if v16.HubRef then
            v16.HubRef:SwitchToPage(v16, true);
        end;
    end);
    local v19 = l_Create_0("TextLabel")({
        Name = "Icon", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0, 10, 0.5, -18), 
        Text = "", 
        TextColor3 = Color3.new(1, 1, 1), 
        TextScaled = true, 
        TextTransparency = 0.5, 
        Parent = v16.TabHeader
    });
    local _ = l_Create_0("UIAspectRatioConstraint")({
        Name = "AspectRatioConstraint", 
        AspectRatio = 1, 
        Parent = v19
    });
    local v21 = l_Create_0("TextLabel")({
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
    v21.TextSize = v7.textSize(24);
    local l_UITextSizeConstraint_0 = Instance.new("UITextSizeConstraint");
    l_UITextSizeConstraint_0.MaxTextSize = v7.textSize(24);
    v21.Parent = v19;
    if v6:IsPortrait() and v6:IsSmallTouchScreen() then
        l_UITextSizeConstraint_0.Parent = v21;
    end;
    if v6:IsSmallTouchScreen() then
        v21.TextSize = v7.textSize(18);
        l_UITextSizeConstraint_0.MaxTextSize = v7.textSize(18);
    elseif v11 then
        v21.TextSize = v7.textSize(48);
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
        Parent = v16.TabHeader
    });
    local v24 = l_Create_0("Frame")({
        Name = "TabLabel", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Parent = v16.TabHeader
    });
    l_Create_0("UIListLayout")({
        Name = "Layout", 
        FillDirection = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 10), 
        Parent = v24
    });
    v19.Parent = v24;
    v21.Parent = v24;
    v21.Size = UDim2.new(0, 0, 0, 0);
    v21.AutomaticSize = Enum.AutomaticSize.XY;
    local function v28() --[[ Line: 166 ]] --[[ Name: onResized ]]
        -- upvalues: v16 (copy), v6 (ref), v19 (copy), v11 (ref), v7 (ref), v24 (copy), v21 (copy)
        if not v16.TabHeader then
            return;
        else
            if v6:IsSmallTouchScreen() then
                v19.Size = UDim2.new(0, 34, 0, 28);
            elseif v11 then
                v19.Size = UDim2.new(0, 88, 0, 74);
            else
                local v25 = v7.getIconSize(v7.IconSize.Medium);
                v19.Size = UDim2.fromOffset(v25, v25);
            end;
            local v26 = v6:IsPortrait();
            local l_Layout_0 = v24.Layout;
            if v26 then
                if v6:IsSmallTouchScreen() then
                    v21.FontSize = v7.fontSize(Enum.FontSize.Size14);
                end;
                v19.Size = UDim2.new(0, 22, 0, 22);
                l_Layout_0.FillDirection = Enum.FillDirection.Vertical;
                l_Layout_0.Padding = UDim.new(0, 0);
            else
                if v6:IsSmallTouchScreen() then
                    v21.FontSize = v7.fontSize(Enum.FontSize.Size18);
                end;
                l_Layout_0.FillDirection = Enum.FillDirection.Horizontal;
                l_Layout_0.Padding = UDim.new(0, 10);
            end;
            v19.Size = UDim2.fromOffset(v19.Size.X.Offset * 0.6666666666666666, v19.Size.Y.Offset * 0.6666666666666666);
            return;
        end;
    end;
    v6:OnResized(v16.TabHeader, v28);
    v16.Page = l_Create_0("Frame")({
        Name = "Page", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    });
    l_Create_0("UIPadding")({
        PaddingLeft = UDim.new(0, 12), 
        PaddingRight = UDim.new(0, 11), 
        Parent = v16.Page
    });
    v16.PageListLayout = l_Create_0("UIListLayout")({
        Name = "RowListLayout", 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = UDim.new(0, 8), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Parent = v16.Page
    });
    l_GuiService_0:AddSelectionParent(l_HttpService_0:GenerateGUID(false), v16.Page);
    v16.Displayed = Instance.new("BindableEvent");
    v16.Displayed.Name = "Displayed";
    v16.Displayed.Event:connect(function() --[[ Line: 240 ]]
        -- upvalues: v16 (copy)
        if not v16.HubRef.Shield.Visible then
            return;
        else
            v16:SelectARow();
            return;
        end;
    end);
    v16.Hidden = Instance.new("BindableEvent");
    v16.Hidden.Event:connect(function() --[[ Line: 247 ]]
        -- upvalues: l_GuiService_0 (ref), v16 (copy)
        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v16.Page) then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end);
    v16.Hidden.Name = "Hidden";
    v16.getValueChangerFrame = function(_, v30) --[[ Line: 255 ]] --[[ Name: getValueChangerFrame ]]
        local _ = nil;
        if type(v30) ~= "table" then
            return v30;
        else
            return v30.SliderFrame and v30.SliderFrame or v30.SelectorFrame or v30.DropDownFrame;
        end;
    end;
    v16.SelectARow = function(_, v33) --[[ Line: 267 ]] --[[ Name: SelectARow ]]
        -- upvalues: l_GuiService_0 (ref), v16 (copy), v17 (copy), v13 (ref), l_FFlagIEMFocusNavToButtons_0 (ref)
        if v33 or not l_GuiService_0.SelectedCoreObject or not l_GuiService_0.SelectedCoreObject:IsDescendantOf(v16.Page) then
            if v16.LastSelectedObject then
                l_GuiService_0.SelectedCoreObject = v16.LastSelectedObject;
                return;
            elseif v17 and #v17 > 0 then
                local v34 = nil;
                if v13 then
                    local v35 = 1e999;
                    local l_ValueChanger_0 = v17[1].ValueChanger;
                    for _, v38 in v17 do
                        if v38.SelectionFrame and v38.SelectionFrame.LayoutOrder < v35 then
                            v35 = v38.SelectionFrame.LayoutOrder;
                            l_ValueChanger_0 = v38;
                        end;
                    end;
                    v34 = v16:getValueChangerFrame(l_ValueChanger_0.ValueChanger);
                else
                    v34 = v16:getValueChangerFrame(v17[1].ValueChanger);
                end;
                l_GuiService_0.SelectedCoreObject = v34;
                return;
            elseif l_FFlagIEMFocusNavToButtons_0 and v16.PageNextSelectionDown then
                l_GuiService_0.SelectedCoreObject = v16.PageNextSelectionDown;
            end;
        end;
    end;
    v16.Display = function(_, v40, v41) --[[ Line: 295 ]] --[[ Name: Display ]]
        -- upvalues: v16 (copy), v19 (copy), v21 (copy), l_UserGameSettings_0 (ref), v12 (ref), v18 (ref), l_TweenService_0 (ref), l_game_EngineFeature_0 (ref)
        v16.OpenStateChangedCount = v16.OpenStateChangedCount + 1;
        if v16.TabHeader then
            v16.TabHeader.TabSelection.Visible = true;
            v19.TextTransparency = 0;
            v21.TextTransparency = 0;
        end;
        v16.Page.Parent = v40;
        v16.Page.Visible = true;
        local v42 = UDim2.new(0, 0, 0, 0);
        local function v43() --[[ Line: 308 ]]
            -- upvalues: l_UserGameSettings_0 (ref), v40 (copy), v12 (ref), v16 (ref), v42 (copy), v18 (ref)
            if l_UserGameSettings_0.ReducedMotion then
                v40.InnerCanvasGroupShow.Visible = false;
            end;
            if v12() then
                if l_UserGameSettings_0.ReducedMotion then
                    v40.InnerCanvasGroupShow.GroupTransparency = 0;
                end;
                v16.Page.Position = v42;
            end;
            v16.Page.Visible = true;
            v18 = true;
            v16.Displayed:Fire();
        end;
        if v41 then
            v16.Page.Position = v42;
            if l_UserGameSettings_0.ReducedMotion then
                v40.InnerCanvasGroupShow.Visible = false;
            end;
            if v12() then
                if l_UserGameSettings_0.ReducedMotion then
                    v40.InnerCanvasGroupShow.GroupTransparency = 0;
                end;
                v16.Page.Position = v42;
            end;
            v16.Page.Visible = true;
            v18 = true;
            v16.Displayed:Fire();
            return;
        elseif l_UserGameSettings_0.ReducedMotion then
            v16.Page.Position = v42;
            v40.InnerCanvasGroupShow.GroupTransparency = 1;
            v40.InnerCanvasGroupShow.Visible = true;
            v16.Page.Parent = v40.InnerCanvasGroupShow;
            v16.Page.Visible = true;
            local v44 = TweenInfo.new(0.25);
            local v45 = {
                GroupTransparency = 0
            };
            local v46 = l_TweenService_0:Create(v40.InnerCanvasGroupShow, v44, v45);
            v46:Play();
            v46.Completed:Connect(function() --[[ Line: 339 ]]
                -- upvalues: v16 (ref), v40 (copy), l_UserGameSettings_0 (ref), v12 (ref), v42 (copy), v18 (ref)
                v16.Page.Parent = v40;
                if l_UserGameSettings_0.ReducedMotion then
                    v40.InnerCanvasGroupShow.Visible = false;
                end;
                if v12() then
                    if l_UserGameSettings_0.ReducedMotion then
                        v40.InnerCanvasGroupShow.GroupTransparency = 0;
                    end;
                    v16.Page.Position = v42;
                end;
                v16.Page.Visible = true;
                v18 = true;
                v16.Displayed:Fire();
            end);
            return;
        elseif l_game_EngineFeature_0 then
            v16.Page:TweenPositionInternal(v42, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, v43);
            return;
        else
            v16.Page:TweenPosition(v42, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, v43);
            return;
        end;
    end;
    v16.Hide = function(_, v48, v49, v50, v51, v52, v53) --[[ Line: 351 ]] --[[ Name: Hide ]]
        -- upvalues: v16 (copy), v19 (copy), v21 (copy), l_UserGameSettings_0 (ref), v18 (ref), l_TweenService_0 (ref), l_game_EngineFeature_0 (ref)
        v16.OpenStateChangedCount = v16.OpenStateChangedCount + 1;
        if v16.TabHeader then
            v16.TabHeader.TabSelection.Visible = false;
            v19.TextTransparency = 0.5;
            v21.TextTransparency = 0.5;
        end;
        if v16.Page.Parent then
            local v54 = UDim2.new(1 * v48, 0, 0, 0);
            local function v55() --[[ Line: 362 ]]
                -- upvalues: l_UserGameSettings_0 (ref), v53 (copy), v52 (copy), v16 (ref), v49 (copy), v18 (ref)
                if l_UserGameSettings_0.ReducedMotion and v53 then
                    v52.InnerCanvasGroupHide.Visible = false;
                end;
                v16.Page.Visible = false;
                v16.Page.Position = UDim2.new(v16.TabPosition - v49, 0, 0, 0);
                v18 = false;
                v16.Hidden:Fire();
            end;
            local function v59() --[[ Line: 372 ]]
                -- upvalues: v50 (copy), v16 (ref), v54 (copy), l_UserGameSettings_0 (ref), v53 (copy), v52 (copy), v49 (copy), v18 (ref), l_TweenService_0 (ref), l_game_EngineFeature_0 (ref), v55 (copy)
                if v50 then
                    v16.Page.Position = v54;
                    if l_UserGameSettings_0.ReducedMotion and v53 then
                        v52.InnerCanvasGroupHide.Visible = false;
                    end;
                    v16.Page.Visible = false;
                    v16.Page.Position = UDim2.new(v16.TabPosition - v49, 0, 0, 0);
                    v18 = false;
                    v16.Hidden:Fire();
                    return;
                elseif l_UserGameSettings_0.ReducedMotion and v53 then
                    v52.InnerCanvasGroupHide.GroupTransparency = 0;
                    v52.InnerCanvasGroupHide.Visible = true;
                    v16.Page.Parent = v52.InnerCanvasGroupHide;
                    local v56 = TweenInfo.new(0.25);
                    local v57 = {
                        GroupTransparency = 1
                    };
                    local v58 = l_TweenService_0:Create(v52.InnerCanvasGroupHide, v56, v57);
                    v58:Play();
                    v58.Completed:Connect(function() --[[ Line: 388 ]]
                        -- upvalues: v16 (ref), v52 (ref), v54 (ref), l_UserGameSettings_0 (ref), v53 (ref), v49 (ref), v18 (ref)
                        v16.Page.Parent = v52;
                        v16.Page.Position = v54;
                        if l_UserGameSettings_0.ReducedMotion and v53 then
                            v52.InnerCanvasGroupHide.Visible = false;
                        end;
                        v16.Page.Visible = false;
                        v16.Page.Position = UDim2.new(v16.TabPosition - v49, 0, 0, 0);
                        v18 = false;
                        v16.Hidden:Fire();
                    end);
                    return;
                elseif l_game_EngineFeature_0 then
                    v16.Page:TweenPositionInternal(v54, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, v55);
                    return;
                else
                    v16.Page:TweenPosition(v54, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, v55);
                    return;
                end;
            end;
            if v51 then
                local l_OpenStateChangedCount_0 = v16.OpenStateChangedCount;
                delay(v51, function() --[[ Line: 404 ]]
                    -- upvalues: l_OpenStateChangedCount_0 (copy), v16 (ref), v59 (copy)
                    if l_OpenStateChangedCount_0 == v16.OpenStateChangedCount then
                        v59();
                    end;
                end);
                return;
            else
                v59();
            end;
        end;
    end;
    v16.GetDisplayed = function(_) --[[ Line: 415 ]] --[[ Name: GetDisplayed ]]
        -- upvalues: v18 (ref)
        return v18;
    end;
    v16.GetVisibility = function(_) --[[ Line: 419 ]] --[[ Name: GetVisibility ]]
        -- upvalues: v16 (copy)
        return v16.Page.Parent;
    end;
    v16.GetTabHeader = function(_) --[[ Line: 423 ]] --[[ Name: GetTabHeader ]]
        -- upvalues: v16 (copy)
        return v16.TabHeader;
    end;
    v16.GetRows = function(_) --[[ Line: 427 ]] --[[ Name: GetRows ]]
        -- upvalues: l_FFlagIEMFocusNavToButtons_0 (ref), v17 (copy)
        if not l_FFlagIEMFocusNavToButtons_0 then
            return;
        else
            return v17;
        end;
    end;
    v16.SetHub = function(_, v66) --[[ Line: 435 ]] --[[ Name: SetHub ]]
        -- upvalues: v16 (copy), v17 (copy)
        v16.HubRef = v66;
        for _, v68 in next, v17 do
            if type(v68.ValueChanger) == "table" then
                v68.ValueChanger.HubRef = v16.HubRef;
            end;
        end;
    end;
    v16.GetSize = function(_) --[[ Line: 445 ]] --[[ Name: GetSize ]]
        -- upvalues: v16 (copy)
        return v16.Page.AbsoluteSize;
    end;
    v16.AddRow = function(_, v71, v72, v73, v74) --[[ Line: 449 ]] --[[ Name: AddRow ]]
        -- upvalues: v17 (copy), v16 (copy)
        v17[#v17 + 1] = {
            SelectionFrame = v71, 
            Label = v72, 
            ValueChanger = v73
        };
        local v75 = 0;
        if v71 then
            v75 = v71.Size.Y.Offset;
        end;
        if v74 then
            v16.Page.Size = UDim2.new(1, 0, 0, v16.Page.Size.Y.Offset + v75 + v74);
        else
            v16.Page.Size = UDim2.new(1, 0, 0, v16.Page.Size.Y.Offset + v75);
        end;
        if v16.HubRef and type(v73) == "table" then
            v73.HubRef = v16.HubRef;
        end;
    end;
    return v16;
end;
return {
    CreateNewPage = function(_) --[[ Line: 475 ]] --[[ Name: CreateNewPage ]]
        -- upvalues: v76 (copy)
        return (v76());
    end
};