local l_CoreGui_0 = game:GetService("CoreGui");
local l_Folder_0 = Instance.new("Folder");
l_Folder_0.Name = "Highlights";
l_Folder_0.Parent = l_CoreGui_0;
return {
    setUpHighlight = function() --[[ Line: 9 ]] --[[ Name: setUpHighlight ]]
        -- upvalues: l_Folder_0 (copy)
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Parent = l_Folder_0;
        l_ScreenGui_0.DisplayOrder = 9999999;
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = "Highlight";
        l_Frame_0.BackgroundTransparency = 1;
        l_Frame_0.BorderSizePixel = 0;
        l_Frame_0.Size = UDim2.new();
        l_Frame_0.Position = UDim2.new();
        l_Frame_0.Interactable = false;
        l_Frame_0.Parent = l_ScreenGui_0;
        local l_UIStroke_0 = Instance.new("UIStroke");
        l_UIStroke_0.Color = Color3.fromRGB(51, 95, 255);
        l_UIStroke_0.Thickness = 2;
        l_UIStroke_0.Parent = l_Frame_0;
        local l_UICorner_0 = Instance.new("UICorner");
        l_UICorner_0.CornerRadius = UDim.new(0, 8);
        l_UICorner_0.Parent = l_Frame_0;
        return l_Frame_0;
    end, 
    cleanUpHighlight = function() --[[ Line: 34 ]] --[[ Name: cleanUpHighlight ]]
        -- upvalues: l_Folder_0 (copy)
        l_Folder_0:ClearAllChildren();
    end, 
    highlight = function(v6, v7) --[[ Line: 39 ]] --[[ Name: highlight ]]
        if not v7 then
            v6.Visible = false;
            return;
        else
            v6.Size = UDim2.fromOffset(v7.AbsoluteSize.X, v7.AbsoluteSize.Y);
            v6.Position = UDim2.fromOffset(v7.AbsolutePosition.X, v7.AbsolutePosition.Y);
            v6.Visible = true;
            return;
        end;
    end
};