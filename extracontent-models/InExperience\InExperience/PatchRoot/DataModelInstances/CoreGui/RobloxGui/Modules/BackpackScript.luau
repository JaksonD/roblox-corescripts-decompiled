local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_RobloxGui_0.Modules;
local v4 = require(l_CorePackages_0.Packages.Signals);
local v5 = require(l_CorePackages_0.Workspace.Packages.InExperienceTopBar);
local l_SettingsShowSignal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal;
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local v8 = require(l_Modules_0.Flags.FFlagMountCoreGuiBackpack);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_InExperienceUIVRIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP;
local l_FFlagTopBarSignalizeSetCores_0 = v5.Flags.FFlagTopBarSignalizeSetCores;
local v12 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v13 = game:DefineFastFlag("EnableHotbarHide", false);
local v14 = {
    OpenClose = nil, 
    IsHotbarVisible = false, 
    IsOpen = false, 
    StateChanged = Instance.new("BindableEvent"), 
    ModuleName = "Backpack", 
    KeepVRTopbarOpen = true, 
    VRIsExclusive = true, 
    VRClosesNonExclusive = true
};
local v15 = 60;
local l_Size14_0 = Enum.FontSize.Size14;
local v17 = 0.5 * l_UserGameSettings_0.PreferredTransparency;
local v18 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039);
local v19 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
local v20 = Color3.new(0.35294117647058826, 0.5568627450980392, 0.9137254901960784);
local v21 = 0.5 * l_UserGameSettings_0.PreferredTransparency;
local v22 = Color3.new(1, 1, 1);
local _ = UDim2.new(0, 14, 0, 9);
local l_Value_0 = Enum.KeyCode.Backquote.Value;
local v25 = Color3.new(0, 0.6352941176470588, 1);
local v26 = "   Search";
local v27 = Color3.new(0.37, 0.37, 0.37);
local v28 = 0.15 * l_UserGameSettings_0.PreferredTransparency;
local l_Value_1 = Enum.KeyCode.Zero.Value;
local l_Value_2 = Enum.KeyCode.Backspace.Value;
local v31 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_VRService_0 = game:GetService("VRService");
local l_GamepadService_0 = game:GetService("GamepadService");
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v39 = require(l_Modules_0.TenFootInterface):IsEnabled();
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v41 = require(l_Modules_0.GameTranslator);
pcall(function() --[[ Line: 121 ]]
    -- upvalues: v26 (ref), v12 (copy)
    v26 = v12:FormatByKey("InGame.UnknownNamespace.BACKPACK_SEARCH");
end);
local v42 = true;
if v39 then
    v15 = 100;
    l_Size14_0 = Enum.FontSize.Size24;
end;
local v43 = false;
local v44 = l_UserInputService_0.TouchEnabled and l_GuiService_0:GetScreenResolution().X < 1024;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v46 = nil;
local v47 = nil;
local v48 = nil;
local v49 = nil;
local v50 = nil;
local v51 = nil;
local v52 = nil;
local v53 = nil;
local v54 = nil;
local v55 = nil;
local v56 = nil;
local v57 = nil;
local v58 = nil;
local v59 = nil;
local v60 = {};
local v61 = nil;
local v62 = {};
local v63 = {};
local v64 = {};
local v65 = 0;
local v66 = nil;
local v67 = false;
local v68 = false;
local v69 = false;
local v70 = false;
local v71 = {};
local v72 = {};
local v73 = false;
local v74 = 0;
local v75 = v44 and 3 or 10;
local v76 = v44 and 2 or 4;
local v77 = nil;
v14.BackpackEmpty = l_Create_0("BindableEvent")({
    Name = "BackpackEmpty"
});
v14.BackpackItemAdded = l_Create_0("BindableEvent")({
    Name = "BackpackAdded"
});
v14.BackpackItemRemoved = l_Create_0("BindableEvent")({
    Name = "BackpackRemoved"
});
local function v81(v78, v79) --[[ Line: 188 ]] --[[ Name: NewGui ]]
    -- upvalues: l_Size14_0 (ref)
    local v80 = Instance.new(v78);
    v80.Name = v79;
    v80.BackgroundColor3 = Color3.new(0, 0, 0);
    v80.BackgroundTransparency = 1;
    v80.BorderColor3 = Color3.new(0, 0, 0);
    v80.BorderSizePixel = 0;
    v80.Size = UDim2.new(1, 0, 1, 0);
    if v78:match("Text") then
        v80.TextColor3 = Color3.new(1, 1, 1);
        v80.Text = "";
        v80.Font = Enum.Font.SourceSans;
        v80.FontSize = l_Size14_0;
        v80.TextWrapped = true;
        if v78 == "TextButton" then
            v80.Font = Enum.Font.SourceSansBold;
            v80.BorderSizePixel = 1;
        end;
    end;
    return v80;
end;
local function _() --[[ Line: 210 ]] --[[ Name: FindLowestEmpty ]]
    -- upvalues: v75 (ref), v60 (copy)
    for v82 = 1, v75 do
        local v83 = v60[v82];
        if not v83.Tool then
            return v83;
        end;
    end;
    return nil;
end;
v14.IsInventoryEmpty = function() --[[ Line: 220 ]] --[[ Name: isInventoryEmpty ]]
    -- upvalues: v75 (ref), v60 (copy)
    for v85 = v75 + 1, #v60 do
        local v86 = v60[v85];
        if v86 and v86.Tool then
            return false;
        end;
    end;
    return true;
end;
local function _() --[[ Line: 232 ]] --[[ Name: UseGazeSelection ]]
    return false;
end;
local function v101(v88) --[[ Line: 236 ]] --[[ Name: AdjustHotbarFrames ]]
    -- upvalues: v50 (ref), v75 (ref), v65 (ref), v13 (copy), v60 (copy), v48 (ref), v14 (copy)
    local v89 = false;
    local l_Visible_0 = v50.Visible;
    local v91 = l_Visible_0 and v75 or v65;
    local v92 = 0;
    local v93 = if v13 then v91 >= 1 and not v88 else v91 >= 1;
    for v94 = 1, v75 do
        local v95 = v60[v94];
        if (if v13 then v95.Tool and not v88 else v95.Tool) or l_Visible_0 then
            v92 = v92 + 1;
            v95:Readjust(v92, v91);
            v95.Frame.Visible = true;
        else
            v95.Frame.Visible = false;
        end;
    end;
    local l_v48_0 = v48;
    local v97 = not l_Visible_0;
    if v97 then
        v97 = v93;
        if not v97 then
            local v98;
            for v99 = v75 + 1, #v60 do
                local v100 = v60[v99];
                if v100 and v100.Tool then
                    v98 = false;
                    v89 = true;
                end;
                if v89 then
                    break;
                end;
            end;
            if not v89 then
                v98 = true;
            end;
            v89 = false;
            v97 = not v98;
        end;
    end;
    l_v48_0.Visible = v97;
    v48.Position = UDim2.new(0.5, -15, 1, v93 and -110 or -50);
    v14.IsHotbarVisible = v93;
end;
local function v104() --[[ Line: 259 ]] --[[ Name: UpdateScrollingFrameCanvasSize ]]
    -- upvalues: v52 (ref), v15 (ref), v53 (ref)
    local v102 = math.floor(v52.AbsoluteSize.X / (v15 + 5));
    local v103 = math.ceil((#v53:GetChildren() - 1) / v102) * (v15 + 5) + 5;
    v52.CanvasSize = UDim2.new(0, 0, 0, v103);
end;
local function v107() --[[ Line: 266 ]] --[[ Name: AdjustInventoryFrames ]]
    -- upvalues: v75 (ref), v60 (copy), v104 (copy)
    for v105 = v75 + 1, #v60 do
        local v106 = v60[v105];
        v106.Frame.LayoutOrder = v106.Index;
        v106.Frame.Visible = v106.Tool ~= nil;
    end;
    v104();
end;
local function v108() --[[ Line: 275 ]] --[[ Name: UpdateBackpackLayout ]]
    -- upvalues: v47 (ref), v75 (ref), v15 (ref), v50 (ref), v76 (copy), v52 (ref), v101 (copy), v107 (copy)
    v47.Size = UDim2.new(0, 5 + v75 * (v15 + 5), 0, v15 + 5 + 5);
    v47.Position = UDim2.new(0.5, -v47.Size.X.Offset / 2, 1, -v47.Size.Y.Offset);
    v50.Size = UDim2.new(0, v47.Size.X.Offset, 0, v47.Size.Y.Offset * v76 + 40);
    v50.Position = UDim2.new(0.5, -v50.Size.X.Offset / 2, 1, v47.Position.Y.Offset - v50.Size.Y.Offset);
    v52.Size = UDim2.new(1, v52.ScrollBarThickness + 1, 1, -40);
    v52.Position = UDim2.new(0, 0, 0, 40);
    v101();
    v107();
end;
local function _(v109, v110, v111) --[[ Line: 287 ]] --[[ Name: Clamp ]]
    return (math.min(v110, (math.max(v109, v111))));
end;
local function _(v113, v114, v115) --[[ Line: 291 ]] --[[ Name: CheckBounds ]]
    local l_AbsolutePosition_0 = v113.AbsolutePosition;
    local l_AbsoluteSize_0 = v113.AbsoluteSize;
    local v118 = false;
    if l_AbsolutePosition_0.X < v114 then
        v118 = false;
        if v114 <= l_AbsolutePosition_0.X + l_AbsoluteSize_0.X then
            v118 = false;
            if l_AbsolutePosition_0.Y < v115 then
                v118 = v115 <= l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
            end;
        end;
    end;
    return v118;
end;
local function _(v120, v121) --[[ Line: 297 ]] --[[ Name: GetOffset ]]
    return (v120.AbsolutePosition + v120.AbsoluteSize / 2 - v121).magnitude;
end;
local function _() --[[ Line: 302 ]] --[[ Name: DisableActiveHopper ]]
    -- upvalues: v66 (ref), v62 (copy)
    v66:ToggleSelect();
    v62[v66]:UpdateEquipView();
    v66 = nil;
end;
local function _() --[[ Line: 308 ]] --[[ Name: UnequipAllTools ]]
    -- upvalues: v58 (ref), v66 (ref), v62 (copy)
    if v58 then
        v58:UnequipTools();
        if v66 then
            v66:ToggleSelect();
            v62[v66]:UpdateEquipView();
            v66 = nil;
        end;
    end;
end;
local function _(v125) --[[ Line: 317 ]] --[[ Name: EquipNewTool ]]
    -- upvalues: v58 (ref), v66 (ref), v62 (copy), v57 (ref)
    if v58 then
        v58:UnequipTools();
        if v66 then
            v66:ToggleSelect();
            v62[v66]:UpdateEquipView();
            v66 = nil;
        end;
    end;
    if v125:IsA("HopperBin") then
        v125:ToggleSelect();
        v62[v125]:UpdateEquipView();
        v66 = v125;
        return;
    else
        v125.Parent = v57;
        return;
    end;
end;
local function _(v127) --[[ Line: 329 ]] --[[ Name: IsEquipped ]]
    -- upvalues: v57 (ref)
    return v127 and (v127:IsA("HopperBin") and v127.Active or v127.Parent == v57);
end;
local function v129(v130, v131) --[[ Line: 333 ]] --[[ Name: MakeSlot ]]
    -- upvalues: v60 (copy), v21 (ref), v19 (copy), v18 (copy), v47 (ref), v15 (ref), v41 (copy), v75 (ref), v50 (ref), v65 (ref), v68 (ref), v43 (ref), l_ContextActionService_0 (copy), v62 (copy), v61 (ref), v57 (ref), v77 (ref), v81 (copy), v20 (copy), v64 (copy), v104 (copy), v58 (ref), v66 (ref), v59 (ref), v22 (copy), v129 (copy), v53 (ref), v70 (ref), v63 (copy), l_Value_1 (copy), v52 (ref)
    v131 = v131 or #v60 + 1;
    local v132 = {
        Tool = nil, 
        Index = v131, 
        Frame = nil
    };
    local v133 = nil;
    local v134 = nil;
    local v135 = nil;
    local v136 = nil;
    local v137 = nil;
    local v138 = nil;
    local v139 = nil;
    local v140 = nil;
    local v141 = nil;
    local function _() --[[ Line: 358 ]] --[[ Name: UpdateSlotFading ]]
        -- upvalues: v133 (ref), v21 (ref), v19 (ref), v18 (ref)
        v133.SelectionImageObject = nil;
        v133.BackgroundTransparency = v133.Draggable and 0 or v21;
        v133.BackgroundColor3 = v133.Draggable and v19 or v18;
    end;
    v132.Readjust = function(_, v144, v145) --[[ Line: 364 ]] --[[ Name: Readjust ]]
        -- upvalues: v47 (ref), v15 (ref), v133 (ref)
        local v146 = v47.Size.X.Offset / 2;
        local v147 = v15 + 5;
        local v148 = v144 - (v145 / 2 + 0.5);
        v133.Position = UDim2.new(0, v146 - v15 / 2 + v147 * v148, 0, 5);
    end;
    v132.Fill = function(v149, v150) --[[ Line: 372 ]] --[[ Name: Fill ]]
        -- upvalues: v135 (ref), v136 (ref), v41 (ref), v140 (ref), v137 (ref), v75 (ref), v50 (ref), v133 (ref), v65 (ref), v68 (ref), v43 (ref), l_ContextActionService_0 (ref), v62 (ref), v61 (ref), v60 (ref)
        local v151 = false;
        if not v150 then
            return v149:Clear();
        else
            v149.Tool = v150;
            local function v154() --[[ Line: 379 ]] --[[ Name: assignToolData ]]
                -- upvalues: v150 (copy), v135 (ref), v136 (ref), v41 (ref), v140 (ref)
                local l_TextureId_0 = v150.TextureId;
                v135.Image = l_TextureId_0;
                if l_TextureId_0 ~= "" then
                    v136.Visible = false;
                else
                    v136.Visible = true;
                end;
                v41:TranslateAndRegister(v136, v150, v150.Name);
                if v140 and v150:IsA("Tool") then
                    v41:TranslateAndRegister(v140, v150, v150.ToolTip);
                    local v153 = v140.TextBounds.X + 6;
                    v140.Size = UDim2.new(0, v153, 0, 16);
                    v140.Position = UDim2.new(0.5, -v153 / 2, 0, -25);
                end;
            end;
            v154();
            if v137 then
                v137:disconnect();
                v137 = nil;
            end;
            v137 = v150.Changed:connect(function(v155) --[[ Line: 405 ]]
                -- upvalues: v154 (copy)
                if v155 == "TextureId" or v155 == "Name" or v155 == "ToolTip" then
                    v154();
                end;
            end);
            local v156 = v149.Index <= v75;
            local l_Visible_1 = v50.Visible;
            if not v156 or l_Visible_1 then
                v133.Draggable = true;
            end;
            v149:UpdateEquipView();
            if v156 then
                v65 = v65 + 1;
                if v68 and v65 >= 1 and not v43 then
                    v43 = true;
                    l_ContextActionService_0:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
                end;
            end;
            v62[v150] = v149;
            local v158;
            for v159 = 1, v75 do
                local v160 = v60[v159];
                if not v160.Tool then
                    v158 = v160;
                    v151 = true;
                end;
                if v151 then
                    break;
                end;
            end;
            if not v151 then
                v158 = nil;
            end;
            v151 = false;
            v61 = v158;
            return;
        end;
    end;
    v132.Clear = function(v161) --[[ Line: 436 ]] --[[ Name: Clear ]]
        -- upvalues: v137 (ref), v135 (ref), v136 (ref), v140 (ref), v133 (ref), v75 (ref), v65 (ref), v43 (ref), l_ContextActionService_0 (ref), v62 (ref), v61 (ref), v60 (ref)
        local v162 = false;
        if not v161.Tool then
            return;
        else
            if v137 then
                v137:disconnect();
                v137 = nil;
            end;
            v135.Image = "";
            v136.Text = "";
            if v140 then
                v140.Text = "";
                v140.Visible = false;
            end;
            v133.Draggable = false;
            v161:UpdateEquipView(true);
            if v161.Index <= v75 then
                v65 = v65 - 1;
                if v65 < 1 then
                    v43 = false;
                    l_ContextActionService_0:UnbindAction("RBXHotbarEquip");
                end;
            end;
            v62[v161.Tool] = nil;
            v161.Tool = nil;
            local v163;
            for v164 = 1, v75 do
                local v165 = v60[v164];
                if not v165.Tool then
                    v163 = v165;
                    v162 = true;
                end;
                if v162 then
                    break;
                end;
            end;
            if not v162 then
                v163 = nil;
            end;
            v162 = false;
            v61 = v163;
            return;
        end;
    end;
    v132.UpdateEquipView = function(v166, v167) --[[ Line: 467 ]] --[[ Name: UpdateEquipView ]]
        -- upvalues: v57 (ref), v77 (ref), v132 (copy), v138 (ref), v81 (ref), v133 (ref), v20 (ref), v21 (ref), v19 (ref), v18 (ref)
        local v168 = false;
        if not v167 then
            local l_Tool_0 = v166.Tool;
            if l_Tool_0 and (l_Tool_0:IsA("HopperBin") and l_Tool_0.Active or l_Tool_0.Parent == v57) then
                v77 = v132;
                if not v138 then
                    v138 = v81("Frame", "Equipped");
                    v138.ZIndex = v133.ZIndex;
                    for _, v171 in pairs({
                        {
                            0.1, 
                            1, 
                            0, 
                            0
                        }, 
                        {
                            0.8, 
                            0.1, 
                            0.1, 
                            0
                        }, 
                        {
                            0.1, 
                            1, 
                            0.9, 
                            0
                        }, 
                        {
                            0.8, 
                            0.1, 
                            0.1, 
                            0.9
                        }
                    }) do
                        local v172 = v81("Frame", "Edge");
                        v172.BackgroundTransparency = 0;
                        v172.BackgroundColor3 = v20;
                        v172.Size = UDim2.new(v171[1], 0, v171[2], 0);
                        v172.Position = UDim2.new(v171[3], 0, v171[4], 0);
                        v172.ZIndex = v138.ZIndex;
                        v172.Parent = v138;
                    end;
                end;
                v138.Parent = v133;
                v168 = true;
            end;
        end;
        if not v168 then
            if v138 then
                v138.Parent = nil;
            end;
        end;
        v168 = false;
        v133.SelectionImageObject = nil;
        v133.BackgroundTransparency = v133.Draggable and 0 or v21;
        v133.BackgroundColor3 = v133.Draggable and v19 or v18;
    end;
    v132.IsEquipped = function(v173) --[[ Line: 499 ]] --[[ Name: IsEquipped ]]
        -- upvalues: v57 (ref)
        local l_Tool_1 = v173.Tool;
        return l_Tool_1 and (l_Tool_1:IsA("HopperBin") and l_Tool_1.Active or l_Tool_1.Parent == v57);
    end;
    v132.Delete = function(v175) --[[ Line: 503 ]] --[[ Name: Delete ]]
        -- upvalues: v64 (ref), v133 (ref), v60 (ref), v104 (ref)
        v64[v133] = nil;
        v133:Destroy();
        table.remove(v60, v175.Index);
        local v176 = #v60;
        for v177 = v175.Index, v176 do
            v60[v177]:SlideBack();
        end;
        v104();
    end;
    v132.Swap = function(v178, v179) --[[ Line: 517 ]] --[[ Name: Swap ]]
        local l_Tool_2 = v178.Tool;
        local l_Tool_3 = v179.Tool;
        v178:Clear();
        if l_Tool_3 then
            v179:Clear();
            v178:Fill(l_Tool_3);
        end;
        if l_Tool_2 then
            v179:Fill(l_Tool_2);
            return;
        else
            v179:Clear();
            return;
        end;
    end;
    v132.SlideBack = function(v182) --[[ Line: 531 ]] --[[ Name: SlideBack ]]
        -- upvalues: v133 (ref)
        v182.Index = v182.Index - 1;
        v133.Name = v182.Index;
        v133.LayoutOrder = v182.Index;
    end;
    v132.TurnNumber = function(_, v184) --[[ Line: 537 ]] --[[ Name: TurnNumber ]]
        -- upvalues: v141 (ref)
        if v141 then
            v141.Visible = v184;
        end;
    end;
    v132.SetClickability = function(v185, v186) --[[ Line: 543 ]] --[[ Name: SetClickability ]]
        -- upvalues: v133 (ref), v21 (ref), v19 (ref), v18 (ref)
        if v185.Tool then
            v133.Draggable = not v186;
            v133.SelectionImageObject = nil;
            v133.BackgroundTransparency = v133.Draggable and 0 or v21;
            v133.BackgroundColor3 = v133.Draggable and v19 or v18;
        end;
    end;
    v132.CheckTerms = function(v187, v188) --[[ Line: 550 ]] --[[ Name: CheckTerms ]]
        -- upvalues: v136 (ref), v140 (ref)
        local v189 = 0;
        local _ = function(v190, v191) --[[ Line: 552 ]] --[[ Name: checkEm ]]
            -- upvalues: v189 (ref)
            local _, v193 = v190:lower():gsub(v191, "");
            v189 = v189 + v193;
        end;
        local l_Tool_4 = v187.Tool;
        if l_Tool_4 then
            for v196 in pairs(v188) do
                local v197, v198 = v136.Text:lower():gsub(v196, "");
                v189 = v189 + v198;
                if l_Tool_4:IsA("Tool") then
                    v197, v198 = (v140 and v140.Text or ""):lower():gsub(v196, "");
                    v189 = v189 + v198;
                end;
            end;
        end;
        return v189;
    end;
    v132.Select = function(_, v200) --[[ Line: 570 ]] --[[ Name: Select ]]
        -- upvalues: v132 (copy), v57 (ref), v58 (ref), v66 (ref), v62 (ref), v59 (ref)
        if v200 then
            return;
        else
            local l_Tool_5 = v132.Tool;
            if l_Tool_5 then
                if l_Tool_5 and (l_Tool_5:IsA("HopperBin") and l_Tool_5.Active or l_Tool_5.Parent == v57) then
                    if v58 then
                        v58:UnequipTools();
                        if v66 then
                            v66:ToggleSelect();
                            v62[v66]:UpdateEquipView();
                            v66 = nil;
                            return;
                        end;
                    end;
                elseif l_Tool_5.Parent == v59 then
                    if v58 then
                        v58:UnequipTools();
                        if v66 then
                            v66:ToggleSelect();
                            v62[v66]:UpdateEquipView();
                            v66 = nil;
                        end;
                    end;
                    if l_Tool_5:IsA("HopperBin") then
                        l_Tool_5:ToggleSelect();
                        v62[l_Tool_5]:UpdateEquipView();
                        v66 = l_Tool_5;
                        return;
                    else
                        l_Tool_5.Parent = v57;
                    end;
                end;
            end;
            return;
        end;
    end;
    v133 = v81("TextButton", v131);
    v133.BackgroundColor3 = v18;
    v133.BorderColor3 = v22;
    v133.Text = "";
    v133.AutoButtonColor = false;
    v133.BorderSizePixel = 0;
    v133.Size = UDim2.new(0, v15, 0, v15);
    v133.Active = true;
    v133.Draggable = false;
    v133.BackgroundTransparency = v21;
    v133.MouseButton1Click:connect(function() --[[ Line: 597 ]]
        -- upvalues: v132 (copy)
        changeSlot(v132);
    end);
    v132.Frame = v133;
    local v202 = v81("Frame", "SelectionObjectClipper");
    v202.Visible = false;
    v202.Parent = v133;
    v139 = v81("ImageLabel", "Selector");
    v139.Size = UDim2.new(1, 0, 1, 0);
    v139.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png";
    v139.ScaleType = Enum.ScaleType.Slice;
    v139.SliceCenter = Rect.new(12, 12, 52, 52);
    v139.Parent = v202;
    v135 = v81("ImageLabel", "Icon");
    v135.Size = UDim2.new(0.8, 0, 0.8, 0);
    v135.Position = UDim2.new(0.1, 0, 0.1, 0);
    v135.Parent = v133;
    v136 = v81("TextLabel", "ToolName");
    v136.Size = UDim2.new(1, -2, 1, -2);
    v136.Position = UDim2.new(0, 1, 0, 1);
    v136.Parent = v133;
    v132.Frame.LayoutOrder = v132.Index;
    if v131 <= v75 then
        v140 = v81("TextLabel", "ToolTip");
        v140.TextWrapped = false;
        v140.TextYAlignment = Enum.TextYAlignment.Top;
        v140.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4);
        v140.BackgroundTransparency = 0;
        v140.Visible = false;
        v140.Parent = v133;
        v133.MouseEnter:connect(function() --[[ Line: 635 ]]
            -- upvalues: v140 (ref)
            if v140.Text ~= "" then
                v140.Visible = true;
            end;
        end);
        v133.MouseLeave:connect(function() --[[ Line: 640 ]]
            -- upvalues: v140 (ref)
            v140.Visible = false;
        end);
        v132.MoveToInventory = function(v203) --[[ Line: 642 ]] --[[ Name: MoveToInventory ]]
            -- upvalues: v132 (copy), v75 (ref), v129 (ref), v53 (ref), v57 (ref), v58 (ref), v66 (ref), v62 (ref), v70 (ref), v50 (ref)
            if v132.Index <= v75 then
                local l_Tool_6 = v132.Tool;
                v203:Clear();
                local v205 = v129(v53);
                v205:Fill(l_Tool_6);
                if l_Tool_6 and (l_Tool_6:IsA("HopperBin") and l_Tool_6.Active or l_Tool_6.Parent == v57) and v58 then
                    v58:UnequipTools();
                    if v66 then
                        v66:ToggleSelect();
                        v62[v66]:UpdateEquipView();
                        v66 = nil;
                    end;
                end;
                if v70 then
                    v205.Frame.Visible = false;
                    v205.Parent = v50;
                end;
            end;
        end;
        if v131 < 10 or v131 == v75 then
            v202 = v131 < 10 and v131 or 0;
            v141 = v81("TextLabel", "Number");
            v141.Text = v202;
            v141.Size = UDim2.new(0.15, 0, 0.15, 0);
            v141.Visible = false;
            v141.Parent = v133;
            v63[l_Value_1 + v202] = function(v206) --[[ Line: 668 ]]
                -- upvalues: v132 (copy)
                v132:Select(v206);
            end;
        end;
    end;
    v202 = v133.Position;
    local v207 = 0;
    local v208 = nil;
    do
        local l_v202_0, l_v207_0, l_v208_0 = v202, v207, v208;
        v133.DragBegin:connect(function(v212) --[[ Line: 679 ]]
            -- upvalues: v64 (ref), v133 (ref), l_v202_0 (ref), v135 (ref), v136 (ref), v141 (ref), v138 (ref), l_v208_0 (ref), v53 (ref), v50 (ref), v134 (ref), v81 (ref)
            v64[v133] = true;
            l_v202_0 = v212;
            v133.BorderSizePixel = 2;
            v133.ZIndex = 2;
            v135.ZIndex = 2;
            v136.ZIndex = 2;
            v133.Parent.ZIndex = 2;
            if v141 then
                v141.ZIndex = 2;
            end;
            if v138 then
                v138.ZIndex = 2;
                for _, v214 in pairs(v138:GetChildren()) do
                    v214.ZIndex = 2;
                end;
            end;
            l_v208_0 = v133.Parent;
            if l_v208_0 == v53 then
                local _ = v133.AbsolutePosition;
                local v216 = UDim2.new(0, v133.AbsolutePosition.X - v50.AbsolutePosition.X, 0, v133.AbsolutePosition.Y - v50.AbsolutePosition.Y);
                v133.Parent = v50;
                v133.Position = v216;
                v134 = v81("Frame", "FakeSlot");
                v134.LayoutOrder = v133.LayoutOrder;
                v134.Size = v133.Size;
                v134.BackgroundTransparency = 1;
                v134.Parent = v53;
            end;
        end);
        v133.DragStopped:connect(function(v217, v218) --[[ Line: 717 ]]
            -- upvalues: v134 (ref), v133 (ref), l_v202_0 (ref), l_v208_0 (ref), v135 (ref), v136 (ref), v141 (ref), v138 (ref), v64 (ref), v132 (copy), v50 (ref), v75 (ref), l_v207_0 (ref), v61 (ref), v47 (ref), v60 (ref), v57 (ref), v58 (ref), v66 (ref), v62 (ref), v70 (ref)
            if v134 then
                v134:Destroy();
            end;
            local v219 = tick();
            v133.Position = l_v202_0;
            v133.Parent = l_v208_0;
            v133.BorderSizePixel = 0;
            v133.ZIndex = 1;
            v135.ZIndex = 1;
            v136.ZIndex = 1;
            l_v208_0.ZIndex = 1;
            if v141 then
                v141.ZIndex = 1;
            end;
            if v138 then
                v138.ZIndex = 1;
                for _, v221 in pairs(v138:GetChildren()) do
                    v221.ZIndex = 1;
                end;
            end;
            v64[v133] = nil;
            if not v132.Tool then
                return;
            else
                local l_v50_0 = v50;
                local l_AbsolutePosition_2 = l_v50_0.AbsolutePosition;
                local l_AbsoluteSize_1 = l_v50_0.AbsoluteSize;
                local v225 = false;
                if l_AbsolutePosition_2.X < v217 then
                    v225 = false;
                    if v217 <= l_AbsolutePosition_2.X + l_AbsoluteSize_1.X then
                        v225 = false;
                        if l_AbsolutePosition_2.Y < v218 then
                            v225 = v218 <= l_AbsolutePosition_2.Y + l_AbsoluteSize_1.Y;
                        end;
                    end;
                end;
                if v225 then
                    if v132.Index <= v75 then
                        v132:MoveToInventory();
                    end;
                    if v132.Index > v75 and v219 - l_v207_0 < 0.5 then
                        if v61 then
                            v225 = v132.Tool;
                            v132:Clear();
                            v61:Fill(v225);
                            v132:Delete();
                        end;
                        v219 = 0;
                    end;
                else
                    l_v50_0 = v47;
                    l_AbsolutePosition_2 = l_v50_0.AbsolutePosition;
                    l_AbsoluteSize_1 = l_v50_0.AbsoluteSize;
                    v225 = false;
                    if l_AbsolutePosition_2.X < v217 then
                        v225 = false;
                        if v217 <= l_AbsolutePosition_2.X + l_AbsoluteSize_1.X then
                            v225 = false;
                            if l_AbsolutePosition_2.Y < v218 then
                                v225 = v218 <= l_AbsolutePosition_2.Y + l_AbsoluteSize_1.Y;
                            end;
                        end;
                    end;
                    if v225 then
                        v225 = {
                            1e999, 
                            nil
                        };
                        for v226 = 1, v75 do
                            local v227 = v60[v226];
                            local l_Frame_0 = v227.Frame;
                            local v229 = Vector2.new(v217, v218);
                            local l_magnitude_0 = (l_Frame_0.AbsolutePosition + l_Frame_0.AbsoluteSize / 2 - v229).magnitude;
                            if l_magnitude_0 < v225[1] then
                                v225 = {
                                    l_magnitude_0, 
                                    v227
                                };
                            end;
                        end;
                        l_v50_0 = v225[2];
                        if l_v50_0 ~= v132 then
                            v132:Swap(l_v50_0);
                            if v132.Index > v75 then
                                l_AbsolutePosition_2 = v132.Tool;
                                if not l_AbsolutePosition_2 then
                                    v132:Delete();
                                else
                                    if l_AbsolutePosition_2 and (l_AbsolutePosition_2:IsA("HopperBin") and l_AbsolutePosition_2.Active or l_AbsolutePosition_2.Parent == v57) and v58 then
                                        v58:UnequipTools();
                                        if v66 then
                                            v66:ToggleSelect();
                                            v62[v66]:UpdateEquipView();
                                            v66 = nil;
                                        end;
                                    end;
                                    if v70 then
                                        v132.Frame.Visible = false;
                                        v132.Frame.Parent = v50;
                                    end;
                                end;
                            end;
                        end;
                    elseif v132.Index <= v75 then
                        v132:MoveToInventory();
                    end;
                end;
                l_v207_0 = v219;
                return;
            end;
        end);
    end;
    v133.Parent = v130;
    v60[v131] = v132;
    if v75 < v131 then
        v104();
        if v50.Visible and not v70 then
            v202 = v52.CanvasSize.Y.Offset - v52.AbsoluteSize.Y;
            v52.CanvasPosition = Vector2.new(0, (math.max(0, v202)));
        end;
    end;
    return v132;
end;
local _ = function(v231) --[[ Line: 826 ]] --[[ Name: SetNumberOfHotbarSlots ]]
    -- upvalues: v75 (ref), v60 (copy), v129 (copy), v47 (ref), v61 (ref), v65 (ref), v108 (copy)
    if v75 ~= v231 then
        local l_v75_0 = v75;
        if v231 < l_v75_0 then
            for v233 = l_v75_0, v231 + 1, -1 do
                local v234 = v60[v233];
                if v234 then
                    v234:MoveToInventory();
                    v234:Delete();
                end;
            end;
            for v235 = l_v75_0, v231 + 1, -1 do
                local v236 = v60[v235];
                if not v236.Tool then
                    v236:Delete();
                end;
            end;
        else
            for v237 = l_v75_0, v231 do
                v75 = v237;
                if v60[v237] then
                    local _ = v60[v237];
                    local l_Tool_7 = v60[v237].Tool;
                    local v240 = v129(v47, v237);
                    if l_Tool_7 then
                        v240:Fill(l_Tool_7);
                    elseif not v61 then
                        v61 = v240;
                    end;
                else
                    local v241 = v129(v47, v237);
                    v241.Frame.Visible = false;
                    if not v61 then
                        v61 = v241;
                    end;
                end;
            end;
        end;
        v75 = v231;
        v65 = 0;
        for v242 = 1, v75 do
            if v60[v242] and v60[v242].Tool then
                v65 = v65 + 1;
            end;
        end;
        v108();
    end;
end;
local function v253(v244) --[[ Line: 888 ]] --[[ Name: OnChildAdded ]]
    -- upvalues: v57 (ref), v58 (ref), v74 (ref), v66 (ref), v62 (copy), v67 (ref), l_LocalPlayer_0 (ref), v61 (ref), v129 (copy), v53 (ref), v60 (copy), v59 (ref), v101 (copy), v75 (ref), v50 (ref), v14 (copy)
    if not v244:IsA("Tool") and not v244:IsA("HopperBin") then
        if v244:IsA("Humanoid") and v244.Parent == v57 then
            v58 = v244;
        end;
        return;
    else
        if v244.Parent == v57 then
            v74 = tick();
        end;
        if v66 and v244.Parent == v57 then
            v66:ToggleSelect();
            v62[v66]:UpdateEquipView();
            v66 = nil;
        end;
        if not v67 and v244.Parent == v57 and not v62[v244] then
            local l_StarterGear_0 = l_LocalPlayer_0:FindFirstChild("StarterGear");
            if l_StarterGear_0 and l_StarterGear_0:FindFirstChild(v244.Name) then
                v67 = true;
                local v246 = v61 or v129(v53);
                for v247 = v246.Index, 1, -1 do
                    local v248 = v60[v247];
                    local v249 = v247 - 1;
                    if v249 > 0 then
                        v60[v249]:Swap(v248);
                    else
                        v248:Fill(v244);
                    end;
                end;
                for _, v251 in pairs(v57:GetChildren()) do
                    if v251:IsA("Tool") and v251 ~= v244 then
                        v251.Parent = v59;
                    end;
                end;
                v101();
                return;
            end;
        end;
        local v252 = v62[v244];
        if v252 then
            v252:UpdateEquipView();
        else
            v252 = v61 or v129(v53);
            v252:Fill(v244);
            if v252.Index <= v75 and not v50.Visible then
                v101();
            end;
            if v244:IsA("HopperBin") and v244.Active then
                if v58 then
                    v58:UnequipTools();
                    if v66 then
                        v66:ToggleSelect();
                        v62[v66]:UpdateEquipView();
                        v66 = nil;
                    end;
                end;
                v66 = v244;
            end;
        end;
        v14.BackpackItemAdded:Fire();
        return;
    end;
end;
local function v261(v254) --[[ Line: 955 ]] --[[ Name: OnChildRemoved ]]
    -- upvalues: v74 (ref), v57 (ref), v59 (ref), v62 (copy), v75 (ref), v50 (ref), v101 (copy), v66 (ref), v14 (copy), v60 (copy)
    local v255 = false;
    if not v254:IsA("Tool") and not v254:IsA("HopperBin") then
        return;
    else
        v74 = tick();
        local l_Parent_0 = v254.Parent;
        if l_Parent_0 == v57 or l_Parent_0 == v59 then
            return;
        else
            local v257 = v62[v254];
            if v257 then
                v257:Clear();
                if v257.Index > v75 then
                    v257:Delete();
                elseif not v50.Visible then
                    v101();
                end;
            end;
            if v254 == v66 then
                v66 = nil;
            end;
            v14.BackpackItemRemoved:Fire();
            local v258;
            for v259 = v75 + 1, #v60 do
                local v260 = v60[v259];
                if v260 and v260.Tool then
                    v258 = false;
                    v255 = true;
                end;
                if v255 then
                    break;
                end;
            end;
            if not v255 then
                v258 = true;
            end;
            v255 = false;
            if v258 then
                v14.BackpackEmpty:Fire();
            end;
            return;
        end;
    end;
end;
local function v271(v262) --[[ Line: 989 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: v60 (copy), v75 (ref), v66 (ref), v72 (ref), v57 (ref), v261 (copy), v253 (copy), v59 (ref), l_LocalPlayer_0 (ref), v101 (copy)
    for v263 = #v60, 1, -1 do
        local v264 = v60[v263];
        if v264.Tool then
            v264:Clear();
        end;
        if v75 < v263 then
            v264:Delete();
        end;
    end;
    v66 = nil;
    for _, v266 in pairs(v72) do
        v266:disconnect();
    end;
    v72 = {};
    v57 = v262;
    table.insert(v72, v262.ChildRemoved:connect(v261));
    table.insert(v72, v262.ChildAdded:connect(v253));
    for _, v268 in pairs(v262:GetChildren()) do
        v253(v268);
    end;
    v59 = l_LocalPlayer_0:WaitForChild("Backpack");
    table.insert(v72, v59.ChildRemoved:connect(v261));
    table.insert(v72, v59.ChildAdded:connect(v253));
    for _, v270 in pairs(v59:GetChildren()) do
        v253(v270);
    end;
    v101();
end;
local function v276(v272, v273) --[[ Line: 1028 ]] --[[ Name: OnInputBegan ]]
    -- upvalues: v69 (ref), v68 (ref), l_Value_2 (copy), v63 (copy), v50 (ref), v14 (copy)
    if v272.UserInputType == Enum.UserInputType.Keyboard and not v69 and (v68 or v272.KeyCode.Value == l_Value_2) then
        local v274 = v63[v272.KeyCode.Value];
        if v274 then
            v274(v273);
        end;
    end;
    local l_UserInputType_0 = v272.UserInputType;
    if not v273 and (l_UserInputType_0 == Enum.UserInputType.MouseButton1 or l_UserInputType_0 == Enum.UserInputType.Touch) and v50.Visible then
        v14.OpenClose();
    end;
end;
local function v280(v277) --[[ Line: 1047 ]] --[[ Name: OnUISChanged ]]
    -- upvalues: l_UserInputService_0 (copy), l_VRService_0 (copy), v75 (ref), v60 (copy)
    if v277 == "KeyboardEnabled" or v277 == "VREnabled" then
        local v278 = l_UserInputService_0.KeyboardEnabled and not l_VRService_0.VREnabled;
        for v279 = 1, v75 do
            v60[v279]:TurnNumber(v278);
        end;
    end;
end;
local v281 = nil;
local v282 = nil;
local function v283() --[[ Line: 1059 ]]

end;
local v284 = Vector2.new(0, 0);
unbindAllGamepadEquipActions = function() --[[ Line: 1063 ]] --[[ Name: unbindAllGamepadEquipActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("RBXBackpackHasGamepadFocus");
    l_ContextActionService_0:UnbindAction("RBXCloseInventory");
end;
local function _(v285, v286) --[[ Line: 1068 ]] --[[ Name: setHotbarVisibility ]]
    -- upvalues: v75 (ref), v60 (copy)
    for v287 = 1, v75 do
        local v288 = v60[v287];
        if v288 and v288.Frame and (v286 or v288.Tool) then
            v288.Frame.Visible = v285;
        end;
    end;
end;
local function v293(v290) --[[ Line: 1077 ]] --[[ Name: getInputDirection ]]
    -- upvalues: v284 (ref)
    local v291 = 1;
    if v290.UserInputState == Enum.UserInputState.End then
        v291 = -1;
    end;
    if v290.KeyCode == Enum.KeyCode.Thumbstick1 then
        local l_magnitude_1 = v290.Position.magnitude;
        if l_magnitude_1 > 0.98 then
            v284 = Vector2.new(v290.Position.x / l_magnitude_1, -v290.Position.y / l_magnitude_1);
        else
            v284 = Vector2.new(0, 0);
        end;
    elseif v290.KeyCode == Enum.KeyCode.DPadLeft then
        v284 = Vector2.new(v284.x - v291 * 1, v284.y);
    elseif v290.KeyCode == Enum.KeyCode.DPadRight then
        v284 = Vector2.new(v284.x + v291 * 1, v284.y);
    elseif v290.KeyCode == Enum.KeyCode.DPadUp then
        v284 = Vector2.new(v284.x, v284.y - v291 * 1);
    elseif v290.KeyCode == Enum.KeyCode.DPadDown then
        v284 = Vector2.new(v284.x, v284.y + v291 * 1);
    else
        v284 = Vector2.new(0, 0);
    end;
    return v284;
end;
local _ = function(_, _, v296) --[[ Line: 1108 ]]
    -- upvalues: v293 (copy), v75 (ref), v60 (copy), v58 (ref), v66 (ref), v62 (copy)
    local v297 = v293(v296);
    if v297 == Vector2.new(0, 0) then
        return;
    else
        local v298 = math.atan2(v297.y, v297.x) - -1.5707963267948966;
        if v298 < 0 then
            v298 = v298 + 6.283185307179586;
        end;
        local v299 = math.floor(v298 / 0.7853981633974483 + 1 + 0.5);
        if v75 < v299 then
            v299 = 1;
        end;
        if v299 > 0 then
            local v300 = v60[v299];
            if v300 and v300.Tool and not v300:IsEquipped() then
                v300:Select();
                return;
            end;
        elseif v58 then
            v58:UnequipTools();
            if v66 then
                v66:ToggleSelect();
                v62[v66]:UpdateEquipView();
                v66 = nil;
            end;
        end;
        return;
    end;
end;
changeToolFunc = function(_, v303, v304) --[[ Line: 1138 ]]
    -- upvalues: v281 (ref), v282 (ref), v58 (ref), v66 (ref), v62 (copy), v75 (ref), v60 (copy), v77 (ref)
    if v303 ~= Enum.UserInputState.Begin then
        return;
    elseif v281 and (v281.KeyCode == Enum.KeyCode.ButtonR1 and v304.KeyCode == Enum.KeyCode.ButtonL1 or v281.KeyCode == Enum.KeyCode.ButtonL1 and v304.KeyCode == Enum.KeyCode.ButtonR1) and tick() - v282 <= 0.06 then
        if v58 then
            v58:UnequipTools();
            if v66 then
                v66:ToggleSelect();
                v62[v66]:UpdateEquipView();
                v66 = nil;
            end;
        end;
        v281 = v304;
        v282 = tick();
        return;
    else
        v281 = v304;
        v282 = tick();
        delay(0.06, function() --[[ Line: 1158 ]]
            -- upvalues: v281 (ref), v304 (copy), v75 (ref), v60 (ref), v58 (ref), v66 (ref), v62 (ref), v77 (ref)
            if v281 ~= v304 then
                return;
            else
                local v305 = 0;
                v305 = v304.KeyCode == Enum.KeyCode.ButtonL1 and -1 or 1;
                for v306 = 1, v75 do
                    if v60[v306]:IsEquipped() then
                        local v307 = v305 + v306;
                        local v308 = false;
                        if v75 < v307 then
                            v307 = 1;
                            v308 = true;
                        elseif v307 < 1 then
                            v307 = v75;
                            v308 = true;
                        end;
                        local l_v307_0 = v307;
                        while true do
                            if not v60[v307].Tool then
                                v307 = v307 + v305;
                                if v307 == l_v307_0 then
                                    return;
                                elseif v75 < v307 then
                                    v307 = 1;
                                    v308 = true;
                                elseif v307 < 1 then
                                    v307 = v75;
                                    v308 = true;
                                end;
                            elseif v308 then
                                if v58 then
                                    v58:UnequipTools();
                                    if v66 then
                                        v66:ToggleSelect();
                                        v62[v66]:UpdateEquipView();
                                        v66 = nil;
                                    end;
                                end;
                                v77 = nil;
                                return;
                            else
                                v60[v307]:Select();
                                return;
                            end;
                        end;
                    end;
                end;
                if v77 and v77.Tool then
                    v77:Select();
                    return;
                else
                    local v310 = v305 == -1 and v75 or 1;
                    local v311 = v305 == -1 and 1 or v75;
                    for v312 = v310, v311, v305 do
                        if v60[v312].Tool then
                            v60[v312]:Select();
                            return;
                        end;
                    end;
                    return;
                end;
            end;
        end);
        return;
    end;
end;
getGamepadSwapSlot = function() --[[ Line: 1222 ]] --[[ Name: getGamepadSwapSlot ]]
    -- upvalues: v60 (copy)
    for v313 = 1, #v60 do
        if v60[v313].Frame.BorderSizePixel > 0 then
            return v60[v313];
        end;
    end;
end;
changeSlot = function(v314) --[[ Line: 1230 ]] --[[ Name: changeSlot ]]
    -- upvalues: l_GamepadService_0 (copy), l_GuiService_0 (copy), v51 (ref), v75 (ref)
    local l_GamepadCursorEnabled_0 = l_GamepadService_0.GamepadCursorEnabled;
    if v314.Frame == l_GuiService_0.SelectedCoreObject and not l_GamepadCursorEnabled_0 then
        local v316 = getGamepadSwapSlot();
        if v316 then
            v316.Frame.BorderSizePixel = 0;
            if v316 ~= v314 then
                v314:Swap(v316);
                v51.SelectionImageObject.Visible = false;
                if v314.Index > v75 and not v314.Tool then
                    if l_GuiService_0.SelectedCoreObject == v314.Frame then
                        l_GuiService_0.SelectedCoreObject = v316.Frame;
                    end;
                    v314:Delete();
                end;
                if v316.Index > v75 and not v316.Tool then
                    if l_GuiService_0.SelectedCoreObject == v316.Frame then
                        l_GuiService_0.SelectedCoreObject = v314.Frame;
                    end;
                    v316:Delete();
                    return;
                end;
            end;
        else
            local l_Size_0 = v314.Frame.Size;
            local l_Position_0 = v314.Frame.Position;
            v314.Frame:TweenSizeAndPosition(l_Size_0 + UDim2.new(0, 10, 0, 10), l_Position_0 - UDim2.new(0, 5, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function() --[[ Line: 1259 ]]
                -- upvalues: v314 (copy), l_Size_0 (copy), l_Position_0 (copy)
                v314.Frame:TweenSizeAndPosition(l_Size_0, l_Position_0, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true);
            end);
            v314.Frame.BorderSizePixel = 3;
            v51.SelectionImageObject.Visible = true;
            return;
        end;
    else
        v314:Select();
        v51.SelectionImageObject.Visible = false;
    end;
end;
enableGamepadInventoryControl = function() --[[ Line: 1269 ]] --[[ Name: enableGamepadInventoryControl ]]
    -- upvalues: v50 (ref), v14 (copy), l_ContextActionService_0 (copy), v283 (copy), l_GuiService_0 (copy), v47 (ref)
    local function v323(_, v320, _) --[[ Line: 1270 ]]
        -- upvalues: v50 (ref), v14 (ref)
        if v320 ~= Enum.UserInputState.Begin then
            return;
        else
            if getGamepadSwapSlot() then
                local v322 = getGamepadSwapSlot();
                if v322 then
                    v322.Frame.BorderSizePixel = 0;
                    return;
                end;
            elseif v50.Visible then
                v14.OpenClose();
            end;
            return;
        end;
    end;
    l_ContextActionService_0:BindAction("RBXBackpackHasGamepadFocus", v283, false, Enum.UserInputType.Gamepad1);
    l_ContextActionService_0:BindAction("RBXCloseInventory", v323, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart);
    if not false then
        l_GuiService_0.SelectedCoreObject = v47:FindFirstChild("1");
    end;
end;
disableGamepadInventoryControl = function() --[[ Line: 1295 ]] --[[ Name: disableGamepadInventoryControl ]]
    -- upvalues: v75 (ref), v60 (copy), l_GuiService_0 (copy), v46 (ref)
    unbindAllGamepadEquipActions();
    for v324 = 1, v75 do
        local v325 = v60[v324];
        if v325 and v325.Frame then
            v325.Frame.BorderSizePixel = 0;
        end;
    end;
    if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v46) then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
end;
local function _() --[[ Line: 1311 ]] --[[ Name: bindBackpackHotbarAction ]]
    -- upvalues: v68 (ref), v43 (ref), l_ContextActionService_0 (copy)
    if v68 and not v43 then
        v43 = true;
        l_ContextActionService_0:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
    end;
end;
local function _() --[[ Line: 1318 ]] --[[ Name: unbindBackpackHotbarAction ]]
    -- upvalues: v43 (ref), l_ContextActionService_0 (copy)
    disableGamepadInventoryControl();
    v43 = false;
    l_ContextActionService_0:UnbindAction("RBXHotbarEquip");
end;
gamepadDisconnected = function() --[[ Line: 1324 ]] --[[ Name: gamepadDisconnected ]]
    -- upvalues: l_VRService_0 (copy), v73 (ref)
    if not l_VRService_0.VREnabled then
        v73 = false;
        disableGamepadInventoryControl();
    end;
end;
gamepadConnected = function() --[[ Line: 1331 ]] --[[ Name: gamepadConnected ]]
    -- upvalues: l_VRService_0 (copy), v73 (ref), l_GuiService_0 (copy), v46 (ref), v65 (ref), v68 (ref), v43 (ref), l_ContextActionService_0 (copy), v50 (ref)
    if not l_VRService_0.VREnabled then
        v73 = true;
        l_GuiService_0:AddSelectionParent("RBXBackpackSelection", v46);
        if v65 >= 1 and v68 and not v43 then
            v43 = true;
            l_ContextActionService_0:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
        end;
        if v50.Visible then
            enableGamepadInventoryControl();
        end;
    end;
end;
local function v332(v328, v329) --[[ Line: 1346 ]] --[[ Name: OnCoreGuiChanged ]]
    -- upvalues: v42 (ref), v68 (ref), v8 (copy), v46 (ref), l_RobloxGui_0 (copy), v71 (copy), l_GuiService_0 (copy), v65 (ref), v43 (ref), l_ContextActionService_0 (copy)
    if v328 == Enum.CoreGuiType.Backpack or v328 == Enum.CoreGuiType.All then
        v329 = v329 and v42;
        v68 = v329;
        if v8 then
            if v329 then
                v46.Parent = l_RobloxGui_0;
            else
                v46.Parent = nil;
            end;
        else
            v46.Visible = v329;
        end;
        for _, v331 in pairs(v71) do
            if v329 then
                l_GuiService_0:AddKey(v331);
            else
                l_GuiService_0:RemoveKey(v331);
            end;
        end;
        if v329 then
            if v65 >= 1 and v68 and not v43 then
                v43 = true;
                l_ContextActionService_0:BindAction("RBXHotbarEquip", changeToolFunc, false, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
                return;
            end;
        else
            disableGamepadInventoryControl();
            v43 = false;
            l_ContextActionService_0:UnbindAction("RBXHotbarEquip");
        end;
    end;
end;
local function v338(v333, v334) --[[ Line: 1381 ]] --[[ Name: MakeVRRoundButton ]]
    -- upvalues: v81 (copy)
    local v335 = v81("ImageButton", v333);
    v335.Size = UDim2.new(0, 40, 0, 40);
    v335.Image = "rbxasset://textures/ui/Keyboard/close_button_background.png";
    local v336 = v81("ImageLabel", "Icon");
    v336.Size = UDim2.new(0.5, 0, 0.5, 0);
    v336.Position = UDim2.new(0.25, 0, 0.25, 0);
    v336.Image = v334;
    v336.Parent = v335;
    local v337 = v81("ImageLabel", "Selection");
    v337.Size = UDim2.new(0.9, 0, 0.9, 0);
    v337.Position = UDim2.new(0.05, 0, 0.05, 0);
    v337.Image = "rbxasset://textures/ui/Keyboard/close_button_selection.png";
    v335.SelectionImageObject = v337;
    return v335, v336, v337;
end;
v46 = v81("Frame", "Backpack");
if v8 then
    if l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
        v46.Parent = l_RobloxGui_0;
    end;
else
    v46.Visible = false;
    v46.Parent = l_RobloxGui_0;
end;
v47 = v81("Frame", "Hotbar");
v47.Parent = v46;
for v339 = 1, v75 do
    local v340 = v129(v47, v339);
    v340.Frame.Visible = false;
    if not v61 then
        v61 = v340;
    end;
end;
v48 = v81("ImageButton", "OpenInventory");
v48.Size = UDim2.new(0, 30, 0, 30);
v48.Image = "rbxasset://textures/ui/Backpack/ScrollUpArrow.png";
v48.MouseButton1Click:connect(function() --[[ Line: 1433 ]]
    -- upvalues: v14 (copy)
    v14.OpenClose();
end);
v48.SelectionGained:connect(function() --[[ Line: 1436 ]]
    -- upvalues: v48 (ref), v25 (copy)
    v48.ImageColor3 = v25;
end);
v48.SelectionLost:connect(function() --[[ Line: 1439 ]]
    -- upvalues: v48 (ref)
    v48.ImageColor3 = Color3.new(1, 1, 1);
end);
local v341 = v81("Frame", "Selection");
v341.Visible = false;
v48.SelectionImageObject = v341;
v49 = v338("CloseInventory", "rbxasset://textures/ui/Keyboard/close_button_icon.png");
v49.Position = UDim2.new(0, 0, 0, -50);
v49.MouseButton1Click:connect(function() --[[ Line: 1449 ]]
    -- upvalues: v50 (ref), v14 (copy)
    if v50.Visible then
        v14.OpenClose();
    end;
end);
LeftBumperButton = v81("ImageLabel", "LeftBumper");
LeftBumperButton.Size = UDim2.new(0, 40, 0, 40);
LeftBumperButton.Position = UDim2.new(0, -LeftBumperButton.Size.X.Offset, 0.5, -LeftBumperButton.Size.Y.Offset / 2);
RightBumperButton = v81("ImageLabel", "RightBumper");
RightBumperButton.Size = UDim2.new(0, 40, 0, 40);
RightBumperButton.Position = UDim2.new(1, 0, 0.5, -RightBumperButton.Size.Y.Offset / 2);
v50 = v81("Frame", "Inventory");
v50.BackgroundTransparency = v17;
v50.BackgroundColor3 = v18;
v50.Active = true;
v50.Visible = false;
v50.Parent = v46;
v51 = v81("TextButton", "VRInventorySelector");
v51.Position = UDim2.new(0, 0, 0, 0);
v51.Size = UDim2.new(1, 0, 1, 0);
v51.BackgroundTransparency = 1;
v51.Text = "";
v51.Parent = v50;
v341 = v81("ImageLabel", "Selector");
v341.Size = UDim2.new(1, 0, 1, 0);
v341.Image = "rbxasset://textures/ui/Keyboard/key_selection_9slice.png";
v341.ScaleType = Enum.ScaleType.Slice;
v341.SliceCenter = Rect.new(12, 12, 52, 52);
v341.Visible = false;
v51.SelectionImageObject = v341;
v52 = v81("ScrollingFrame", "ScrollingFrame");
v52.Selectable = false;
v52.CanvasSize = UDim2.new(0, 0, 0, 0);
v52.Parent = v50;
v53 = v81("Frame", "UIGridFrame");
v53.Selectable = false;
v53.Size = UDim2.new(1, -10, 1, 0);
v53.Position = UDim2.new(0, 5, 0, 0);
v53.Parent = v52;
v54 = Instance.new("UIGridLayout");
v54.SortOrder = Enum.SortOrder.LayoutOrder;
v54.CellSize = UDim2.new(0, v15, 0, v15);
v54.CellPadding = UDim2.new(0, 5, 0, 5);
v54.Parent = v53;
v55 = v338("ScrollUpButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png");
v55.Size = UDim2.new(0, 34, 0, 34);
v55.Position = UDim2.new(0.5, -v55.Size.X.Offset / 2, 0, 43);
v55.Icon.Position = v55.Icon.Position - UDim2.new(0, 0, 0, 2);
v55.MouseButton1Click:connect(function() --[[ Line: 1508 ]]
    -- upvalues: v52 (ref), v15 (ref)
    v52.CanvasPosition = Vector2.new(v52.CanvasPosition.X, (math.min(v52.CanvasSize.Y.Offset - v52.AbsoluteWindowSize.Y, (math.max(0, v52.CanvasPosition.Y - (v15 + 5))))));
end);
v56 = v338("ScrollDownButton", "rbxasset://textures/ui/Backpack/ScrollUpArrow.png");
v56.Rotation = 180;
v56.Icon.Position = v56.Icon.Position - UDim2.new(0, 0, 0, 2);
v56.Size = UDim2.new(0, 34, 0, 34);
v56.Position = UDim2.new(0.5, -v56.Size.X.Offset / 2, 1, -v56.Size.Y.Offset - 3);
v56.MouseButton1Click:connect(function() --[[ Line: 1519 ]]
    -- upvalues: v52 (ref), v15 (ref)
    v52.CanvasPosition = Vector2.new(v52.CanvasPosition.X, (math.min(v52.CanvasSize.Y.Offset - v52.AbsoluteWindowSize.Y, (math.max(0, v52.CanvasPosition.Y + (v15 + 5))))));
end);
v52.Changed:connect(function(v342) --[[ Line: 1525 ]]
    -- upvalues: v52 (ref), v55 (ref), v56 (ref)
    if v342 == "AbsoluteWindowSize" or v342 == "CanvasPosition" or v342 == "CanvasSize" then
        local v343 = v52.CanvasPosition.Y ~= 0;
        local v344 = v52.CanvasPosition.Y < v52.CanvasSize.Y.Offset - v52.AbsoluteWindowSize.Y;
        v55.Visible = v343;
        v56.Visible = v344;
    end;
end);
v108();
local v345 = l_Create_0("Frame")({
    Name = "GamepadHintsFrame", 
    Size = UDim2.new(0, v47.Size.X.Offset, 0, v39 and 95 or 60), 
    BackgroundTransparency = 1, 
    Visible = false, 
    Parent = v46
});
local function v352(v346, v347, v348) --[[ Line: 1548 ]] --[[ Name: addGamepadHint ]]
    -- upvalues: l_Create_0 (copy), v345 (copy), v39 (copy)
    local v349 = l_Create_0("Frame")({
        Name = "HintFrame", 
        Size = UDim2.new(1, 0, 1, -5), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Parent = v345
    });
    local _ = l_Create_0("ImageLabel")({
        Name = "HintImage", 
        Size = v39 and UDim2.new(0, 90, 0, 90) or UDim2.new(0, 60, 0, 60), 
        BackgroundTransparency = 1, 
        Image = v39 and v347 or v346, 
        Parent = v349
    });
    local v351 = l_Create_0("TextLabel")({
        Name = "HintText", 
        Position = UDim2.new(0, v39 and 100 or 70, 0, 0), 
        Size = UDim2.new(1, -(v39 and 100 or 70), 1, 0), 
        Font = Enum.Font.SourceSansBold, 
        FontSize = v39 and Enum.FontSize.Size36 or Enum.FontSize.Size24, 
        BackgroundTransparency = 1, 
        Text = v348, 
        TextColor3 = Color3.new(1, 1, 1), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = true, 
        Parent = v349
    });
    Instance.new("UITextSizeConstraint", v351).MaxTextSize = v351.TextSize;
end;
local function v358() --[[ Line: 1585 ]] --[[ Name: resizeGamepadHintsFrame ]]
    -- upvalues: v345 (copy), v47 (ref), v39 (copy), v50 (ref)
    v345.Size = UDim2.new(v47.Size.X.Scale, v47.Size.X.Offset, 0, v39 and 95 or 60);
    v345.Position = UDim2.new(v47.Position.X.Scale, v47.Position.X.Offset, v50.Position.Y.Scale, v50.Position.Y.Offset - v345.Size.Y.Offset);
    local v353 = 0;
    local l_v345_Children_0 = v345:GetChildren();
    for v355 = 1, #l_v345_Children_0 do
        l_v345_Children_0[v355].Size = UDim2.new(1, 0, 1, -5);
        l_v345_Children_0[v355].Position = UDim2.new(0, 0, 0, 0);
        v353 = v353 + (l_v345_Children_0[v355].HintText.Position.X.Offset + l_v345_Children_0[v355].HintText.TextBounds.X);
    end;
    local v356 = (v345.AbsoluteSize.X - v353) / (#l_v345_Children_0 - 1);
    for v357 = 1, #l_v345_Children_0 do
        l_v345_Children_0[v357].Position = v357 == 1 and UDim2.new(0, 0, 0, 0) or UDim2.new(0, l_v345_Children_0[v357 - 1].Position.X.Offset + l_v345_Children_0[v357 - 1].Size.X.Offset + v356, 0, 0);
        l_v345_Children_0[v357].Size = UDim2.new(0, l_v345_Children_0[v357].HintText.Position.X.Offset + l_v345_Children_0[v357].HintText.TextBounds.X, 1, -5);
    end;
end;
v352("rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonX@2x.png", "Remove From Hotbar");
v352("rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonA@2x.png", "Select/Swap");
v352("rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", "rbxasset://textures/ui/Controls/DesignSystem/ButtonB@2x.png", "Close Backpack");
local v359 = v81("Frame", "Search");
v359.BackgroundColor3 = v27;
v359.BackgroundTransparency = v28;
v359.Size = UDim2.new(0, 190, 0, 30);
v359.Position = UDim2.new(1, -v359.Size.X.Offset - 5, 0, 5);
v359.Parent = v50;
local v360 = v81("TextBox", "TextBox");
v360.Text = v26;
v360.ClearTextOnFocus = false;
v360.FontSize = Enum.FontSize.Size24;
v360.TextXAlignment = Enum.TextXAlignment.Left;
v360.Size = v359.Size - UDim2.new(0, 0, 0, 0);
v360.Position = UDim2.new(0, 0, 0, 0);
v360.Parent = v359;
local v361 = v81("TextButton", "X");
v361.Text = "x";
v361.TextColor3 = v20;
v361.FontSize = Enum.FontSize.Size24;
v361.TextYAlignment = Enum.TextYAlignment.Bottom;
v361.BackgroundColor3 = v27;
v361.BackgroundTransparency = 0;
v361.Size = UDim2.new(0, v359.Size.Y.Offset - 10, 0, v359.Size.Y.Offset - 10);
v361.Position = UDim2.new(1, -v361.Size.X.Offset - 10, 0.5, -v361.Size.Y.Offset / 2);
v361.ZIndex = 0;
v361.Visible = false;
v361.BorderSizePixel = 0;
v361.Parent = v359;
local l_v360_0 = v360 --[[ copy: 118 -> 126 ]];
local l_v361_0 = v361 --[[ copy: 119 -> 127 ]];
local function v375() --[[ Line: 1642 ]] --[[ Name: search ]]
    -- upvalues: l_v360_0 (copy), v75 (ref), v60 (copy), v50 (ref), v70 (ref), v53 (ref), v52 (ref), v104 (copy), l_v361_0 (copy)
    local v364 = {};
    for v365 in l_v360_0.Text:gmatch("%S+") do
        v364[v365:lower()] = true;
    end;
    local v366 = {};
    for v367 = v75 + 1, #v60 do
        local v368 = v60[v367];
        table.insert(v366, {
            v368, 
            (v368:CheckTerms(v364))
        });
        v368.Frame.Visible = false;
        v368.Frame.Parent = v50;
    end;
    table.sort(v366, function(v369, v370) --[[ Line: 1657 ]]
        return v369[2] > v370[2];
    end);
    v70 = true;
    local v371 = 0;
    for _, v373 in ipairs(v366) do
        local v374 = v373[1];
        if v373[2] > 0 then
            v374.Frame.Visible = true;
            v374.Frame.Parent = v53;
            v374.Frame.LayoutOrder = v75 + v371;
            v371 = v371 + 1;
        end;
    end;
    v52.CanvasPosition = Vector2.new(0, 0);
    v104();
    l_v361_0.ZIndex = 3;
end;
local function v378() --[[ Line: 1679 ]] --[[ Name: clearResults ]]
    -- upvalues: l_v361_0 (copy), v70 (ref), v75 (ref), v60 (copy), v53 (ref), v104 (copy)
    if l_v361_0.ZIndex > 0 then
        v70 = false;
        for v376 = v75 + 1, #v60 do
            local v377 = v60[v376];
            v377.Frame.LayoutOrder = v377.Index;
            v377.Frame.Parent = v53;
            v377.Frame.Visible = true;
        end;
        l_v361_0.ZIndex = 0;
    end;
    v104();
end;
local l_v378_0 = v378 --[[ copy: 121 -> 128 ]];
local function v380() --[[ Line: 1693 ]] --[[ Name: reset ]]
    -- upvalues: l_v378_0 (copy), l_v360_0 (copy), v26 (ref)
    l_v378_0();
    l_v360_0.Text = v26;
end;
local l_v375_0 = v375 --[[ copy: 120 -> 129 ]];
local function v386(v382) --[[ Line: 1698 ]] --[[ Name: onChanged ]]
    -- upvalues: l_v360_0 (copy), l_v378_0 (copy), v26 (ref), l_v375_0 (copy), l_v361_0 (copy)
    if v382 == "Text" then
        local l_Text_0 = l_v360_0.Text;
        if l_Text_0 == "" then
            l_v378_0();
        elseif l_Text_0 ~= v26 then
            l_v375_0();
        end;
        local l_l_v361_0_0 = l_v361_0;
        local v385 = false;
        if l_Text_0 ~= "" then
            v385 = l_Text_0 ~= v26;
        end;
        l_l_v361_0_0.Visible = v385;
    end;
end;
local function v387() --[[ Line: 1710 ]] --[[ Name: onFocused ]]
    -- upvalues: l_v360_0 (copy), v26 (ref)
    if l_v360_0.Text == v26 then
        l_v360_0.Text = "";
    end;
end;
local function v389(v388) --[[ Line: 1716 ]] --[[ Name: focusLost ]]
    -- upvalues: l_v375_0 (copy), l_v360_0 (copy), v26 (ref)
    if v388 then
        l_v375_0();
        return;
    else
        if l_v360_0.Text == "" then
            l_v360_0.Text = v26;
        end;
        return;
    end;
end;
v360.Focused:connect(v387);
v361.MouseButton1Click:connect(v380);
v360.Changed:connect(v386);
v360.FocusLost:connect(v389);
v14.StateChanged.Event:connect(function(v390) --[[ Line: 1730 ]]
    -- upvalues: l_v361_0 (copy), l_v378_0 (copy), l_v360_0 (copy), v26 (ref)
    l_v361_0.Modal = v390;
    if not v390 then
        l_v378_0();
        l_v360_0.Text = v26;
    end;
end);
v63[Enum.KeyCode.Escape.Value] = function(v391) --[[ Line: 1737 ]]
    -- upvalues: l_v378_0 (copy), l_v360_0 (copy), v26 (ref), v50 (ref), v14 (copy)
    if v391 then
        l_v378_0();
        l_v360_0.Text = v26;
        return;
    else
        if v50.Visible then
            v14.OpenClose();
        end;
        return;
    end;
end;
l_UserInputService_0.LastInputTypeChanged:connect(function(v392) --[[ Line: 1745 ]] --[[ Name: detectGamepad ]]
    -- upvalues: l_VRService_0 (copy), v359 (copy)
    if v392 == Enum.UserInputType.Gamepad1 and not l_VRService_0.VREnabled then
        v359.Visible = false;
        return;
    else
        v359.Visible = true;
        return;
    end;
end);
v360 = function(_, v394, _) --[[ Line: 1756 ]]
    -- upvalues: l_GuiService_0 (copy), v75 (ref), v60 (copy)
    if v394 ~= Enum.UserInputState.Begin then
        return;
    elseif not l_GuiService_0.SelectedCoreObject then
        return;
    else
        for v396 = 1, v75 do
            if v60[v396].Frame == l_GuiService_0.SelectedCoreObject and v60[v396].Tool then
                v60[v396]:MoveToInventory();
                return;
            end;
        end;
        return;
    end;
end;
local l_v360_1 = v360 --[[ copy: 118 -> 130 ]];
v361 = function() --[[ Line: 1768 ]] --[[ Name: openClose ]]
    -- upvalues: v64 (copy), v50 (ref), v101 (copy), v47 (ref), v75 (ref), v60 (copy), v73 (ref), v31 (copy), l_UserInputService_0 (copy), v358 (copy), v345 (copy), l_ContextActionService_0 (copy), l_v360_1 (copy), v14 (copy)
    if not next(v64) then
        v50.Visible = not v50.Visible;
        local l_Visible_2 = v50.Visible;
        v101();
        v47.Active = not v47.Active;
        for v399 = 1, v75 do
            v60[v399]:SetClickability(not l_Visible_2);
        end;
    end;
    if v50.Visible then
        if v73 then
            if v31[l_UserInputService_0:GetLastInputType()] then
                v358();
                v345.Visible = true;
            end;
            enableGamepadInventoryControl();
        end;
    else
        if v73 then
            v345.Visible = false;
        end;
        disableGamepadInventoryControl();
    end;
    if v50.Visible then
        l_ContextActionService_0:BindAction("RBXRemoveSlot", l_v360_1, false, Enum.KeyCode.ButtonX);
    else
        l_ContextActionService_0:UnbindAction("RBXRemoveSlot");
    end;
    v14.IsOpen = v50.Visible;
    v14.StateChanged:Fire(v50.Visible);
end;
local l_v361_1 = v361 --[[ copy: 119 -> 131 ]];
v63[l_Value_0] = function() --[[ Line: 1804 ]]
    -- upvalues: l_GuiService_0 (copy), l_v361_1 (copy)
    if l_GuiService_0.MenuIsOpen then
        return;
    else
        l_v361_1();
        return;
    end;
end;
v14.OpenClose = v361;
while not l_LocalPlayer_0 do
    wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
l_LocalPlayer_0.CharacterAdded:connect(v271);
if l_LocalPlayer_0.Character then
    v271(l_LocalPlayer_0.Character);
end;
for v401 = 0, 9 do
    table.insert(v71, (tostring(v401)));
end;
table.insert(v71, "`");
l_UserInputService_0.InputBegan:connect(v276);
l_UserInputService_0.TextBoxFocused:connect(function() --[[ Line: 1839 ]]
    -- upvalues: v69 (ref)
    v69 = true;
end);
l_UserInputService_0.TextBoxFocusReleased:connect(function() --[[ Line: 1840 ]]
    -- upvalues: v69 (ref)
    v69 = false;
end);
v63[l_Value_2] = function() --[[ Line: 1843 ]]
    -- upvalues: v66 (ref), v58 (ref), v62 (copy)
    if v66 and v58 then
        v58:UnequipTools();
        if v66 then
            v66:ToggleSelect();
            v62[v66]:UpdateEquipView();
            v66 = nil;
        end;
    end;
end;
l_UserInputService_0.Changed:connect(v280);
v360 = l_UserInputService_0.KeyboardEnabled and not l_VRService_0.VREnabled;
for v402 = 1, v75 do
    v60[v402]:TurnNumber(v360);
end;
if l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
    gamepadConnected();
end;
l_UserInputService_0.GamepadConnected:connect(function(v403) --[[ Line: 1857 ]]
    if v403 == Enum.UserInputType.Gamepad1 then
        gamepadConnected();
    end;
end);
l_UserInputService_0.GamepadDisconnected:connect(function(v404) --[[ Line: 1862 ]]
    if v404 == Enum.UserInputType.Gamepad1 then
        gamepadDisconnected();
    end;
end);
v14.TopbarEnabledChanged = function(_, v406) --[[ Line: 1869 ]] --[[ Name: TopbarEnabledChanged ]]
    -- upvalues: v42 (ref), v332 (copy), l_StarterGui_0 (copy)
    v42 = v406;
    v332(Enum.CoreGuiType.Backpack, l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack));
end;
if l_FFlagTopBarSignalizeSetCores_0 then
    v14.disposeEffect = v4.createEffect(function(v407) --[[ Line: 1876 ]]
        -- upvalues: v5 (copy), v14 (copy)
        local l_GetTopBarStore_0 = v5.Stores.GetTopBarStore;
        if l_GetTopBarStore_0 then
            v14:TopbarEnabledChanged(l_GetTopBarStore_0(v407).getTopBarCoreGuiEnabled(v407));
        end;
    end);
end;
l_StarterGui_0.CoreGuiChangedSignal:connect(v332);
v360 = Enum.CoreGuiType.Backpack;
v361 = Enum.CoreGuiType.Health;
v332(v360, l_StarterGui_0:GetCoreGuiEnabled(v360));
v332(v361, l_StarterGui_0:GetCoreGuiEnabled(v361));
if v13 then
    l_SettingsShowSignal_0:connect(function(v409) --[[ Line: 1891 ]]
        -- upvalues: v14 (copy), v101 (copy)
        if v409 then
            if v14.IsHotbarVisible then
                v101(true);
                return;
            end;
        else
            v101(false);
        end;
    end);
end;
l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 1902 ]]
    -- upvalues: v14 (copy), l_isInExperienceUIVREnabled_0 (copy), l_InExperienceUIVRIXP_0 (copy), l_VRService_0 (copy)
    if v14.IsOpen and (not l_isInExperienceUIVREnabled_0 or l_InExperienceUIVRIXP_0:isMovePanelToCenter() and true or not l_VRService_0.VREnabled) then
        v14.OpenClose();
    end;
end);
l_InExperienceAppChatModal_0.default.visibilitySignal.Event:Connect(function(v410) --[[ Line: 1911 ]]
    -- upvalues: v14 (copy)
    if v410 and v14.IsOpen then
        v14.OpenClose();
    end;
end);
v375 = function() --[[ Line: 1917 ]] --[[ Name: OnPreferredTransparencyChanged ]]
    -- upvalues: l_UserGameSettings_0 (copy), v17 (ref), v50 (ref), v21 (ref), v60 (copy), v28 (ref), v359 (copy)
    local l_PreferredTransparency_0 = l_UserGameSettings_0.PreferredTransparency;
    v17 = 0.5 * l_UserGameSettings_0.PreferredTransparency;
    v50.BackgroundTransparency = v17;
    v21 = 0.5 * l_PreferredTransparency_0;
    for _, v413 in ipairs(v60) do
        v413.Frame.BackgroundTransparency = v21;
    end;
    v28 = 0.15 * l_UserGameSettings_0.PreferredTransparency;
    v359.BackgroundTransparency = v28;
end;
l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):connect(v375);
return v14;