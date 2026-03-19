return {
    createControlBar = function(v0) --[[ Line: 4 ]] --[[ Name: createControlBar ]]
        v0.ControlBarContainer = Instance.new("Frame");
        v0.ControlBarContainer.Name = "ControlBarContainer";
        v0.ControlBarContainer.BackgroundTransparency = 1;
        v0.ControlBarContainer.BorderSizePixel = 0;
        v0.ControlBarContainer.AnchorPoint = Vector2.new(0, 1);
        v0.ControlBarContainerVisiblePosition = UDim2.new(0, 0, 1, 0);
        v0.ControlBarContainerNonVisiblePosition = UDim2.new(0, 0, 1.2, 0);
        v0.ControlBarContainer.Position = v0.ControlBarContainerVisiblePosition;
        v0.maxControlBarHeight = 45;
        v0.ControlBarContainer.Size = UDim2.new(1, 0, 0, v0.maxControlBarHeight);
        v0.ControlBarContainer.Parent = v0.screenGui;
        local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
        l_UIAspectRatioConstraint_0.AspectRatio = 30;
        l_UIAspectRatioConstraint_0.AspectType = Enum.AspectType.ScaleWithParentSize;
        l_UIAspectRatioConstraint_0.DominantAxis = Enum.DominantAxis.Width;
        l_UIAspectRatioConstraint_0.Parent = v0.ControlBarContainer;
        v0.defaultBackgroundColor3 = Color3.fromRGB(20, 20, 20);
        v0.defaultBackgroundTransparency = 0.15;
        v0.defaultButtonsTimeControlBarXSize = 0.275;
        v0.defaultHelpBarXSize = 0.025;
        v0.defaultScrubberControlBarXSize = 1 - v0.defaultButtonsTimeControlBarXSize - v0.defaultHelpBarXSize;
        v0.ButtonsTimeControlBar = Instance.new("Frame");
        v0.ButtonsTimeControlBar.Name = "ButtonsTimeControlBar";
        v0.ButtonsTimeControlBar.BackgroundColor3 = v0.defaultBackgroundColor3;
        v0.ButtonsTimeControlBar.BackgroundTransparency = v0.defaultBackgroundTransparency;
        v0.ButtonsTimeControlBar.BorderSizePixel = 0;
        v0.ButtonsTimeControlBar.SizeConstraint = Enum.SizeConstraint.RelativeXY;
        v0.ButtonsTimeControlBar.Size = UDim2.new(v0.defaultButtonsTimeControlBarXSize, 0, 1, 0);
        v0.ButtonsTimeControlBar.Parent = v0.ControlBarContainer;
        local l_UIPadding_0 = Instance.new("UIPadding");
        l_UIPadding_0.PaddingLeft = UDim.new(0.02, 0);
        l_UIPadding_0.Parent = v0.ButtonsTimeControlBar;
        v0.ScrubberControlBar = Instance.new("Frame");
        v0.ScrubberControlBar.Name = "ScrubberControlBar";
        v0.ScrubberControlBar.BackgroundColor3 = Color3.fromRGB(53, 53, 53);
        v0.ScrubberControlBar.BackgroundTransparency = 0.5;
        v0.ScrubberControlBar.BorderSizePixel = 0;
        v0.ScrubberControlBar.SizeConstraint = Enum.SizeConstraint.RelativeXY;
        v0.ScrubberControlBar.Size = UDim2.new(v0.defaultScrubberControlBarXSize, 0, 1, 0);
        v0.ScrubberControlBar.Parent = v0.ControlBarContainer;
        local l_UIFlexItem_0 = Instance.new("UIFlexItem");
        l_UIFlexItem_0.FlexMode = Enum.UIFlexMode.Fill;
        l_UIFlexItem_0.Parent = v0.ScrubberControlBar;
        v0.HelpBar = Instance.new("Frame");
        v0.HelpBar.Name = "HelpBar";
        v0.HelpBar.BackgroundColor3 = v0.defaultBackgroundColor3;
        v0.HelpBar.BackgroundTransparency = v0.defaultBackgroundTransparency;
        v0.HelpBar.BorderSizePixel = 0;
        v0.HelpBar.SizeConstraint = Enum.SizeConstraint.RelativeXY;
        v0.HelpBar.Size = UDim2.new(v0.defaultHelpBarXSize, 0, 1, 0);
        v0.HelpBar.Parent = v0.ControlBarContainer;
        v0.maxViewportScalingWidth = v0.maxControlBarHeight * l_UIAspectRatioConstraint_0.AspectRatio;
        local function v6() --[[ Line: 73 ]] --[[ Name: setupControlBarScaling ]]
            -- upvalues: v0 (copy), l_UIAspectRatioConstraint_0 (copy), l_UIPadding_0 (copy)
            v0.firstThresholdCheck = true;
            v0.lastCheckAboveThreshold = false;
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            if not l_CurrentCamera_0 then
                warn("No current camera found in workspace");
                return;
            else
                l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 81 ]]
                    -- upvalues: l_CurrentCamera_0 (copy), v0 (ref), l_UIAspectRatioConstraint_0 (ref), l_UIPadding_0 (ref)
                    if l_CurrentCamera_0.ViewportSize.X > v0.maxViewportScalingWidth then
                        if not v0.firstBoundaryCheck and v0.lastCheckAboveThreshold then
                            return;
                        else
                            v0.lastCheckAboveThreshold = true;
                            l_UIAspectRatioConstraint_0.Parent = nil;
                            local v5 = v0.ButtonsTimeControlBar.AbsoluteSize.X * l_UIPadding_0.PaddingLeft.Scale + l_UIPadding_0.PaddingLeft.Offset;
                            l_UIPadding_0.PaddingLeft = UDim.new(0, v5);
                            v0.ButtonsTimeControlBar.Size = UDim2.new(0, v0.ButtonsTimeControlBar.AbsoluteSize.X, 1, 0);
                            v0.HelpBar.Size = UDim2.new(0, v0.HelpBar.AbsoluteSize.X, 1, 0);
                        end;
                    elseif not v0.firstBoundaryCheck and not v0.lastCheckAboveThreshold then
                        return;
                    else
                        v0.lastCheckAboveThreshold = false;
                        l_UIAspectRatioConstraint_0.Parent = v0.ControlBarContainer;
                        l_UIPadding_0.PaddingLeft = UDim.new(0.02, 0);
                        v0.ButtonsTimeControlBar.Size = UDim2.new(v0.defaultButtonsTimeControlBarXSize, 0, 1, 0);
                        v0.HelpBar.Size = UDim2.new(v0.defaultHelpBarXSize, 0, 1, 0);
                    end;
                    v0.firstBoundaryCheck = false;
                end);
                return;
            end;
        end;
        v6();
        workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v6);
        v0.createUIListLayout = function(v7, v8) --[[ Line: 124 ]] --[[ Name: createUIListLayout ]]
            local l_UIListLayout_0 = Instance.new("UIListLayout");
            l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Left;
            l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
            l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
            l_UIListLayout_0.Padding = UDim.new(0, v8);
            l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
            l_UIListLayout_0.Parent = v7;
            return l_UIListLayout_0;
        end;
        v0.createUIListLayout(v0.ControlBarContainer, 0);
        v0.createUIListLayout(v0.ButtonsTimeControlBar, 7.5);
    end
};