local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("UserInputService");
local _ = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local _ = game:GetService("Players");
local l_SoundService_0 = game:GetService("SoundService");
local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v12 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
local v13 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
local v14 = Color3.new(0, 0.6352941176470588, 1);
local v15 = Color3.new(0, 0.6352941176470588, 1);
local v16 = Color3.new(1, 1, 1);
local v17 = l_HttpService_0:JSONDecode("[\n  [\n    {\n      \"a\": 7,\n      \"w\": 0.8\n    },\n    \"*\",\n    \"Q\",\n    \"W\",\n    \"E\",\n    \"R\",\n    \"T\",\n    \"Y\",\n    \"U\",\n    \"I\",\n    \"O\",\n    \"P\",\n    {\n      \"w\": 1.8\n    },\n    \"Delete\"\n  ],\n  [\n    {\n      \"w\": 1.6\n    },\n    \"Caps\",\n    \"A\",\n    \"S\",\n    \"D\",\n    \"F\",\n    \"G\",\n    \"H\",\n    \"J\",\n    \"K\",\n    \"L\",\n    \"?\",\n    {\n      \"h\": 2,\n      \"w2\": 2.4,\n      \"h2\": 1,\n      \"x2\": -1.4,\n      \"y2\": 1\n    },\n    \"Enter\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"Shift\",\n    \"Z\",\n    \"X\",\n    \"C\",\n    \"V\",\n    \"B\",\n    \"N\",\n    \"M\",\n    \".\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"123/sym\",\n    {\n      \"w\": 8\n    },\n    \"\",\n    {\n      \"w\": 2.4\n    },\n    \"<Speaker>\"\n  ]\n]\n");
local v18 = l_HttpService_0:JSONDecode("[\n  [\n    {\n      \"a\": 7,\n      \"w\": 0.8\n    },\n    \"*\",\n    \"1\",\n    \"2\",\n    \"3\",\n    \"4\",\n    \"5\",\n    \"6\",\n    \"7\",\n    \"8\",\n    \"9\",\n    \"0\",\n    {\n      \"w\": 1.8\n    },\n    \"Delete\"\n  ],\n  [\n    {\n      \"w\": 1.6\n    },\n    \"!\",\n    \"@\",\n    \"#\",\n    \"$\",\n    \"%\",\n    \"^\",\n    \"&\",\n    \"(\",\n    \")\",\n    \"=\",\n    \"?\",\n    {\n      \"h\": 2,\n      \"w2\": 2.4,\n      \"h2\": 1,\n      \"x2\": -1.4,\n      \"y2\": 1\n    },\n    \"Enter\"\n  ],\n  [\n    {\n      \"w\": 1.2\n    },\n    \"/\",\n    \"-\",\n    \"+\",\n    \"_\",\n    \":\",\n    \";\",\n    \"'\",\n    \"\\\"\",\n    \",\",\n    \".\"\n  ],\n  [\n    {\n      \"w\": 2.2\n    },\n    \"abc\",\n    {\n      \"w\": 8\n    },\n    \"\",\n    {\n      \"w\": 2.4\n    },\n    \"<Speaker>\"\n  ]\n]\n");
local v19 = {};
for v20, v21 in pairs({
    "ASR_STATUS_OK", 
    "ASR_STATUS_CANCELLED", 
    "ASR_STATUS_UNKNOWN", 
    "ASR_STATUS_INVALID_ARGUMENTS", 
    "ASR_STATUS_DEADLINE_EXCEEDED", 
    "ASR_STATUS_NOT_FOUND", 
    "ASR_STATUS_ALREADY_EXISTS", 
    "ASR_STATUS_PERMISSION_DENIED", 
    "ASR_STATUS_UNAUTHENTICATED", 
    "ASR_STATUS_RESOURCE_EXHAUSTED", 
    "ASR_STATUS_FAILED_PRECONDITION", 
    "ASR_STATUS_ABORTED", 
    "ASR_STATUS_OUT_OF_RANGE", 
    "ASR_STATUS_UNIMPLEMENTED", 
    "ASR_STATUS_INTERNAL", 
    "ASR_STATUS_UNAVAILABLE", 
    "ASR_STATUS_DATA_LOSS", 
    "ASR_STATUS_NOT_ENABLED", 
    "ASR_STATUS_LOW_CONFIDENCE", 
    "ASR_STATUS_INVALID_JSON"
}) do
    v19[v21] = v20 - 1;
end;
local function _(v22, v23) --[[ Line: 223 ]] --[[ Name: tokenizeString ]]
    local v24 = {};
    for v25 in string.gmatch(v22, "([^" .. v23 .. "]+)") do
        table.insert(v24, v25);
    end;
    return v24;
end;
local function _(v27) --[[ Line: 231 ]] --[[ Name: ConvertFontSizeEnumToInt ]]
    local v28 = string.match(v27.Name, "%d+");
    return v28 and tostring(v28) or 12;
end;
local function _(v30, v31, v32) --[[ Line: 240 ]] --[[ Name: RayPlaneIntersection ]]
    v31 = v31.unit;
    v30 = v30.Unit;
    local v33 = v31:Dot(v30.Direction);
    if v33 == 0 then
        return nil;
    else
        local v34 = v31:Dot(v32 - v30.Origin) / v33;
        if v34 < 0 then
            return nil;
        else
            return v30.Origin + v30.Direction * v34;
        end;
    end;
end;
Clamp = function(v36, v37, v38) --[[ Line: 261 ]] --[[ Name: Clamp ]]
    return (math.max(v36, (math.min(v37, v38))));
end;
local function _(v39, v40, v41) --[[ Line: 266 ]] --[[ Name: PointInGuiObject ]]
    local l_AbsolutePosition_0 = v39.AbsolutePosition;
    local v43 = v39.AbsolutePosition + v39.AbsoluteSize;
    if l_AbsolutePosition_0.X <= v40 and v40 <= v43.X and l_AbsolutePosition_0.Y <= v41 and v41 <= v43.Y then
        return true;
    else
        return false;
    end;
end;
local function v45(v46, v47) --[[ Line: 275 ]] --[[ Name: FindAncestorOfType ]]
    -- upvalues: v45 (copy)
    if not v46 then
        return nil;
    else
        local l_Parent_0 = v46.Parent;
        if l_Parent_0 and l_Parent_0:IsA(v47) then
            return l_Parent_0;
        else
            return v45(l_Parent_0, v47);
        end;
    end;
end;
local function v56(v49) --[[ Line: 286 ]] --[[ Name: ExtendedInstance ]]
    local v50 = {};
    setmetatable(v50, {
        __index = function(_, v52) --[[ Line: 291 ]] --[[ Name: __index ]]
            -- upvalues: v49 (copy)
            return v49[v52];
        end, 
        __newindex = function(_, v54, v55) --[[ Line: 295 ]] --[[ Name: __newindex ]]
            -- upvalues: v49 (copy)
            v49[v54] = v55;
        end
    });
    return v50;
end;
local function v70(v57) --[[ Line: 304 ]] --[[ Name: CreateVRButton ]]
    -- upvalues: v56 (copy)
    local v58 = v56(v57);
    rawset(v58, "OnEnter", function(_) --[[ Line: 307 ]]

    end);
    rawset(v58, "OnLeave", function(_) --[[ Line: 309 ]]

    end);
    rawset(v58, "OnDown", function(_) --[[ Line: 311 ]]

    end);
    rawset(v58, "OnUp", function(_) --[[ Line: 313 ]]

    end);
    rawset(v58, "ContainsPoint", function(_, v64, v65) --[[ Line: 315 ]]
        -- upvalues: v57 (copy)
        local l_v57_0 = v57;
        local l_AbsolutePosition_1 = l_v57_0.AbsolutePosition;
        local v68 = l_v57_0.AbsolutePosition + l_v57_0.AbsoluteSize;
        if l_AbsolutePosition_1.X <= v64 and v64 <= v68.X and l_AbsolutePosition_1.Y <= v65 and v65 <= v68.Y then
            return true;
        else
            return false;
        end;
    end);
    rawset(v58, "Update", function(_) --[[ Line: 318 ]]

    end);
    return v58;
end;
local _ = l_Create_0("ImageLabel")({
    Name = "SelectionRing", 
    Size = UDim2.new(1, -6, 1, -6), 
    Position = UDim2.new(0, 4, 0, 3), 
    Image = "rbxasset://textures/ui/menu/buttonHover.png", 
    ScaleType = Enum.ScaleType.Slice, 
    SliceCenter = Rect.new(47, 47, 47, 47), 
    BackgroundTransparency = 1
});
local v72 = {
    ["<Speaker>"] = {
        Asset = "rbxasset://textures/ui/Keyboard/mic_icon.png", 
        AspectRatio = 0.615
    }
};
local function v123(v73, v74, v75) --[[ Line: 340 ]] --[[ Name: CreateKeyboardKey ]]
    -- upvalues: l_Create_0 (copy), v16 (copy), v12 (copy), v70 (copy), v72 (copy), v14 (copy), v13 (copy), v15 (copy)
    local v76 = v74.width2 and v74.height2 and v74.x2 and v74.y2;
    local v77 = l_Create_0("ImageButton")({
        Name = v75[1], 
        Position = UDim2.new(v74.x, 0, v74.y, 0), 
        Size = UDim2.new(v74.width, 0, v74.height, 0), 
        BorderSizePixel = 0, 
        Image = "", 
        BackgroundTransparency = 1, 
        ZIndex = 1
    });
    local v78 = l_Create_0("TextLabel")({
        Name = "KeyText", 
        Text = v75[#v75], 
        Position = UDim2.new(0, -10, 0, -10), 
        Size = UDim2.new(1, 0, 1, 0), 
        Font = Enum.Font.SourceSansBold, 
        FontSize = Enum.FontSize.Size96, 
        TextColor3 = v16, 
        BackgroundTransparency = 1, 
        Selectable = true, 
        ZIndex = 2, 
        Parent = v77
    });
    local v79 = l_Create_0("Frame")({
        Name = "KeyBackground", 
        Size = UDim2.new(1, -10, 1, -10), 
        Position = UDim2.new(0, -5, 0, -5), 
        BackgroundColor3 = v12, 
        BackgroundTransparency = 0.3, 
        BorderSizePixel = 0, 
        Parent = v77
    });
    local v80 = l_Create_0("ImageLabel")({
        Name = "SelectionObject", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png", 
        ImageTransparency = 0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(12, 12, 52, 52), 
        BorderSizePixel = 0
    });
    v77.SelectionImageObject = l_Create_0("ImageLabel")({
        Visible = false
    });
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    if v76 then
        v81 = l_Create_0("ImageButton")({
            Name = "KeyBackground", 
            Position = UDim2.new(v74.x2 / v74.width, -5, v74.y2 / v74.height, -5), 
            Size = UDim2.new(v74.width2 / v74.width, 0, v74.height2 / v74.height, -10), 
            BackgroundColor3 = v12, 
            BackgroundTransparency = 0.3, 
            BorderSizePixel = 0, 
            AutoButtonColor = false, 
            SelectionImageObject = v77.SelectionImageObject, 
            Parent = v77
        });
        if v74.x2 <= 0 then
            v78.Size = v81.Size - UDim2.new(0, 10, 0, 0);
            v78.Position = v81.Position;
            v81.Size = v81.Size - UDim2.new(1, 0, 0, 0);
        end;
        v82 = l_Create_0("Frame")({
            Name = "SpecialSelectionObject", 
            Size = UDim2.new(1, 0, 0.5, 0), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true; 
            l_Create_0("ImageLabel")({
                Name = "Borders", 
                Position = UDim2.new(-1, 0, -1, 0), 
                Size = UDim2.new(2, 0, 2, 0), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png", 
                ImageTransparency = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(12, 12, 52, 52)
            })
        });
        v83 = v82:Clone();
        v83.Size = UDim2.new(1, 0, 0.5, 5);
        v83.Position = UDim2.new(0, 0, 0, 0);
        v83.Borders.Size = UDim2.new(1, 0, 1, 30);
        v83.Borders.Position = UDim2.new(0, 0, 0, 0);
        v84 = v82:Clone();
        v84.Size = UDim2.new(1, 5, 1, 0);
        v84.Position = UDim2.new(0, 0, 0, 0);
        v84.Borders.Size = UDim2.new(1, 30, 1, 0);
        v84.Borders.Position = UDim2.new(0, 0, 0, 0);
    end;
    local v85 = v70(v77);
    local v86 = false;
    local v87 = false;
    local v88 = false;
    if #v75 == 1 then
        v88 = false;
        if type(v75[1]) == "string" then
            v88 = false;
            if #v75[1] == 1 then
                v88 = false;
                if string.byte(v75[1]) >= 65 then
                    v88 = string.byte(v75[1]) <= 122;
                end;
            end;
        end;
    end;
    local v89 = nil;
    if v75[1] and v72[v75[1]] then
        v78.Visible = false;
        v89 = l_Create_0("ImageLabel")({
            Name = "KeyIcon", 
            Size = UDim2.new(v72[v75[1]].AspectRatio, -20, 1, -20), 
            SizeConstraint = Enum.SizeConstraint.RelativeYY, 
            BackgroundTransparency = 1, 
            Image = v72[v75[1]].Asset, 
            Parent = v79
        });
        local function v91(v90) --[[ Line: 472 ]] --[[ Name: onChanged ]]
            -- upvalues: v89 (ref)
            if v90 == "AbsoluteSize" then
                v89.Position = UDim2.new(0.5, -v89.AbsoluteSize.X / 2, 0.5, -v89.AbsoluteSize.Y / 2);
            end;
        end;
        v89.Changed:connect(v91);
        v89.Position = UDim2.new(0.5, -v89.AbsoluteSize.X / 2, 0.5, -v89.AbsoluteSize.Y / 2);
    end;
    local function v94() --[[ Line: 481 ]] --[[ Name: onClicked ]]
        -- upvalues: v85 (copy), v73 (copy), v88 (copy)
        local v92 = nil;
        local l_v85_CurrentKeyValue_0 = v85:GetCurrentKeyValue();
        if l_v85_CurrentKeyValue_0 == "Shift" then
            v73:SetShift(not v73:GetShift());
        elseif l_v85_CurrentKeyValue_0 == "Caps" then
            v73:SetCaps(not v73:GetCaps());
        elseif l_v85_CurrentKeyValue_0 == "Enter" then
            v73:SubmitText(true, true);
        elseif l_v85_CurrentKeyValue_0 == "Delete" then
            v73:BackspaceAtCursor();
        elseif l_v85_CurrentKeyValue_0 == "123/sym" then
            v73:SetCurrentKeyset(2);
        elseif l_v85_CurrentKeyValue_0 == "abc" then
            v73:SetCurrentKeyset(1);
        elseif l_v85_CurrentKeyValue_0 == "<Speaker>" then
            v73:SetVoiceMode(true);
        else
            v92 = l_v85_CurrentKeyValue_0 == "Tab" and "\t" or l_v85_CurrentKeyValue_0;
        end;
        if v92 ~= nil then
            v73:SubmitCharacter(v92, v88);
        end;
    end;
    local function _(v95, v96) --[[ Line: 510 ]] --[[ Name: setKeyColor ]]
        -- upvalues: v79 (copy), v81 (ref), v76 (copy), v82 (ref), v83 (ref), v84 (ref), v80 (copy)
        v79.BackgroundColor3 = v95;
        if v81 then
            v81.BackgroundColor3 = v95;
        end;
        if v76 then
            v82.Parent = v96 and v79 or nil;
            v83.Parent = v96 and v79 or nil;
            v84.Parent = v96 and v81 or nil;
            return;
        else
            v80.Parent = v96 and v79 or nil;
            return;
        end;
    end;
    local function v105() --[[ Line: 524 ]] --[[ Name: update ]]
        -- upvalues: v85 (copy), v87 (ref), v14 (ref), v79 (copy), v81 (ref), v76 (copy), v82 (ref), v83 (ref), v84 (ref), v80 (copy), v86 (ref), v13 (ref), v73 (copy), v15 (ref), v12 (ref), v89 (ref), v78 (copy)
        local l_v85_CurrentKeyValue_1 = v85:GetCurrentKeyValue();
        if v87 then
            local l_v14_0 = v14;
            v79.BackgroundColor3 = l_v14_0;
            if v81 then
                v81.BackgroundColor3 = l_v14_0;
            end;
            if v76 then
                v82.Parent = nil;
                v83.Parent = nil;
                v84.Parent = nil;
            else
                v80.Parent = nil;
            end;
        elseif v86 then
            local l_v13_0 = v13;
            v79.BackgroundColor3 = l_v13_0;
            if v81 then
                v81.BackgroundColor3 = l_v13_0;
            end;
            if v76 then
                v82.Parent = v79 or nil;
                v83.Parent = v79 or nil;
                v84.Parent = v81 or nil;
            else
                v80.Parent = v79 or nil;
            end;
        elseif l_v85_CurrentKeyValue_1 == "Caps" and v73:GetCaps() then
            local l_v15_0 = v15;
            v79.BackgroundColor3 = l_v15_0;
            if v81 then
                v81.BackgroundColor3 = l_v15_0;
            end;
            if v76 then
                v82.Parent = nil;
                v83.Parent = nil;
                v84.Parent = nil;
            else
                v80.Parent = nil;
            end;
        elseif l_v85_CurrentKeyValue_1 == "Shift" and v73:GetShift() then
            local l_v15_1 = v15;
            v79.BackgroundColor3 = l_v15_1;
            if v81 then
                v81.BackgroundColor3 = l_v15_1;
            end;
            if v76 then
                v82.Parent = nil;
                v83.Parent = nil;
                v84.Parent = nil;
            else
                v80.Parent = nil;
            end;
        elseif l_v85_CurrentKeyValue_1 == "abc" then
            local l_v15_2 = v15;
            v79.BackgroundColor3 = l_v15_2;
            if v81 then
                v81.BackgroundColor3 = l_v15_2;
            end;
            if v76 then
                v82.Parent = nil;
                v83.Parent = nil;
                v84.Parent = nil;
            else
                v80.Parent = nil;
            end;
        else
            local l_v12_0 = v12;
            v79.BackgroundColor3 = l_v12_0;
            if v81 then
                v81.BackgroundColor3 = l_v12_0;
            end;
            if v76 then
                v82.Parent = nil;
                v83.Parent = nil;
                v84.Parent = nil;
            else
                v80.Parent = nil;
            end;
        end;
        if v89 then
            v89.ImageTransparency = 0.5;
        end;
        v78.Text = v85:GetCurrentKeyValue();
    end;
    local v106 = {};
    rawset(v85, "OnEnter", function(_) --[[ Line: 550 ]]
        -- upvalues: v86 (ref), v105 (copy)
        v86 = true;
        v105();
    end);
    rawset(v85, "OnLeave", function(_) --[[ Line: 554 ]]
        -- upvalues: v106 (copy), v86 (ref), v87 (ref), v105 (copy)
        if not next(v106) then
            v86 = false;
            v87 = false;
            v105();
        end;
    end);
    rawset(v85, "OnDown", function(_) --[[ Line: 561 ]]
        -- upvalues: v87 (ref), v105 (copy), v94 (copy)
        v87 = true;
        v105();
        v94();
    end);
    rawset(v85, "OnUp", function(_) --[[ Line: 569 ]]
        -- upvalues: v87 (ref), v105 (copy)
        v87 = false;
        v105();
    end);
    rawset(v85, "GetCurrentKeyValue", function(_) --[[ Line: 573 ]]
        -- upvalues: v73 (copy), v88 (copy), v75 (copy)
        local l_v73_Shift_0 = v73:GetShift();
        local l_v73_Caps_0 = v73:GetCaps();
        if v88 then
            if l_v73_Caps_0 and l_v73_Shift_0 then
                return string.lower(v75[#v75]);
            elseif l_v73_Caps_0 or l_v73_Shift_0 then
                return v75[1];
            else
                return string.lower(v75[#v75]);
            end;
        elseif l_v73_Shift_0 then
            return v75[1];
        else
            return v75[#v75];
        end;
    end);
    rawset(v85, "ContainsPoint", function(_, v115, v116) --[[ Line: 593 ]]
        -- upvalues: v79 (copy), v81 (ref)
        local l_v79_0 = v79;
        local l_AbsolutePosition_2 = l_v79_0.AbsolutePosition;
        local v119 = l_v79_0.AbsolutePosition + l_v79_0.AbsoluteSize;
        local v120 = l_AbsolutePosition_2.X <= v115 and v115 <= v119.X and l_AbsolutePosition_2.Y <= v116 and v116 <= v119.Y;
        if not v120 then
            v120 = v81;
            if v120 then
                l_v79_0 = v81;
                l_AbsolutePosition_2 = l_v79_0.AbsolutePosition;
                v119 = l_v79_0.AbsolutePosition + l_v79_0.AbsoluteSize;
                if l_AbsolutePosition_2.X <= v115 and v115 <= v119.X and l_AbsolutePosition_2.Y <= v116 and v116 <= v119.Y then
                    return true;
                else
                    v120 = false;
                end;
            end;
        end;
        return v120;
    end);
    rawset(v85, "Update", function(_) --[[ Line: 597 ]]
        -- upvalues: v105 (copy)
        v105();
    end);
    rawset(v85, "GetInstance", function(_) --[[ Line: 600 ]]
        -- upvalues: v77 (copy)
        return v77;
    end);
    v77.MouseButton1Down:connect(function() --[[ Line: 604 ]]
        -- upvalues: v85 (copy)
        v85:OnDown();
    end);
    v77.MouseButton1Up:connect(function() --[[ Line: 605 ]]
        -- upvalues: v85 (copy)
        v85:OnUp();
    end);
    v77.SelectionGained:connect(function() --[[ Line: 606 ]]
        -- upvalues: v106 (copy), v77 (copy), v85 (copy)
        v106[v77] = true;
        v85:OnEnter();
    end);
    v77.SelectionLost:connect(function() --[[ Line: 607 ]]
        -- upvalues: v106 (copy), v77 (copy), v85 (copy)
        v106[v77] = nil;
        v85:OnLeave();
    end);
    if v81 then
        v81.MouseButton1Down:connect(function() --[[ Line: 613 ]]
            -- upvalues: v85 (copy)
            v85:OnDown();
        end);
        v81.MouseButton1Up:connect(function() --[[ Line: 614 ]]
            -- upvalues: v85 (copy)
            v85:OnUp();
        end);
        v81.SelectionGained:connect(function() --[[ Line: 615 ]]
            -- upvalues: v106 (copy), v81 (ref), v85 (copy)
            v106[v81] = true;
            v85:OnEnter();
        end);
        v81.SelectionLost:connect(function() --[[ Line: 619 ]]
            -- upvalues: v106 (copy), v81 (ref), v85 (copy)
            v106[v81] = nil;
            v85:OnLeave();
        end);
    end;
    v105();
    return v85;
end;
local function v126() --[[ Line: 630 ]] --[[ Name: CreateBaseVoiceState ]]
    return {
        Name = "Base", 
        TransitionFrom = function(_) --[[ Line: 634 ]] --[[ Name: TransitionFrom ]]

        end, 
        TransitionTo = function(_) --[[ Line: 636 ]] --[[ Name: TransitionTo ]]

        end
    };
end;
local _ = function() --[[ Line: 642 ]] --[[ Name: CreateListeningVoiceState ]]
    -- upvalues: v126 (copy), l_SoundService_0 (copy)
    local v127 = v126();
    v127.Name = "Listening";
    v127.TransitionTo = function(_) --[[ Line: 647 ]] --[[ Name: TransitionTo ]]
        -- upvalues: l_SoundService_0 (ref)
        pcall(function() --[[ Line: 648 ]]
            -- upvalues: l_SoundService_0 (ref)
            l_SoundService_0:BeginRecording();
        end);
    end;
    return v127;
end;
local _ = function() --[[ Line: 654 ]] --[[ Name: CreateProcessingVoiceState ]]
    -- upvalues: v126 (copy), l_SoundService_0 (copy)
    local v130 = v126();
    v130.Name = "Processing";
    local v131 = false;
    local v132 = nil;
    v130.TransitionTo = function(_) --[[ Line: 662 ]] --[[ Name: TransitionTo ]]
        -- upvalues: v132 (ref), l_SoundService_0 (ref), v131 (ref)
        coroutine.wrap(function() --[[ Line: 663 ]]
            -- upvalues: v132 (ref), l_SoundService_0 (ref), v131 (ref)
            pcall(function() --[[ Line: 664 ]]
                -- upvalues: v132 (ref), l_SoundService_0 (ref)
                v132 = l_SoundService_0:EndRecording();
            end);
            v131 = true;
        end)();
    end;
    v130.GetResultAsync = function(_) --[[ Line: 669 ]] --[[ Name: GetResultAsync ]]
        -- upvalues: v131 (ref), v132 (ref)
        while not v131 do
            wait();
        end;
        return v132;
    end;
    return v130;
end;
local function _() --[[ Line: 679 ]] --[[ Name: CreateWaitingVoiceState ]]
    -- upvalues: v126 (copy)
    local v136 = v126();
    v136.Name = "Waiting";
    return v136;
end;
local v138 = {
    Listening = {
        Processing = true
    }, 
    Processing = {
        Waiting = true
    }, 
    Waiting = {
        Listening = true
    }
};
local v139 = {};
local v140 = v126();
v140.Name = "Waiting";
v139.CurrentState = v140;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_l_BindableEvent_0_0 = l_BindableEvent_0 --[[ copy: 36 -> 40 ]];
v139.TransitionState = function(v143, v144) --[[ Line: 695 ]] --[[ Name: TransitionState ]]
    -- upvalues: v138 (copy), l_l_BindableEvent_0_0 (copy)
    if v138[v143.CurrentState.Name][v144.Name] then
        v143.CurrentState:TransitionFrom();
        v143.CurrentState = v144;
        v143.CurrentState:TransitionTo();
        l_l_BindableEvent_0_0:Fire(v143.CurrentState);
        return true;
    else
        return false;
    end;
end;
v139.GetCurrentState = function(v145) --[[ Line: 707 ]] --[[ Name: GetCurrentState ]]
    return v145.CurrentState;
end;
v139.StateTransitionedEvent = l_BindableEvent_0.Event;
l_BindableEvent_0 = function(v146) --[[ Line: 716 ]] --[[ Name: ConstructKeyboardUI ]]
    -- upvalues: l_CorePackages_0 (copy), l_Create_0 (copy), v15 (copy), v70 (copy), v12 (copy), v16 (copy), l_RunService_0 (copy), v56 (copy), l_TextService_0 (copy), v139 (copy), v126 (copy), l_SoundService_0 (copy), l_ContextActionService_0 (copy), v123 (copy), v19 (copy)
    local l_Panel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D;
    local v148 = l_Panel3D_0.Get("Keyboard");
    v148:SetVisible(false);
    local v149 = {};
    local v150 = l_Create_0("Frame")({
        Name = "VirtualKeyboard", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        Visible = false
    });
    local v151 = l_Create_0("ImageLabel")({
        Name = "TextEntryBackground", 
        Size = UDim2.new(0.5, 0, 0.125, 0), 
        Position = UDim2.new(0.25, 0, 0, 0), 
        Image = "", 
        BackgroundTransparency = 0.5, 
        BackgroundColor3 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039), 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        Parent = v150
    });
    local v152 = l_Create_0("Frame")({
        Name = "TextfieldBackground", 
        Position = UDim2.new(0, 2, 0, 2), 
        Size = UDim2.new(1, -4, 1, -4), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.new(0.8196078431372549, 0.8470588235294118, 0.8666666666666667), 
        BorderSizePixel = 0, 
        Visible = true, 
        Parent = v151
    });
    local v153 = l_Create_0("TextButton")({
        Name = "TextEntryField", 
        Text = "", 
        Position = UDim2.new(0, 4, 0, 4), 
        Size = UDim2.new(1, -8, 1, -8), 
        Font = Enum.Font.SourceSans, 
        FontSize = Enum.FontSize.Size60, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Parent = v152
    });
    local v154 = l_Create_0("Frame")({
        Name = "TextfieldCursor", 
        Size = UDim2.new(0, 5, 0.9, 0), 
        Position = UDim2.new(0, 0, 0.05, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = v15, 
        BorderSizePixel = 0, 
        Visible = true, 
        ZIndex = 2, 
        Parent = v153
    });
    local v155 = l_Create_0("ImageButton")({
        Name = "CloseButton", 
        Size = UDim2.new(0.075, -10, 0.198, -10), 
        Position = UDim2.new(0, -5, 0, -35), 
        Image = "rbxasset://textures/ui/Keyboard/close_button_background.png", 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        Parent = v150
    });
    v155.SelectionImageObject = l_Create_0("ImageLabel")({
        Name = "Selection", 
        Size = UDim2.new(0.9, 0, 0.9, 0), 
        Position = UDim2.new(0.05, 0, 0.05, 0), 
        Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png", 
        BackgroundTransparency = 1
    });
    l_Create_0("ImageLabel")({
        Name = "Icon", 
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        Position = UDim2.new(0.25, 0, 0.25, 0), 
        Image = "rbxasset://textures/ui/Keyboard/close_button_icon.png", 
        BackgroundTransparency = 1, 
        Parent = v155
    });
    local v156 = v70(v155);
    table.insert(v149, v156);
    local v157 = l_Create_0("Frame")({
        Name = "VoiceRecognitionContainer", 
        Size = UDim2.new(1, 0, 0.85, 0), 
        Position = UDim2.new(0, 0, 0.15, 0), 
        BackgroundTransparency = 1, 
        Active = true, 
        Visible = false, 
        Parent = v150
    });
    local v158 = l_Create_0("Frame")({
        Name = "voiceRecognitionBackground1", 
        Size = UDim2.new(1, 0, 0.75, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundColor3 = v12, 
        BackgroundTransparency = 0.3, 
        BorderSizePixel = 0, 
        Active = true, 
        Parent = v157
    }):Clone();
    v158.Size = UDim2.new(0.8, 0, 0.25, 0);
    v158.Position = UDim2.new(0, 0, 0.75, 0);
    v158.Parent = v157;
    local v159 = v70(l_Create_0("TextButton")({
        Name = "DoneButton", 
        Size = UDim2.new(0.2, -5, 0.25, -5), 
        Position = UDim2.new(0.8, 5, 0.75, 5), 
        Text = "Done", 
        BackgroundColor3 = v15, 
        Font = Enum.Font.SourceSansBold, 
        FontSize = Enum.FontSize.Size96, 
        TextColor3 = v16, 
        BackgroundTransparency = 0, 
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        Parent = v157
    }));
    table.insert(v149, v159);
    v158 = l_Create_0("TextLabel")({
        Name = "VoiceProcessingStatus", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0.5, 0, 0.33, 0), 
        Text = "", 
        Font = Enum.Font.SourceSansBold, 
        FontSize = Enum.FontSize.Size96, 
        TextColor3 = v16, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Parent = v157
    });
    local v169 = (function() --[[ Line: 873 ]] --[[ Name: CreateVoiceVisualizerWidget ]]
        -- upvalues: l_Create_0 (ref), v16 (ref), l_RunService_0 (ref)
        local v160 = {};
        local v161 = {};
        local v162 = l_Create_0("Frame")({
            Name = "VoiceVisualizerContainer", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        });
        v160.Container = v162;
        for v163 = 1, 50 do
            table.insert(v161, (l_Create_0("Frame")({
                Name = "Bar", 
                Size = UDim2.new(0.02, -4, 1, 0), 
                Position = UDim2.new(v163 / 50, 0, 0, 0), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = v16, 
                Parent = v162
            })));
        end;
        v160.StartAnimation = function(_) --[[ Line: 903 ]] --[[ Name: StartAnimation ]]
            -- upvalues: l_RunService_0 (ref), v161 (copy)
            l_RunService_0:UnbindFromRenderStep("VoiceVisualizerWidget");
            l_RunService_0:BindToRenderStep("VoiceVisualizerWidget", Enum.RenderPriority.First.Value, function() --[[ Line: 906 ]]
                -- upvalues: v161 (ref)
                for v165, v166 in pairs(v161) do
                    local v167 = ((math.abs((math.sin(tick() * 2.5 + v165 * 0.5026548245743669))) + math.abs((math.cos(tick() * 2.5 + v165 * 0.5026548245743669)))) / 2 - 0.3) * 1.4285714285714286;
                    v166.Size = UDim2.new(0.02, -4, v167, 0);
                    v166.Position = UDim2.new(v165 / 50, 0, (1 - v167) / 2, 0);
                end;
            end);
        end;
        v160.StopAnimation = function(_) --[[ Line: 917 ]] --[[ Name: StopAnimation ]]
            -- upvalues: l_RunService_0 (ref)
            l_RunService_0:UnbindFromRenderStep("VoiceVisualizerWidget");
        end;
        return v160;
    end)();
    v169.Container.Parent = v157;
    v169.Container.Size = UDim2.new(0.5, 0, 0.4, 0);
    v169.Container.Position = UDim2.new(0.25, 0, 0.4, 0);
    local v170 = v56(v150);
    local v171 = nil;
    local v172 = {};
    local v173 = false;
    local v174 = false;
    local v175 = 0;
    local l_BindableEvent_1 = Instance.new("BindableEvent");
    local l_BindableEvent_2 = Instance.new("BindableEvent");
    local v178 = false;
    local function v184(v179) --[[ Line: 943 ]] --[[ Name: SetTextFieldCursorPosition ]]
        -- upvalues: v175 (ref), v153 (copy), l_TextService_0 (ref), v154 (copy)
        v175 = Clamp(0, #v153.Text, v179);
        if not v153.TextFits then
            v175 = #v153.Text;
        end;
        local l_l_TextService_0_0 = l_TextService_0;
        local v181 = string.sub(v153.Text, 1, v175);
        local l_FontSize_0 = v153.FontSize;
        local v183 = string.match(l_FontSize_0.Name, "%d+");
        l_l_TextService_0_0 = l_l_TextService_0_0:GetTextSize(v181, v183 and tostring(v183) or 12, v153.Font, v153.AbsoluteSize);
        v154.Position = UDim2.new(0, l_l_TextService_0_0.x, v154.Position.Y.Scale, v154.Position.Y.Offset);
    end;
    local function _(v185) --[[ Line: 957 ]] --[[ Name: UpdateTextEntryFieldText ]]
        -- upvalues: v153 (copy), v184 (copy), v175 (ref)
        v153:SetTextFromInput(v185);
        v184(v175);
    end;
    local v187 = "";
    local function _() --[[ Line: 963 ]] --[[ Name: getBufferText ]]
        -- upvalues: v171 (ref), v187 (ref)
        if v171 and v171.TextBox then
            return v171.TextBox.Text;
        else
            return v187;
        end;
    end;
    local function _(v189) --[[ Line: 969 ]] --[[ Name: setBufferText ]]
        -- upvalues: v171 (ref), v187 (ref), v153 (copy), v184 (copy), v175 (ref)
        if v171 and v171.TextBox then
            v171.TextBox.Text = v189;
            return;
        else
            if v187 ~= v189 then
                v187 = v189;
                v153:SetTextFromInput(v187);
                v184(v175);
            end;
            return;
        end;
    end;
    local function v198(v191, v192) --[[ Line: 978 ]] --[[ Name: calculateTextCursorPosition ]]
        -- upvalues: v153 (copy), l_TextService_0 (ref)
        v191 = v191 - v153.AbsolutePosition.x;
        v192 = v192 - v153.AbsolutePosition.y;
        for v193 = 1, #v153.Text do
            local l_l_TextService_0_1 = l_TextService_0;
            local v195 = string.sub(v153.Text, 1, v193);
            local l_FontSize_1 = v153.FontSize;
            local v197 = string.match(l_FontSize_1.Name, "%d+");
            if v191 < l_l_TextService_0_1:GetTextSize(v195, v197 and tostring(v197) or 12, v153.Font, v153.AbsoluteSize).x then
                return v193 - 1;
            end;
        end;
        return #v153.Text;
    end;
    local v199 = nil;
    rawset(v170, "OpenedEvent", l_BindableEvent_1.Event);
    rawset(v170, "ClosedEvent", l_BindableEvent_2.Event);
    rawset(v170, "GetCurrentKeyset", function(_) --[[ Line: 1001 ]]
        -- upvalues: v172 (copy), v199 (ref)
        return v172[v199];
    end);
    rawset(v170, "SetCurrentKeyset", function(_, v202) --[[ Line: 1005 ]]
        -- upvalues: v199 (ref), v172 (copy)
        if v202 ~= v199 and v172[v202] ~= nil then
            if v172[v199] and v172[v199].container then
                v172[v199].container.Visible = false;
            end;
            v199 = v202;
            if v172[v199] and v172[v199].container then
                v172[v199].container.Visible = true;
            end;
        end;
    end);
    rawset(v170, "SetVoiceMode", function(v203, v204) --[[ Line: 1019 ]]
        -- upvalues: v157 (copy), v139 (ref), v126 (ref), l_SoundService_0 (ref)
        v204 = false;
        local l_v203_CurrentKeyset_0 = v203:GetCurrentKeyset();
        if l_v203_CurrentKeyset_0 and l_v203_CurrentKeyset_0.container then
            l_v203_CurrentKeyset_0.container.Visible = not v204;
        end;
        v157.Visible = v204;
        if v204 then
            local l_v139_0 = v139;
            local v207 = v126();
            v207.Name = "Listening";
            v207.TransitionTo = function(_) --[[ Line: 647 ]] --[[ Name: TransitionTo ]]
                -- upvalues: l_SoundService_0 (ref)
                pcall(function() --[[ Line: 648 ]]
                    -- upvalues: l_SoundService_0 (ref)
                    l_SoundService_0:BeginRecording();
                end);
            end;
            l_v139_0:TransitionState(v207);
        end;
    end);
    rawset(v170, "GetCaps", function(_) --[[ Line: 1035 ]]
        -- upvalues: v173 (ref)
        return v173;
    end);
    rawset(v170, "SetCaps", function(v210, v211) --[[ Line: 1039 ]]
        -- upvalues: v173 (ref)
        v173 = v211;
        for _, v213 in pairs(v210:GetCurrentKeyset().keys) do
            v213:Update();
        end;
    end);
    rawset(v170, "GetShift", function(_) --[[ Line: 1046 ]]
        -- upvalues: v174 (ref)
        return v174;
    end);
    rawset(v170, "SetShift", function(v215, v216) --[[ Line: 1050 ]]
        -- upvalues: v174 (ref)
        v174 = v216;
        for _, v218 in pairs(v215:GetCurrentKeyset().keys) do
            v218:Update();
        end;
    end);
    local v219 = false;
    local v220 = nil;
    local v221 = nil;
    local v222 = nil;
    local function _() --[[ Line: 1063 ]] --[[ Name: disconnectKeyboardEvents ]]
        -- upvalues: v220 (ref), v221 (ref), v222 (ref)
        if v220 then
            v220:disconnect();
        end;
        v220 = nil;
        if v221 then
            v221:disconnect();
        end;
        v221 = nil;
        if v222 then
            v222:disconnect();
        end;
        v222 = nil;
    end;
    rawset(v170, "Open", function(v224, v225) --[[ Line: 1072 ]]
        -- upvalues: v178 (ref), v171 (ref), v150 (copy), v148 (copy), v220 (ref), v221 (ref), v222 (ref), v153 (copy), v184 (copy), v175 (ref), v219 (ref), v187 (ref), l_Panel3D_0 (copy), l_ContextActionService_0 (ref), v199 (ref), v172 (copy), l_BindableEvent_1 (copy)
        if v178 then
            return;
        else
            v178 = true;
            v171 = v225;
            v224:SetCurrentKeyset(1);
            v224:SetVoiceMode(false);
            v150.Visible = true;
            v148:ResizeStuds(5.9, 2.25, 320);
            local v226 = CFrame.new();
            if v220 then
                v220:disconnect();
            end;
            v220 = nil;
            if v221 then
                v221:disconnect();
            end;
            v221 = nil;
            if v222 then
                v222:disconnect();
            end;
            v222 = nil;
            if v225.TextBox then
                v220 = v225.TextBox.Changed:connect(function(v227) --[[ Line: 1088 ]]
                    -- upvalues: v225 (copy), v153 (ref), v184 (ref), v175 (ref)
                    if v227 == "Text" then
                        local l_Text_0 = v225.TextBox.Text;
                        v153:SetTextFromInput(l_Text_0);
                        v184(v175);
                    end;
                end);
                v221 = v225.TextBox.FocusLost:connect(function(v229) --[[ Line: 1093 ]]
                    -- upvalues: v219 (ref), v224 (copy)
                    if not v219 then
                        v224:Close(v229);
                    end;
                end);
                if v225.TextBox.ClearTextOnFocus then
                    if v171 and v171.TextBox then
                        v171.TextBox.Text = "";
                    elseif v187 ~= "" then
                        v187 = "";
                        v153:SetTextFromInput(v187);
                        v184(v175);
                    end;
                else
                    local l_Text_1 = v225.TextBox.Text;
                    v153:SetTextFromInput(l_Text_1);
                    v184(v175);
                end;
                local v231 = l_Panel3D_0.FindContainerOf(v225.TextBox);
                if v231 then
                    v222 = l_Panel3D_0.OnPanelClosed.Event:connect(function(v232) --[[ Line: 1107 ]]
                        -- upvalues: v231 (copy), v224 (copy)
                        if v232 == v231.name then
                            v224:Close(false);
                        end;
                    end);
                    local v233 = v225.TextBox.AbsolutePosition + Vector2.new(0.5, 1) * v225.TextBox.AbsoluteSize;
                    v226 = v231:GetCFrameInCameraSpace() * CFrame.new(v231:GetGuiPositionInPanelSpace(v233)) * CFrame.new(0, -v148.height * 0.65, 0.5) * CFrame.Angles(-0.39269908169872414, 0, 0);
                else
                    v226 = l_Panel3D_0.GetHeadLookXZ(true) * CFrame.Angles(0.39269908169872414, 0, 0) * CFrame.new(0, -1, -5);
                end;
            elseif v171 and v171.TextBox then
                v171.TextBox.Text = "";
            elseif v187 ~= "" then
                v187 = "";
                v153:SetTextFromInput(v187);
                v184(v175);
            end;
            l_ContextActionService_0:BindCoreAction("VirtualKeyboardControllerInput", function(_, v235, v236) --[[ Line: 1125 ]]
                -- upvalues: v184 (ref), v175 (ref), v224 (copy), v199 (ref), v172 (ref)
                if v235 == Enum.UserInputState.End then
                    if v236.KeyCode == Enum.KeyCode.ButtonL1 then
                        v184(v175 - 1);
                        return;
                    elseif v236.KeyCode == Enum.KeyCode.ButtonR1 then
                        v184(v175 + 1);
                        return;
                    elseif v236.KeyCode == Enum.KeyCode.ButtonX then
                        v224:BackspaceAtCursor();
                        return;
                    elseif v236.KeyCode == Enum.KeyCode.ButtonY then
                        v224:SubmitCharacter(" ", false);
                        return;
                    elseif v236.KeyCode == Enum.KeyCode.ButtonL2 then
                        if v199 then
                            v224:SetCurrentKeyset(v199 % #v172 + 1);
                            return;
                        end;
                    elseif v236.KeyCode == Enum.KeyCode.ButtonL3 then
                        v224:SetCaps(not v224:GetCaps());
                        return;
                    elseif v236.KeyCode == Enum.KeyCode.ButtonB then
                        v224:Close(false);
                    end;
                end;
            end, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL2, Enum.KeyCode.ButtonL3, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonB);
            v224.Parent = v148:GetGUI();
            v148:SetType(l_Panel3D_0.Type.Fixed, {
                CFrame = v226
            });
            v148:SetCanFade(false);
            v148:SetVisible(true, true);
            v148:ForceShowUntilLookedAt();
            v148.OnUpdate = function(_) --[[ Line: 1157 ]] --[[ Name: OnUpdate ]]

            end;
            l_BindableEvent_1:Fire();
            return;
        end;
    end);
    rawset(v170, "Close", function(v238, v239) --[[ Line: 1163 ]]
        -- upvalues: v178 (ref), v220 (ref), v221 (ref), v222 (ref), l_ContextActionService_0 (ref), v148 (copy), v150 (copy), l_Panel3D_0 (copy), l_BindableEvent_2 (copy)
        v239 = v239 == true;
        if not v178 then
            return;
        else
            v178 = false;
            if v220 then
                v220:disconnect();
            end;
            v220 = nil;
            if v221 then
                v221:disconnect();
            end;
            v221 = nil;
            if v222 then
                v222:disconnect();
            end;
            v222 = nil;
            l_ContextActionService_0:UnbindCoreAction("VirtualKeyboardControllerInput");
            v148:OnMouseLeave();
            v148:SetVisible(false, true);
            v150.Visible = false;
            l_Panel3D_0.Get("Topbar3D"):SetVisible(true);
            v238:SubmitText(v239, false);
            l_BindableEvent_2:Fire();
            return;
        end;
    end);
    rawset(v170, "SubmitText", function(_, v241, v242) --[[ Line: 1183 ]]
        -- upvalues: v171 (ref), v187 (ref), l_Panel3D_0 (copy), v148 (copy), v219 (ref)
        local v243 = v171 and v171.TextBox;
        if v243 then
            if v241 then
                v243.Text = if v171 and v171.TextBox then v171.TextBox.Text else v187;
            end;
            local v244 = l_Panel3D_0.FindContainerOf(v243);
            local v245 = v242 and v244 and v244.linkedTo == v148;
            if v245 then
                v219 = true;
            end;
            v243:ReleaseFocus(v241);
            if v245 then
                v243:CaptureFocus();
                v219 = false;
            end;
        end;
    end);
    rawset(v170, "GetCurrentOptions", function(_) --[[ Line: 1206 ]]
        -- upvalues: v171 (ref)
        return v171;
    end);
    rawset(v170, "BackspaceAtCursor", function(_) --[[ Line: 1210 ]]
        -- upvalues: v175 (ref), v171 (ref), v187 (ref), v153 (copy), v184 (copy)
        if v175 >= 1 then
            local v248 = if v171 and v171.TextBox then v171.TextBox.Text else v187;
            local v249 = string.sub(v248, 1, v175 - 1) .. string.sub(v248, v175 + 1, #v248);
            local v250 = v175 - 1;
            if v171 and v171.TextBox then
                v171.TextBox.Text = v249;
            elseif v187 ~= v249 then
                v187 = v249;
                v153:SetTextFromInput(v187);
                v184(v175);
            end;
            v184(v250);
        end;
    end);
    rawset(v170, "SubmitCharacter", function(v251, v252, v253) --[[ Line: 1220 ]]
        -- upvalues: v171 (ref), v187 (ref), v175 (ref), v153 (copy), v184 (copy)
        local v254 = if v171 and v171.TextBox then v171.TextBox.Text else v187;
        local v255 = string.sub(v254, 1, v175) .. v252 .. string.sub(v254, v175 + 1, #v254);
        if v171 and v171.TextBox then
            v171.TextBox.Text = v255;
        elseif v187 ~= v255 then
            v187 = v255;
            v153:SetTextFromInput(v187);
            v184(v175);
        end;
        v184(v175 + #v252);
        if v253 and v251:GetShift() then
            v251:SetShift(false);
        end;
    end);
    for _, v257 in pairs(v146) do
        local v258 = {};
        local v259 = l_Create_0("Frame")({
            Name = "KeyboardSizeConstrainer", 
            Size = UDim2.new(1, 0, 1, -20), 
            Position = UDim2.new(0, 0, 0, 20), 
            BackgroundTransparency = 1, 
            Parent = v150
        });
        local v260 = 0;
        local v261 = 0;
        local v262 = 0;
        for _, v264 in pairs(v257) do
            local v265 = 0;
            local v266 = 1;
            local v267 = 1;
            local v268 = nil;
            local v269 = nil;
            local v270 = nil;
            local v271 = nil;
            for _, v273 in pairs(v264) do
                if type(v273) == "table" then
                    if v273.w then
                        v266 = v273.w;
                    end;
                    if v273.h then
                        v267 = v273.h;
                    end;
                    if v273.x then
                        v265 = v265 + v273.x;
                    end;
                    if v273.y then
                        v262 = v262 + v273.y;
                    end;
                    if v273.x2 then
                        v270 = v273.x2;
                    end;
                    if v273.y2 then
                        v271 = v273.y2;
                    end;
                    if v273.w2 then
                        v268 = v273.w2;
                    end;
                    if v273.h2 then
                        v269 = v273.h2;
                    end;
                elseif type(v273) == "string" then
                    if v273 == "" then
                        v273 = " ";
                    end;
                    local l_v123_0 = v123;
                    local l_v170_0 = v170;
                    local v276 = {
                        x = v265, 
                        y = v262, 
                        width = v266, 
                        height = v267, 
                        x2 = v270, 
                        y2 = v271, 
                        width2 = v268, 
                        height2 = v269
                    };
                    local l_v273_0 = v273;
                    local v278 = {};
                    for v279 in string.gmatch(l_v273_0, "([^\n]+)") do
                        table.insert(v278, v279);
                    end;
                    table.insert(v258, (l_v123_0(l_v170_0, v276, v278)));
                    v265 = v265 + v266;
                    v260 = math.max(v260, v265);
                    v261 = math.max(v261, v262 + v267);
                    v266 = 1;
                    v267 = 1;
                    v268 = nil;
                    v269 = nil;
                    v270 = nil;
                    v271 = nil;
                end;
            end;
            v262 = v262 + 1;
        end;
        for _, v281 in pairs(v258) do
            v281.Position = UDim2.new(v281.Position.X.Scale / v260, 0, v281.Position.Y.Scale / v261, 0);
            v281.Size = UDim2.new(v281.Size.X.Scale / v260, 0, v281.Size.Y.Scale / v261, 0);
            v281.Parent = v259;
        end;
        v259.SizeConstraint = Enum.SizeConstraint.RelativeXX;
        v259.Size = UDim2.new(1, 0, -v261 / v260, 0);
        v259.Position = UDim2.new(0, 0, 1, 0);
        v259.Visible = false;
        table.insert(v172, {
            keys = v258, 
            container = v259
        });
    end;
    v170:SetCurrentKeyset(1);
    v153.MouseButton1Click:connect(function() --[[ Line: 1301 ]]
        -- upvalues: v184 (copy), v198 (copy), v148 (copy)
        v184((v198(v148.lookAtPixel.X, v148.lookAtPixel.Y)));
    end);
    v156.MouseButton1Click:connect(function() --[[ Line: 1305 ]]
        -- upvalues: v170 (copy)
        v170:Close(false);
    end);
    v159.MouseButton1Click:connect(function() --[[ Line: 1309 ]]
        -- upvalues: v139 (ref), v126 (ref), l_SoundService_0 (ref)
        if v139:GetCurrentState().Name == "Listening" then
            local l_v139_1 = v139;
            local v283 = v126();
            v283.Name = "Processing";
            local v284 = false;
            local v285 = nil;
            local v286;
            do
                local l_v284_0, l_v285_0 = v284, v285;
                v283.TransitionTo = function(_) --[[ Line: 662 ]] --[[ Name: TransitionTo ]]
                    -- upvalues: l_v285_0 (ref), l_SoundService_0 (ref), l_v284_0 (ref)
                    coroutine.wrap(function() --[[ Line: 663 ]]
                        -- upvalues: l_v285_0 (ref), l_SoundService_0 (ref), l_v284_0 (ref)
                        pcall(function() --[[ Line: 664 ]]
                            -- upvalues: l_v285_0 (ref), l_SoundService_0 (ref)
                            l_v285_0 = l_SoundService_0:EndRecording();
                        end);
                        l_v284_0 = true;
                    end)();
                end;
                v283.GetResultAsync = function(_) --[[ Line: 669 ]] --[[ Name: GetResultAsync ]]
                    -- upvalues: l_v284_0 (ref), l_v285_0 (ref)
                    while not l_v284_0 do
                        wait();
                    end;
                    return l_v285_0;
                end;
                v286 = v283;
            end;
            l_v139_1:TransitionState(v286);
        end;
    end);
    local function v296(v291) --[[ Line: 1315 ]] --[[ Name: onVoiceProcessingStateChanged ]]
        -- upvalues: v158 (copy), v169 (copy), v19 (ref), v171 (ref), v187 (ref), v153 (copy), v184 (copy), v175 (ref), v139 (ref), v126 (ref), v170 (copy)
        if v291.Name == "Listening" then
            v158.Text = "Listening...";
        elseif v291.Name == "Processing" then
            v158.Text = "Processing...";
        elseif v291.Name == "Waiting" then
            v158.Text = "Done";
        end;
        if v291.Name == "Processing" then
            coroutine.wrap(function() --[[ Line: 1326 ]]
                -- upvalues: v169 (ref), v291 (copy), v19 (ref), v171 (ref), v187 (ref), v153 (ref), v184 (ref), v175 (ref), v158 (ref), v139 (ref), v126 (ref)
                v169:StopAnimation();
                local l_v291_ResultAsync_0 = v291:GetResultAsync();
                if l_v291_ResultAsync_0 and l_v291_ResultAsync_0.Status == v19.ASR_STATUS_OK then
                    local l_Response_0 = l_v291_ResultAsync_0.Response;
                    if v171 and v171.TextBox then
                        v171.TextBox.Text = l_Response_0;
                    elseif v187 ~= l_Response_0 then
                        v187 = l_Response_0;
                        v153:SetTextFromInput(v187);
                        v184(v175);
                    end;
                else
                    v158.Text = "An error occurred, please try again.";
                    wait(2);
                end;
                local l_v139_2 = v139;
                local v295 = v126();
                v295.Name = "Waiting";
                l_v139_2:TransitionState(v295);
            end)();
            return;
        elseif v291.Name == "Listening" then
            v169:StartAnimation();
            return;
        else
            if v291.Name == "Waiting" then
                v170:SetVoiceMode(false);
            end;
            return;
        end;
    end;
    v139.StateTransitionedEvent:connect(v296);
    v296(v139:GetCurrentState());
    return v170;
end;
v140 = nil;
local function _() --[[ Line: 1352 ]] --[[ Name: GetKeyboard ]]
    -- upvalues: v140 (ref), l_BindableEvent_0 (copy), v17 (copy), v18 (copy)
    if v140 == nil then
        v140 = l_BindableEvent_0({
            v17, 
            v18
        });
    end;
    return v140;
end;
local v303 = {
    CreateVirtualKeyboardOptions = function(_, v299) --[[ Line: 1363 ]] --[[ Name: CreateVirtualKeyboardOptions ]]
        return {
            TextBox = v299
        };
    end, 
    ShowVirtualKeyboard = function(_, _) --[[ Line: 1372 ]] --[[ Name: ShowVirtualKeyboard ]]

    end, 
    CloseVirtualKeyboard = function(_) --[[ Line: 1378 ]] --[[ Name: CloseVirtualKeyboard ]]

    end
};
if v140 == nil then
    v140 = l_BindableEvent_0({
        v17, 
        v18
    });
end;
v303.OpenedEvent = v140.OpenedEvent;
if v140 == nil then
    v140 = l_BindableEvent_0({
        v17, 
        v18
    });
end;
v303.ClosedEvent = v140.ClosedEvent;
return v303;