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
local v14 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagIEMFocusNavToButtons_0 = v14.FFlagIEMFocusNavToButtons;
local l_FFlagIEMTabFocusNav_0 = v14.FFlagIEMTabFocusNav;
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local function v79() --[[ Line: 44 ]] --[[ Name: Initialize ]]
    -- upvalues: l_FFlagIEMFocusNavToButtons_0 (copy), l_Signal_0 (copy), l_FFlagIEMTabFocusNav_0 (copy), l_Create_0 (copy), v6 (copy), v11 (copy), v7 (copy), l_GuiService_0 (copy), l_HttpService_0 (copy), v13 (copy), l_UserGameSettings_0 (copy), v12 (copy), l_TweenService_0 (copy), l_game_EngineFeature_0 (copy)
    local v18 = {
        HubRef = nil, 
        LastSelectedObject = nil, 
        TabPosition = 0, 
        Active = false, 
        OpenStateChangedCount = 0, 
        ShouldShowBottomBar = true, 
        ShouldShowHubBar = true, 
        ShouldDisableDefaultScroll = false, 
        IsPageClipped = true, 
        SelectARow = nil
    };
    if l_FFlagIEMFocusNavToButtons_0 then
        v18.LastSelectableObjectsUpdated = l_Signal_0.new();
        v18.LastSelectableObjects = {};
        v18.PageNextSelectionDown = nil;
    end;
    if l_FFlagIEMTabFocusNav_0 then
        v18.FirstSelectableObjectsUpdated = l_Signal_0.new();
        v18.FirstSelectableObjects = {};
    end;
    local v19 = {};
    local v20 = false;
    v18.TabHeader = l_Create_0("TextButton")({
        Name = "Header", 
        Text = "", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.2, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        Selectable = l_FFlagIEMTabFocusNav_0 and true or not l_FFlagIEMFocusNavToButtons_0 and nil
    });
    if v6:IsSmallTouchScreen() then
        v18.TabHeader.Size = UDim2.new(0, 84, 1, 0);
    elseif v11 then
        v18.TabHeader.Size = UDim2.new(0, 220, 1, 0);
    end;
    if l_FFlagIEMTabFocusNav_0 then
        local function v21() --[[ Line: 84 ]] --[[ Name: switchToPage ]]
            -- upvalues: v18 (copy)
            if v18.HubRef and v18.HubRef.Pages.CurrentPage ~= v18 then
                v18.HubRef:SwitchToPage(v18, true);
            end;
        end;
        v18.TabHeader.Activated:connect(v21);
        v18.TabHeader.SelectionGained:connect(v21);
    else
        v18.TabHeader.MouseButton1Click:connect(function() --[[ Line: 92 ]]
            -- upvalues: v18 (copy)
            if v18.HubRef then
                v18.HubRef:SwitchToPage(v18, true);
            end;
        end);
    end;
    local v22 = l_Create_0("TextLabel")({
        Name = "Icon", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0, 10, 0.5, -18), 
        Text = "", 
        TextColor3 = Color3.new(1, 1, 1), 
        TextScaled = true, 
        TextTransparency = 0.5, 
        Parent = v18.TabHeader
    });
    local _ = l_Create_0("UIAspectRatioConstraint")({
        Name = "AspectRatioConstraint", 
        AspectRatio = 1, 
        Parent = v22
    });
    local v24 = l_Create_0("TextLabel")({
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
    v24.TextSize = v7.textSize(24);
    local l_UITextSizeConstraint_0 = Instance.new("UITextSizeConstraint");
    l_UITextSizeConstraint_0.MaxTextSize = v7.textSize(24);
    v24.Parent = v22;
    if v6:IsPortrait() and v6:IsSmallTouchScreen() then
        l_UITextSizeConstraint_0.Parent = v24;
    end;
    if v6:IsSmallTouchScreen() then
        v24.TextSize = v7.textSize(18);
        l_UITextSizeConstraint_0.MaxTextSize = v7.textSize(18);
    elseif v11 then
        v24.TextSize = v7.textSize(48);
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
        Parent = v18.TabHeader
    });
    local v27 = l_Create_0("Frame")({
        Name = "TabLabel", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Parent = v18.TabHeader
    });
    l_Create_0("UIListLayout")({
        Name = "Layout", 
        FillDirection = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 10), 
        Parent = v27
    });
    v22.Parent = v27;
    v24.Parent = v27;
    v24.Size = UDim2.new(0, 0, 0, 0);
    v24.AutomaticSize = Enum.AutomaticSize.XY;
    local function v31() --[[ Line: 182 ]] --[[ Name: onResized ]]
        -- upvalues: v18 (copy), v6 (ref), v22 (copy), v11 (ref), v7 (ref), v27 (copy), v24 (copy)
        if not v18.TabHeader then
            return;
        else
            if v6:IsSmallTouchScreen() then
                v22.Size = UDim2.new(0, 34, 0, 28);
            elseif v11 then
                v22.Size = UDim2.new(0, 88, 0, 74);
            else
                local v28 = v7.getIconSize(v7.IconSize.Medium);
                v22.Size = UDim2.fromOffset(v28, v28);
            end;
            local v29 = v6:IsPortrait();
            local l_Layout_0 = v27.Layout;
            if v29 then
                if v6:IsSmallTouchScreen() then
                    v24.FontSize = v7.fontSize(Enum.FontSize.Size14);
                end;
                v22.Size = UDim2.new(0, 22, 0, 22);
                l_Layout_0.FillDirection = Enum.FillDirection.Vertical;
                l_Layout_0.Padding = UDim.new(0, 0);
            else
                if v6:IsSmallTouchScreen() then
                    v24.FontSize = v7.fontSize(Enum.FontSize.Size18);
                end;
                l_Layout_0.FillDirection = Enum.FillDirection.Horizontal;
                l_Layout_0.Padding = UDim.new(0, 10);
            end;
            v22.Size = UDim2.fromOffset(v22.Size.X.Offset * 0.6666666666666666, v22.Size.Y.Offset * 0.6666666666666666);
            return;
        end;
    end;
    v6:OnResized(v18.TabHeader, v31);
    v18.Page = l_Create_0("Frame")({
        Name = "Page", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    });
    l_Create_0("UIPadding")({
        PaddingLeft = UDim.new(0, 12), 
        PaddingRight = UDim.new(0, 11), 
        Parent = v18.Page
    });
    v18.PageListLayout = l_Create_0("UIListLayout")({
        Name = "RowListLayout", 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = UDim.new(0, 8), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Parent = v18.Page
    });
    l_GuiService_0:AddSelectionParent(l_HttpService_0:GenerateGUID(false), v18.Page);
    v18.Displayed = Instance.new("BindableEvent");
    v18.Displayed.Name = "Displayed";
    v18.Displayed.Event:connect(function() --[[ Line: 256 ]]
        -- upvalues: v18 (copy)
        if not v18.HubRef.Shield.Visible then
            return;
        else
            v18:SelectARow();
            return;
        end;
    end);
    v18.Hidden = Instance.new("BindableEvent");
    v18.Hidden.Event:connect(function() --[[ Line: 262 ]]
        -- upvalues: l_GuiService_0 (ref), v18 (copy)
        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v18.Page) then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end);
    v18.Hidden.Name = "Hidden";
    v18.getValueChangerFrame = function(_, v33) --[[ Line: 270 ]] --[[ Name: getValueChangerFrame ]]
        local _ = nil;
        if type(v33) ~= "table" then
            return v33;
        else
            return v33.SliderFrame and v33.SliderFrame or v33.SelectorFrame or v33.DropDownFrame;
        end;
    end;
    v18.SelectARow = function(_, v36) --[[ Line: 282 ]] --[[ Name: SelectARow ]]
        -- upvalues: l_FFlagIEMTabFocusNav_0 (ref), l_GuiService_0 (ref), v18 (copy), v19 (copy), v13 (ref), l_FFlagIEMFocusNavToButtons_0 (ref)
        if l_FFlagIEMTabFocusNav_0 and not v36 and l_GuiService_0.SelectedCoreObject == v18.TabHeader then
            return;
        else
            if v36 or not l_GuiService_0.SelectedCoreObject or not l_GuiService_0.SelectedCoreObject:IsDescendantOf(v18.Page) then
                if v18.LastSelectedObject then
                    l_GuiService_0.SelectedCoreObject = v18.LastSelectedObject;
                    return;
                elseif v19 and #v19 > 0 then
                    local v37 = nil;
                    if v13 then
                        local v38 = 1e999;
                        local l_ValueChanger_0 = v19[1].ValueChanger;
                        for _, v41 in v19 do
                            if v41.SelectionFrame and v41.SelectionFrame.LayoutOrder < v38 then
                                v38 = v41.SelectionFrame.LayoutOrder;
                                l_ValueChanger_0 = v41;
                            end;
                        end;
                        v37 = v18:getValueChangerFrame(l_ValueChanger_0.ValueChanger);
                    else
                        v37 = v18:getValueChangerFrame(v19[1].ValueChanger);
                    end;
                    l_GuiService_0.SelectedCoreObject = v37;
                    return;
                elseif l_FFlagIEMFocusNavToButtons_0 and v18.PageNextSelectionDown then
                    l_GuiService_0.SelectedCoreObject = v18.PageNextSelectionDown;
                end;
            end;
            return;
        end;
    end;
    v18.Display = function(_, v43, v44) --[[ Line: 313 ]] --[[ Name: Display ]]
        -- upvalues: v18 (copy), v22 (copy), v24 (copy), l_UserGameSettings_0 (ref), v12 (ref), v20 (ref), l_TweenService_0 (ref), l_game_EngineFeature_0 (ref)
        v18.OpenStateChangedCount = v18.OpenStateChangedCount + 1;
        if v18.TabHeader then
            v18.TabHeader.TabSelection.Visible = true;
            v22.TextTransparency = 0;
            v24.TextTransparency = 0;
        end;
        v18.Page.Parent = v43;
        v18.Page.Visible = true;
        local v45 = UDim2.new(0, 0, 0, 0);
        local function v46() --[[ Line: 326 ]]
            -- upvalues: l_UserGameSettings_0 (ref), v43 (copy), v12 (ref), v18 (ref), v45 (copy), v20 (ref)
            if l_UserGameSettings_0.ReducedMotion then
                v43.InnerCanvasGroupShow.Visible = false;
            end;
            if v12() then
                if l_UserGameSettings_0.ReducedMotion then
                    v43.InnerCanvasGroupShow.GroupTransparency = 0;
                end;
                v18.Page.Position = v45;
            end;
            v18.Page.Visible = true;
            v20 = true;
            v18.Displayed:Fire();
        end;
        if v44 then
            v18.Page.Position = v45;
            if l_UserGameSettings_0.ReducedMotion then
                v43.InnerCanvasGroupShow.Visible = false;
            end;
            if v12() then
                if l_UserGameSettings_0.ReducedMotion then
                    v43.InnerCanvasGroupShow.GroupTransparency = 0;
                end;
                v18.Page.Position = v45;
            end;
            v18.Page.Visible = true;
            v20 = true;
            v18.Displayed:Fire();
            return;
        elseif l_UserGameSettings_0.ReducedMotion then
            v18.Page.Position = v45;
            v43.InnerCanvasGroupShow.GroupTransparency = 1;
            v43.InnerCanvasGroupShow.Visible = true;
            v18.Page.Parent = v43.InnerCanvasGroupShow;
            v18.Page.Visible = true;
            local v47 = TweenInfo.new(0.25);
            local v48 = {
                GroupTransparency = 0
            };
            local v49 = l_TweenService_0:Create(v43.InnerCanvasGroupShow, v47, v48);
            v49:Play();
            v49.Completed:Connect(function() --[[ Line: 357 ]]
                -- upvalues: v18 (ref), v43 (copy), l_UserGameSettings_0 (ref), v12 (ref), v45 (copy), v20 (ref)
                v18.Page.Parent = v43;
                if l_UserGameSettings_0.ReducedMotion then
                    v43.InnerCanvasGroupShow.Visible = false;
                end;
                if v12() then
                    if l_UserGameSettings_0.ReducedMotion then
                        v43.InnerCanvasGroupShow.GroupTransparency = 0;
                    end;
                    v18.Page.Position = v45;
                end;
                v18.Page.Visible = true;
                v20 = true;
                v18.Displayed:Fire();
            end);
            return;
        elseif l_game_EngineFeature_0 then
            v18.Page:TweenPositionInternal(v45, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, v46);
            return;
        else
            v18.Page:TweenPosition(v45, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, v46);
            return;
        end;
    end;
    v18.Hide = function(_, v51, v52, v53, v54, v55, v56) --[[ Line: 369 ]] --[[ Name: Hide ]]
        -- upvalues: v18 (copy), v22 (copy), v24 (copy), l_UserGameSettings_0 (ref), v20 (ref), l_TweenService_0 (ref), l_game_EngineFeature_0 (ref)
        v18.OpenStateChangedCount = v18.OpenStateChangedCount + 1;
        if v18.TabHeader then
            v18.TabHeader.TabSelection.Visible = false;
            v22.TextTransparency = 0.5;
            v24.TextTransparency = 0.5;
        end;
        if v18.Page.Parent then
            local v57 = UDim2.new(1 * v51, 0, 0, 0);
            local function v58() --[[ Line: 380 ]]
                -- upvalues: l_UserGameSettings_0 (ref), v56 (copy), v55 (copy), v18 (ref), v52 (copy), v20 (ref)
                if l_UserGameSettings_0.ReducedMotion and v56 then
                    v55.InnerCanvasGroupHide.Visible = false;
                end;
                v18.Page.Visible = false;
                v18.Page.Position = UDim2.new(v18.TabPosition - v52, 0, 0, 0);
                v20 = false;
                v18.Hidden:Fire();
            end;
            local function v62() --[[ Line: 390 ]]
                -- upvalues: v53 (copy), v18 (ref), v57 (copy), l_UserGameSettings_0 (ref), v56 (copy), v55 (copy), v52 (copy), v20 (ref), l_TweenService_0 (ref), l_game_EngineFeature_0 (ref), v58 (copy)
                if v53 then
                    v18.Page.Position = v57;
                    if l_UserGameSettings_0.ReducedMotion and v56 then
                        v55.InnerCanvasGroupHide.Visible = false;
                    end;
                    v18.Page.Visible = false;
                    v18.Page.Position = UDim2.new(v18.TabPosition - v52, 0, 0, 0);
                    v20 = false;
                    v18.Hidden:Fire();
                    return;
                elseif l_UserGameSettings_0.ReducedMotion and v56 then
                    v55.InnerCanvasGroupHide.GroupTransparency = 0;
                    v55.InnerCanvasGroupHide.Visible = true;
                    v18.Page.Parent = v55.InnerCanvasGroupHide;
                    local v59 = TweenInfo.new(0.25);
                    local v60 = {
                        GroupTransparency = 1
                    };
                    local v61 = l_TweenService_0:Create(v55.InnerCanvasGroupHide, v59, v60);
                    v61:Play();
                    v61.Completed:Connect(function() --[[ Line: 406 ]]
                        -- upvalues: v18 (ref), v55 (ref), v57 (ref), l_UserGameSettings_0 (ref), v56 (ref), v52 (ref), v20 (ref)
                        v18.Page.Parent = v55;
                        v18.Page.Position = v57;
                        if l_UserGameSettings_0.ReducedMotion and v56 then
                            v55.InnerCanvasGroupHide.Visible = false;
                        end;
                        v18.Page.Visible = false;
                        v18.Page.Position = UDim2.new(v18.TabPosition - v52, 0, 0, 0);
                        v20 = false;
                        v18.Hidden:Fire();
                    end);
                    return;
                elseif l_game_EngineFeature_0 then
                    v18.Page:TweenPositionInternal(v57, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, v58);
                    return;
                else
                    v18.Page:TweenPosition(v57, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, v58);
                    return;
                end;
            end;
            if v54 then
                local l_OpenStateChangedCount_0 = v18.OpenStateChangedCount;
                delay(v54, function() --[[ Line: 422 ]]
                    -- upvalues: l_OpenStateChangedCount_0 (copy), v18 (ref), v62 (copy)
                    if l_OpenStateChangedCount_0 == v18.OpenStateChangedCount then
                        v62();
                    end;
                end);
                return;
            else
                v62();
            end;
        end;
    end;
    v18.GetDisplayed = function(_) --[[ Line: 433 ]] --[[ Name: GetDisplayed ]]
        -- upvalues: v20 (ref)
        return v20;
    end;
    v18.GetVisibility = function(_) --[[ Line: 437 ]] --[[ Name: GetVisibility ]]
        -- upvalues: v18 (copy)
        return v18.Page.Parent;
    end;
    v18.GetTabHeader = function(_) --[[ Line: 441 ]] --[[ Name: GetTabHeader ]]
        -- upvalues: v18 (copy)
        return v18.TabHeader;
    end;
    v18.GetRows = function(_) --[[ Line: 445 ]] --[[ Name: GetRows ]]
        -- upvalues: l_FFlagIEMFocusNavToButtons_0 (ref), v19 (copy)
        if not l_FFlagIEMFocusNavToButtons_0 then
            return;
        else
            return v19;
        end;
    end;
    v18.SetHub = function(_, v69) --[[ Line: 453 ]] --[[ Name: SetHub ]]
        -- upvalues: v18 (copy), v19 (copy)
        v18.HubRef = v69;
        for _, v71 in next, v19 do
            if type(v71.ValueChanger) == "table" then
                v71.ValueChanger.HubRef = v18.HubRef;
            end;
        end;
    end;
    v18.GetSize = function(_) --[[ Line: 463 ]] --[[ Name: GetSize ]]
        -- upvalues: v18 (copy)
        return v18.Page.AbsoluteSize;
    end;
    v18.AddRow = function(_, v74, v75, v76, v77) --[[ Line: 467 ]] --[[ Name: AddRow ]]
        -- upvalues: v19 (copy), v18 (copy)
        v19[#v19 + 1] = {
            SelectionFrame = v74, 
            Label = v75, 
            ValueChanger = v76
        };
        local v78 = 0;
        if v74 then
            v78 = v74.Size.Y.Offset;
        end;
        if v77 then
            v18.Page.Size = UDim2.new(1, 0, 0, v18.Page.Size.Y.Offset + v78 + v77);
        else
            v18.Page.Size = UDim2.new(1, 0, 0, v18.Page.Size.Y.Offset + v78);
        end;
        if v18.HubRef and type(v76) == "table" then
            v76.HubRef = v18.HubRef;
        end;
    end;
    return v18;
end;
return {
    CreateNewPage = function(_) --[[ Line: 493 ]] --[[ Name: CreateNewPage ]]
        -- upvalues: v79 (copy)
        return (v79());
    end
};