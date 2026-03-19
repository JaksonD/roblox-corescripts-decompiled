local v0 = require(script.Parent.Theme);
local v1 = v0.color("SELECTED_COLOR", Color3.fromRGB(0, 162, 255));
local v2 = v0.color("NON_SELECTED_COLOR", Color3.fromRGB(78, 84, 96));
local v3 = v0.color("ARROW_COLOR", Color3.fromRGB(204, 204, 204));
local v4 = v0.color("ARROW_COLOR_HOVER", Color3.fromRGB(255, 255, 255));
local v5 = v0.color("ARROW_COLOR_INACTIVE", Color3.fromRGB(150, 150, 150));
local v6 = UDim.new(0, 14);
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:FindFirstChild("RobloxGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_VRService_0 = game:GetService("VRService");
local l_Workspace_0 = game:GetService("Workspace");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v18 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons);
local v19 = require(l_RobloxGui_0.Modules.Settings.Pages.LeaveGameWithNextUp.Flags.FFlagAddNextUpContainer);
local v20 = game:DefineFastFlag("RepositionDropDownScrim", false);
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local v22 = if require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled() then require(l_Chrome_0.Service) else nil;
local v23 = require(l_CorePackages_0.Packages.Signals);
local v24 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_FFlagHideShortcutsWhileIemDropdownActive_0 = require(l_Chrome_0.Flags).FFlagHideShortcutsWhileIemDropdownActive;
local l_game_EngineFeature_0 = game:GetEngineFeature("EnablePreferredTextSizeAccessGuiService");
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v28 = game:DefineFastFlag("IncreaseLegacyPeopleRowButtonSize", false);
local v29 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_CorePackages_1 = game:GetService("CorePackages");
local v31 = require(l_CorePackages_1.Workspace.Packages.AppCommonLib);
local l_Signal_0 = v31.Signal;
local l_Create_0 = v31.Create;
local v34 = require(l_CorePackages_1.Packages.BuilderIcons);
local l_Migration_0 = v34.Migration;
local v36 = require(l_RobloxGui_0.Modules:WaitForChild("TenFootInterface")):IsEnabled();
local v38 = v23.createComputed(function(v37) --[[ Line: 84 ]]
    -- upvalues: v24 (copy)
    return v24.GetInputModeStore(v37).getLastInputType(v37) == v24.Input.Touch;
end);
local v40 = v23.createComputed(function(v39) --[[ Line: 89 ]]
    -- upvalues: v24 (copy)
    return v24.GetInputModeStore(v39).getLastInputType(v39) == v24.Input.Pointer;
end);
local v41 = {};
setmetatable(v41, {
    __mode = "k"
});
local v42 = l_Create_0("ImageLabel")({
    Image = "", 
    BackgroundTransparency = 1
});
clamp = function(v43, v44, v45) --[[ Line: 106 ]] --[[ Name: clamp ]]
    return (math.max(v43, (math.min(v44, v45))));
end;
local function v50(v46, v47, v48, v49) --[[ Line: 111 ]] --[[ Name: Linear ]]
    if v49 <= v46 then
        return v47 + v48;
    else
        return v48 * v46 / v49 + v47;
    end;
end;
local function v55(v51, v52, v53, v54) --[[ Line: 119 ]] --[[ Name: EaseOutQuad ]]
    if v54 <= v51 then
        return v52 + v53;
    else
        v51 = v51 / v54;
        return v52 - v53 * v51 * (v51 - 2);
    end;
end;
local function v60(v56, v57, v58, v59) --[[ Line: 128 ]] --[[ Name: EaseInOutQuad ]]
    if v59 <= v56 then
        return v57 + v58;
    else
        v56 = v56 / v59;
        if v56 < 0.5 then
            return 2 * v58 * v56 * v56 + v57;
        else
            return v57 + v58 * (2 * (2 - v56) * v56 - 1);
        end;
    end;
end;
PropertyTweener = function(v61, v62, v63, v64, v65, v66, v67) --[[ Line: 140 ]] --[[ Name: PropertyTweener ]]
    -- upvalues: l_RunService_0 (copy)
    local v68 = {
        StartTime = tick()
    };
    v68.EndTime = v68.StartTime + v65;
    v68.Cancelled = false;
    local v69 = false;
    local v70 = 0;
    local function _() --[[ Line: 149 ]] --[[ Name: finalize ]]
        -- upvalues: v61 (copy), v62 (copy), v66 (copy), v63 (copy), v64 (copy), v69 (ref), v70 (ref), v67 (copy)
        if v61 then
            v61[v62] = v66(1, v63, v64 - v63, 1);
        end;
        v69 = true;
        v70 = 1;
        if v67 then
            v67();
        end;
    end;
    v61[v62] = v66(0, v63, v64 - v63, v65);
    coroutine.wrap(function() --[[ Line: 162 ]]
        -- upvalues: v68 (copy), v61 (copy), v62 (copy), v66 (copy), v63 (copy), v64 (copy), v65 (copy), v70 (ref), l_RunService_0 (ref), v69 (ref), v67 (copy)
        local v72 = tick();
        while true do
            if v72 < v68.EndTime and v61 then
                if v68.Cancelled then
                    return;
                else
                    v61[v62] = v66(v72 - v68.StartTime, v63, v64 - v63, v65);
                    v70 = clamp(0, 1, (v72 - v68.StartTime) / v65);
                    l_RunService_0.RenderStepped:Wait();
                    v72 = tick();
                end;
            else
                if v68.Cancelled == false and v61 then
                    if v61 then
                        v61[v62] = v66(1, v63, v64 - v63, 1);
                    end;
                    v69 = true;
                    v70 = 1;
                    if v67 then
                        v67();
                    end;
                end;
                return;
            end;
        end;
    end)();
    v68.GetFinal = function(_) --[[ Line: 178 ]] --[[ Name: GetFinal ]]
        -- upvalues: v64 (copy)
        return v64;
    end;
    v68.GetPercentComplete = function(_) --[[ Line: 182 ]] --[[ Name: GetPercentComplete ]]
        -- upvalues: v70 (ref)
        return v70;
    end;
    v68.IsFinished = function(_) --[[ Line: 186 ]] --[[ Name: IsFinished ]]
        -- upvalues: v69 (ref)
        return v69;
    end;
    v68.Finish = function(v76) --[[ Line: 190 ]] --[[ Name: Finish ]]
        -- upvalues: v69 (ref), v61 (copy), v62 (copy), v66 (copy), v63 (copy), v64 (copy), v70 (ref), v67 (copy)
        if not v69 then
            v76:Cancel();
            if v61 then
                v61[v62] = v66(1, v63, v64 - v63, 1);
            end;
            v69 = true;
            v70 = 1;
            if v67 then
                v67();
            end;
        end;
    end;
    v68.Cancel = function(_) --[[ Line: 197 ]] --[[ Name: Cancel ]]
        -- upvalues: v68 (copy)
        v68.Cancelled = true;
    end;
    return v68;
end;
local function _() --[[ Line: 204 ]] --[[ Name: isTouchInput ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
end;
local function v87() --[[ Line: 210 ]] --[[ Name: CreateSignal ]]
    local v79 = {};
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v81 = nil;
    local v82 = nil;
    v79.fire = function(_, ...) --[[ Line: 218 ]] --[[ Name: fire ]]
        -- upvalues: v81 (ref), v82 (ref), l_BindableEvent_0 (copy)
        v81 = {
            ...
        };
        v82 = select("#", ...);
        l_BindableEvent_0:Fire();
    end;
    v79.connect = function(_, v85) --[[ Line: 224 ]] --[[ Name: connect ]]
        -- upvalues: l_BindableEvent_0 (copy), v81 (ref), v82 (ref)
        if not v85 then
            error("connect(nil)", 2);
        end;
        return l_BindableEvent_0.Event:Connect(function() --[[ Line: 228 ]]
            -- upvalues: v85 (copy), v81 (ref), v82 (ref)
            v85(unpack(v81, 1, v82));
        end);
    end;
    v79.wait = function(_) --[[ Line: 233 ]] --[[ Name: wait ]]
        -- upvalues: l_BindableEvent_0 (copy), v81 (ref), v82 (ref)
        l_BindableEvent_0.Event:wait();
        if not v81 then
            error("Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
        end;
        return unpack(v81, 1, v82);
    end;
    return v79;
end;
local function _() --[[ Line: 244 ]] --[[ Name: getViewportSize ]]
    -- upvalues: l_GuiService_0 (copy)
    if _G.__TESTEZ_RUNNING_TEST__ then
        return Vector2.new(1024, 1024);
    else
        return l_GuiService_0:GetHardwareSafeViewport();
    end;
end;
local function _() --[[ Line: 253 ]] --[[ Name: isSmallTouchScreen ]]
    -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy)
    local v89 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    return l_UserInputService_0.TouchEnabled and (v89.Y < 500 or v89.X < 700);
end;
local function _() --[[ Line: 258 ]] --[[ Name: isPortrait ]]
    -- upvalues: l_GuiService_0 (copy)
    local v91 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    return v91.Y > v91.X;
end;
local function _() --[[ Line: 263 ]] --[[ Name: isTenFootInterface ]]
    -- upvalues: v36 (copy)
    return v36;
end;
local function _() --[[ Line: 267 ]] --[[ Name: usesSelectedObject ]]
    -- upvalues: l_VRService_0 (copy), l_UserInputService_0 (copy)
    if l_VRService_0.VREnabled then
        return false;
    elseif l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch and not l_UserInputService_0.GamepadEnabled then
        return false;
    else
        return true;
    end;
end;
local function v101(v95, v96, v97, v98) --[[ Line: 280 ]] --[[ Name: addHoverState ]]
    local function v99() --[[ Line: 281 ]] --[[ Name: onNormalButtonStateCallback ]]
        -- upvalues: v95 (copy), v97 (copy), v96 (copy)
        if v95.Active then
            v97(v96);
        end;
    end;
    local function v100() --[[ Line: 286 ]] --[[ Name: onHoverButtonStateCallback ]]
        -- upvalues: v95 (copy), v98 (copy), v96 (copy)
        if v95.Active then
            v98(v96);
        end;
    end;
    v95.MouseEnter:Connect(v100);
    v95.SelectionGained:Connect(v100);
    v95.MouseLeave:Connect(v99);
    v95.SelectionLost:Connect(v99);
    v97(v96);
end;
local function v107(v102, v103) --[[ Line: 300 ]] --[[ Name: addOnResizedCallback ]]
    -- upvalues: v41 (copy), l_GuiService_0 (copy)
    v41[v102] = v103;
    local l_v103_0 = v103;
    local v105 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v106 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    l_v103_0(v105, v106.Y > v106.X);
end;
local v108 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local function v137(v109, v110, v111, v112, v113, v114) --[[ Line: 316 ]] --[[ Name: MakeDefaultButton ]]
    -- upvalues: l_Create_0 (copy), v0 (copy), v108 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), l_VRService_0 (copy)
    local v115 = l_Create_0("ImageLabel")({
        Image = "", 
        BackgroundTransparency = 1
    });
    local v116 = nil;
    local v117 = nil;
    local v118 = "DefaultButtonStroke";
    local v119 = "DefaultButton";
    if v109 == "DropDownFrame" then
        v118 = "ControlInputStroke";
        v119 = "ControlInputBackground";
    end;
    if v114 == "ImageButton" then
        v119 = "ImageButton";
    end;
    v116 = l_Create_0("ImageButton")({
        Name = v109 .. "Button", 
        AutoButtonColor = false, 
        BackgroundColor3 = v0.color(v119), 
        BackgroundTransparency = v0.transparency(v119), 
        Size = v110, 
        ZIndex = 2, 
        SelectionImageObject = v115
    });
    l_Create_0("UICorner")({
        CornerRadius = v0.DefaultCornerRadius, 
        Parent = v116
    });
    v117 = l_Create_0("UIStroke")({
        Name = "Border", 
        Color = v0.color(v118), 
        Transparency = v0.transparency(v118), 
        Thickness = v0.DefaultStokeThickness, 
        Parent = v116
    });
    local _ = l_Create_0("BoolValue")({
        Name = "Enabled", 
        Parent = v116, 
        Value = true
    });
    if v111 then
        v116.MouseButton1Click:Connect(function() --[[ Line: 363 ]]
            -- upvalues: v111 (copy), v108 (ref), l_UserInputService_0 (ref)
            v111(v108[l_UserInputService_0:GetLastInputType()] or false);
        end);
    else
        if v117 then
            v117.Enabled = false;
        end;
        v116.Selectable = false;
    end;
    local function _(v121) --[[ Line: 373 ]] --[[ Name: isPointerInput ]]
        local v122 = true;
        if v121.UserInputType ~= Enum.UserInputType.MouseMovement then
            v122 = v121.UserInputType == Enum.UserInputType.Touch;
        end;
        return v122;
    end;
    local v124 = nil;
    local function v126(v125) --[[ Line: 379 ]] --[[ Name: setRowRef ]]
        -- upvalues: v124 (ref)
        v124 = v125;
    end;
    local function v129() --[[ Line: 383 ]] --[[ Name: selectButton ]]
        -- upvalues: v113 (copy), v112 (copy), v116 (ref), v0 (ref), v124 (ref)
        local l_v113_0 = v113;
        if l_v113_0 == nil and v112 then
            l_v113_0 = v112.HubRef;
        end;
        if l_v113_0 and l_v113_0.Active or l_v113_0 == nil then
            v116.BackgroundColor3 = v0.color("DefaultButtonHover");
            v116.BackgroundTransparency = v0.transparency("DefaultButtonHover");
            local l_v116_0 = v116;
            if v124 then
                l_v116_0 = v124;
            end;
            if l_v113_0 then
                l_v113_0:ScrollToFrame(l_v116_0);
            end;
        end;
    end;
    local function _() --[[ Line: 405 ]] --[[ Name: deselectButton ]]
        -- upvalues: v116 (ref), v0 (ref), v119 (ref)
        v116.BackgroundColor3 = v0.color(v119);
        v116.BackgroundTransparency = v0.transparency(v119);
    end;
    v116.InputBegan:Connect(function(v131) --[[ Line: 410 ]]
        -- upvalues: v116 (ref), v129 (copy)
        if v116.Selectable then
            local v132 = true;
            if v131.UserInputType ~= Enum.UserInputType.MouseMovement then
                v132 = v131.UserInputType == Enum.UserInputType.Touch;
            end;
            if v132 then
                v129();
            end;
        end;
    end);
    v116.InputEnded:Connect(function(v133) --[[ Line: 415 ]]
        -- upvalues: v116 (ref), l_GuiService_0 (ref), v0 (ref), v119 (ref)
        if v116.Selectable and l_GuiService_0.SelectedCoreObject ~= v116 then
            local v134 = true;
            if v133.UserInputType ~= Enum.UserInputType.MouseMovement then
                v134 = v133.UserInputType == Enum.UserInputType.Touch;
            end;
            if v134 then
                v116.BackgroundColor3 = v0.color(v119);
                v116.BackgroundTransparency = v0.transparency(v119);
            end;
        end;
    end);
    v116.SelectionGained:Connect(function() --[[ Line: 421 ]]
        -- upvalues: v129 (copy)
        v129();
    end);
    v116.SelectionLost:Connect(function() --[[ Line: 424 ]]
        -- upvalues: v116 (ref), v0 (ref), v119 (ref)
        v116.BackgroundColor3 = v0.color(v119);
        v116.BackgroundTransparency = v0.transparency(v119);
    end);
    local _ = l_GuiService_0.Changed:Connect(function(v135) --[[ Line: 428 ]]
        -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v116 (ref), v0 (ref), v119 (ref), v129 (copy)
        if v135 ~= "SelectedCoreObject" then
            return;
        elseif not (not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false)) then
            return;
        elseif l_GuiService_0.SelectedCoreObject == nil or l_GuiService_0.SelectedCoreObject ~= v116 then
            v116.BackgroundColor3 = v0.color(v119);
            v116.BackgroundTransparency = v0.transparency(v119);
            return;
        else
            if v116.Selectable then
                v129();
            end;
            return;
        end;
    end);
    return v116, v126;
end;
local function v152(v138, v139, v140, v141, v142, v143) --[[ Line: 449 ]] --[[ Name: MakeButton ]]
    -- upvalues: v137 (copy), l_Create_0 (copy), v0 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy), v36 (copy), l_game_EngineFeature_0 (copy)
    local v144, v145 = v137(v138, v140, v141, v142, v143);
    local v146 = l_Create_0("TextLabel")({
        Name = v138 .. "TextLabel", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        TextColor3 = v0.color("WhiteButtonText", Color3.fromRGB(255, 255, 255)), 
        TextTransparency = v0.transparency("WhiteButtonText", 0), 
        TextYAlignment = Enum.TextYAlignment.Center, 
        Font = v0.font(Enum.Font.SourceSansBold, "Button"), 
        TextSize = v0.textSize(24, "Button"), 
        Text = v139, 
        TextScaled = false, 
        TextWrapped = true, 
        ZIndex = 2, 
        Parent = v144
    });
    local v147 = Instance.new("UITextSizeConstraint", v146);
    local v148 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    if l_UserInputService_0.TouchEnabled and (v148.Y < 500 or v148.X < 700) then
        if v0.UseBiggerText and (v138 == "ResumeButton" or v138 == "ResetButton" or v138 == "LeaveButton") then
            v146.TextSize = v0.textSize(20);
        else
            v146.TextSize = v0.textSize(18);
        end;
    elseif v36 then
        local v149 = true;
        if v138 ~= "FriendStatus" then
            v149 = v138 == "BlockButton";
        end;
        if not v149 then
            v146.TextSize = v0.textSize(36);
        end;
    end;
    if not l_game_EngineFeature_0 then
        v147.MaxTextSize = v146.TextSize;
    else
        local v150 = (l_GuiService_0.PreferredTextSize.Value - 1) * 3;
        v147.MaxTextSize = v146.TextSize + v150;
        v148 = v146.TextSize;
        do
            local l_v150_0 = v150;
            l_GuiService_0:GetPropertyChangedSignal("PreferredTextSize"):Connect(function() --[[ Line: 490 ]]
                -- upvalues: l_v150_0 (ref), l_GuiService_0 (ref), v147 (copy), v148 (copy)
                l_v150_0 = (l_GuiService_0.PreferredTextSize.Value - 1) * 3;
                v147.MaxTextSize = v148 + l_v150_0;
            end);
        end;
    end;
    return v144, v146, v145;
end;
local function v167(v153, v154, v155, v156, v157, v158, v159, v160) --[[ Line: 499 ]] --[[ Name: MakeImageButton ]]
    -- upvalues: v137 (copy), l_Migration_0 (copy), v0 (copy), l_Create_0 (copy), v28 (copy), v34 (copy)
    if not v160 then
        v160 = "ImageButton";
    end;
    local v161, v162 = v137(v153, v155, v157, v158, v159, v160);
    local v163 = nil;
    local v164 = nil;
    local v165 = l_Migration_0.uiblox[v154] or l_Migration_0.luaApps[v154];
    if not string.match(v154, "^rbxasset://") then
        v154 = v0.Images[v154];
    end;
    if typeof(v154) == "table" then
        v163 = v154.ImageRectOffset;
        v164 = v154.ImageRectSize;
        v154 = v154.Image;
    end;
    local v166 = nil;
    v166 = if v165 then l_Create_0("TextLabel")({
        Name = v153 .. "TextLabel", 
        BackgroundTransparency = 1, 
        Size = v156, 
        TextSize = if v28 then v156.Y.Offset * 0.8571428571428571 else v156.Y.Offset * 0.6666666666666666, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        TextColor3 = Color3.new(1, 1, 1), 
        Text = v165.name, 
        FontFace = v34.Font[v165.variant], 
        Parent = v161, 
        ZIndex = 2
    }) else l_Create_0("ImageLabel")({
        Name = v153 .. "ImageLabel", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v156, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Image = v154, 
        ImageRectOffset = v163, 
        ImageRectSize = v164, 
        ZIndex = 2, 
        Parent = v161
    });
    if v160 == "ImageButton" then
        v161.Border.Thickness = 0;
        v161.Border.Transparency = 1;
    end;
    return v161, v166, v162;
end;
local function v178(v168, v169, v170, v171, v172, v173) --[[ Line: 554 ]] --[[ Name: AddButtonRow ]]
    -- upvalues: v152 (copy), l_Create_0 (copy)
    local v174, v175, v176 = v152(v169, v170, v171, v172, v168, v173);
    local v177 = l_Create_0("Frame")({
        Name = v169 .. "Row", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, v171.Y.Scale, v171.Y.Offset), 
        Parent = v168.Page
    });
    v174.Parent = v177;
    v174.AnchorPoint = Vector2.new(1, 0);
    v174.Position = UDim2.new(1, -20, 0, 0);
    return v177, v174, v175, v176;
end;
local function v194(v179, v180) --[[ Line: 570 ]] --[[ Name: MakeRoundedRectFocusState ]]
    -- upvalues: l_Create_0 (copy), v6 (copy), v0 (copy), l_RunService_0 (copy), l_UserGameSettings_0 (copy)
    local v181 = l_Create_0("Frame")({
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 12, 1, 12), 
        Position = UDim2.fromOffset(-6, -6)
    });
    l_Create_0("UICorner")({
        CornerRadius = v6, 
        Parent = v181
    });
    local v182 = l_Create_0("UIStroke")({
        Color = v0.selectionCursor.AnimatedColor, 
        Transparency = 0, 
        Thickness = 3, 
        Parent = v181
    });
    local v183 = l_Create_0("UIGradient")({
        Rotation = 0, 
        Color = v0.selectionCursor.GradientColorSequence, 
        Transparency = v0.selectionCursor.GradientTransparencySequence, 
        Parent = v182
    });
    l_RunService_0:UnbindFromRenderStep(v180);
    l_RunService_0:BindToRenderStep(v180, Enum.RenderPriority.Last.Value, function() --[[ Line: 597 ]]
        -- upvalues: v183 (copy), v0 (ref), l_UserGameSettings_0 (ref)
        local v184 = v183.Rotation + 2;
        local l_GradientColorSequence_0 = v0.selectionCursor.GradientColorSequence;
        local l_GradientTransparencySequence_0 = v0.selectionCursor.GradientTransparencySequence;
        if l_UserGameSettings_0.ReducedMotion then
            local v187 = (math.sin((math.rad(v184))) + 1) / 2;
            local l_Value_0 = l_GradientColorSequence_0.Keypoints[1].Value;
            local l_Value_1 = l_GradientColorSequence_0.Keypoints[#l_GradientColorSequence_0.Keypoints].Value;
            l_GradientColorSequence_0 = ColorSequence.new(l_Value_0:lerp(l_Value_1, v187));
            local l_Value_2 = l_GradientTransparencySequence_0.Keypoints[1].Value;
            local l_Value_3 = l_GradientTransparencySequence_0.Keypoints[#l_GradientTransparencySequence_0.Keypoints].Value;
            l_GradientTransparencySequence_0 = NumberSequence.new(l_Value_2 + (l_Value_3 - l_Value_2) * v187);
        end;
        v183.Rotation = v184;
        v183.Color = l_GradientColorSequence_0;
        v183.Transparency = l_GradientTransparencySequence_0;
    end);
    v179.AncestryChanged:Connect(function(_, v193) --[[ Line: 621 ]]
        -- upvalues: l_RunService_0 (ref), v180 (copy)
        if not v193 then
            l_RunService_0:UnbindFromRenderStep(v180);
        end;
    end);
    v179.SelectionImageObject = v181;
end;
local function v281(v195, v196, v197) --[[ Line: 630 ]] --[[ Name: CreateDropDown ]]
    -- upvalues: v0 (copy), l_HttpService_0 (copy), l_GuiService_0 (copy), l_Create_0 (copy), v20 (copy), l_CoreGui_0 (copy), l_VRService_0 (copy), l_isInExperienceUIVREnabled_0 (copy), l_CorePackages_1 (copy), l_UserInputService_0 (copy), l_ContextActionService_0 (copy), l_FFlagHideShortcutsWhileIemDropdownActive_0 (copy), v22 (copy), v29 (copy), v152 (copy)
    local v198 = v0.color("SELECTION_TEXT_COLOR_NORMAL", Color3.fromRGB(178, 178, 178));
    local v199 = Color3.fromRGB(229, 229, 229);
    local v200 = v0.color("SELECTION_TEXT_COLOR_HIGHLIGHTED", Color3.fromRGB(255, 255, 255));
    local v201 = nil;
    local v202 = {
        CurrentIndex = nil, 
        UpdateDropDownList = nil, 
        DropDownFrame = nil, 
        Selections = nil
    };
    Instance.new("BindableEvent").Name = "IndexChanged";
    if type(v195) ~= "table" then
        error("CreateDropDown dropDownStringTable (first arg) is not a table", 2);
        return v202;
    else
        local l_BindableEvent_1 = Instance.new("BindableEvent");
        l_BindableEvent_1.Name = "IndexChanged";
        local v204 = true;
        local v205 = l_HttpService_0:GenerateGUID(false);
        local v206 = nil;
        local l_v195_0 = v195;
        local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
        local v210 = l_Create_0("ImageButton")({
            Name = "DropDownFullscreenFrame", 
            BackgroundTransparency = 0.2, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, if v20 then l_l_GuiService_0_GuiInset_0.Y else 0), 
            Position = if v20 then UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y) else nil, 
            BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
            ZIndex = 10, 
            Active = true, 
            Visible = false, 
            Selectable = false, 
            AutoButtonColor = false, 
            Parent = l_CoreGui_0.RobloxGui
        });
        local function v214(v211) --[[ Line: 682 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), l_isInExperienceUIVREnabled_0 (ref), l_CorePackages_1 (ref), v210 (copy), l_CoreGui_0 (ref), v202 (copy), l_v195_0 (ref)
            if v211 ~= "VREnabled" then
                return;
            else
                if l_VRService_0.VREnabled then
                    if l_isInExperienceUIVREnabled_0 then
                        local v212 = require(l_CorePackages_1.Workspace.Packages.VrSpatialUi);
                        local l_PanelType_0 = v212.Constants.PanelType;
                        v210.Parent = v212.UIManager.getInstance():getPanelObject(l_PanelType_0.MoreMenu);
                        v210.BackgroundTransparency = 0.2;
                    else
                        v210.Parent = require(l_CorePackages_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):GetGUI();
                        v210.BackgroundTransparency = 1;
                    end;
                else
                    v210.Parent = l_CoreGui_0.RobloxGui;
                    v210.BackgroundTransparency = 0.2;
                end;
                if v202.UpdateDropDownList then
                    v202:UpdateDropDownList(l_v195_0);
                end;
                return;
            end;
        end;
        l_VRService_0.Changed:Connect(v214);
        v214("VREnabled");
        local v215 = l_Create_0("ImageLabel")({
            Name = "DropDownSelectionFrame", 
            Image = "", 
            ScaleType = Enum.ScaleType.Stretch, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            BackgroundTransparency = v0.transparency("DropdownListBg", 1), 
            BackgroundColor3 = v0.color("DropdownListBg"), 
            Size = UDim2.new(0.6, 0, 0.9, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ZIndex = 10, 
            Parent = v210
        });
        l_Create_0("UICorner")({
            CornerRadius = v0.DefaultCornerRadius, 
            Parent = v215
        });
        local v216 = l_Create_0("ScrollingFrame")({
            Name = "DropDownScrollingFrame", 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, -20, 1, -25), 
            Position = UDim2.new(0, 10, 0, 10), 
            ZIndex = 10, 
            ScrollBarThickness = v0.DefaultScrollBarThickness, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Parent = v215
        });
        local v217 = nil;
        local v218 = false;
        local function v221(v219, v220) --[[ Line: 746 ]]
            -- upvalues: v202 (copy), v204 (ref), v197 (copy), v210 (copy), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v201 (ref), v217 (ref), l_ContextActionService_0 (ref), v205 (copy), v206 (ref), v218 (ref), l_isInExperienceUIVREnabled_0 (ref), l_CorePackages_1 (ref)
            if v219 ~= nil and v220 ~= Enum.UserInputState.Begin then
                return;
            else
                v202.DropDownFrame.Selectable = v204;
                v197:SetActive(true);
                if v210.Visible and not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                    l_GuiService_0.SelectedCoreObject = v201;
                end;
                v210.Visible = false;
                if v217 then
                    v217:Disconnect();
                end;
                l_ContextActionService_0:UnbindCoreAction(v205 .. "Action");
                l_ContextActionService_0:UnbindCoreAction(v205 .. "FreezeAction");
                v206.Value = v204;
                v218 = false;
                if l_VRService_0.VREnabled and not l_isInExperienceUIVREnabled_0 then
                    require(l_CorePackages_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v210, 0);
                end;
                return;
            end;
        end;
        local function v222() --[[ Line: 776 ]]

        end;
        local function v227() --[[ Line: 778 ]]
            -- upvalues: v204 (ref), v202 (copy), v218 (ref), v210 (copy), l_VRService_0 (ref), l_isInExperienceUIVREnabled_0 (ref), l_CorePackages_1 (ref), v201 (ref), l_GuiService_0 (ref), v217 (ref), v200 (copy), v199 (copy), v198 (copy), v221 (copy), l_FFlagHideShortcutsWhileIemDropdownActive_0 (ref), v22 (ref), l_ContextActionService_0 (ref), v205 (copy), v222 (copy), v197 (copy), v206 (ref)
            if not v204 then
                return;
            else
                v202.DropDownFrame.Selectable = false;
                v218 = true;
                v210.Visible = true;
                if l_VRService_0.VREnabled and not l_isInExperienceUIVREnabled_0 then
                    require(l_CorePackages_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v210, 0.5);
                end;
                v201 = v202.DropDownFrame;
                if v202.CurrentIndex and v202.CurrentIndex > 0 then
                    l_GuiService_0.SelectedCoreObject = v202.Selections[v202.CurrentIndex];
                elseif #v202.Selections > 0 then
                    l_GuiService_0.SelectedCoreObject = v202.Selections[1];
                end;
                v217 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 801 ]]
                    -- upvalues: v202 (ref), l_GuiService_0 (ref), v200 (ref), l_VRService_0 (ref), v199 (ref), v198 (ref)
                    for v223 = 1, #v202.Selections do
                        if l_GuiService_0.SelectedCoreObject == v202.Selections[v223] then
                            v202.Selections[v223].TextColor3 = v200;
                        else
                            v202.Selections[v223].TextColor3 = l_VRService_0.VREnabled and v199 or v198;
                        end;
                    end;
                end);
                local l_v221_0 = v221;
                if l_FFlagHideShortcutsWhileIemDropdownActive_0 then
                    v22:setHideShortcutBar("InExperienceMenuDropdown", true);
                    l_v221_0 = function(v225, v226) --[[ Line: 815 ]]
                        -- upvalues: v221 (ref), v22 (ref)
                        v221(v225, v226);
                        v22:setHideShortcutBar("InExperienceMenuDropdown", false);
                    end;
                end;
                l_ContextActionService_0:BindCoreAction(v205 .. "FreezeAction", v222, false, Enum.UserInputType.Keyboard, Enum.UserInputType.Gamepad1);
                l_ContextActionService_0:BindCoreAction(v205 .. "Action", l_v221_0, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
                v197:SetActive(false);
                v206.Value = false;
                return;
            end;
        end;
        local v228 = v29:FormatByKey("Feature.SettingsHub.Label.ChooseOne");
        local v229 = UDim2.new(0.6, 0, 0, 40);
        v202.DropDownFrame = v152("DropDownFrame", v228, v229, v227, nil, v197);
        v202.DropDownFrame.Position = UDim2.new(1, 0, 0.5, 0);
        v202.DropDownFrame.AnchorPoint = Vector2.new(1, 0.5);
        v206 = v202.DropDownFrame.Enabled;
        local l_DropDownFrameTextLabel_0 = v202.DropDownFrame.DropDownFrameTextLabel;
        l_DropDownFrameTextLabel_0.Position = UDim2.new(0, 15, 0, 0);
        l_DropDownFrameTextLabel_0.Size = UDim2.new(1, -50, 1, 0);
        l_DropDownFrameTextLabel_0.ClipsDescendants = true;
        l_DropDownFrameTextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
        local v231 = l_Create_0("ImageLabel")({
            Name = "DropDownImage", 
            Image = "rbxasset://textures/ui/Settings/DropDown/DropDown.png", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, 15, 0, 10), 
            Position = UDim2.new(1, -12, 0.5, 0), 
            ZIndex = 2, 
            Parent = v202.DropDownFrame
        });
        v202.DropDownImage = v231;
        local function v236(v232) --[[ Line: 868 ]] --[[ Name: setSelection ]]
            -- upvalues: v202 (copy), l_DropDownFrameTextLabel_0 (copy), l_BindableEvent_1 (copy)
            local v233 = false;
            for v234, v235 in pairs(v202.Selections) do
                if v234 == v232 then
                    l_DropDownFrameTextLabel_0.Text = v235.Text;
                    v202.CurrentIndex = v234;
                    v233 = true;
                end;
            end;
            if v233 then
                l_BindableEvent_1:Fire(v232);
            end;
        end;
        local function v241(v237) --[[ Line: 884 ]] --[[ Name: setSelectionByValue ]]
            -- upvalues: v202 (copy), l_DropDownFrameTextLabel_0 (copy), l_BindableEvent_1 (copy)
            local v238 = false;
            for v239, v240 in pairs(v202.Selections) do
                if v240.Text == v237 then
                    l_DropDownFrameTextLabel_0.Text = v240.Text;
                    v202.CurrentIndex = v239;
                    v238 = true;
                end;
            end;
            if v238 then
                l_BindableEvent_1:Fire(v202.CurrentIndex);
            end;
            return v238;
        end;
        local function _(v242) --[[ Line: 901 ]] --[[ Name: setIsFaded ]]
            -- upvalues: v202 (copy)
            if v242 then
                v202.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5;
                v202.DropDownFrame.ImageTransparency = 0.5;
                v202.DropDownImage.ImageTransparency = 0.5;
                return;
            else
                v202.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0;
                v202.DropDownFrame.ImageTransparency = 0;
                v202.DropDownImage.ImageTransparency = 0;
                return;
            end;
        end;
        v202.IndexChanged = l_BindableEvent_1.Event;
        v202.SetSelectionIndex = function(_, v245) --[[ Line: 916 ]] --[[ Name: SetSelectionIndex ]]
            -- upvalues: v236 (copy)
            v236(v245);
        end;
        v202.SetSelectionByValue = function(_, v247) --[[ Line: 920 ]] --[[ Name: SetSelectionByValue ]]
            -- upvalues: v241 (copy)
            return (v241(v247));
        end;
        v202.ResetSelectionIndex = function(_) --[[ Line: 924 ]] --[[ Name: ResetSelectionIndex ]]
            -- upvalues: v202 (copy), l_DropDownFrameTextLabel_0 (copy), v228 (copy), v221 (copy)
            v202.CurrentIndex = nil;
            l_DropDownFrameTextLabel_0.Text = v228;
            v221();
        end;
        v202.GetSelectedIndex = function(_) --[[ Line: 930 ]] --[[ Name: GetSelectedIndex ]]
            -- upvalues: v202 (copy)
            return v202.CurrentIndex;
        end;
        v202.SetZIndex = function(_, v251) --[[ Line: 934 ]] --[[ Name: SetZIndex ]]
            -- upvalues: v202 (copy), v231 (copy), l_DropDownFrameTextLabel_0 (copy)
            v202.DropDownFrame.ZIndex = v251;
            v231.ZIndex = v251;
            l_DropDownFrameTextLabel_0.ZIndex = v251;
        end;
        v202.SetInteractable = function(_, v253) --[[ Line: 940 ]] --[[ Name: SetInteractable ]]
            -- upvalues: v204 (ref), v202 (copy), v221 (copy), l_VRService_0 (ref), v206 (ref), v218 (ref)
            v204 = v253;
            v202.DropDownFrame.Selectable = v204;
            if not v204 then
                v221();
                if l_VRService_0.VREnabled then
                    v202.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5;
                    v202.DropDownFrame.ImageTransparency = 0.5;
                    v202.DropDownImage.ImageTransparency = 0.5;
                else
                    v202.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0;
                    v202.DropDownFrame.ImageTransparency = 0;
                    v202.DropDownImage.ImageTransparency = 0;
                end;
                if not l_VRService_0.VREnabled then
                    v202:SetZIndex(1);
                end;
            else
                v202.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0;
                v202.DropDownFrame.ImageTransparency = 0;
                v202.DropDownImage.ImageTransparency = 0;
                if not l_VRService_0.VREnabled then
                    v202:SetZIndex(2);
                end;
            end;
            v206.Value = v253 and not v218;
            v202.DropDownImage.Visible = v253;
            if v253 then
                v202.DropDownFrame.ImageTransparency = 0;
                return;
            else
                v202.DropDownFrame.ImageTransparency = 0.5;
                return;
            end;
        end;
        v202.SetAutoLocalize = function(_, v255) --[[ Line: 967 ]] --[[ Name: SetAutoLocalize ]]
            -- upvalues: v210 (copy)
            v210.AutoLocalize = v255;
        end;
        v202.UpdateDropDownList = function(_, v257) --[[ Line: 971 ]] --[[ Name: UpdateDropDownList ]]
            -- upvalues: l_v195_0 (ref), v202 (copy), l_VRService_0 (ref), v0 (ref), l_Create_0 (ref), v199 (copy), v198 (copy), v216 (copy), v196 (copy), l_DropDownFrameTextLabel_0 (copy), v200 (copy), v221 (copy), l_BindableEvent_1 (copy), l_UserInputService_0 (ref), l_GuiService_0 (ref), v205 (copy), v210 (copy), v215 (copy)
            l_v195_0 = v257;
            if v202.Selections then
                for v258 = 1, #v202.Selections do
                    v202.Selections[v258]:Destroy();
                end;
            end;
            v202.Selections = {};
            v202.SelectionInfo = {};
            local l_VREnabled_0 = l_VRService_0.VREnabled;
            local v260 = l_VREnabled_0 and v0.font(Enum.Font.SourceSansBold, "Bold") or v0.font(Enum.Font.SourceSans, "UtilityText");
            local v261 = l_VREnabled_0 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            local v262 = l_VREnabled_0 and 70 or 50;
            local v263 = v262 + 1;
            local v264 = l_VREnabled_0 and 600 or 400;
            local v265 = 0;
            for v266, v267 in pairs(v257) do
                local v268 = l_Create_0("Frame")({
                    BackgroundTransparency = 0.7, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0)
                });
                l_Create_0("UICorner")({
                    CornerRadius = v0.DefaultCornerRadius, 
                    Parent = v268
                });
                local l_v267_0 = v267;
                local v270 = "";
                local v271 = typeof(v267) == "table";
                if v271 then
                    l_v267_0 = v267.title;
                    v270 = v267.subtitle;
                    v265 = v265 + 10;
                end;
                local v272 = nil;
                if v271 then
                    v272 = l_Create_0("TextButton")({
                        Name = "Selection" .. tostring(v266), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        AutoButtonColor = false, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Size = UDim2.new(1, -28, 0, v262 + 10), 
                        Position = UDim2.new(0, 14, 0, (v266 - 1) * (v263 + 10)), 
                        TextColor3 = l_VRService_0.VREnabled and v199 or v198, 
                        Font = v260, 
                        TextSize = v261, 
                        Text = l_v267_0, 
                        ZIndex = 10, 
                        SelectionImageObject = v268, 
                        Parent = v216
                    });
                    local _ = l_Create_0("TextLabel")({
                        Name = "Subtitle" .. tostring(v266), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, -28, 0, v262 * 0.8), 
                        Position = UDim2.new(0, 14, 0, 15), 
                        TextColor3 = l_VRService_0.VREnabled and v199 or v198, 
                        Font = v260, 
                        TextSize = v261 * 0.8, 
                        Text = v270, 
                        ZIndex = 10, 
                        Parent = v272
                    });
                else
                    v272 = l_Create_0("TextButton")({
                        Name = "Selection" .. tostring(v266), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        AutoButtonColor = false, 
                        Size = UDim2.new(1, -28, 0, v262), 
                        Position = UDim2.new(0, 14, 0, (v266 - 1) * v263), 
                        TextColor3 = l_VRService_0.VREnabled and v199 or v198, 
                        Font = v260, 
                        TextSize = v261, 
                        Text = v267, 
                        ZIndex = 10, 
                        SelectionImageObject = v268, 
                        Parent = v216
                    });
                end;
                if v266 == v196 then
                    v202.CurrentIndex = v266;
                    l_DropDownFrameTextLabel_0.Text = l_v267_0;
                    v272.TextColor3 = v200;
                elseif not v196 and v266 == 1 then
                    v272.TextColor3 = v200;
                end;
                do
                    local l_v272_0 = v272;
                    local function v275() --[[ Line: 1075 ]]
                        -- upvalues: l_DropDownFrameTextLabel_0 (ref), l_v272_0 (ref), v221 (ref), v202 (ref), v266 (copy), l_BindableEvent_1 (ref)
                        l_DropDownFrameTextLabel_0.Text = l_v272_0.Text;
                        v221();
                        v202.CurrentIndex = v266;
                        l_BindableEvent_1:Fire(v266);
                    end;
                    l_v272_0.MouseButton1Click:Connect(v275);
                    l_v272_0.MouseEnter:Connect(function() --[[ Line: 1084 ]]
                        -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), l_v272_0 (ref)
                        if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                            l_GuiService_0.SelectedCoreObject = l_v272_0;
                        end;
                    end);
                    v202.Selections[v266] = l_v272_0;
                    local l_SelectionInfo_0 = v202.SelectionInfo;
                    local v277 = {
                        Clicked = v275
                    };
                    l_SelectionInfo_0[l_v272_0] = v277;
                end;
            end;
            l_GuiService_0:RemoveSelectionGroup(v205);
            l_GuiService_0:AddSelectionTuple(v205, unpack(v202.Selections));
            v216.CanvasSize = UDim2.new(1, -20, 0, #v257 * v263 + v265);
            local function v278() --[[ Line: 1100 ]] --[[ Name: updateDropDownSize ]]
                -- upvalues: v216 (ref), v210 (ref), v215 (ref), v264 (copy)
                if v216.CanvasSize.Y.Offset < v210.AbsoluteSize.Y - 10 then
                    v215.Size = UDim2.new(0, v264, 0, v216.CanvasSize.Y.Offset + 25);
                    return;
                else
                    v215.Size = UDim2.new(0, v264, 0.9, 0);
                    return;
                end;
            end;
            v210.Changed:Connect(function(v279) --[[ Line: 1113 ]]
                -- upvalues: v278 (copy)
                if v279 ~= "AbsoluteSize" then
                    return;
                else
                    v278();
                    return;
                end;
            end);
            v278();
        end;
        v202:UpdateDropDownList(v195);
        v210.MouseButton1Click:Connect(v221);
        v197.PoppedMenu:Connect(function(v280) --[[ Line: 1128 ]]
            -- upvalues: v210 (copy), v221 (copy)
            if v280 == v210 then
                v221();
            end;
        end);
        return v202;
    end;
end;
local function v355(v282, v283) --[[ Line: 1137 ]] --[[ Name: CreateSelector ]]
    -- upvalues: l_Create_0 (copy), v42 (copy), v0 (copy), v3 (copy), l_UserInputService_0 (copy), v4 (copy), v101 (copy), l_VRService_0 (copy), l_GuiService_0 (copy), v55 (copy), v5 (copy), v36 (copy), v38 (copy), v40 (copy), v41 (copy)
    local v284 = 0;
    local v285 = {
        HubRef = nil, 
        SetSelectionIndex = nil
    };
    if type(v282) ~= "table" then
        error("CreateSelector selectionStringTable (first arg) is not a table", 2);
        return v285;
    else
        local l_BindableEvent_2 = Instance.new("BindableEvent");
        l_BindableEvent_2.Name = "IndexChanged";
        local v287 = true;
        v285.CurrentIndex = 0;
        v285.SelectorFrame = l_Create_0("ImageButton")({
            Name = "Selector", 
            Image = "", 
            AutoButtonColor = false, 
            NextSelectionLeft = v285.SelectorFrame, 
            NextSelectionRight = v285.SelectorFrame, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.6, 0, 0, 50), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            ZIndex = 2, 
            SelectionImageObject = v42
        });
        local v288 = l_Create_0("ImageButton")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v42, 
            Parent = v285.SelectorFrame
        });
        local v289 = l_Create_0("ImageButton")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v42, 
            Parent = v285.SelectorFrame
        });
        local v290 = l_Create_0("ImageLabel")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 18, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/Left.png", 
            ImageColor3 = v3, 
            ZIndex = 4, 
            Parent = v288
        });
        local v291 = l_Create_0("ImageLabel")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 18, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/Right.png", 
            ImageColor3 = v3, 
            ZIndex = 4, 
            Parent = v289
        });
        if not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) then
            local function v293(v292) --[[ Line: 1223 ]]
                -- upvalues: v3 (ref)
                v292.ImageColor3 = v3;
            end;
            local function v295(v294) --[[ Line: 1225 ]]
                -- upvalues: v4 (ref)
                v294.ImageColor3 = v4;
            end;
            v101(v288, v290, v293, v295);
            v101(v289, v291, v293, v295);
        end;
        v285.Selections = {};
        local v296 = {};
        local v297 = {};
        local v298 = l_Create_0("ImageButton")({
            Name = "AutoSelectButton", 
            BackgroundTransparency = 1, 
            Image = "", 
            Position = UDim2.new(0, v288.Size.X.Offset, 0, 0), 
            Size = UDim2.new(1, v288.Size.X.Offset * -2, 1, 0), 
            Parent = v285.SelectorFrame, 
            ZIndex = 2, 
            SelectionImageObject = v42
        });
        v298.MouseButton1Click:Connect(function() --[[ Line: 1246 ]]
            -- upvalues: v287 (ref), v285 (copy), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref)
            if not v287 then
                return;
            elseif #v285.Selections <= 1 then
                return;
            else
                local v299 = v285.CurrentIndex + 1;
                if #v285.Selections < v299 then
                    v299 = 1;
                end;
                v285:SetSelectionIndex(v299);
                if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                    l_GuiService_0.SelectedCoreObject = v285.SelectorFrame;
                end;
                return;
            end;
        end);
        v297[v298] = true;
        local function v307(v300, v301) --[[ Line: 1265 ]] --[[ Name: setSelection ]]
            -- upvalues: v285 (copy), v288 (copy), v296 (ref), v55 (ref), l_BindableEvent_2 (copy)
            for v302, v303 in pairs(v285.Selections) do
                local v304 = v302 == v300;
                local v305 = UDim2.new(0, v288.Size.X.Offset, 0, 0);
                local v306 = UDim2.new(0, v288.Size.X.Offset * v301 * 3, 0, 0);
                if v296[v303] then
                    v306 = UDim2.new(0, v288.Size.X.Offset * -v301 * 3, 0, 0);
                end;
                if v306.X.Offset < 0 then
                    v306 = UDim2.new(0, v306.X.Offset + v303.AbsoluteSize.X / 4, 0, 0);
                end;
                if v304 then
                    v296[v303] = true;
                    v303.Position = v306;
                    v303.Visible = true;
                    PropertyTweener(v303, "TextTransparency", 1, 0, 0.165, v55);
                    if v303:IsDescendantOf(game) then
                        v303:TweenPosition(v305, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true);
                    else
                        v303.Position = v305;
                    end;
                    v285.CurrentIndex = v302;
                    l_BindableEvent_2:Fire(v300);
                elseif v296[v303] then
                    v296[v303] = false;
                    PropertyTweener(v303, "TextTransparency", 0, 1, 0.165, v55);
                    if v303:IsDescendantOf(game) then
                        v303:TweenPosition(v306, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true);
                    else
                        v303.Position = v306;
                    end;
                end;
            end;
        end;
        local function v312(v308, v309) --[[ Line: 1316 ]] --[[ Name: stepFunc ]]
            -- upvalues: v287 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v285 (copy), v307 (copy)
            if not v287 then
                return;
            elseif v308 ~= nil and v308.UserInputType ~= Enum.UserInputType.MouseButton1 and v308.UserInputType ~= Enum.UserInputType.Gamepad1 and v308.UserInputType ~= Enum.UserInputType.Gamepad2 and v308.UserInputType ~= Enum.UserInputType.Gamepad3 and v308.UserInputType ~= Enum.UserInputType.Gamepad4 and v308.UserInputType ~= Enum.UserInputType.Keyboard then
                return;
            else
                if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                    l_GuiService_0.SelectedCoreObject = v285.SelectorFrame;
                end;
                local v310 = v309 + v285.CurrentIndex;
                local v311 = 0;
                v311 = v285.CurrentIndex < v310 and 1 or -1;
                if #v285.Selections < v310 then
                    v310 = 1;
                elseif v310 < 1 then
                    v310 = #v285.Selections;
                end;
                v307(v310, v311);
                return;
            end;
        end;
        local v313 = nil;
        local function _() --[[ Line: 1356 ]] --[[ Name: connectToGuiService ]]
            -- upvalues: v313 (ref), l_GuiService_0 (ref), v285 (copy), v297 (copy), l_VRService_0 (ref)
            v313 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 1357 ]]
                -- upvalues: v285 (ref), l_GuiService_0 (ref), v297 (ref), l_VRService_0 (ref)
                if #v285.Selections <= 0 then
                    return;
                else
                    if l_GuiService_0.SelectedCoreObject ~= nil and v297[l_GuiService_0.SelectedCoreObject] and not l_VRService_0.VREnabled then
                        l_GuiService_0.SelectedCoreObject = v285.SelectorFrame;
                    end;
                    return;
                end;
            end);
        end;
        v285.IndexChanged = l_BindableEvent_2.Event;
        v285.SetSelectionIndex = function(_, v316) --[[ Line: 1370 ]] --[[ Name: SetSelectionIndex ]]
            -- upvalues: v307 (copy)
            v307(v316, 1);
        end;
        v285.GetSelectedIndex = function(_) --[[ Line: 1374 ]] --[[ Name: GetSelectedIndex ]]
            -- upvalues: v285 (copy)
            return v285.CurrentIndex;
        end;
        v285.SetZIndex = function(_, v319) --[[ Line: 1378 ]] --[[ Name: SetZIndex ]]
            -- upvalues: v288 (copy), v289 (copy), v290 (copy), v291 (copy), v285 (copy)
            v288.ZIndex = v319;
            v289.ZIndex = v319;
            v290.ZIndex = v319;
            v291.ZIndex = v319;
            for v320 = 1, #v285.Selections do
                v285.Selections[v320].ZIndex = v319;
            end;
        end;
        v285.SetInteractable = function(_, v322) --[[ Line: 1389 ]] --[[ Name: SetInteractable ]]
            -- upvalues: v287 (ref), v285 (copy), v288 (copy), v289 (copy), v0 (ref), v290 (copy), v5 (ref), v291 (copy), v3 (ref)
            v287 = v322;
            v285.SelectorFrame.Selectable = v287;
            v288.Active = v287;
            v289.Active = v287;
            v288.Visible = v287;
            v289.Visible = v287;
            if not v287 then
                for _, v324 in pairs(v285.Selections) do
                    v324.TextColor3 = v0.color("NotInteractableSelection", Color3.fromRGB(255, 255, 255));
                end;
                v290.ImageColor3 = v5;
                v291.ImageColor3 = v5;
                return;
            else
                for _, v326 in pairs(v285.Selections) do
                    v326.TextColor3 = Color3.fromRGB(255, 255, 255);
                end;
                v290.ImageColor3 = v3;
                v291.ImageColor3 = v3;
                return;
            end;
        end;
        v285.UpdateOptions = function(_, v328) --[[ Line: 1414 ]] --[[ Name: UpdateOptions ]]
            -- upvalues: v285 (copy), v296 (ref), l_Create_0 (ref), v288 (copy), v0 (ref), v36 (ref), v283 (copy), v289 (copy)
            for _, v330 in pairs(v285.Selections) do
                v330:Destroy();
            end;
            v296 = {};
            v285.Selections = {};
            for v331, v332 in pairs(v328) do
                local v333 = l_Create_0("TextLabel")({
                    Name = "Selection" .. tostring(v331), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, v288.Size.X.Offset * -2, 1, 0), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v0.font(Enum.Font.SourceSans, "UtilityText"), 
                    TextSize = v0.textSize(24, "UtilityText"), 
                    TextWrapped = true, 
                    Text = v332, 
                    ZIndex = 2, 
                    Visible = false, 
                    Parent = v285.SelectorFrame
                });
                if v36 then
                    v333.TextSize = v0.textSize(36);
                end;
                if v331 == v283 then
                    v285.CurrentIndex = v331;
                    v333.Position = UDim2.new(0, v288.Size.X.Offset, 0, 0);
                    v333.Visible = true;
                    v296[v333] = true;
                else
                    v296[v333] = false;
                end;
                v285.Selections[v331] = v333;
            end;
            local v334 = #v285.Selections > 1;
            v288.Visible = v334;
            v289.Visible = v334;
        end;
        local function v337(v335) --[[ Line: 1462 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), v288 (copy), v289 (copy), v298 (copy)
            if v335 ~= "VREnabled" then
                return;
            else
                local l_VREnabled_1 = l_VRService_0.VREnabled;
                v288.Selectable = l_VREnabled_1;
                v289.Selectable = l_VREnabled_1;
                v298.Selectable = l_VREnabled_1;
                return;
            end;
        end;
        l_VRService_0.Changed:Connect(v337);
        local l_VREnabled_2 = l_VRService_0.VREnabled;
        v288.Selectable = l_VREnabled_2;
        v289.Selectable = l_VREnabled_2;
        v298.Selectable = l_VREnabled_2;
        v288.InputBegan:Connect(function(v339) --[[ Line: 1474 ]]
            -- upvalues: v38 (ref), v40 (ref), v312 (copy)
            if v38(false) or v40(false) and v339.UserInputType == Enum.UserInputType.MouseButton1 then
                v312(nil, -1);
            end;
        end);
        v289.InputBegan:Connect(function(v340) --[[ Line: 1480 ]]
            -- upvalues: v38 (ref), v40 (ref), v312 (copy)
            if v38(false) or v40(false) and v340.UserInputType == Enum.UserInputType.MouseButton1 then
                v312(nil, 1);
            end;
        end);
        l_VREnabled_2 = true;
        v285:UpdateOptions(v282);
        l_UserInputService_0.InputBegan:Connect(function(v341) --[[ Line: 1490 ]]
            -- upvalues: v287 (ref), l_VREnabled_2 (ref), l_GuiService_0 (ref), v285 (copy), v312 (copy)
            if not v287 then
                return;
            elseif not l_VREnabled_2 then
                return;
            elseif v341.UserInputType ~= Enum.UserInputType.Gamepad1 and v341.UserInputType ~= Enum.UserInputType.Keyboard then
                return;
            elseif l_GuiService_0.SelectedCoreObject ~= v285.SelectorFrame then
                return;
            elseif v341.KeyCode == Enum.KeyCode.DPadLeft or v341.KeyCode == Enum.KeyCode.Left or v341.KeyCode == Enum.KeyCode.A then
                v312(v341, -1);
                return;
            else
                if v341.KeyCode == Enum.KeyCode.DPadRight or v341.KeyCode == Enum.KeyCode.Right or v341.KeyCode == Enum.KeyCode.D then
                    v312(v341, 1);
                end;
                return;
            end;
        end);
        l_UserInputService_0.InputChanged:Connect(function(v342) --[[ Line: 1523 ]]
            -- upvalues: v287 (ref), l_VREnabled_2 (ref), v284 (ref), l_GuiService_0 (ref), v285 (copy), v312 (copy)
            if not v287 then
                return;
            elseif not l_VREnabled_2 then
                v284 = 0;
                return;
            elseif v342.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return;
            else
                local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_0 or not l_SelectedCoreObject_0:IsDescendantOf(v285.SelectorFrame.Parent) then
                    return;
                elseif v342.KeyCode ~= Enum.KeyCode.Thumbstick1 then
                    return;
                elseif v342.Position.X > 0.8 and v342.Delta.X > 0 and v284 ~= 1 then
                    v284 = 1;
                    v312(v342, v284);
                    return;
                elseif v342.Position.X < -0.8 and v342.Delta.X < 0 and v284 ~= -1 then
                    v284 = -1;
                    v312(v342, v284);
                    return;
                else
                    if math.abs(v342.Position.X) < 0.8 then
                        v284 = 0;
                    end;
                    return;
                end;
            end;
        end);
        v285.SelectorFrame.AncestryChanged:Connect(function(_, v345) --[[ Line: 1564 ]]
            -- upvalues: l_VREnabled_2 (ref), v313 (ref), l_GuiService_0 (ref), v285 (copy), v297 (copy), l_VRService_0 (ref)
            l_VREnabled_2 = v345;
            if not l_VREnabled_2 then
                if v313 then
                    v313:Disconnect();
                    return;
                end;
            else
                v313 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 1357 ]]
                    -- upvalues: v285 (ref), l_GuiService_0 (ref), v297 (ref), l_VRService_0 (ref)
                    if #v285.Selections <= 0 then
                        return;
                    else
                        if l_GuiService_0.SelectedCoreObject ~= nil and v297[l_GuiService_0.SelectedCoreObject] and not l_VRService_0.VREnabled then
                            l_GuiService_0.SelectedCoreObject = v285.SelectorFrame;
                        end;
                        return;
                    end;
                end);
            end;
        end);
        local function v351(_, v347) --[[ Line: 1575 ]] --[[ Name: onResized ]]
            -- upvalues: v0 (ref), v36 (ref), v285 (copy)
            local v348 = 0;
            v348 = if v347 then v0.textSize(16) else v36 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            for _, v350 in pairs(v285.Selections) do
                v350.TextSize = v348;
            end;
        end;
        v41[v285.SelectorFrame] = v351;
        local l_v351_0 = v351;
        local v353 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
        local v354 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
        l_v351_0(v353, v354.Y > v354.X);
        v313 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 1357 ]]
            -- upvalues: v285 (copy), l_GuiService_0 (ref), v297 (copy), l_VRService_0 (ref)
            if #v285.Selections <= 0 then
                return;
            else
                if l_GuiService_0.SelectedCoreObject ~= nil and v297[l_GuiService_0.SelectedCoreObject] and not l_VRService_0.VREnabled then
                    l_GuiService_0.SelectedCoreObject = v285.SelectorFrame;
                end;
                return;
            end;
        end);
        return v285;
    end;
end;
local function v380(v356, v357, v358, v359, v360) --[[ Line: 1594 ]] --[[ Name: ShowAlert ]]
    -- upvalues: l_CoreGui_0 (copy), l_VRService_0 (copy), l_isInExperienceUIVREnabled_0 (copy), l_CorePackages_1 (copy), l_Create_0 (copy), v0 (copy), l_HttpService_0 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy), v152 (copy), l_UserInputService_0 (copy)
    local l_RobloxGui_1 = l_CoreGui_0.RobloxGui;
    if l_RobloxGui_1:FindFirstChild("AlertViewFullScreen") then
        return;
    else
        local v362 = nil;
        local function v368(v363) --[[ Line: 1605 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), l_isInExperienceUIVREnabled_0 (ref), l_CorePackages_1 (ref), l_RobloxGui_1 (ref), l_CoreGui_0 (ref), v362 (ref)
            if v363 ~= "VREnabled" then
                return;
            else
                local _ = nil;
                local v365 = nil;
                if l_VRService_0.VREnabled then
                    if l_isInExperienceUIVREnabled_0 then
                        local v366 = require(l_CorePackages_1.Workspace.Packages.VrSpatialUi);
                        local l_PanelType_1 = v366.Constants.PanelType;
                        l_RobloxGui_1 = v366.UIManager.getInstance():getPanelObject(l_PanelType_1.MoreMenu);
                    else
                        v365 = require(l_CorePackages_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu");
                        l_RobloxGui_1 = v365:GetGUI();
                    end;
                else
                    l_RobloxGui_1 = l_CoreGui_0.RobloxGui;
                end;
                if v362 and v362.Parent ~= nil then
                    v362.Parent = l_RobloxGui_1;
                    if l_VRService_0.VREnabled and not l_isInExperienceUIVREnabled_0 then
                        v365:SetSubpanelDepth(v362, 0.5);
                    end;
                end;
                return;
            end;
        end;
        local v369 = l_VRService_0.Changed:Connect(v368);
        v362 = l_Create_0("ImageLabel")({
            Name = "AlertViewBacking", 
            Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png", 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 6, 46, 44), 
            BackgroundTransparency = 1, 
            ImageTransparency = 1, 
            Size = UDim2.new(0, 400, 0, 350), 
            Position = UDim2.new(0.5, -200, 0.5, -175), 
            ZIndex = 9, 
            Parent = l_RobloxGui_1
        });
        v368("VREnabled");
        if v360 or not l_isInExperienceUIVREnabled_0 and l_VRService_0.VREnabled then
            v362.ImageTransparency = 0;
        else
            v362.Size = UDim2.new(0.8, 0, 0, 350);
            v362.Position = UDim2.new(0.1, 0, 0.1, 0);
        end;
        if l_CoreGui_0.RobloxGui.AbsoluteSize.Y <= v362.Size.Y.Offset then
            v362.Size = UDim2.new(v362.Size.X.Scale, v362.Size.X.Offset, v362.Size.Y.Scale, l_CoreGui_0.RobloxGui.AbsoluteSize.Y);
            v362.Position = UDim2.new(v362.Position.X.Scale, -v362.Size.X.Offset / 2, 0.5, -v362.Size.Y.Offset / 2);
        end;
        if not v360 then
            l_Create_0("UICorner")({
                CornerRadius = v0.DefaultCornerRadius, 
                Parent = v362
            });
            v362.BackgroundColor3 = v0.color("MenuContainer");
            v362.BackgroundTransparency = v0.transparency("MenuContainer");
        end;
        local _ = l_Create_0("TextLabel")({
            Name = "AlertViewText", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.95, 0, 0.6, 0), 
            Position = UDim2.new(0.025, 0, 0.05, 0), 
            Font = v0.font(Enum.Font.SourceSansBold, "Bold"), 
            TextSize = v0.textSize(36), 
            Text = v356, 
            TextWrapped = true, 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 10, 
            Parent = v362
        });
        local _ = l_Create_0("ImageLabel")({
            Image = "", 
            BackgroundTransparency = 1
        });
        local v372 = l_HttpService_0:GenerateGUID(false);
        local function v375(_, v374) --[[ Line: 1704 ]]
            -- upvalues: l_VRService_0 (ref), v362 (ref), l_isInExperienceUIVREnabled_0 (ref), l_CorePackages_1 (ref), v359 (copy), l_ContextActionService_0 (ref), v372 (copy), l_GuiService_0 (ref), v358 (copy), v369 (copy)
            if l_VRService_0.VREnabled and (v374 == Enum.UserInputState.Begin or v374 == Enum.UserInputState.Cancel) then
                return;
            elseif not v362 then
                return;
            else
                if l_VRService_0.VREnabled and not l_isInExperienceUIVREnabled_0 then
                    require(l_CorePackages_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v362, 0);
                end;
                v362:Destroy();
                v362 = nil;
                if v359 then
                    v359();
                end;
                l_ContextActionService_0:UnbindCoreAction(v372);
                l_GuiService_0.SelectedCoreObject = nil;
                if v358 then
                    v358:ShowBar();
                end;
                if v369 then
                    v369:Disconnect();
                end;
                return;
            end;
        end;
        local v376 = UDim2.new(1, -20, 0, 60);
        local v377 = UDim2.new(0, 10, 0.65, 0);
        if not v360 then
            v376 = UDim2.new(0, 200, 0, 50);
            v377 = UDim2.new(0.5, -100, 0.65, 0);
        end;
        local v378, v379 = v152("AlertViewButton", v357, v376, v375);
        v378.Position = v377;
        v378.NextSelectionLeft = v378;
        v378.NextSelectionRight = v378;
        v378.NextSelectionUp = v378;
        v378.NextSelectionDown = v378;
        v378.ZIndex = 9;
        v379.ZIndex = v378.ZIndex;
        v378.Parent = v362;
        if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
            l_GuiService_0.SelectedCoreObject = v378;
        end;
        l_GuiService_0.SelectedCoreObject = v378;
        l_ContextActionService_0:BindCoreAction(v372, v375, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonA);
        if v358 and (l_isInExperienceUIVREnabled_0 and true or not l_VRService_0.VREnabled) then
            v358:HideBar();
            v358.Pages.CurrentPage:Hide(1, 1);
        end;
        return;
    end;
end;
local function v474(v381, v382, v383, v384, v385) --[[ Line: 1774 ]] --[[ Name: CreateNewSlider ]]
    -- upvalues: l_HttpService_0 (copy), l_Signal_0 (copy), l_Create_0 (copy), v42 (copy), l_RobloxGui_0 (copy), v0 (copy), l_UserInputService_0 (copy), v4 (copy), v3 (copy), v4 (copy), v101 (copy), v1 (copy), v2 (copy), l_VRService_0 (copy), l_GuiService_0 (copy), l_RunService_0 (copy)
    local v386 = {};
    local v387 = tonumber(v381);
    local l_v382_0 = v382;
    local v389 = 0;
    local v390 = nil;
    local v391 = true;
    local v392 = l_HttpService_0:GenerateGUID(false);
    v381 = "";
    v382 = "";
    if v387 <= 0 then
        error("CreateNewSlider failed because numOfSteps (first arg) is 0 or negative, please supply a positive integer", 2);
        return;
    else
        local v393 = v384 or v385;
        local l_BindableEvent_3 = Instance.new("BindableEvent");
        l_BindableEvent_3.Name = "ValueChanged";
        local v395 = l_Signal_0.new();
        v386.SliderFrame = l_Create_0("ImageButton")({
            Name = "Slider", 
            Image = "", 
            AutoButtonColor = false, 
            NextSelectionLeft = v386.SliderFrame, 
            NextSelectionRight = v386.SliderFrame, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.6, 0, 0, 50), 
            AutomaticSize = if v393 then Enum.AutomaticSize.Y else nil, 
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            SelectionImageObject = v42, 
            ZIndex = 2
        });
        local v396 = nil;
        if v393 then
            v396 = l_Create_0("Frame")({
                Name = "StepsAndButtonsContainer", 
                Size = UDim2.new(1, 0, 0, 50), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Parent = v386.SliderFrame
            });
            l_Create_0("UIListLayout")({
                Name = "UIListLayout", 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v386.SliderFrame
            });
            local v397 = l_Create_0("Frame")({
                Name = "SliderLabels", 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Parent = v386.SliderFrame, 
                LayoutOrder = 2
            });
            l_Create_0("UIPadding")({
                Name = "UIPadding", 
                PaddingRight = UDim.new(0, 50), 
                PaddingLeft = UDim.new(0, 50), 
                Parent = v397
            });
            local function _() --[[ Line: 1856 ]] --[[ Name: isWideEnough ]]
                -- upvalues: l_RobloxGui_0 (ref)
                return l_RobloxGui_0.AbsoluteSize.X > 460;
            end;
            if v384 then
                v386.LeftLabel = l_Create_0("TextLabel")({
                    Name = "LeftLabel", 
                    Text = v384, 
                    Font = v0.font(Enum.Font.SourceSans, "UtilityRow"), 
                    TextSize = v0.textSize(18, "UtilityRow"), 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextTransparency = 0.25, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Parent = v397, 
                    Visible = l_RobloxGui_0.AbsoluteSize.X > 460
                });
            end;
            if v385 then
                v386.RightLabel = l_Create_0("TextLabel")({
                    Name = "RightLabel", 
                    Text = v385, 
                    Font = v0.font(Enum.Font.SourceSans, "UtilityRow"), 
                    TextSize = v0.textSize(18, "UtilityRow"), 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextTransparency = 0.25, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Parent = v397, 
                    Visible = l_RobloxGui_0.AbsoluteSize.X > 460
                });
            end;
            l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ Line: 1895 ]]
                -- upvalues: v386 (copy), l_RobloxGui_0 (ref)
                if v386.LeftLabel then
                    v386.LeftLabel.Visible = l_RobloxGui_0.AbsoluteSize.X > 460;
                end;
                if v386.RightLabel then
                    v386.RightLabel.Visible = l_RobloxGui_0.AbsoluteSize.X > 460;
                end;
            end);
        end;
        v386.StepsContainer = l_Create_0("Frame")({
            Name = "StepsContainer", 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -100, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Parent = if v393 then v396 else v386.SliderFrame
        });
        local v399 = l_Create_0("ImageButton")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v42, 
            Active = true, 
            Parent = if v393 then v396 else v386.SliderFrame
        });
        local v400 = l_Create_0("ImageButton")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v42, 
            Active = true, 
            Parent = if v393 then v396 else v386.SliderFrame
        });
        local v401 = l_Create_0("ImageLabel")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 30, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/Less.png", 
            ZIndex = 4, 
            Parent = v399, 
            ImageColor3 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch and v4 or v3
        });
        local v402 = l_Create_0("ImageLabel")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 30, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/More.png", 
            ZIndex = 4, 
            Parent = v400, 
            ImageColor3 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch and v4 or v3
        });
        if not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) then
            local function v404(v403) --[[ Line: 1966 ]]
                -- upvalues: v3 (ref)
                v403.ImageColor3 = v3;
            end;
            local function v406(v405) --[[ Line: 1968 ]]
                -- upvalues: v4 (ref)
                v405.ImageColor3 = v4;
            end;
            v101(v399, v401, v404, v406);
            v101(v400, v402, v404, v406);
        end;
        v386.Steps = {};
        local v407 = 1 / v387;
        for v408 = 1, v387 do
            local v409 = l_Create_0("ImageButton")({
                Name = "Step" .. tostring(v408), 
                BackgroundColor3 = v1, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                Active = false, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new((v408 - 1) * v407, 2, 0.5, 0), 
                Size = UDim2.new(v407, -4, 0, 24), 
                Image = "", 
                ZIndex = 3, 
                Selectable = false, 
                ImageTransparency = 0.36, 
                Parent = v386.StepsContainer, 
                SelectionImageObject = v42
            });
            if l_v382_0 < v408 then
                v409.BackgroundColor3 = v2;
            end;
            if v408 == 1 or v408 == v387 then
                l_Create_0("UICorner")({
                    CornerRadius = v0.DefaultCornerRadius, 
                    Parent = v409
                });
                l_Create_0("Frame")({
                    Name = "Filler", 
                    BackgroundColor3 = v409.BackgroundColor3, 
                    Parent = v409, 
                    Size = UDim2.new(0.25, 0, 1, 0), 
                    BorderSizePixel = 0, 
                    Position = if v408 == 1 then UDim2.new(0.75, 0, 0, 0) else UDim2.new(0, 0, 0, 0)
                });
            end;
            v386.Steps[#v386.Steps + 1] = v409;
        end;
        local function v411() --[[ Line: 2022 ]] --[[ Name: hideSelection ]]
            -- upvalues: v387 (copy), v386 (copy), v2 (ref)
            for v410 = 1, v387 do
                v386.Steps[v410].BackgroundColor3 = v2;
                if v410 == 1 or v410 == v387 then
                    v386.Steps[v410].Filler.BackgroundColor3 = v2;
                end;
            end;
        end;
        local function v413() --[[ Line: 2030 ]] --[[ Name: showSelection ]]
            -- upvalues: v387 (copy), l_v382_0 (ref), v386 (copy), v1 (ref)
            for v412 = 1, v387 do
                if l_v382_0 >= v412 then
                    v386.Steps[v412].BackgroundColor3 = v1;
                    if v412 == 1 or v412 == v387 then
                        v386.Steps[v412].Filler.BackgroundColor3 = v1;
                    end;
                else
                    break;
                end;
            end;
        end;
        local function v415(v414) --[[ Line: 2042 ]] --[[ Name: setCurrentStep ]]
            -- upvalues: v383 (ref), v399 (copy), v400 (copy), v387 (copy), l_v382_0 (ref), v411 (copy), v413 (copy), v390 (ref), v395 (copy), l_BindableEvent_3 (copy)
            if not v383 then
                v383 = 0;
            end;
            v399.Visible = true;
            v400.Visible = true;
            if v414 <= v383 then
                v414 = v383;
                v399.Visible = false;
            end;
            if v387 <= v414 then
                v414 = v387;
                v400.Visible = false;
            end;
            if l_v382_0 == v414 then
                return;
            else
                l_v382_0 = v414;
                v411();
                v413();
                v390 = tick();
                if v395 then
                    v395:fire(l_v382_0);
                    return;
                else
                    l_BindableEvent_3:Fire(l_v382_0);
                    return;
                end;
            end;
        end;
        local function _(v416) --[[ Line: 2076 ]] --[[ Name: isActivateEvent ]]
            if not v416 then
                return false;
            else
                local v417 = true;
                if v416.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    v417 = true;
                    if v416.UserInputType ~= Enum.UserInputType.Touch then
                        v417 = false;
                        if v416.UserInputType == Enum.UserInputType.Gamepad1 then
                            v417 = v416.KeyCode == Enum.KeyCode.ButtonA;
                        end;
                    end;
                end;
                return v417;
            end;
        end;
        local function v432(v419, v420, v421) --[[ Line: 2087 ]] --[[ Name: mouseDownFunc ]]
            -- upvalues: v391 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v386 (copy), v389 (ref), l_v382_0 (ref), v387 (copy), v415 (copy)
            if not v391 then
                return;
            elseif v419 == nil then
                return;
            elseif not (not not v419 and (v419.UserInputType == Enum.UserInputType.MouseButton1 or v419.UserInputType == Enum.UserInputType.Touch or v419.UserInputType == Enum.UserInputType.Gamepad1 and v419.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) and not l_VRService_0.VREnabled then
                    l_GuiService_0.SelectedCoreObject = v386.SliderFrame;
                end;
                if not l_VRService_0.VREnabled then
                    if v421 then
                        v389 = v420 - l_v382_0;
                    else
                        v389 = 0;
                        local v422 = nil;
                        local v423 = nil;
                        v422 = l_UserInputService_0.InputChanged:Connect(function(v424) --[[ Line: 2113 ]]
                            -- upvalues: v387 (ref), v386 (ref), v415 (ref)
                            if v424.UserInputType ~= Enum.UserInputType.MouseMovement then
                                return;
                            else
                                local l_X_0 = v424.Position.X;
                                for v426 = 1, v387 do
                                    local l_X_1 = v386.Steps[v426].AbsolutePosition.X;
                                    local l_X_2 = v386.Steps[v426].AbsoluteSize.X;
                                    if l_X_1 <= l_X_0 and l_X_0 <= l_X_1 + l_X_2 then
                                        v415(v426);
                                        return;
                                    elseif v426 == 1 and l_X_0 < l_X_1 then
                                        v415(0);
                                        return;
                                    elseif v426 == v387 and l_X_1 <= l_X_0 then
                                        v415(v426);
                                        return;
                                    end;
                                end;
                                return;
                            end;
                        end);
                        do
                            local l_v422_0, l_v423_0 = v422, v423;
                            l_v423_0 = l_UserInputService_0.InputEnded:Connect(function(v431) --[[ Line: 2134 ]]
                                -- upvalues: v389 (ref), l_v423_0 (ref), l_v422_0 (ref)
                                if not (not not v431 and (v431.UserInputType == Enum.UserInputType.MouseButton1 or v431.UserInputType == Enum.UserInputType.Touch or v431.UserInputType == Enum.UserInputType.Gamepad1 and v431.KeyCode == Enum.KeyCode.ButtonA)) then
                                    return;
                                else
                                    v389 = 0;
                                    l_v423_0:Disconnect();
                                    l_v422_0:Disconnect();
                                    return;
                                end;
                            end);
                        end;
                    end;
                else
                    v389 = 0;
                end;
                v415(v420);
                return;
            end;
        end;
        local function _(v433) --[[ Line: 2151 ]] --[[ Name: mouseUpFunc ]]
            -- upvalues: v391 (ref), v389 (ref)
            if not v391 then
                return;
            elseif not (not not v433 and (v433.UserInputType == Enum.UserInputType.MouseButton1 or v433.UserInputType == Enum.UserInputType.Touch or v433.UserInputType == Enum.UserInputType.Gamepad1 and v433.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                v389 = 0;
                return;
            end;
        end;
        v386.ValueChanged = l_BindableEvent_3.Event;
        if v395 then
            v386.ValueChanged = v395;
        end;
        v386.SetValue = function(_, v436) --[[ Line: 2168 ]] --[[ Name: SetValue ]]
            -- upvalues: v415 (copy)
            v415(v436);
        end;
        v386.GetValue = function(_) --[[ Line: 2172 ]] --[[ Name: GetValue ]]
            -- upvalues: l_v382_0 (ref)
            return l_v382_0;
        end;
        v386.SetInteractable = function(_, v439) --[[ Line: 2176 ]] --[[ Name: SetInteractable ]]
            -- upvalues: v389 (ref), v391 (ref), v386 (copy), v411 (copy), v413 (copy)
            v389 = 0;
            v391 = v439;
            v386.SliderFrame.Selectable = v439;
            if not v391 then
                v411();
                return;
            else
                v413();
                return;
            end;
        end;
        v386.SetZIndex = function(_, v441) --[[ Line: 2187 ]] --[[ Name: SetZIndex ]]
            -- upvalues: v399 (copy), v400 (copy), v401 (copy), v402 (copy), v386 (copy)
            v399.ZIndex = v441;
            v400.ZIndex = v441;
            v401.ZIndex = v441;
            v402.ZIndex = v441;
            for v442 = 1, #v386.Steps do
                v386.Steps[v442].ZIndex = v441;
            end;
        end;
        v386.SetMinStep = function(_, v444) --[[ Line: 2198 ]] --[[ Name: SetMinStep ]]
            -- upvalues: v387 (copy), v383 (ref), l_v382_0 (ref), v399 (copy), v400 (copy)
            if v444 >= 0 and v444 <= v387 then
                v383 = v444;
            end;
            if l_v382_0 <= v383 then
                l_v382_0 = v383;
                v399.Visible = false;
            end;
            if v387 <= l_v382_0 then
                l_v382_0 = v387;
                v400.Visible = false;
            end;
        end;
        v399.InputBegan:Connect(function(v445) --[[ Line: 2215 ]]
            -- upvalues: v432 (copy), l_v382_0 (ref)
            v432(v445, l_v382_0 - 1, true);
        end);
        v399.InputEnded:Connect(function(v446) --[[ Line: 2218 ]]
            -- upvalues: v391 (ref), v389 (ref)
            if not v391 then
                return;
            elseif not (not not v446 and (v446.UserInputType == Enum.UserInputType.MouseButton1 or v446.UserInputType == Enum.UserInputType.Touch or v446.UserInputType == Enum.UserInputType.Gamepad1 and v446.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                v389 = 0;
                return;
            end;
        end);
        v400.InputBegan:Connect(function(v447) --[[ Line: 2221 ]]
            -- upvalues: v432 (copy), l_v382_0 (ref)
            v432(v447, l_v382_0 + 1, true);
        end);
        v400.InputEnded:Connect(function(v448) --[[ Line: 2224 ]]
            -- upvalues: v391 (ref), v389 (ref)
            if not v391 then
                return;
            elseif not (not not v448 and (v448.UserInputType == Enum.UserInputType.MouseButton1 or v448.UserInputType == Enum.UserInputType.Touch or v448.UserInputType == Enum.UserInputType.Gamepad1 and v448.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                v389 = 0;
                return;
            end;
        end);
        local function v452(v449) --[[ Line: 2228 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), v399 (copy), v391 (ref), v400 (copy), v386 (copy), v387 (copy)
            if v449 ~= "VREnabled" then
                return;
            elseif l_VRService_0.VREnabled then
                v399.Selectable = v391;
                v400.Selectable = v391;
                v386.SliderFrame.Selectable = v391;
                for v450 = 1, v387 do
                    v386.Steps[v450].Selectable = v391;
                    v386.Steps[v450].Active = v391;
                end;
                return;
            else
                v399.Selectable = false;
                v400.Selectable = false;
                v386.SliderFrame.Selectable = v391;
                for v451 = 1, v387 do
                    v386.Steps[v451].Selectable = false;
                    v386.Steps[v451].Active = false;
                end;
                return;
            end;
        end;
        l_VRService_0.Changed:Connect(v452);
        v452("VREnabled");
        for v453 = 1, v387 do
            v386.Steps[v453].InputBegan:Connect(function(v454) --[[ Line: 2255 ]]
                -- upvalues: v432 (copy), v453 (copy)
                v432(v454, v453);
            end);
            v386.Steps[v453].InputEnded:Connect(function(v455) --[[ Line: 2258 ]]
                -- upvalues: v391 (ref), v389 (ref)
                if not v391 then
                    return;
                elseif not (not not v455 and (v455.UserInputType == Enum.UserInputType.MouseButton1 or v455.UserInputType == Enum.UserInputType.Touch or v455.UserInputType == Enum.UserInputType.Gamepad1 and v455.KeyCode == Enum.KeyCode.ButtonA)) then
                    return;
                else
                    v389 = 0;
                    return;
                end;
            end);
        end;
        v386.SliderFrame.InputBegan:Connect(function(v456) --[[ Line: 2263 ]]
            -- upvalues: l_VRService_0 (ref), l_GuiService_0 (ref), v386 (copy), v432 (copy), l_v382_0 (ref)
            if l_VRService_0.VREnabled then
                local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_1 or not l_SelectedCoreObject_1:IsDescendantOf(v386.SliderFrame.Parent) then
                    return;
                end;
            end;
            v432(v456, l_v382_0);
        end);
        v386.SliderFrame.InputEnded:Connect(function(v458) --[[ Line: 2272 ]]
            -- upvalues: l_VRService_0 (ref), l_GuiService_0 (ref), v386 (copy), v391 (ref), v389 (ref)
            if l_VRService_0.VREnabled then
                local l_SelectedCoreObject_2 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_2 or not l_SelectedCoreObject_2:IsDescendantOf(v386.SliderFrame.Parent) then
                    return;
                end;
            end;
            if not v391 then
                return;
            elseif not (not not v458 and (v458.UserInputType == Enum.UserInputType.MouseButton1 or v458.UserInputType == Enum.UserInputType.Touch or v458.UserInputType == Enum.UserInputType.Gamepad1 and v458.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                v389 = 0;
                return;
            end;
        end);
        local function v460() --[[ Line: 2282 ]]
            -- upvalues: v390 (ref), v415 (copy), l_v382_0 (ref), v389 (ref)
            if v390 == nil then
                return;
            else
                if tick() - v390 >= 0.2 then
                    v415(l_v382_0 + v389);
                end;
                return;
            end;
        end;
        local v461 = true;
        local v462 = {
            [Enum.KeyCode.Thumbstick1] = true, 
            [Enum.KeyCode.DPadLeft] = -1, 
            [Enum.KeyCode.DPadRight] = 1, 
            [Enum.KeyCode.Left] = -1, 
            [Enum.KeyCode.Right] = 1, 
            [Enum.KeyCode.A] = -1, 
            [Enum.KeyCode.D] = 1, 
            [Enum.KeyCode.ButtonA] = true
        };
        l_UserInputService_0.InputBegan:Connect(function(v463) --[[ Line: 2308 ]]
            -- upvalues: v391 (ref), v461 (ref), l_GuiService_0 (ref), v386 (copy), v462 (copy), v389 (ref), v415 (copy), l_v382_0 (ref)
            if not v391 then
                return;
            elseif not v461 then
                return;
            elseif v463.UserInputType ~= Enum.UserInputType.Gamepad1 and v463.UserInputType ~= Enum.UserInputType.Keyboard then
                return;
            else
                local l_SelectedCoreObject_3 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_3 or not l_SelectedCoreObject_3:IsDescendantOf(v386.SliderFrame.Parent) then
                    return;
                elseif v462[v463.KeyCode] == -1 then
                    v389 = -1;
                    v415(l_v382_0 - 1);
                    return;
                else
                    if v462[v463.KeyCode] == 1 then
                        v389 = 1;
                        v415(l_v382_0 + 1);
                    end;
                    return;
                end;
            end;
        end);
        l_UserInputService_0.InputEnded:Connect(function(v465) --[[ Line: 2336 ]]
            -- upvalues: v391 (ref), l_GuiService_0 (ref), v386 (copy), v462 (copy), v389 (ref)
            if not v391 then
                return;
            elseif v465.UserInputType ~= Enum.UserInputType.Gamepad1 and v465.UserInputType ~= Enum.UserInputType.Keyboard then
                return;
            else
                local l_SelectedCoreObject_4 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_4 or not l_SelectedCoreObject_4:IsDescendantOf(v386.SliderFrame.Parent) then
                    return;
                else
                    if v462[v465.KeyCode] then
                        v389 = 0;
                    end;
                    return;
                end;
            end;
        end);
        l_UserInputService_0.InputChanged:Connect(function(v467) --[[ Line: 2357 ]]
            -- upvalues: v391 (ref), v389 (ref), v461 (ref), l_GuiService_0 (ref), v386 (copy), v415 (copy), l_v382_0 (ref)
            if not v391 then
                v389 = 0;
                return;
            elseif not v461 then
                v389 = 0;
                return;
            elseif v467.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return;
            else
                local l_SelectedCoreObject_5 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_5 or not l_SelectedCoreObject_5:IsDescendantOf(v386.SliderFrame.Parent) then
                    return;
                elseif v467.KeyCode ~= Enum.KeyCode.Thumbstick1 then
                    return;
                elseif v467.Position.X > 0.8 and v467.Delta.X > 0 and v389 ~= 1 then
                    v389 = 1;
                    v415(l_v382_0 + 1);
                    return;
                elseif v467.Position.X < -0.8 and v467.Delta.X < 0 and v389 ~= -1 then
                    v389 = -1;
                    v415(l_v382_0 - 1);
                    return;
                else
                    if math.abs(v467.Position.X) < 0.8 then
                        v389 = 0;
                    end;
                    return;
                end;
            end;
        end);
        local v469 = false;
        l_GuiService_0.Changed:Connect(function(v470) --[[ Line: 2398 ]]
            -- upvalues: l_GuiService_0 (ref), v386 (copy), v469 (ref), v390 (ref), l_RunService_0 (ref), v392 (copy), v460 (copy)
            if v470 ~= "SelectedCoreObject" then
                return;
            else
                local l_SelectedCoreObject_6 = l_GuiService_0.SelectedCoreObject;
                if l_SelectedCoreObject_6 and l_SelectedCoreObject_6:IsDescendantOf(v386.SliderFrame.Parent) then
                    if not v469 then
                        v469 = true;
                        v390 = tick();
                        l_RunService_0:BindToRenderStep(v392, Enum.RenderPriority.Input.Value + 1, v460);
                        return;
                    end;
                elseif v469 then
                    v469 = false;
                    l_RunService_0:UnbindFromRenderStep(v392);
                end;
                return;
            end;
        end);
        v386.SliderFrame.AncestryChanged:Connect(function(_, v473) --[[ Line: 2419 ]]
            -- upvalues: v461 (ref)
            v461 = v473;
        end);
        v415(l_v382_0);
        return v386;
    end;
end;
local v475 = 50;
if v36 then
    v475 = 90;
end;
local v476 = {};
local function v530(v477, v478, v479, v480, v481, v482, v483, v484, v485, v486) --[[ Line: 2434 ]] --[[ Name: AddNewRow ]]
    -- upvalues: v476 (copy), l_Create_0 (copy), v475 (ref), v42 (copy), v0 (copy), v36 (copy), l_GuiService_0 (copy), v41 (copy), v474 (copy), v355 (copy), v281 (copy), l_VRService_0 (copy), l_UserInputService_0 (copy), l_CoreGui_0 (copy)
    local v487 = 0;
    local v488 = v479 ~= "TextBox";
    if v476[v477] then
        v487 = v476[v477];
    end;
    local v489 = nil;
    v489 = l_Create_0("ImageButton")({
        Name = v478 .. "Frame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(2, 2, 18, 18), 
        ImageTransparency = 1, 
        Active = false, 
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 0, v475), 
        AutomaticSize = if not not v483 or v484 or v485 then Enum.AutomaticSize.Y else nil, 
        Position = UDim2.new(0, 0, 0, v487), 
        ZIndex = 2, 
        Selectable = false, 
        SelectionImageObject = v42, 
        Parent = v477.Page
    });
    v489.BackgroundColor3 = v0.color("RowFrameBackground");
    v489.ImageColor3 = v489.BackgroundColor3;
    l_Create_0("UICorner")({
        CornerRadius = v0.DefaultCornerRadius, 
        Parent = v489
    });
    if v489 and v482 then
        v489.Position = UDim2.new(v489.Position.X.Scale, v489.Position.X.Offset, v489.Position.Y.Scale, v489.Position.Y.Offset + v482);
    end;
    local v490 = nil;
    local v491 = nil;
    if v483 then
        v490 = l_Create_0("Frame")({
            Name = v478 .. "RowLabelAndDescriptionFrame", 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 10, 0, 0), 
            Size = UDim2.new(0.4, -20, 0, 50), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Parent = v489
        });
        v491 = l_Create_0("TextLabel")({
            Name = v478 .. "Label", 
            Text = v478, 
            Font = v0.font(Enum.Font.SourceSansBold, "UtilityRow"), 
            TextSize = v0.textSize(16, "UtilityRow"), 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextWrapped = true, 
            ZIndex = 2, 
            Parent = v490, 
            LayoutOrder = 1
        });
        l_Create_0("TextLabel")({
            Name = v478 .. "Description", 
            Text = v483, 
            Font = v0.font(Enum.Font.SourceSans, "UtilityRow"), 
            TextSize = v0.textSize(18, "UtilityRow"), 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextTransparency = 0.25, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            ZIndex = 2, 
            Parent = v490, 
            LayoutOrder = 2
        });
        l_Create_0("UIListLayout")({
            Name = v478 .. "UIListLayout", 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8), 
            Parent = v490
        });
        l_Create_0("UIPadding")({
            Name = v478 .. "UIListLayout", 
            PaddingBottom = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10), 
            Parent = v490
        });
    else
        v491 = l_Create_0("TextLabel")({
            Name = v478 .. "Label", 
            Text = v478, 
            Font = v0.font(Enum.Font.SourceSansBold, "UtilityRow"), 
            TextSize = v0.textSize(16, "UtilityRow"), 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.4, -20, 1, 0), 
            Position = UDim2.new(0, 10, 0, 0), 
            ZIndex = 2, 
            Parent = v489
        });
        l_Create_0("UIPadding")({
            Name = v478 .. "UIPadding", 
            PaddingBottom = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10), 
            Parent = v491
        });
    end;
    if not v488 then
        v491.Text = "";
    end;
    local function v494(_, v493) --[[ Line: 2566 ]] --[[ Name: onResized ]]
        -- upvalues: v491 (ref), v0 (ref), v36 (ref)
        if v493 then
            v491.TextSize = v0.textSize(16, "UtilityRow");
            return;
        else
            v491.TextSize = v36 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            return;
        end;
    end;
    local v495 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v496 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    if v496.Y > v496.X then
        v496 = v0.textSize(16, "UtilityRow");
        v491.TextSize = v496;
    else
        v496 = v36 and v0.textSize(36) or v0.textSize(24, "UtilityText");
        v491.TextSize = v496;
    end;
    v41[v489] = v494;
    local v497 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v498 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    if v498.Y > v498.X then
        v498 = v0.textSize(16, "UtilityRow");
        v491.TextSize = v498;
    else
        v498 = v36 and v0.textSize(36) or v0.textSize(24, "UtilityText");
        v491.TextSize = v498;
    end;
    v495 = nil;
    v497 = nil;
    if v479 == "Slider" then
        v497 = v474(v480, v481, nil, v484, v485);
        v497.SliderFrame.Parent = v489;
        v495 = v497.SliderFrame;
    elseif v479 == "Selector" then
        v497 = v355(v480, v481);
        v497.SelectorFrame.Parent = v489;
        v495 = v497.SelectorFrame;
    elseif v479 == "DropDown" then
        v497 = v281(v480, v481, v477.HubRef);
        v497.DropDownFrame.Parent = v489;
        v495 = v497.DropDownFrame;
    elseif v479 == "TextBox" then
        v496 = l_Create_0("ImageLabel")({
            Image = "", 
            BackgroundTransparency = 1
        });
        v497 = {
            HubRef = nil
        };
        v498 = l_Create_0("TextBox")({
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0.6, 0, 1, 0), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Text = v478, 
            TextColor3 = Color3.fromRGB(49, 49, 49), 
            BackgroundTransparency = v0.transparency("ControlInputBackground", 0.5), 
            BorderSizePixel = 0, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Font = v0.font(Enum.Font.SourceSans, "UtilityText"), 
            TextSize = v0.textSize(24, "UtilityText"), 
            ZIndex = 2, 
            SelectionImageObject = v496, 
            ClearTextOnFocus = false, 
            Interactable = v486, 
            Parent = v489
        });
        v495 = v498;
        local l_v498_0 = v498 --[[ copy: 19 -> 25 ]];
        v498.Focused:Connect(function() --[[ Line: 2620 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), l_v498_0 (copy), v478 (copy)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                l_GuiService_0.SelectedCoreObject = l_v498_0;
            end;
            if l_v498_0.Text == v478 then
                l_v498_0.Text = "";
            end;
        end);
        if v482 then
            v498.Position = UDim2.new(v498.Position.X.Scale, v498.Position.X.Offset, v498.Position.Y.Scale, v498.Position.Y.Offset + v482);
        end;
        local l_v498_1 = v498 --[[ copy: 19 -> 26 ]];
        v495.SelectionGained:Connect(function() --[[ Line: 2638 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_v498_1 (copy), v0 (ref), v497 (ref), v495 (ref)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                l_v498_1.BackgroundTransparency = v0.transparency("ControlInputBackground", 0.1);
                if v497.HubRef then
                    v497.HubRef:ScrollToFrame(v495);
                end;
            end;
        end);
        v495.SelectionLost:Connect(function() --[[ Line: 2647 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_v498_1 (copy), v0 (ref)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                l_v498_1.BackgroundTransparency = v0.transparency("ControlInputBackground", 0.5);
            end;
        end);
        local function v503() --[[ Line: 2653 ]]
            -- upvalues: l_CoreGui_0 (ref), v495 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), v477 (copy), l_GuiService_0 (ref)
            local l_DropDownFullscreenFrame_0 = l_CoreGui_0.RobloxGui:FindFirstChild("DropDownFullscreenFrame");
            if l_DropDownFullscreenFrame_0 and l_DropDownFullscreenFrame_0.Visible then
                return;
            else
                local l_v495_0 = v495;
                if l_v495_0 and l_v495_0.Visible and l_v495_0.ZIndex > 1 and not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) and v477.Active then
                    l_GuiService_0.SelectedCoreObject = l_v495_0;
                end;
                return;
            end;
        end;
        local function v505(v504) --[[ Line: 2671 ]] --[[ Name: processInput ]]
            -- upvalues: l_GuiService_0 (ref), v495 (ref), l_v498_1 (copy)
            if v504.UserInputState == Enum.UserInputState.Begin and v504.KeyCode == Enum.KeyCode.Return and l_GuiService_0.SelectedCoreObject == v495 then
                l_v498_1:CaptureFocus();
            end;
        end;
        v498.MouseEnter:Connect(v503);
        l_UserInputService_0.InputBegan:Connect(v505);
    elseif v479 == "TextEntry" then
        v496 = l_Create_0("ImageLabel")({
            Image = "", 
            BackgroundTransparency = 1
        });
        v497 = {
            HubRef = nil
        };
        v498 = l_Create_0("TextBox")({
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0.4, -10, 0, 40), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Text = v478, 
            TextColor3 = Color3.fromRGB(178, 178, 178), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextWrapped = false, 
            Font = v0.font(Enum.Font.SourceSans, "UtilityText"), 
            TextSize = v0.textSize(24, "UtilityText"), 
            ZIndex = 2, 
            SelectionImageObject = v496, 
            ClearTextOnFocus = false, 
            Parent = v489
        });
        v495 = v498;
        local l_v498_2 = v498 --[[ copy: 19 -> 23 ]];
        v498.Focused:Connect(function() --[[ Line: 2712 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), l_v498_2 (copy), v478 (copy)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                l_GuiService_0.SelectedCoreObject = l_v498_2;
            end;
            if l_v498_2.Text == v478 then
                l_v498_2.Text = "";
            end;
        end);
        if v482 then
            v498.Position = UDim2.new(v498.Position.X.Scale, v498.Position.X.Offset, v498.Position.Y.Scale, v498.Position.Y.Offset + v482);
        end;
        local l_v498_3 = v498 --[[ copy: 19 -> 24 ]];
        v495.SelectionGained:Connect(function() --[[ Line: 2730 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_v498_3 (copy), v497 (ref), v495 (ref)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                l_v498_3.BackgroundTransparency = 0.8;
                if v497.HubRef then
                    v497.HubRef:ScrollToFrame(v495);
                end;
            end;
        end);
        v495.SelectionLost:Connect(function() --[[ Line: 2739 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_v498_3 (copy)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                l_v498_3.BackgroundTransparency = 1;
            end;
        end);
        local function v510() --[[ Line: 2745 ]]
            -- upvalues: l_CoreGui_0 (ref), v495 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), v477 (copy), l_GuiService_0 (ref)
            local l_DropDownFullscreenFrame_1 = l_CoreGui_0.RobloxGui:FindFirstChild("DropDownFullscreenFrame");
            if l_DropDownFullscreenFrame_1 and l_DropDownFullscreenFrame_1.Visible then
                return;
            else
                local l_v495_1 = v495;
                if l_v495_1 and l_v495_1.Visible and l_v495_1.ZIndex > 1 and not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) and v477.Active then
                    l_GuiService_0.SelectedCoreObject = l_v495_1;
                end;
                return;
            end;
        end;
        local function v512(v511) --[[ Line: 2763 ]] --[[ Name: processInput ]]
            -- upvalues: l_GuiService_0 (ref), v495 (ref), l_v498_3 (copy)
            if v511.UserInputState == Enum.UserInputState.Begin and v511.KeyCode == Enum.KeyCode.Return and l_GuiService_0.SelectedCoreObject == v495 then
                l_v498_3:CaptureFocus();
            end;
        end;
        v489.MouseEnter:Connect(v510);
        v497.SetZIndex = function(_, v514) --[[ Line: 2774 ]] --[[ Name: SetZIndex ]]
            -- upvalues: l_v498_3 (copy)
            l_v498_3.ZIndex = v514;
        end;
        v497.SetInteractable = function(_, v516) --[[ Line: 2778 ]] --[[ Name: SetInteractable ]]
            -- upvalues: l_v498_3 (copy)
            l_v498_3.Selectable = v516;
            if not v516 then
                l_v498_3.TextColor3 = Color3.fromRGB(49, 49, 49);
                l_v498_3.ZIndex = 1;
                return;
            else
                l_v498_3.TextColor3 = Color3.fromRGB(178, 178, 178);
                l_v498_3.ZIndex = 2;
                return;
            end;
        end;
        v497.SetValue = function(_, v518) --[[ Line: 2789 ]] --[[ Name: SetValue ]]
            -- upvalues: l_v498_3 (copy)
            l_v498_3.Text = v518;
        end;
        local l_BindableEvent_4 = Instance.new("BindableEvent");
        l_BindableEvent_4.Name = "ValueChanged";
        v498.FocusLost:Connect(function() --[[ Line: 2796 ]]
            -- upvalues: l_BindableEvent_4 (copy), l_v498_3 (copy)
            l_BindableEvent_4:Fire(l_v498_3.Text);
        end);
        v497.ValueChanged = l_BindableEvent_4.Event;
        l_UserInputService_0.InputBegan:Connect(v512);
    end;
    v496 = v478 .. "ValueChanger";
    v497.Name = v496;
    v496 = v497.SetAutoLocalize;
    v497.SetAutoLocalize = function(v520, v521) --[[ Line: 2808 ]]
        -- upvalues: v489 (ref), v496 (copy)
        v489.AutoLocalize = v521;
        if v496 then
            v496(v520, v521);
        end;
    end;
    v487 = v487 + v475;
    if v482 then
        v487 = v487 + v482;
    end;
    v476[v477] = v487;
    if v488 then
        v498 = function() --[[ Line: 2823 ]]
            -- upvalues: l_CoreGui_0 (ref), v497 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), v477 (copy), l_GuiService_0 (ref)
            local l_DropDownFullscreenFrame_2 = l_CoreGui_0.RobloxGui:FindFirstChild("DropDownFullscreenFrame");
            if l_DropDownFullscreenFrame_2 and l_DropDownFullscreenFrame_2.Visible then
                return;
            else
                local v523 = v497.SliderFrame or v497.SliderFrame or v497.DropDownFrame or v497.SelectorFrame;
                if v523 and v523.Visible and v523.ZIndex > 1 and not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) and v477.Active then
                    l_GuiService_0.SelectedCoreObject = v523;
                end;
                return;
            end;
        end;
        v489.MouseEnter:Connect(v498);
        local function v527(v524) --[[ Line: 2853 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), v489 (ref), v495 (ref), l_GuiService_0 (ref), v0 (ref)
            if v524 == "VREnabled" then
                if l_VRService_0.VREnabled then
                    v489.Selectable = true;
                    v489.Active = true;
                    v495.Active = true;
                    l_GuiService_0.Changed:Connect(function(v525) --[[ Line: 2859 ]]
                        -- upvalues: l_GuiService_0 (ref), v489 (ref), v0 (ref)
                        if v525 == "SelectedCoreObject" then
                            local l_SelectedCoreObject_7 = l_GuiService_0.SelectedCoreObject;
                            if l_SelectedCoreObject_7 and (l_SelectedCoreObject_7 == v489 or l_SelectedCoreObject_7:IsDescendantOf(v489)) then
                                v489.ImageTransparency = v0.transparency("RowFrameBackground", 0.5);
                                v489.BackgroundTransparency = 1;
                                return;
                            else
                                v489.ImageTransparency = 1;
                                v489.BackgroundTransparency = 1;
                            end;
                        end;
                    end);
                    return;
                else
                    v489.Selectable = false;
                    v489.Active = false;
                end;
            end;
        end;
        l_VRService_0.Changed:Connect(v527);
        if l_VRService_0.VREnabled then
            v489.Selectable = true;
            v489.Active = true;
            v495.Active = true;
            l_GuiService_0.Changed:Connect(function(v528) --[[ Line: 2859 ]]
                -- upvalues: l_GuiService_0 (ref), v489 (ref), v0 (ref)
                if v528 == "SelectedCoreObject" then
                    local l_SelectedCoreObject_8 = l_GuiService_0.SelectedCoreObject;
                    if l_SelectedCoreObject_8 and (l_SelectedCoreObject_8 == v489 or l_SelectedCoreObject_8:IsDescendantOf(v489)) then
                        v489.ImageTransparency = v0.transparency("RowFrameBackground", 0.5);
                        v489.BackgroundTransparency = 1;
                        return;
                    else
                        v489.ImageTransparency = 1;
                        v489.BackgroundTransparency = 1;
                    end;
                end;
            end);
        else
            v489.Selectable = false;
            v489.Active = false;
        end;
        v495.SelectionGained:Connect(function() --[[ Line: 2880 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), v489 (ref), v0 (ref), v497 (ref)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                if l_VRService_0.VREnabled then
                    v489.ImageTransparency = 0.5;
                    v489.BackgroundTransparency = 1;
                else
                    v489.ImageTransparency = 1;
                    v489.BackgroundTransparency = v0.transparency("RowFrameBackground", 0.5);
                end;
                if v497.HubRef then
                    v497.HubRef:ScrollToFrame(v489);
                end;
            end;
        end);
        v495.SelectionLost:Connect(function() --[[ Line: 2895 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), v489 (ref)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                v489.ImageTransparency = 1;
                v489.BackgroundTransparency = 1;
            end;
        end);
    end;
    v477:AddRow(v489, v491, v497, v482, false);
    v497.Selection = v495;
    return v489, v491, v497;
end;
local function v545(v531, v532, v533, v534, v535) --[[ Line: 2910 ]] --[[ Name: AddNewRowObject ]]
    -- upvalues: v476 (copy), l_Create_0 (copy), v475 (ref), v42 (copy), v0 (copy), v36 (copy), v41 (copy), l_GuiService_0 (copy), l_VRService_0 (copy)
    local v536 = 0;
    if v476[v531] then
        v536 = v476[v531];
    end;
    local v537 = l_Create_0("ImageButton")({
        Name = v532 .. "Frame", 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BorderSizePixel = 0, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10), 
        ImageTransparency = 1, 
        Active = false, 
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 0, v475), 
        Position = UDim2.new(0, 0, 0, v536), 
        ZIndex = 2, 
        Selectable = false, 
        SelectionImageObject = v42, 
        Parent = v531.Page
    });
    v537.BackgroundColor3 = v0.color("RowFrameBackground");
    v537.ImageColor3 = v537.BackgroundColor3;
    v537.SelectionGained:Connect(function() --[[ Line: 2938 ]]
        -- upvalues: v537 (copy), v0 (ref)
        v537.BackgroundTransparency = v0.transparency("RowFrameBackground", 0.5);
    end);
    v537.SelectionLost:Connect(function() --[[ Line: 2941 ]]
        -- upvalues: v537 (copy)
        v537.BackgroundTransparency = 1;
    end);
    l_Create_0("UICorner")({
        CornerRadius = v0.DefaultCornerRadius, 
        Parent = v537
    });
    local v538 = l_Create_0("TextLabel")({
        Name = v532 .. "Label", 
        Text = v532, 
        Font = v0.font(Enum.Font.SourceSansBold, "UtilityRow"), 
        TextSize = v0.textSize(16, "UtilityRow"), 
        TextColor3 = Color3.fromRGB(255, 255, 255), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = true, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(0.4, -20, 1, 0), 
        Position = UDim2.new(0, 10, 0, 0), 
        ZIndex = 2, 
        Parent = v537
    });
    l_Create_0("UIPadding")({
        Name = v532 .. "UIPadding", 
        PaddingBottom = UDim.new(0, 10), 
        PaddingTop = UDim.new(0, 10), 
        Parent = v538
    });
    local function v541(_, v540) --[[ Line: 2973 ]] --[[ Name: onResized ]]
        -- upvalues: v535 (copy), v538 (copy), v0 (ref), v36 (ref)
        if v535 then
            UDim2.new(0, 200, 1, 0);
        end;
        if v540 then
            v538.TextSize = v0.textSize(16, "UtilityRow");
            return;
        else
            v538.TextSize = v36 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            return;
        end;
    end;
    v41[v537] = v541;
    local l_v541_0 = v541;
    local v543 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v544 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    l_v541_0(v543, v544.Y > v544.X);
    if v534 then
        v537.Position = UDim2.new(v537.Position.X.Scale, v537.Position.X.Offset, v537.Position.Y.Scale, v537.Position.Y.Offset + v534);
    end;
    v536 = v536 + v475;
    if v534 then
        v536 = v536 + v534;
    end;
    v476[v531] = v536;
    l_v541_0 = function() --[[ Line: 3001 ]]
        -- upvalues: v537 (copy), l_GuiService_0 (ref)
        if v537.Visible then
            l_GuiService_0.SelectedCoreObject = v537;
        end;
    end;
    v537.MouseEnter:Connect(l_v541_0);
    v533.SelectionImageObject = v42;
    v533.SelectionGained:Connect(function() --[[ Line: 3010 ]]
        -- upvalues: l_VRService_0 (ref), v537 (copy), v0 (ref)
        if l_VRService_0.VREnabled then
            v537.ImageTransparency = v0.transparency("RowFrameBackground", 0.5);
            v537.BackgroundTransparency = 1;
            return;
        else
            v537.ImageTransparency = 1;
            v537.BackgroundTransparency = v0.transparency("RowFrameBackground", 0.5);
            return;
        end;
    end);
    v533.SelectionLost:Connect(function() --[[ Line: 3019 ]]
        -- upvalues: v537 (copy)
        v537.ImageTransparency = 1;
        v537.BackgroundTransparency = 1;
    end);
    v533.Parent = v537;
    v531:AddRow(v537, v538, v533, v534, true);
    return v537;
end;
local v588 = {
    GetEaseLinear = function(_) --[[ Line: 3033 ]] --[[ Name: GetEaseLinear ]]
        -- upvalues: v50 (copy)
        return v50;
    end, 
    GetEaseOutQuad = function(_) --[[ Line: 3036 ]] --[[ Name: GetEaseOutQuad ]]
        -- upvalues: v55 (copy)
        return v55;
    end, 
    GetEaseInOutQuad = function(_) --[[ Line: 3039 ]] --[[ Name: GetEaseInOutQuad ]]
        -- upvalues: v60 (copy)
        return v60;
    end, 
    CreateNewSlider = function(_, v550, v551, v552, v553, v554) --[[ Line: 3043 ]] --[[ Name: CreateNewSlider ]]
        -- upvalues: v474 (copy)
        return v474(v550, v551, v552, v553, v554);
    end, 
    CreateNewSelector = function(_, v556, v557) --[[ Line: 3047 ]] --[[ Name: CreateNewSelector ]]
        -- upvalues: v355 (copy)
        return (v355(v556, v557));
    end, 
    CreateNewDropDown = function(_, v559, v560) --[[ Line: 3051 ]] --[[ Name: CreateNewDropDown ]]
        -- upvalues: v281 (copy)
        return (v281(v559, v560, nil));
    end, 
    AddNewRow = function(_, v562, v563, v564, v565, v566, v567, v568, v569, v570, v571) --[[ Line: 3055 ]] --[[ Name: AddNewRow ]]
        -- upvalues: v530 (copy)
        return v530(v562, v563, v564, v565, v566, v567, v568, v569, v570, v571);
    end, 
    AddNewRowObject = function(_, v573, v574, v575, v576, v577) --[[ Line: 3059 ]] --[[ Name: AddNewRowObject ]]
        -- upvalues: v545 (copy)
        return (v545(v573, v574, v575, v576, v577));
    end, 
    ShowAlert = function(_, v579, v580, v581, v582, v583) --[[ Line: 3063 ]] --[[ Name: ShowAlert ]]
        -- upvalues: v380 (copy)
        v380(v579, v580, v581, v582, v583);
    end, 
    IsSmallTouchScreen = function(_) --[[ Line: 3067 ]] --[[ Name: IsSmallTouchScreen ]]
        -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy)
        local v585 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
        return l_UserInputService_0.TouchEnabled and (v585.Y < 500 or v585.X < 700);
    end, 
    IsPortrait = function(_) --[[ Line: 3071 ]] --[[ Name: IsPortrait ]]
        -- upvalues: l_GuiService_0 (copy)
        local v587 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
        return v587.Y > v587.X;
    end
};
if v18 or v19 then
    local function _() --[[ Line: 3076 ]] --[[ Name: isUsingGamepad ]]
        -- upvalues: v108 (copy), l_UserInputService_0 (copy)
        return v108[l_UserInputService_0:GetLastInputType()] or false;
    end;
    v588.IsUsingGamepad = function(_) --[[ Line: 3080 ]] --[[ Name: IsUsingGamepad ]]
        -- upvalues: v108 (copy), l_UserInputService_0 (copy)
        return v108[l_UserInputService_0:GetLastInputType()] or false;
    end;
end;
v588.MakeStyledButton = function(_, v592, v593, v594, v595, v596, v597) --[[ Line: 3085 ]] --[[ Name: MakeStyledButton ]]
    -- upvalues: v152 (copy)
    return v152(v592, v593, v594, v595, v596, v597);
end;
v588.MakeStyledImageButton = function(_, v599, v600, v601, v602, v603, v604, v605, v606) --[[ Line: 3089 ]] --[[ Name: MakeStyledImageButton ]]
    -- upvalues: v167 (copy)
    return v167(v599, v600, v601, v602, v603, v604, v605, v606);
end;
v588.AddButtonRow = function(_, v608, v609, v610, v611, v612, v613) --[[ Line: 3093 ]] --[[ Name: AddButtonRow ]]
    -- upvalues: v178 (copy)
    return v178(v608, v609, v610, v611, v612, v613);
end;
v588.MakeFocusState = function(_, v615, v616) --[[ Line: 3097 ]] --[[ Name: MakeFocusState ]]
    -- upvalues: v194 (copy)
    return v194(v615, v616);
end;
v588.CreateSignal = function(_) --[[ Line: 3101 ]] --[[ Name: CreateSignal ]]
    -- upvalues: v87 (copy)
    return (v87());
end;
v588.UsesSelectedObject = function(_) --[[ Line: 3105 ]] --[[ Name: UsesSelectedObject ]]
    -- upvalues: l_VRService_0 (copy), l_UserInputService_0 (copy)
    if l_VRService_0.VREnabled then
        return false;
    elseif l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch and not l_UserInputService_0.GamepadEnabled then
        return false;
    else
        return true;
    end;
end;
v588.TweenProperty = function(_, v620, v621, v622, v623, v624, v625, v626) --[[ Line: 3109 ]] --[[ Name: TweenProperty ]]
    return PropertyTweener(v620, v621, v622, v623, v624, v625, v626);
end;
v588.OnResized = function(_, v628, v629) --[[ Line: 3113 ]] --[[ Name: OnResized ]]
    -- upvalues: v107 (copy)
    return v107(v628, v629);
end;
v588.FireOnResized = function(_) --[[ Line: 3117 ]] --[[ Name: FireOnResized ]]
    -- upvalues: l_GuiService_0 (copy), v588 (copy), v41 (copy)
    local v631 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v632 = v588:IsPortrait();
    for _, v634 in pairs(v41) do
        v634(v631, v632);
    end;
end;
v588.Lerp = function(_, v636, v637, v638) --[[ Line: 3128 ]] --[[ Name: Lerp ]]
    return (1 - v636) * v637 + v636 * v638;
end;
v588.Round = function(_, v640) --[[ Line: 3133 ]] --[[ Name: Round ]]
    return v640 % 1 >= 0.5 and math.ceil(v640) or math.floor(v640);
end;
v588.IsExperienceOlderThanOneWeek = function(_, v642) --[[ Line: 3137 ]] --[[ Name: IsExperienceOlderThanOneWeek ]]
    -- upvalues: l_Workspace_0 (copy)
    if v642 ~= nil and v642.Created ~= nil then
        local l_UnixTimestampMillis_0 = DateTime.fromIsoDate(v642.Created).UnixTimestampMillis;
        if l_Workspace_0:GetServerTimeNow() * 1000 - l_UnixTimestampMillis_0 > 604800000 then
            return true;
        end;
    end;
    return false;
end;
return v588;