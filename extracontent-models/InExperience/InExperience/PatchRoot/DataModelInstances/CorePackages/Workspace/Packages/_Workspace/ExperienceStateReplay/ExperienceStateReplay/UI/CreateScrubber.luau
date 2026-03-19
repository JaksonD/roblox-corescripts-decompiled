local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.SecondsToTimeStr);
return {
    createScrubber = function(v2) --[[ Line: 7 ]] --[[ Name: createScrubber ]]
        -- upvalues: v1 (copy)
        v2.ScrubberLoadProgress = Instance.new("Frame");
        v2.ScrubberLoadProgress.Name = "ScrubberLoadProgress";
        v2.ScrubberLoadProgress.BackgroundColor3 = Color3.fromRGB(150, 150, 150);
        v2.ScrubberLoadProgress.BackgroundTransparency = 0.5;
        v2.ScrubberLoadProgress.BorderSizePixel = 0;
        v2.ScrubberLoadProgress.AnchorPoint = Vector2.new(0, 0);
        v2.ScrubberLoadProgress.Position = UDim2.new(0, 0, 0, 0);
        v2.ScrubberLoadProgress.SizeConstraint = Enum.SizeConstraint.RelativeXY;
        v2.ScrubberLoadProgress.Size = UDim2.new(0, 0, 1, 0);
        v2.ScrubberLoadProgress.Parent = v2.ScrubberControlBar;
        v2.ScrubberPlayProgress = Instance.new("Frame");
        v2.ScrubberPlayProgress.Name = "ScrubberPlayProgress";
        v2.ScrubberPlayProgress.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
        v2.ScrubberPlayProgress.BorderSizePixel = 0;
        v2.ScrubberPlayProgress.AnchorPoint = Vector2.new(0, 0);
        v2.ScrubberPlayProgress.Position = UDim2.new(0, 0, 0, 0);
        v2.ScrubberPlayProgress.SizeConstraint = Enum.SizeConstraint.RelativeXY;
        v2.ScrubberPlayProgress.Size = UDim2.new(0, 0, 1, 0);
        v2.ScrubberPlayProgress.Parent = v2.ScrubberLoadProgress;
        v2.ScrubberButton = Instance.new("TextButton");
        v2.ScrubberButton.Name = "ScrubberButton";
        v2.ScrubberButton.Text = "";
        v2.ScrubberButton.BackgroundTransparency = 1;
        v2.ScrubberButton.BorderSizePixel = 0;
        v2.ScrubberButton.AnchorPoint = Vector2.new(0, 0);
        v2.ScrubberButton.Position = UDim2.new(0, 0, 0, 0);
        v2.ScrubberButton.SizeConstraint = Enum.SizeConstraint.RelativeXY;
        v2.ScrubberButton.Size = UDim2.new(1, 0, 1, 0);
        v2.ScrubberButton.Parent = v2.ScrubberControlBar;
        v2.ScrubberTimeLabel = Instance.new("TextLabel");
        v2.ScrubberTimeLabel.Name = "ScrubberTimeLabel";
        v2.ScrubberTimeLabel.Font = Enum.Font.SourceSans;
        v2.ScrubberTimeLabel.TextXAlignment = Enum.TextXAlignment.Center;
        v2.ScrubberTimeLabel.TextYAlignment = Enum.TextYAlignment.Center;
        v2.ScrubberTimeLabel.Size = UDim2.new(0.15, 0, 1.3, 0);
        v2.ScrubberTimeLabel.SizeConstraint = Enum.SizeConstraint.RelativeXY;
        v2.ScrubberTimeLabel.AnchorPoint = Vector2.new(0.5, 1);
        v2.ScrubberTimeLabel.Position = UDim2.new(0, 0, 0, 0);
        v2.ScrubberTimeLabel.BorderSizePixel = 0;
        v2.ScrubberTimeLabel.BackgroundColor3 = v2.defaultBackgroundColor3;
        v2.ScrubberTimeLabel.BackgroundTransparency = v2.defaultBackgroundTransparency;
        v2.ScrubberTimeLabel.Text = v1.convertSecondsToTimeStr(0);
        v2.ScrubberTimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
        v2.ScrubberTimeLabel.TextScaled = true;
        v2.ScrubberTimeLabel.Parent = v2.ScrubberControlBar;
        v2.ScrubberTimeLabel.Visible = false;
        local l_UIPadding_0 = Instance.new("UIPadding");
        l_UIPadding_0.PaddingBottom = UDim.new(0.05, 0);
        l_UIPadding_0.Parent = v2.ScrubberTimeLabel;
        local l_ScrubberControlBar_0 = v2.ScrubberControlBar;
        if not l_ScrubberControlBar_0 then
            warn("No ScrubberControlBar found");
            return;
        else
            local function v11(v5) --[[ Line: 69 ]]
                -- upvalues: v2 (copy), l_ScrubberControlBar_0 (copy), v1 (ref)
                local l_ScrubberTimeLabel_0 = v2.ScrubberTimeLabel;
                if not l_ScrubberTimeLabel_0 then
                    warn("No ScrubberTimeLabel found");
                    return;
                else
                    l_ScrubberTimeLabel_0.Position = UDim2.new(0, v5 - l_ScrubberControlBar_0.AbsolutePosition.X, 0, 0);
                    local l_X_0 = l_ScrubberControlBar_0.AbsolutePosition.X;
                    local v8 = l_X_0 + l_ScrubberControlBar_0.AbsoluteSize.X;
                    local v9 = (v5 - l_X_0) / (v8 - l_X_0);
                    local v10 = v9 * v2.overallLengthSeconds;
                    v2.ScrubberTimeLabel.Text = v1.convertSecondsToTimeStr(v10);
                    if v9 > 0.75 then
                        v2.ScrubberTimeLabel.AnchorPoint = Vector2.new(1, 1);
                        return;
                    else
                        v2.ScrubberTimeLabel.AnchorPoint = Vector2.new(0.5, 1);
                        return;
                    end;
                end;
            end;
            l_ScrubberControlBar_0.MouseEnter:Connect(function(v12) --[[ Line: 90 ]]
                -- upvalues: v2 (copy), v11 (copy)
                v2.ScrubberTimeLabel.Visible = true;
                v11(v12);
            end);
            l_ScrubberControlBar_0.MouseMoved:Connect(function(v13) --[[ Line: 94 ]]
                -- upvalues: v11 (copy)
                v11(v13);
            end);
            l_ScrubberControlBar_0.MouseLeave:Connect(function() --[[ Line: 97 ]]
                -- upvalues: v2 (copy)
                v2.ScrubberTimeLabel.Visible = false;
            end);
            return;
        end;
    end
};