local v0 = {};
local v1 = nil;
v0.hideOverlay = function() --[[ Line: 12 ]] --[[ Name: hideOverlay ]]
    -- upvalues: v1 (ref)
    if v1 then
        v1:Destroy();
        v1 = nil;
    end;
end;
v0.showOverlay = function(v2, v3, v4) --[[ Line: 25 ]] --[[ Name: showOverlay ]]
    -- upvalues: v0 (copy), v1 (ref)
    v0.hideOverlay();
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "TextOverlay";
    l_Frame_0.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2);
    l_Frame_0.BackgroundTransparency = 0.5;
    l_Frame_0.Size = UDim2.new(0.7, 0, 0.1, 0);
    l_Frame_0.Position = UDim2.new(0.5, 0, 0.8, 0);
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.ZIndex = 100;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "OverlayLabel";
    l_TextLabel_0.Text = v2;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextScaled = true;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Size = UDim2.new(0.8, 0, 0.8, 0);
    l_TextLabel_0.Position = UDim2.new(0.5, 0, 0.5, 0);
    l_TextLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_TextLabel_0.Font = Enum.Font.SourceSans;
    l_TextLabel_0.Parent = l_Frame_0;
    l_TextLabel_0.ZIndex = 200;
    l_Frame_0.Parent = v4;
    v1 = l_Frame_0;
    task.spawn(function() --[[ Line: 66 ]]
        -- upvalues: v3 (copy), v1 (ref), l_Frame_0 (copy), v0 (ref)
        task.wait(v3);
        if v1 == l_Frame_0 then
            v0.hideOverlay();
        end;
    end);
end;
return v0;