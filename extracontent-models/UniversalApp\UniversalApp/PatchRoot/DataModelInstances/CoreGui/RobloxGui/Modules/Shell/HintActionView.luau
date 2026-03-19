local l_CorePackages_0 = game:GetService("CorePackages");
local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TextService_0 = game:GetService("TextService");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_getFFlagDebugLuaAppAlwaysUseGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagDebugLuaAppAlwaysUseGamepad;
return function(v9, v10, v11) --[[ Line: 26 ]] --[[ Name: createHintActionView ]]
    -- upvalues: l_Create_0 (copy), l_GlobalSettings_0 (copy), l_TextService_0 (copy), l_Utility_0 (copy), l_ContextActionService_0 (copy), l_getFFlagDebugLuaAppAlwaysUseGamepad_0 (copy), v6 (copy)
    if v11 == nil then
        v11 = UDim2.new(1, -1, 1, -1);
    end;
    local v12 = {};
    if v10 == nil or #v10 == 0 then
        v10 = "DefaultHintAction";
    end;
    local v13 = l_Create_0("Frame")({
        Name = "HintActionContainer", 
        Size = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Parent = v9
    });
    local v14 = l_Create_0("TextLabel")({
        Name = "HintActionText", 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Right, 
        Text = "", 
        ZIndex = 10, 
        Parent = v13
    });
    local v15 = l_Create_0("ImageLabel")({
        Name = "HintActionImage", 
        Size = UDim2.new(0, 83, 0, 83), 
        BackgroundTransparency = 1, 
        Image = "", 
        ZIndex = 10, 
        Parent = v13
    });
    local function v17() --[[ Line: 69 ]] --[[ Name: updateLayout ]]
        -- upvalues: l_TextService_0 (ref), v14 (copy), l_Utility_0 (ref), v15 (copy), v13 (copy), v11 (ref)
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v14.Text, l_Utility_0.ConvertFontSizeEnumToInt(v14.FontSize), v14.Font, Vector2.new(0, 0));
        v14.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.x, 0, v15.Size.Y.Offset);
        v14.Position = UDim2.new(1, -l_l_TextService_0_TextSize_0.x, 0, -4);
        l_l_TextService_0_TextSize_0 = l_l_TextService_0_TextSize_0.x + v15.Size.X.Offset + 8;
        v13.Size = UDim2.new(0, l_l_TextService_0_TextSize_0, 0, v15.Size.Y.Offset);
        v13.Position = UDim2.new(v11.X.Scale, v11.X.Offset * v13.Size.X.Offset, v11.Y.Scale, v11.Y.Offset * v13.Size.Y.Offset);
    end;
    v12.BindAction = function(_, v19, v20) --[[ Line: 86 ]] --[[ Name: BindAction ]]
        -- upvalues: l_ContextActionService_0 (ref), v10 (ref), l_getFFlagDebugLuaAppAlwaysUseGamepad_0 (ref), v6 (ref)
        if not v19 then
            return;
        else
            l_ContextActionService_0:UnbindCoreAction(v10);
            if l_getFFlagDebugLuaAppAlwaysUseGamepad_0() and v6.Config.DebugKeyboardBindings then
                local v21 = v6.Config.DebugKeyboardBindings[v20] or {};
                l_ContextActionService_0:BindCoreAction(v10, v19, false, v20, table.unpack(v21));
                return;
            else
                l_ContextActionService_0:BindCoreAction(v10, v19, false, v20);
                return;
            end;
        end;
    end;
    v12.UnbindAction = function(_) --[[ Line: 100 ]] --[[ Name: UnbindAction ]]
        -- upvalues: l_ContextActionService_0 (ref), v10 (ref)
        l_ContextActionService_0:UnbindCoreAction(v10);
    end;
    v12.SetParent = function(_, v24) --[[ Line: 104 ]] --[[ Name: SetParent ]]
        -- upvalues: v13 (copy)
        v13.Parent = v24;
    end;
    v12.SetVisible = function(_, v26) --[[ Line: 108 ]] --[[ Name: SetVisible ]]
        -- upvalues: v13 (copy)
        v13.Visible = v26;
    end;
    v12.SetTransparency = function(_, v28) --[[ Line: 112 ]] --[[ Name: SetTransparency ]]
        -- upvalues: v14 (copy), v15 (copy)
        v14.TextTransparency = v28;
        v15.ImageTransparency = v28;
    end;
    v12.SetVisibleWithTween = function(_, v30) --[[ Line: 117 ]] --[[ Name: SetVisibleWithTween ]]
        -- upvalues: l_Utility_0 (ref), v14 (copy), v15 (copy)
        l_Utility_0.PropertyTweener(v14, "TextTransparency", v14.TextTransparency, v30, 0.25, l_Utility_0.EaseOutQuad, true);
        l_Utility_0.PropertyTweener(v15, "ImageTransparency", v15.ImageTransparency, v30, 0.25, l_Utility_0.EaseOutQuad, true);
    end;
    v12.SetText = function(_, v32) --[[ Line: 122 ]] --[[ Name: SetText ]]
        -- upvalues: v14 (copy), v17 (copy)
        if v32 == v14.Text then
            return;
        else
            v14.Text = v32;
            v17();
            return;
        end;
    end;
    v12.SetImage = function(_, v34) --[[ Line: 131 ]] --[[ Name: SetImage ]]
        -- upvalues: v15 (copy)
        if v34 == v15.Image then
            return;
        else
            v15.Image = v34;
            return;
        end;
    end;
    return v12;
end;