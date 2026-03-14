return {
    createLoadingOverlay = function(v0) --[[ Line: 4 ]] --[[ Name: createLoadingOverlay ]]
        v0.LoadingOverlay = Instance.new("Frame");
        v0.LoadingOverlay.Name = "LoadingOverlay";
        v0.LoadingOverlay.BackgroundColor3 = v0.defaultBackgroundColor3;
        v0.LoadingOverlay.BackgroundTransparency = v0.defaultBackgroundTransparency;
        v0.LoadingOverlay.AnchorPoint = Vector2.new(0.5, 0.5);
        v0.LoadingOverlay.Position = UDim2.new(0.5, 0, 0.5, 0);
        v0.LoadingOverlay.BorderSizePixel = 0;
        v0.LoadingOverlay.Size = UDim2.new(0.5, 0, 0.5, 0);
        v0.LoadingOverlay.Visible = false;
        v0.LoadingOverlay.Parent = v0.screenGui;
        v0.LoadingLabel = Instance.new("TextLabel");
        v0.LoadingLabel.Name = "LoadingLabel";
        v0.LoadingLabel.Font = Enum.Font.SourceSans;
        v0.LoadingLabel.TextXAlignment = Enum.TextXAlignment.Center;
        v0.LoadingLabel.TextYAlignment = Enum.TextYAlignment.Center;
        v0.LoadingLabel.AnchorPoint = Vector2.new(0.5, 0.5);
        v0.LoadingLabel.Position = UDim2.new(0.5, 0, 0.5, 0);
        v0.LoadingLabel.Size = UDim2.new(1, 0, 1, 0);
        v0.LoadingLabel.SizeConstraint = Enum.SizeConstraint.RelativeXY;
        v0.LoadingLabel.BackgroundTransparency = 1;
        v0.LoadingLabel.Text = "Loading";
        v0.LoadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
        v0.LoadingLabel.TextScaled = true;
        v0.LoadingLabel.Parent = v0.LoadingOverlay;
    end
};