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
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local v23 = if require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled() then require(l_Chrome_0.Service) else nil;
local v24 = require(l_CorePackages_0.Packages.Signals);
local v25 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_FFlagHideShortcutsWhileIemDropdownActive_0 = require(l_Chrome_0.Flags).FFlagHideShortcutsWhileIemDropdownActive;
local l_game_EngineFeature_1 = game:GetEngineFeature("EnablePreferredTextSizeAccessGuiService");
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v29 = game:DefineFastFlag("IncreaseLegacyPeopleRowButtonSize", false);
local v30 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_CorePackages_1 = game:GetService("CorePackages");
local v32 = require(l_CorePackages_1.Workspace.Packages.AppCommonLib);
local l_Signal_0 = v32.Signal;
local l_Create_0 = v32.Create;
local v35 = require(l_CorePackages_1.Packages.BuilderIcons);
local l_Migration_0 = v35.Migration;
local v37 = require(l_RobloxGui_0.Modules:WaitForChild("TenFootInterface")):IsEnabled();
local v39 = v24.createComputed(function(v38) --[[ Line: 86 ]]
    -- upvalues: v25 (copy)
    return v25.GetInputModeStore(v38).getLastInputType(v38) == v25.Input.Touch;
end);
local v41 = v24.createComputed(function(v40) --[[ Line: 91 ]]
    -- upvalues: v25 (copy)
    return v25.GetInputModeStore(v40).getLastInputType(v40) == v25.Input.Pointer;
end);
local v42 = {};
setmetatable(v42, {
    __mode = "k"
});
local v43 = l_Create_0("ImageLabel")({
    Image = "", 
    BackgroundTransparency = 1
});
clamp = function(v44, v45, v46) --[[ Line: 108 ]] --[[ Name: clamp ]]
    return (math.max(v44, (math.min(v45, v46))));
end;
local function v51(v47, v48, v49, v50) --[[ Line: 113 ]] --[[ Name: Linear ]]
    if v50 <= v47 then
        return v48 + v49;
    else
        return v49 * v47 / v50 + v48;
    end;
end;
local function v56(v52, v53, v54, v55) --[[ Line: 121 ]] --[[ Name: EaseOutQuad ]]
    if v55 <= v52 then
        return v53 + v54;
    else
        v52 = v52 / v55;
        return v53 - v54 * v52 * (v52 - 2);
    end;
end;
local function v61(v57, v58, v59, v60) --[[ Line: 130 ]] --[[ Name: EaseInOutQuad ]]
    if v60 <= v57 then
        return v58 + v59;
    else
        v57 = v57 / v60;
        if v57 < 0.5 then
            return 2 * v59 * v57 * v57 + v58;
        else
            return v58 + v59 * (2 * (2 - v57) * v57 - 1);
        end;
    end;
end;
PropertyTweener = function(v62, v63, v64, v65, v66, v67, v68) --[[ Line: 142 ]] --[[ Name: PropertyTweener ]]
    -- upvalues: l_RunService_0 (copy)
    local v69 = {
        StartTime = tick()
    };
    v69.EndTime = v69.StartTime + v66;
    v69.Cancelled = false;
    local v70 = false;
    local v71 = 0;
    local function _() --[[ Line: 151 ]] --[[ Name: finalize ]]
        -- upvalues: v62 (copy), v63 (copy), v67 (copy), v64 (copy), v65 (copy), v70 (ref), v71 (ref), v68 (copy)
        if v62 then
            v62[v63] = v67(1, v64, v65 - v64, 1);
        end;
        v70 = true;
        v71 = 1;
        if v68 then
            v68();
        end;
    end;
    v62[v63] = v67(0, v64, v65 - v64, v66);
    coroutine.wrap(function() --[[ Line: 164 ]]
        -- upvalues: v69 (copy), v62 (copy), v63 (copy), v67 (copy), v64 (copy), v65 (copy), v66 (copy), v71 (ref), l_RunService_0 (ref), v70 (ref), v68 (copy)
        local v73 = tick();
        while true do
            if v73 < v69.EndTime and v62 then
                if v69.Cancelled then
                    return;
                else
                    v62[v63] = v67(v73 - v69.StartTime, v64, v65 - v64, v66);
                    v71 = clamp(0, 1, (v73 - v69.StartTime) / v66);
                    l_RunService_0.RenderStepped:Wait();
                    v73 = tick();
                end;
            else
                if v69.Cancelled == false and v62 then
                    if v62 then
                        v62[v63] = v67(1, v64, v65 - v64, 1);
                    end;
                    v70 = true;
                    v71 = 1;
                    if v68 then
                        v68();
                    end;
                end;
                return;
            end;
        end;
    end)();
    v69.GetFinal = function(_) --[[ Line: 180 ]] --[[ Name: GetFinal ]]
        -- upvalues: v65 (copy)
        return v65;
    end;
    v69.GetPercentComplete = function(_) --[[ Line: 184 ]] --[[ Name: GetPercentComplete ]]
        -- upvalues: v71 (ref)
        return v71;
    end;
    v69.IsFinished = function(_) --[[ Line: 188 ]] --[[ Name: IsFinished ]]
        -- upvalues: v70 (ref)
        return v70;
    end;
    v69.Finish = function(v77) --[[ Line: 192 ]] --[[ Name: Finish ]]
        -- upvalues: v70 (ref), v62 (copy), v63 (copy), v67 (copy), v64 (copy), v65 (copy), v71 (ref), v68 (copy)
        if not v70 then
            v77:Cancel();
            if v62 then
                v62[v63] = v67(1, v64, v65 - v64, 1);
            end;
            v70 = true;
            v71 = 1;
            if v68 then
                v68();
            end;
        end;
    end;
    v69.Cancel = function(_) --[[ Line: 199 ]] --[[ Name: Cancel ]]
        -- upvalues: v69 (copy)
        v69.Cancelled = true;
    end;
    return v69;
end;
local function _() --[[ Line: 206 ]] --[[ Name: isTouchInput ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch;
end;
local function v88() --[[ Line: 212 ]] --[[ Name: CreateSignal ]]
    local v80 = {};
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v82 = nil;
    local v83 = nil;
    v80.fire = function(_, ...) --[[ Line: 220 ]] --[[ Name: fire ]]
        -- upvalues: v82 (ref), v83 (ref), l_BindableEvent_0 (copy)
        v82 = {
            ...
        };
        v83 = select("#", ...);
        l_BindableEvent_0:Fire();
    end;
    v80.connect = function(_, v86) --[[ Line: 226 ]] --[[ Name: connect ]]
        -- upvalues: l_BindableEvent_0 (copy), v82 (ref), v83 (ref)
        if not v86 then
            error("connect(nil)", 2);
        end;
        return l_BindableEvent_0.Event:Connect(function() --[[ Line: 230 ]]
            -- upvalues: v86 (copy), v82 (ref), v83 (ref)
            v86(unpack(v82, 1, v83));
        end);
    end;
    v80.wait = function(_) --[[ Line: 235 ]] --[[ Name: wait ]]
        -- upvalues: l_BindableEvent_0 (copy), v82 (ref), v83 (ref)
        l_BindableEvent_0.Event:wait();
        if not v82 then
            error("Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.");
        end;
        return unpack(v82, 1, v83);
    end;
    return v80;
end;
local function _() --[[ Line: 246 ]] --[[ Name: getViewportSize ]]
    -- upvalues: l_GuiService_0 (copy)
    if _G.__TESTEZ_RUNNING_TEST__ then
        return Vector2.new(1024, 1024);
    else
        return l_GuiService_0:GetHardwareSafeViewport();
    end;
end;
local function _() --[[ Line: 255 ]] --[[ Name: isSmallTouchScreen ]]
    -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy)
    local v90 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    return l_UserInputService_0.TouchEnabled and (v90.Y < 500 or v90.X < 700);
end;
local function _() --[[ Line: 260 ]] --[[ Name: isPortrait ]]
    -- upvalues: l_GuiService_0 (copy)
    local v92 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    return v92.Y > v92.X;
end;
local function _() --[[ Line: 265 ]] --[[ Name: isTenFootInterface ]]
    -- upvalues: v37 (copy)
    return v37;
end;
local function _() --[[ Line: 269 ]] --[[ Name: usesSelectedObject ]]
    -- upvalues: l_VRService_0 (copy), l_UserInputService_0 (copy)
    if l_VRService_0.VREnabled then
        return false;
    elseif l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch and not l_UserInputService_0.GamepadEnabled then
        return false;
    else
        return true;
    end;
end;
local function v102(v96, v97, v98, v99) --[[ Line: 282 ]] --[[ Name: addHoverState ]]
    local function v100() --[[ Line: 283 ]] --[[ Name: onNormalButtonStateCallback ]]
        -- upvalues: v96 (copy), v98 (copy), v97 (copy)
        if v96.Active then
            v98(v97);
        end;
    end;
    local function v101() --[[ Line: 288 ]] --[[ Name: onHoverButtonStateCallback ]]
        -- upvalues: v96 (copy), v99 (copy), v97 (copy)
        if v96.Active then
            v99(v97);
        end;
    end;
    v96.MouseEnter:Connect(v101);
    v96.SelectionGained:Connect(v101);
    v96.MouseLeave:Connect(v100);
    v96.SelectionLost:Connect(v100);
    v98(v97);
end;
local function v108(v103, v104) --[[ Line: 302 ]] --[[ Name: addOnResizedCallback ]]
    -- upvalues: v42 (copy), l_GuiService_0 (copy)
    v42[v103] = v104;
    local l_v104_0 = v104;
    local v106 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v107 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    l_v104_0(v106, v107.Y > v107.X);
end;
local v109 = {
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local function v138(v110, v111, v112, v113, v114, v115) --[[ Line: 318 ]] --[[ Name: MakeDefaultButton ]]
    -- upvalues: l_Create_0 (copy), v0 (copy), v109 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), l_VRService_0 (copy)
    local v116 = l_Create_0("ImageLabel")({
        Image = "", 
        BackgroundTransparency = 1
    });
    local v117 = nil;
    local v118 = nil;
    local v119 = "DefaultButtonStroke";
    local v120 = "DefaultButton";
    if v110 == "DropDownFrame" then
        v119 = "ControlInputStroke";
        v120 = "ControlInputBackground";
    end;
    if v115 == "ImageButton" then
        v120 = "ImageButton";
    end;
    v117 = l_Create_0("ImageButton")({
        Name = v110 .. "Button", 
        AutoButtonColor = false, 
        BackgroundColor3 = v0.color(v120), 
        BackgroundTransparency = v0.transparency(v120), 
        Size = v111, 
        ZIndex = 2, 
        SelectionImageObject = v116
    });
    l_Create_0("UICorner")({
        CornerRadius = v0.DefaultCornerRadius, 
        Parent = v117
    });
    v118 = l_Create_0("UIStroke")({
        Name = "Border", 
        Color = v0.color(v119), 
        Transparency = v0.transparency(v119), 
        Thickness = v0.DefaultStokeThickness, 
        Parent = v117
    });
    local _ = l_Create_0("BoolValue")({
        Name = "Enabled", 
        Parent = v117, 
        Value = true
    });
    if v112 then
        v117.MouseButton1Click:Connect(function() --[[ Line: 365 ]]
            -- upvalues: v112 (copy), v109 (ref), l_UserInputService_0 (ref)
            v112(v109[l_UserInputService_0:GetLastInputType()] or false);
        end);
    else
        if v118 then
            v118.Enabled = false;
        end;
        v117.Selectable = false;
    end;
    local function _(v122) --[[ Line: 375 ]] --[[ Name: isPointerInput ]]
        local v123 = true;
        if v122.UserInputType ~= Enum.UserInputType.MouseMovement then
            v123 = v122.UserInputType == Enum.UserInputType.Touch;
        end;
        return v123;
    end;
    local v125 = nil;
    local function v127(v126) --[[ Line: 381 ]] --[[ Name: setRowRef ]]
        -- upvalues: v125 (ref)
        v125 = v126;
    end;
    local function v130() --[[ Line: 385 ]] --[[ Name: selectButton ]]
        -- upvalues: v114 (copy), v113 (copy), v117 (ref), v0 (ref), v125 (ref)
        local l_v114_0 = v114;
        if l_v114_0 == nil and v113 then
            l_v114_0 = v113.HubRef;
        end;
        if l_v114_0 and l_v114_0.Active or l_v114_0 == nil then
            v117.BackgroundColor3 = v0.color("DefaultButtonHover");
            v117.BackgroundTransparency = v0.transparency("DefaultButtonHover");
            local l_v117_0 = v117;
            if v125 then
                l_v117_0 = v125;
            end;
            if l_v114_0 then
                l_v114_0:ScrollToFrame(l_v117_0);
            end;
        end;
    end;
    local function _() --[[ Line: 407 ]] --[[ Name: deselectButton ]]
        -- upvalues: v117 (ref), v0 (ref), v120 (ref)
        v117.BackgroundColor3 = v0.color(v120);
        v117.BackgroundTransparency = v0.transparency(v120);
    end;
    v117.InputBegan:Connect(function(v132) --[[ Line: 412 ]]
        -- upvalues: v117 (ref), v130 (copy)
        if v117.Selectable then
            local v133 = true;
            if v132.UserInputType ~= Enum.UserInputType.MouseMovement then
                v133 = v132.UserInputType == Enum.UserInputType.Touch;
            end;
            if v133 then
                v130();
            end;
        end;
    end);
    v117.InputEnded:Connect(function(v134) --[[ Line: 417 ]]
        -- upvalues: v117 (ref), l_GuiService_0 (ref), v0 (ref), v120 (ref)
        if v117.Selectable and l_GuiService_0.SelectedCoreObject ~= v117 then
            local v135 = true;
            if v134.UserInputType ~= Enum.UserInputType.MouseMovement then
                v135 = v134.UserInputType == Enum.UserInputType.Touch;
            end;
            if v135 then
                v117.BackgroundColor3 = v0.color(v120);
                v117.BackgroundTransparency = v0.transparency(v120);
            end;
        end;
    end);
    v117.SelectionGained:Connect(function() --[[ Line: 423 ]]
        -- upvalues: v130 (copy)
        v130();
    end);
    v117.SelectionLost:Connect(function() --[[ Line: 426 ]]
        -- upvalues: v117 (ref), v0 (ref), v120 (ref)
        v117.BackgroundColor3 = v0.color(v120);
        v117.BackgroundTransparency = v0.transparency(v120);
    end);
    local _ = l_GuiService_0.Changed:Connect(function(v136) --[[ Line: 430 ]]
        -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v117 (ref), v0 (ref), v120 (ref), v130 (copy)
        if v136 ~= "SelectedCoreObject" then
            return;
        elseif not (not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false)) then
            return;
        elseif l_GuiService_0.SelectedCoreObject == nil or l_GuiService_0.SelectedCoreObject ~= v117 then
            v117.BackgroundColor3 = v0.color(v120);
            v117.BackgroundTransparency = v0.transparency(v120);
            return;
        else
            if v117.Selectable then
                v130();
            end;
            return;
        end;
    end);
    return v117, v127;
end;
local function v153(v139, v140, v141, v142, v143, v144) --[[ Line: 451 ]] --[[ Name: MakeButton ]]
    -- upvalues: v138 (copy), l_Create_0 (copy), v0 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy), v37 (copy), l_game_EngineFeature_1 (copy)
    local v145, v146 = v138(v139, v141, v142, v143, v144);
    local v147 = l_Create_0("TextLabel")({
        Name = v139 .. "TextLabel", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        TextColor3 = v0.color("WhiteButtonText", Color3.fromRGB(255, 255, 255)), 
        TextTransparency = v0.transparency("WhiteButtonText", 0), 
        TextYAlignment = Enum.TextYAlignment.Center, 
        Font = v0.font(Enum.Font.SourceSansBold, "Button"), 
        TextSize = v0.textSize(24, "Button"), 
        Text = v140, 
        TextScaled = false, 
        TextWrapped = true, 
        ZIndex = 2, 
        Parent = v145
    });
    local v148 = Instance.new("UITextSizeConstraint", v147);
    local v149 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    if l_UserInputService_0.TouchEnabled and (v149.Y < 500 or v149.X < 700) then
        if v0.UseBiggerText and (v139 == "ResumeButton" or v139 == "ResetButton" or v139 == "LeaveButton") then
            v147.TextSize = v0.textSize(20);
        else
            v147.TextSize = v0.textSize(18);
        end;
    elseif v37 then
        local v150 = true;
        if v139 ~= "FriendStatus" then
            v150 = v139 == "BlockButton";
        end;
        if not v150 then
            v147.TextSize = v0.textSize(36);
        end;
    end;
    if not l_game_EngineFeature_1 then
        v148.MaxTextSize = v147.TextSize;
    else
        local v151 = (l_GuiService_0.PreferredTextSize.Value - 1) * 3;
        v148.MaxTextSize = v147.TextSize + v151;
        v149 = v147.TextSize;
        do
            local l_v151_0 = v151;
            l_GuiService_0:GetPropertyChangedSignal("PreferredTextSize"):Connect(function() --[[ Line: 492 ]]
                -- upvalues: l_v151_0 (ref), l_GuiService_0 (ref), v148 (copy), v149 (copy)
                l_v151_0 = (l_GuiService_0.PreferredTextSize.Value - 1) * 3;
                v148.MaxTextSize = v149 + l_v151_0;
            end);
        end;
    end;
    return v145, v147, v146;
end;
local function v168(v154, v155, v156, v157, v158, v159, v160, v161) --[[ Line: 501 ]] --[[ Name: MakeImageButton ]]
    -- upvalues: v138 (copy), l_Migration_0 (copy), v0 (copy), l_Create_0 (copy), v29 (copy), v35 (copy)
    if not v161 then
        v161 = "ImageButton";
    end;
    local v162, v163 = v138(v154, v156, v158, v159, v160, v161);
    local v164 = nil;
    local v165 = nil;
    local v166 = l_Migration_0.uiblox[v155] or l_Migration_0.luaApps[v155];
    if not string.match(v155, "^rbxasset://") then
        v155 = v0.Images[v155];
    end;
    if typeof(v155) == "table" then
        v164 = v155.ImageRectOffset;
        v165 = v155.ImageRectSize;
        v155 = v155.Image;
    end;
    local v167 = nil;
    v167 = if v166 then l_Create_0("TextLabel")({
        Name = v154 .. "TextLabel", 
        BackgroundTransparency = 1, 
        Size = v157, 
        TextSize = if v29 then v157.Y.Offset * 0.8571428571428571 else v157.Y.Offset * 0.6666666666666666, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        TextColor3 = Color3.new(1, 1, 1), 
        Text = v166.name, 
        FontFace = v35.Font[v166.variant], 
        Parent = v162, 
        ZIndex = 2
    }) else l_Create_0("ImageLabel")({
        Name = v154 .. "ImageLabel", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v157, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Image = v155, 
        ImageRectOffset = v164, 
        ImageRectSize = v165, 
        ZIndex = 2, 
        Parent = v162
    });
    if v161 == "ImageButton" then
        v162.Border.Thickness = 0;
        v162.Border.Transparency = 1;
    end;
    return v162, v167, v163;
end;
local function v179(v169, v170, v171, v172, v173, v174) --[[ Line: 556 ]] --[[ Name: AddButtonRow ]]
    -- upvalues: v153 (copy), l_Create_0 (copy)
    local v175, v176, v177 = v153(v170, v171, v172, v173, v169, v174);
    local v178 = l_Create_0("Frame")({
        Name = v170 .. "Row", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, v172.Y.Scale, v172.Y.Offset), 
        Parent = v169.Page
    });
    v175.Parent = v178;
    v175.AnchorPoint = Vector2.new(1, 0);
    v175.Position = UDim2.new(1, -20, 0, 0);
    return v178, v175, v176, v177;
end;
local function v195(v180, v181) --[[ Line: 572 ]] --[[ Name: MakeRoundedRectFocusState ]]
    -- upvalues: l_Create_0 (copy), v6 (copy), v0 (copy), l_RunService_0 (copy), l_UserGameSettings_0 (copy)
    local v182 = l_Create_0("Frame")({
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 12, 1, 12), 
        Position = UDim2.fromOffset(-6, -6)
    });
    l_Create_0("UICorner")({
        CornerRadius = v6, 
        Parent = v182
    });
    local v183 = l_Create_0("UIStroke")({
        Color = v0.selectionCursor.AnimatedColor, 
        Transparency = 0, 
        Thickness = 3, 
        Parent = v182
    });
    local v184 = l_Create_0("UIGradient")({
        Rotation = 0, 
        Color = v0.selectionCursor.GradientColorSequence, 
        Transparency = v0.selectionCursor.GradientTransparencySequence, 
        Parent = v183
    });
    l_RunService_0:UnbindFromRenderStep(v181);
    l_RunService_0:BindToRenderStep(v181, Enum.RenderPriority.Last.Value, function() --[[ Line: 599 ]]
        -- upvalues: v184 (copy), v0 (ref), l_UserGameSettings_0 (ref)
        local v185 = v184.Rotation + 2;
        local l_GradientColorSequence_0 = v0.selectionCursor.GradientColorSequence;
        local l_GradientTransparencySequence_0 = v0.selectionCursor.GradientTransparencySequence;
        if l_UserGameSettings_0.ReducedMotion then
            local v188 = (math.sin((math.rad(v185))) + 1) / 2;
            local l_Value_0 = l_GradientColorSequence_0.Keypoints[1].Value;
            local l_Value_1 = l_GradientColorSequence_0.Keypoints[#l_GradientColorSequence_0.Keypoints].Value;
            l_GradientColorSequence_0 = ColorSequence.new(l_Value_0:lerp(l_Value_1, v188));
            local l_Value_2 = l_GradientTransparencySequence_0.Keypoints[1].Value;
            local l_Value_3 = l_GradientTransparencySequence_0.Keypoints[#l_GradientTransparencySequence_0.Keypoints].Value;
            l_GradientTransparencySequence_0 = NumberSequence.new(l_Value_2 + (l_Value_3 - l_Value_2) * v188);
        end;
        v184.Rotation = v185;
        v184.Color = l_GradientColorSequence_0;
        v184.Transparency = l_GradientTransparencySequence_0;
    end);
    v180.AncestryChanged:Connect(function(_, v194) --[[ Line: 623 ]]
        -- upvalues: l_RunService_0 (ref), v181 (copy)
        if not v194 then
            l_RunService_0:UnbindFromRenderStep(v181);
        end;
    end);
    v180.SelectionImageObject = v182;
end;
local function v282(v196, v197, v198) --[[ Line: 632 ]] --[[ Name: CreateDropDown ]]
    -- upvalues: v0 (copy), l_HttpService_0 (copy), l_GuiService_0 (copy), l_Create_0 (copy), v20 (copy), l_CoreGui_0 (copy), l_VRService_0 (copy), l_isInExperienceUIVREnabled_0 (copy), l_CorePackages_1 (copy), l_UserInputService_0 (copy), l_ContextActionService_0 (copy), l_FFlagHideShortcutsWhileIemDropdownActive_0 (copy), v23 (copy), v30 (copy), v153 (copy)
    local v199 = v0.color("SELECTION_TEXT_COLOR_NORMAL", Color3.fromRGB(178, 178, 178));
    local v200 = Color3.fromRGB(229, 229, 229);
    local v201 = v0.color("SELECTION_TEXT_COLOR_HIGHLIGHTED", Color3.fromRGB(255, 255, 255));
    local v202 = nil;
    local v203 = {
        CurrentIndex = nil, 
        UpdateDropDownList = nil, 
        DropDownFrame = nil, 
        Selections = nil
    };
    Instance.new("BindableEvent").Name = "IndexChanged";
    if type(v196) ~= "table" then
        error("CreateDropDown dropDownStringTable (first arg) is not a table", 2);
        return v203;
    else
        local l_BindableEvent_1 = Instance.new("BindableEvent");
        l_BindableEvent_1.Name = "IndexChanged";
        local v205 = true;
        local v206 = l_HttpService_0:GenerateGUID(false);
        local v207 = nil;
        local l_v196_0 = v196;
        local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
        local v211 = l_Create_0("ImageButton")({
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
        local function v215(v212) --[[ Line: 684 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), l_isInExperienceUIVREnabled_0 (ref), l_CorePackages_1 (ref), v211 (copy), l_CoreGui_0 (ref), v203 (copy), l_v196_0 (ref)
            if v212 ~= "VREnabled" then
                return;
            else
                if l_VRService_0.VREnabled then
                    if l_isInExperienceUIVREnabled_0 then
                        local v213 = require(l_CorePackages_1.Workspace.Packages.VrSpatialUi);
                        local l_PanelType_0 = v213.Constants.PanelType;
                        v211.Parent = v213.UIManager.getInstance():getPanelObject(l_PanelType_0.MoreMenu);
                        v211.BackgroundTransparency = 0.2;
                    else
                        v211.Parent = require(l_CorePackages_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):GetGUI();
                        v211.BackgroundTransparency = 1;
                    end;
                else
                    v211.Parent = l_CoreGui_0.RobloxGui;
                    v211.BackgroundTransparency = 0.2;
                end;
                if v203.UpdateDropDownList then
                    v203:UpdateDropDownList(l_v196_0);
                end;
                return;
            end;
        end;
        l_VRService_0.Changed:Connect(v215);
        v215("VREnabled");
        local v216 = l_Create_0("ImageLabel")({
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
            Parent = v211
        });
        l_Create_0("UICorner")({
            CornerRadius = v0.DefaultCornerRadius, 
            Parent = v216
        });
        local v217 = l_Create_0("ScrollingFrame")({
            Name = "DropDownScrollingFrame", 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, -20, 1, -25), 
            Position = UDim2.new(0, 10, 0, 10), 
            ZIndex = 10, 
            ScrollBarThickness = v0.DefaultScrollBarThickness, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Parent = v216
        });
        local v218 = nil;
        local v219 = false;
        local function v222(v220, v221) --[[ Line: 748 ]]
            -- upvalues: v203 (copy), v205 (ref), v198 (copy), v211 (copy), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v202 (ref), v218 (ref), l_ContextActionService_0 (ref), v206 (copy), v207 (ref), v219 (ref), l_isInExperienceUIVREnabled_0 (ref), l_CorePackages_1 (ref)
            if v220 ~= nil and v221 ~= Enum.UserInputState.Begin then
                return;
            else
                v203.DropDownFrame.Selectable = v205;
                v198:SetActive(true);
                if v211.Visible and not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                    l_GuiService_0.SelectedCoreObject = v202;
                end;
                v211.Visible = false;
                if v218 then
                    v218:Disconnect();
                end;
                l_ContextActionService_0:UnbindCoreAction(v206 .. "Action");
                l_ContextActionService_0:UnbindCoreAction(v206 .. "FreezeAction");
                v207.Value = v205;
                v219 = false;
                if l_VRService_0.VREnabled and not l_isInExperienceUIVREnabled_0 then
                    require(l_CorePackages_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v211, 0);
                end;
                return;
            end;
        end;
        local function v223() --[[ Line: 778 ]]

        end;
        local function v228() --[[ Line: 780 ]]
            -- upvalues: v205 (ref), v203 (copy), v219 (ref), v211 (copy), l_VRService_0 (ref), l_isInExperienceUIVREnabled_0 (ref), l_CorePackages_1 (ref), v202 (ref), l_GuiService_0 (ref), v218 (ref), v201 (copy), v200 (copy), v199 (copy), v222 (copy), l_FFlagHideShortcutsWhileIemDropdownActive_0 (ref), v23 (ref), l_ContextActionService_0 (ref), v206 (copy), v223 (copy), v198 (copy), v207 (ref)
            if not v205 then
                return;
            else
                v203.DropDownFrame.Selectable = false;
                v219 = true;
                v211.Visible = true;
                if l_VRService_0.VREnabled and not l_isInExperienceUIVREnabled_0 then
                    require(l_CorePackages_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v211, 0.5);
                end;
                v202 = v203.DropDownFrame;
                if v203.CurrentIndex and v203.CurrentIndex > 0 then
                    l_GuiService_0.SelectedCoreObject = v203.Selections[v203.CurrentIndex];
                elseif #v203.Selections > 0 then
                    l_GuiService_0.SelectedCoreObject = v203.Selections[1];
                end;
                v218 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 803 ]]
                    -- upvalues: v203 (ref), l_GuiService_0 (ref), v201 (ref), l_VRService_0 (ref), v200 (ref), v199 (ref)
                    for v224 = 1, #v203.Selections do
                        if l_GuiService_0.SelectedCoreObject == v203.Selections[v224] then
                            v203.Selections[v224].TextColor3 = v201;
                        else
                            v203.Selections[v224].TextColor3 = l_VRService_0.VREnabled and v200 or v199;
                        end;
                    end;
                end);
                local l_v222_0 = v222;
                if l_FFlagHideShortcutsWhileIemDropdownActive_0 then
                    v23:setHideShortcutBar("InExperienceMenuDropdown", true);
                    l_v222_0 = function(v226, v227) --[[ Line: 817 ]]
                        -- upvalues: v222 (ref), v23 (ref)
                        v222(v226, v227);
                        v23:setHideShortcutBar("InExperienceMenuDropdown", false);
                    end;
                end;
                l_ContextActionService_0:BindCoreAction(v206 .. "FreezeAction", v223, false, Enum.UserInputType.Keyboard, Enum.UserInputType.Gamepad1);
                l_ContextActionService_0:BindCoreAction(v206 .. "Action", l_v222_0, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
                v198:SetActive(false);
                v207.Value = false;
                return;
            end;
        end;
        local v229 = v30:FormatByKey("Feature.SettingsHub.Label.ChooseOne");
        local v230 = UDim2.new(0.6, 0, 0, 40);
        v203.DropDownFrame = v153("DropDownFrame", v229, v230, v228, nil, v198);
        v203.DropDownFrame.Position = UDim2.new(1, 0, 0.5, 0);
        v203.DropDownFrame.AnchorPoint = Vector2.new(1, 0.5);
        v207 = v203.DropDownFrame.Enabled;
        local l_DropDownFrameTextLabel_0 = v203.DropDownFrame.DropDownFrameTextLabel;
        l_DropDownFrameTextLabel_0.Position = UDim2.new(0, 15, 0, 0);
        l_DropDownFrameTextLabel_0.Size = UDim2.new(1, -50, 1, 0);
        l_DropDownFrameTextLabel_0.ClipsDescendants = true;
        l_DropDownFrameTextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
        local v232 = l_Create_0("ImageLabel")({
            Name = "DropDownImage", 
            Image = "rbxasset://textures/ui/Settings/DropDown/DropDown.png", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, 15, 0, 10), 
            Position = UDim2.new(1, -12, 0.5, 0), 
            ZIndex = 2, 
            Parent = v203.DropDownFrame
        });
        v203.DropDownImage = v232;
        local function v237(v233) --[[ Line: 870 ]] --[[ Name: setSelection ]]
            -- upvalues: v203 (copy), l_DropDownFrameTextLabel_0 (copy), l_BindableEvent_1 (copy)
            local v234 = false;
            for v235, v236 in pairs(v203.Selections) do
                if v235 == v233 then
                    l_DropDownFrameTextLabel_0.Text = v236.Text;
                    v203.CurrentIndex = v235;
                    v234 = true;
                end;
            end;
            if v234 then
                l_BindableEvent_1:Fire(v233);
            end;
        end;
        local function v242(v238) --[[ Line: 886 ]] --[[ Name: setSelectionByValue ]]
            -- upvalues: v203 (copy), l_DropDownFrameTextLabel_0 (copy), l_BindableEvent_1 (copy)
            local v239 = false;
            for v240, v241 in pairs(v203.Selections) do
                if v241.Text == v238 then
                    l_DropDownFrameTextLabel_0.Text = v241.Text;
                    v203.CurrentIndex = v240;
                    v239 = true;
                end;
            end;
            if v239 then
                l_BindableEvent_1:Fire(v203.CurrentIndex);
            end;
            return v239;
        end;
        local function _(v243) --[[ Line: 903 ]] --[[ Name: setIsFaded ]]
            -- upvalues: v203 (copy)
            if v243 then
                v203.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5;
                v203.DropDownFrame.ImageTransparency = 0.5;
                v203.DropDownImage.ImageTransparency = 0.5;
                return;
            else
                v203.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0;
                v203.DropDownFrame.ImageTransparency = 0;
                v203.DropDownImage.ImageTransparency = 0;
                return;
            end;
        end;
        v203.IndexChanged = l_BindableEvent_1.Event;
        v203.SetSelectionIndex = function(_, v246) --[[ Line: 918 ]] --[[ Name: SetSelectionIndex ]]
            -- upvalues: v237 (copy)
            v237(v246);
        end;
        v203.SetSelectionByValue = function(_, v248) --[[ Line: 922 ]] --[[ Name: SetSelectionByValue ]]
            -- upvalues: v242 (copy)
            return (v242(v248));
        end;
        v203.ResetSelectionIndex = function(_) --[[ Line: 926 ]] --[[ Name: ResetSelectionIndex ]]
            -- upvalues: v203 (copy), l_DropDownFrameTextLabel_0 (copy), v229 (copy), v222 (copy)
            v203.CurrentIndex = nil;
            l_DropDownFrameTextLabel_0.Text = v229;
            v222();
        end;
        v203.GetSelectedIndex = function(_) --[[ Line: 932 ]] --[[ Name: GetSelectedIndex ]]
            -- upvalues: v203 (copy)
            return v203.CurrentIndex;
        end;
        v203.SetZIndex = function(_, v252) --[[ Line: 936 ]] --[[ Name: SetZIndex ]]
            -- upvalues: v203 (copy), v232 (copy), l_DropDownFrameTextLabel_0 (copy)
            v203.DropDownFrame.ZIndex = v252;
            v232.ZIndex = v252;
            l_DropDownFrameTextLabel_0.ZIndex = v252;
        end;
        v203.SetInteractable = function(_, v254) --[[ Line: 942 ]] --[[ Name: SetInteractable ]]
            -- upvalues: v205 (ref), v203 (copy), v222 (copy), l_VRService_0 (ref), v207 (ref), v219 (ref)
            v205 = v254;
            v203.DropDownFrame.Selectable = v205;
            if not v205 then
                v222();
                if l_VRService_0.VREnabled then
                    v203.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0.5;
                    v203.DropDownFrame.ImageTransparency = 0.5;
                    v203.DropDownImage.ImageTransparency = 0.5;
                else
                    v203.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0;
                    v203.DropDownFrame.ImageTransparency = 0;
                    v203.DropDownImage.ImageTransparency = 0;
                end;
                if not l_VRService_0.VREnabled then
                    v203:SetZIndex(1);
                end;
            else
                v203.DropDownFrame.DropDownFrameTextLabel.TextTransparency = 0;
                v203.DropDownFrame.ImageTransparency = 0;
                v203.DropDownImage.ImageTransparency = 0;
                if not l_VRService_0.VREnabled then
                    v203:SetZIndex(2);
                end;
            end;
            v207.Value = v254 and not v219;
            v203.DropDownImage.Visible = v254;
            if v254 then
                v203.DropDownFrame.ImageTransparency = 0;
                return;
            else
                v203.DropDownFrame.ImageTransparency = 0.5;
                return;
            end;
        end;
        v203.SetAutoLocalize = function(_, v256) --[[ Line: 969 ]] --[[ Name: SetAutoLocalize ]]
            -- upvalues: v211 (copy)
            v211.AutoLocalize = v256;
        end;
        v203.UpdateDropDownList = function(_, v258) --[[ Line: 973 ]] --[[ Name: UpdateDropDownList ]]
            -- upvalues: l_v196_0 (ref), v203 (copy), l_VRService_0 (ref), v0 (ref), l_Create_0 (ref), v200 (copy), v199 (copy), v217 (copy), v197 (copy), l_DropDownFrameTextLabel_0 (copy), v201 (copy), v222 (copy), l_BindableEvent_1 (copy), l_UserInputService_0 (ref), l_GuiService_0 (ref), v206 (copy), v211 (copy), v216 (copy)
            l_v196_0 = v258;
            if v203.Selections then
                for v259 = 1, #v203.Selections do
                    v203.Selections[v259]:Destroy();
                end;
            end;
            v203.Selections = {};
            v203.SelectionInfo = {};
            local l_VREnabled_0 = l_VRService_0.VREnabled;
            local v261 = l_VREnabled_0 and v0.font(Enum.Font.SourceSansBold, "Bold") or v0.font(Enum.Font.SourceSans, "UtilityText");
            local v262 = l_VREnabled_0 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            local v263 = l_VREnabled_0 and 70 or 50;
            local v264 = v263 + 1;
            local v265 = l_VREnabled_0 and 600 or 400;
            local v266 = 0;
            for v267, v268 in pairs(v258) do
                local v269 = l_Create_0("Frame")({
                    BackgroundTransparency = 0.7, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0)
                });
                l_Create_0("UICorner")({
                    CornerRadius = v0.DefaultCornerRadius, 
                    Parent = v269
                });
                local l_v268_0 = v268;
                local v271 = "";
                local v272 = typeof(v268) == "table";
                if v272 then
                    l_v268_0 = v268.title;
                    v271 = v268.subtitle;
                    v266 = v266 + 10;
                end;
                local v273 = nil;
                if v272 then
                    v273 = l_Create_0("TextButton")({
                        Name = "Selection" .. tostring(v267), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        AutoButtonColor = false, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Size = UDim2.new(1, -28, 0, v263 + 10), 
                        Position = UDim2.new(0, 14, 0, (v267 - 1) * (v264 + 10)), 
                        TextColor3 = l_VRService_0.VREnabled and v200 or v199, 
                        Font = v261, 
                        TextSize = v262, 
                        Text = l_v268_0, 
                        ZIndex = 10, 
                        SelectionImageObject = v269, 
                        Parent = v217
                    });
                    local _ = l_Create_0("TextLabel")({
                        Name = "Subtitle" .. tostring(v267), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, -28, 0, v263 * 0.8), 
                        Position = UDim2.new(0, 14, 0, 15), 
                        TextColor3 = l_VRService_0.VREnabled and v200 or v199, 
                        Font = v261, 
                        TextSize = v262 * 0.8, 
                        Text = v271, 
                        ZIndex = 10, 
                        Parent = v273
                    });
                else
                    v273 = l_Create_0("TextButton")({
                        Name = "Selection" .. tostring(v267), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        AutoButtonColor = false, 
                        Size = UDim2.new(1, -28, 0, v263), 
                        Position = UDim2.new(0, 14, 0, (v267 - 1) * v264), 
                        TextColor3 = l_VRService_0.VREnabled and v200 or v199, 
                        Font = v261, 
                        TextSize = v262, 
                        Text = v268, 
                        ZIndex = 10, 
                        SelectionImageObject = v269, 
                        Parent = v217
                    });
                end;
                if v267 == v197 then
                    v203.CurrentIndex = v267;
                    l_DropDownFrameTextLabel_0.Text = l_v268_0;
                    v273.TextColor3 = v201;
                elseif not v197 and v267 == 1 then
                    v273.TextColor3 = v201;
                end;
                do
                    local l_v273_0 = v273;
                    local function v276() --[[ Line: 1077 ]]
                        -- upvalues: l_DropDownFrameTextLabel_0 (ref), l_v273_0 (ref), v222 (ref), v203 (ref), v267 (copy), l_BindableEvent_1 (ref)
                        l_DropDownFrameTextLabel_0.Text = l_v273_0.Text;
                        v222();
                        v203.CurrentIndex = v267;
                        l_BindableEvent_1:Fire(v267);
                    end;
                    l_v273_0.MouseButton1Click:Connect(v276);
                    l_v273_0.MouseEnter:Connect(function() --[[ Line: 1086 ]]
                        -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), l_v273_0 (ref)
                        if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                            l_GuiService_0.SelectedCoreObject = l_v273_0;
                        end;
                    end);
                    v203.Selections[v267] = l_v273_0;
                    local l_SelectionInfo_0 = v203.SelectionInfo;
                    local v278 = {
                        Clicked = v276
                    };
                    l_SelectionInfo_0[l_v273_0] = v278;
                end;
            end;
            l_GuiService_0:RemoveSelectionGroup(v206);
            l_GuiService_0:AddSelectionTuple(v206, unpack(v203.Selections));
            v217.CanvasSize = UDim2.new(1, -20, 0, #v258 * v264 + v266);
            local function v279() --[[ Line: 1102 ]] --[[ Name: updateDropDownSize ]]
                -- upvalues: v217 (ref), v211 (ref), v216 (ref), v265 (copy)
                if v217.CanvasSize.Y.Offset < v211.AbsoluteSize.Y - 10 then
                    v216.Size = UDim2.new(0, v265, 0, v217.CanvasSize.Y.Offset + 25);
                    return;
                else
                    v216.Size = UDim2.new(0, v265, 0.9, 0);
                    return;
                end;
            end;
            v211.Changed:Connect(function(v280) --[[ Line: 1115 ]]
                -- upvalues: v279 (copy)
                if v280 ~= "AbsoluteSize" then
                    return;
                else
                    v279();
                    return;
                end;
            end);
            v279();
        end;
        v203:UpdateDropDownList(v196);
        v211.MouseButton1Click:Connect(v222);
        v198.PoppedMenu:Connect(function(v281) --[[ Line: 1130 ]]
            -- upvalues: v211 (copy), v222 (copy)
            if v281 == v211 then
                v222();
            end;
        end);
        return v203;
    end;
end;
local function v364(v283, v284) --[[ Line: 1139 ]] --[[ Name: CreateSelector ]]
    -- upvalues: l_Create_0 (copy), v43 (copy), v0 (copy), v3 (copy), l_UserInputService_0 (copy), v4 (copy), v102 (copy), l_VRService_0 (copy), l_GuiService_0 (copy), v56 (copy), l_game_EngineFeature_0 (copy), v5 (copy), v37 (copy), v39 (copy), v41 (copy), v42 (copy)
    local v285 = 0;
    local v286 = {
        HubRef = nil, 
        SetSelectionIndex = nil
    };
    if type(v283) ~= "table" then
        error("CreateSelector selectionStringTable (first arg) is not a table", 2);
        return v286;
    else
        local l_BindableEvent_2 = Instance.new("BindableEvent");
        l_BindableEvent_2.Name = "IndexChanged";
        local v288 = true;
        v286.CurrentIndex = 0;
        v286.SelectorFrame = l_Create_0("ImageButton")({
            Name = "Selector", 
            Image = "", 
            AutoButtonColor = false, 
            NextSelectionLeft = v286.SelectorFrame, 
            NextSelectionRight = v286.SelectorFrame, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.6, 0, 0, 50), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            ZIndex = 2, 
            SelectionImageObject = v43
        });
        local v289 = l_Create_0("ImageButton")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v43, 
            Parent = v286.SelectorFrame
        });
        local v290 = l_Create_0("ImageButton")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v43, 
            Parent = v286.SelectorFrame
        });
        local v291 = l_Create_0("ImageLabel")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 18, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/Left.png", 
            ImageColor3 = v3, 
            ZIndex = 4, 
            Parent = v289
        });
        local v292 = l_Create_0("ImageLabel")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 18, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/Right.png", 
            ImageColor3 = v3, 
            ZIndex = 4, 
            Parent = v290
        });
        if not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) then
            local function v294(v293) --[[ Line: 1225 ]]
                -- upvalues: v3 (ref)
                v293.ImageColor3 = v3;
            end;
            local function v296(v295) --[[ Line: 1227 ]]
                -- upvalues: v4 (ref)
                v295.ImageColor3 = v4;
            end;
            v102(v289, v291, v294, v296);
            v102(v290, v292, v294, v296);
        end;
        v286.Selections = {};
        local v297 = {};
        local v298 = {};
        local v299 = l_Create_0("ImageButton")({
            Name = "AutoSelectButton", 
            BackgroundTransparency = 1, 
            Image = "", 
            Position = UDim2.new(0, v289.Size.X.Offset, 0, 0), 
            Size = UDim2.new(1, v289.Size.X.Offset * -2, 1, 0), 
            Parent = v286.SelectorFrame, 
            ZIndex = 2, 
            SelectionImageObject = v43
        });
        v299.MouseButton1Click:Connect(function() --[[ Line: 1248 ]]
            -- upvalues: v288 (ref), v286 (copy), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref)
            if not v288 then
                return;
            elseif #v286.Selections <= 1 then
                return;
            else
                local v300 = v286.CurrentIndex + 1;
                if #v286.Selections < v300 then
                    v300 = 1;
                end;
                v286:SetSelectionIndex(v300);
                if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                    l_GuiService_0.SelectedCoreObject = v286.SelectorFrame;
                end;
                return;
            end;
        end);
        v298[v299] = true;
        local function v308(v301, v302) --[[ Line: 1267 ]] --[[ Name: setSelection ]]
            -- upvalues: v286 (copy), v289 (copy), v297 (ref), v56 (ref), l_game_EngineFeature_0 (ref), l_BindableEvent_2 (copy)
            for v303, v304 in pairs(v286.Selections) do
                local v305 = v303 == v301;
                local v306 = UDim2.new(0, v289.Size.X.Offset, 0, 0);
                local v307 = UDim2.new(0, v289.Size.X.Offset * v302 * 3, 0, 0);
                if v297[v304] then
                    v307 = UDim2.new(0, v289.Size.X.Offset * -v302 * 3, 0, 0);
                end;
                if v307.X.Offset < 0 then
                    v307 = UDim2.new(0, v307.X.Offset + v304.AbsoluteSize.X / 4, 0, 0);
                end;
                if v305 then
                    v297[v304] = true;
                    v304.Position = v307;
                    v304.Visible = true;
                    PropertyTweener(v304, "TextTransparency", 1, 0, 0.165, v56);
                    if v304:IsDescendantOf(game) then
                        if l_game_EngineFeature_0 then
                            v304:TweenPositionInternal(v306, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true);
                        else
                            v304:TweenPosition(v306, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.15, true);
                        end;
                    else
                        v304.Position = v306;
                    end;
                    v286.CurrentIndex = v303;
                    l_BindableEvent_2:Fire(v301);
                elseif v297[v304] then
                    v297[v304] = false;
                    PropertyTweener(v304, "TextTransparency", 0, 1, 0.165, v56);
                    if v304:IsDescendantOf(game) then
                        if l_game_EngineFeature_0 then
                            v304:TweenPositionInternal(v307, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true);
                        else
                            v304:TweenPosition(v307, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.135, true);
                        end;
                    else
                        v304.Position = v307;
                    end;
                end;
            end;
        end;
        local function v313(v309, v310) --[[ Line: 1338 ]] --[[ Name: stepFunc ]]
            -- upvalues: v288 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v286 (copy), v308 (copy)
            if not v288 then
                return;
            elseif v309 ~= nil and v309.UserInputType ~= Enum.UserInputType.MouseButton1 and v309.UserInputType ~= Enum.UserInputType.Gamepad1 and v309.UserInputType ~= Enum.UserInputType.Gamepad2 and v309.UserInputType ~= Enum.UserInputType.Gamepad3 and v309.UserInputType ~= Enum.UserInputType.Gamepad4 and v309.UserInputType ~= Enum.UserInputType.Keyboard then
                return;
            else
                if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                    l_GuiService_0.SelectedCoreObject = v286.SelectorFrame;
                end;
                local v311 = v310 + v286.CurrentIndex;
                local v312 = 0;
                v312 = v286.CurrentIndex < v311 and 1 or -1;
                if #v286.Selections < v311 then
                    v311 = 1;
                elseif v311 < 1 then
                    v311 = #v286.Selections;
                end;
                v308(v311, v312);
                return;
            end;
        end;
        local v314 = nil;
        local function _() --[[ Line: 1378 ]] --[[ Name: connectToGuiService ]]
            -- upvalues: v314 (ref), l_GuiService_0 (ref), v286 (copy), v298 (copy), l_VRService_0 (ref)
            v314 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 1379 ]]
                -- upvalues: v286 (ref), l_GuiService_0 (ref), v298 (ref), l_VRService_0 (ref)
                if #v286.Selections <= 0 then
                    return;
                else
                    if l_GuiService_0.SelectedCoreObject ~= nil and v298[l_GuiService_0.SelectedCoreObject] and not l_VRService_0.VREnabled then
                        l_GuiService_0.SelectedCoreObject = v286.SelectorFrame;
                    end;
                    return;
                end;
            end);
        end;
        v286.IndexChanged = l_BindableEvent_2.Event;
        v286.SetSelectionIndex = function(_, v317) --[[ Line: 1392 ]] --[[ Name: SetSelectionIndex ]]
            -- upvalues: v308 (copy)
            v308(v317, 1);
        end;
        v286.GetSelectedIndex = function(_) --[[ Line: 1396 ]] --[[ Name: GetSelectedIndex ]]
            -- upvalues: v286 (copy)
            return v286.CurrentIndex;
        end;
        v286.SetZIndex = function(_, v320) --[[ Line: 1400 ]] --[[ Name: SetZIndex ]]
            -- upvalues: v289 (copy), v290 (copy), v291 (copy), v292 (copy), v286 (copy)
            v289.ZIndex = v320;
            v290.ZIndex = v320;
            v291.ZIndex = v320;
            v292.ZIndex = v320;
            for v321 = 1, #v286.Selections do
                v286.Selections[v321].ZIndex = v320;
            end;
        end;
        v286.SetInteractable = function(_, v323) --[[ Line: 1411 ]] --[[ Name: SetInteractable ]]
            -- upvalues: v288 (ref), v286 (copy), v289 (copy), v290 (copy), v0 (ref), v291 (copy), v5 (ref), v292 (copy), v3 (ref)
            v288 = v323;
            v286.SelectorFrame.Selectable = v288;
            v289.Active = v288;
            v290.Active = v288;
            v289.Visible = v288;
            v290.Visible = v288;
            if not v288 then
                for _, v325 in pairs(v286.Selections) do
                    v325.TextColor3 = v0.color("NotInteractableSelection", Color3.fromRGB(255, 255, 255));
                end;
                v291.ImageColor3 = v5;
                v292.ImageColor3 = v5;
                return;
            else
                for _, v327 in pairs(v286.Selections) do
                    v327.TextColor3 = Color3.fromRGB(255, 255, 255);
                end;
                v291.ImageColor3 = v3;
                v292.ImageColor3 = v3;
                return;
            end;
        end;
        v286.UpdateOptions = function(_, v329) --[[ Line: 1436 ]] --[[ Name: UpdateOptions ]]
            -- upvalues: v286 (copy), v297 (ref), l_Create_0 (ref), v289 (copy), v0 (ref), v37 (ref), v284 (copy), v290 (copy)
            for _, v331 in pairs(v286.Selections) do
                v331:Destroy();
            end;
            v297 = {};
            v286.Selections = {};
            for v332, v333 in pairs(v329) do
                local v334 = l_Create_0("TextLabel")({
                    Name = "Selection" .. tostring(v332), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, v289.Size.X.Offset * -2, 1, 0), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v0.font(Enum.Font.SourceSans, "UtilityText"), 
                    TextSize = v0.textSize(24, "UtilityText"), 
                    TextWrapped = true, 
                    Text = v333, 
                    ZIndex = 2, 
                    Visible = false, 
                    Parent = v286.SelectorFrame
                });
                if v37 then
                    v334.TextSize = v0.textSize(36);
                end;
                if v332 == v284 then
                    v286.CurrentIndex = v332;
                    v334.Position = UDim2.new(0, v289.Size.X.Offset, 0, 0);
                    v334.Visible = true;
                    v297[v334] = true;
                else
                    v297[v334] = false;
                end;
                v286.Selections[v332] = v334;
            end;
            local v335 = #v286.Selections > 1;
            v289.Visible = v335;
            v290.Visible = v335;
        end;
        local function v338(v336) --[[ Line: 1484 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), v289 (copy), v290 (copy), v299 (copy)
            if v336 ~= "VREnabled" then
                return;
            else
                local l_VREnabled_1 = l_VRService_0.VREnabled;
                v289.Selectable = l_VREnabled_1;
                v290.Selectable = l_VREnabled_1;
                v299.Selectable = l_VREnabled_1;
                return;
            end;
        end;
        l_VRService_0.Changed:Connect(v338);
        local l_VREnabled_2 = l_VRService_0.VREnabled;
        v289.Selectable = l_VREnabled_2;
        v290.Selectable = l_VREnabled_2;
        v299.Selectable = l_VREnabled_2;
        v289.InputBegan:Connect(function(v340) --[[ Line: 1496 ]]
            -- upvalues: v39 (ref), v41 (ref), v288 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v286 (copy), v308 (copy)
            if v39(false) or v41(false) and v340.UserInputType == Enum.UserInputType.MouseButton1 then
                if not v288 then
                    return;
                else
                    if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                        l_GuiService_0.SelectedCoreObject = v286.SelectorFrame;
                    end;
                    local v341 = -1 + v286.CurrentIndex;
                    local v342 = 0;
                    v342 = v286.CurrentIndex < v341 and 1 or -1;
                    if #v286.Selections < v341 then
                        v341 = 1;
                    elseif v341 < 1 then
                        v341 = #v286.Selections;
                    end;
                    v308(v341, v342);
                end;
            end;
        end);
        v290.InputBegan:Connect(function(v343) --[[ Line: 1502 ]]
            -- upvalues: v39 (ref), v41 (ref), v288 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v286 (copy), v308 (copy)
            if v39(false) or v41(false) and v343.UserInputType == Enum.UserInputType.MouseButton1 then
                if not v288 then
                    return;
                else
                    if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                        l_GuiService_0.SelectedCoreObject = v286.SelectorFrame;
                    end;
                    local v344 = 1 + v286.CurrentIndex;
                    local v345 = 0;
                    v345 = v286.CurrentIndex < v344 and 1 or -1;
                    if #v286.Selections < v344 then
                        v344 = 1;
                    elseif v344 < 1 then
                        v344 = #v286.Selections;
                    end;
                    v308(v344, v345);
                end;
            end;
        end);
        l_VREnabled_2 = true;
        v286:UpdateOptions(v283);
        l_UserInputService_0.InputBegan:Connect(function(v346) --[[ Line: 1512 ]]
            -- upvalues: v288 (ref), l_VREnabled_2 (ref), l_GuiService_0 (ref), v286 (copy), l_VRService_0 (ref), l_UserInputService_0 (ref), v308 (copy)
            if not v288 then
                return;
            elseif not l_VREnabled_2 then
                return;
            elseif v346.UserInputType ~= Enum.UserInputType.Gamepad1 and v346.UserInputType ~= Enum.UserInputType.Keyboard then
                return;
            elseif l_GuiService_0.SelectedCoreObject ~= v286.SelectorFrame then
                return;
            elseif v346.KeyCode == Enum.KeyCode.DPadLeft or v346.KeyCode == Enum.KeyCode.Left or v346.KeyCode == Enum.KeyCode.A then
                if not v288 then
                    return;
                elseif v346 ~= nil and v346.UserInputType ~= Enum.UserInputType.MouseButton1 and v346.UserInputType ~= Enum.UserInputType.Gamepad1 and v346.UserInputType ~= Enum.UserInputType.Gamepad2 and v346.UserInputType ~= Enum.UserInputType.Gamepad3 and v346.UserInputType ~= Enum.UserInputType.Gamepad4 and v346.UserInputType ~= Enum.UserInputType.Keyboard then
                    return;
                else
                    if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                        l_GuiService_0.SelectedCoreObject = v286.SelectorFrame;
                    end;
                    local v347 = -1 + v286.CurrentIndex;
                    local v348 = 0;
                    v348 = v286.CurrentIndex < v347 and 1 or -1;
                    if #v286.Selections < v347 then
                        v347 = 1;
                    elseif v347 < 1 then
                        v347 = #v286.Selections;
                    end;
                    v308(v347, v348);
                    return;
                end;
            else
                if v346.KeyCode == Enum.KeyCode.DPadRight or v346.KeyCode == Enum.KeyCode.Right or v346.KeyCode == Enum.KeyCode.D then
                    if not v288 then
                        return;
                    elseif v346 ~= nil and v346.UserInputType ~= Enum.UserInputType.MouseButton1 and v346.UserInputType ~= Enum.UserInputType.Gamepad1 and v346.UserInputType ~= Enum.UserInputType.Gamepad2 and v346.UserInputType ~= Enum.UserInputType.Gamepad3 and v346.UserInputType ~= Enum.UserInputType.Gamepad4 and v346.UserInputType ~= Enum.UserInputType.Keyboard then
                        return;
                    else
                        if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                            l_GuiService_0.SelectedCoreObject = v286.SelectorFrame;
                        end;
                        local v349 = 1 + v286.CurrentIndex;
                        local v350 = 0;
                        v350 = v286.CurrentIndex < v349 and 1 or -1;
                        if #v286.Selections < v349 then
                            v349 = 1;
                        elseif v349 < 1 then
                            v349 = #v286.Selections;
                        end;
                        v308(v349, v350);
                    end;
                end;
                return;
            end;
        end);
        l_UserInputService_0.InputChanged:Connect(function(v351) --[[ Line: 1545 ]]
            -- upvalues: v288 (ref), l_VREnabled_2 (ref), v285 (ref), l_GuiService_0 (ref), v286 (copy), v313 (copy)
            if not v288 then
                return;
            elseif not l_VREnabled_2 then
                v285 = 0;
                return;
            elseif v351.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return;
            else
                local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_0 or not l_SelectedCoreObject_0:IsDescendantOf(v286.SelectorFrame.Parent) then
                    return;
                elseif v351.KeyCode ~= Enum.KeyCode.Thumbstick1 then
                    return;
                elseif v351.Position.X > 0.8 and v351.Delta.X > 0 and v285 ~= 1 then
                    v285 = 1;
                    v313(v351, v285);
                    return;
                elseif v351.Position.X < -0.8 and v351.Delta.X < 0 and v285 ~= -1 then
                    v285 = -1;
                    v313(v351, v285);
                    return;
                else
                    if math.abs(v351.Position.X) < 0.8 then
                        v285 = 0;
                    end;
                    return;
                end;
            end;
        end);
        v286.SelectorFrame.AncestryChanged:Connect(function(_, v354) --[[ Line: 1586 ]]
            -- upvalues: l_VREnabled_2 (ref), v314 (ref), l_GuiService_0 (ref), v286 (copy), v298 (copy), l_VRService_0 (ref)
            l_VREnabled_2 = v354;
            if not l_VREnabled_2 then
                if v314 then
                    v314:Disconnect();
                    return;
                end;
            else
                v314 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 1379 ]]
                    -- upvalues: v286 (ref), l_GuiService_0 (ref), v298 (ref), l_VRService_0 (ref)
                    if #v286.Selections <= 0 then
                        return;
                    else
                        if l_GuiService_0.SelectedCoreObject ~= nil and v298[l_GuiService_0.SelectedCoreObject] and not l_VRService_0.VREnabled then
                            l_GuiService_0.SelectedCoreObject = v286.SelectorFrame;
                        end;
                        return;
                    end;
                end);
            end;
        end);
        local function v360(_, v356) --[[ Line: 1597 ]] --[[ Name: onResized ]]
            -- upvalues: v0 (ref), v37 (ref), v286 (copy)
            local v357 = 0;
            v357 = if v356 then v0.textSize(16) else v37 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            for _, v359 in pairs(v286.Selections) do
                v359.TextSize = v357;
            end;
        end;
        v42[v286.SelectorFrame] = v360;
        local l_v360_0 = v360;
        local v362 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
        local v363 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
        l_v360_0(v362, v363.Y > v363.X);
        v314 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 1379 ]]
            -- upvalues: v286 (copy), l_GuiService_0 (ref), v298 (copy), l_VRService_0 (ref)
            if #v286.Selections <= 0 then
                return;
            else
                if l_GuiService_0.SelectedCoreObject ~= nil and v298[l_GuiService_0.SelectedCoreObject] and not l_VRService_0.VREnabled then
                    l_GuiService_0.SelectedCoreObject = v286.SelectorFrame;
                end;
                return;
            end;
        end);
        return v286;
    end;
end;
local function v389(v365, v366, v367, v368, v369) --[[ Line: 1616 ]] --[[ Name: ShowAlert ]]
    -- upvalues: l_CoreGui_0 (copy), l_VRService_0 (copy), l_isInExperienceUIVREnabled_0 (copy), l_CorePackages_1 (copy), l_Create_0 (copy), v0 (copy), l_HttpService_0 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy), v153 (copy), l_UserInputService_0 (copy)
    local l_RobloxGui_1 = l_CoreGui_0.RobloxGui;
    if l_RobloxGui_1:FindFirstChild("AlertViewFullScreen") then
        return;
    else
        local v371 = nil;
        local function v377(v372) --[[ Line: 1627 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), l_isInExperienceUIVREnabled_0 (ref), l_CorePackages_1 (ref), l_RobloxGui_1 (ref), l_CoreGui_0 (ref), v371 (ref)
            if v372 ~= "VREnabled" then
                return;
            else
                local _ = nil;
                local v374 = nil;
                if l_VRService_0.VREnabled then
                    if l_isInExperienceUIVREnabled_0 then
                        local v375 = require(l_CorePackages_1.Workspace.Packages.VrSpatialUi);
                        local l_PanelType_1 = v375.Constants.PanelType;
                        l_RobloxGui_1 = v375.UIManager.getInstance():getPanelObject(l_PanelType_1.MoreMenu);
                    else
                        v374 = require(l_CorePackages_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu");
                        l_RobloxGui_1 = v374:GetGUI();
                    end;
                else
                    l_RobloxGui_1 = l_CoreGui_0.RobloxGui;
                end;
                if v371 and v371.Parent ~= nil then
                    v371.Parent = l_RobloxGui_1;
                    if l_VRService_0.VREnabled and not l_isInExperienceUIVREnabled_0 then
                        v374:SetSubpanelDepth(v371, 0.5);
                    end;
                end;
                return;
            end;
        end;
        local v378 = l_VRService_0.Changed:Connect(v377);
        v371 = l_Create_0("ImageLabel")({
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
        v377("VREnabled");
        if v369 or not l_isInExperienceUIVREnabled_0 and l_VRService_0.VREnabled then
            v371.ImageTransparency = 0;
        else
            v371.Size = UDim2.new(0.8, 0, 0, 350);
            v371.Position = UDim2.new(0.1, 0, 0.1, 0);
        end;
        if l_CoreGui_0.RobloxGui.AbsoluteSize.Y <= v371.Size.Y.Offset then
            v371.Size = UDim2.new(v371.Size.X.Scale, v371.Size.X.Offset, v371.Size.Y.Scale, l_CoreGui_0.RobloxGui.AbsoluteSize.Y);
            v371.Position = UDim2.new(v371.Position.X.Scale, -v371.Size.X.Offset / 2, 0.5, -v371.Size.Y.Offset / 2);
        end;
        if not v369 then
            l_Create_0("UICorner")({
                CornerRadius = v0.DefaultCornerRadius, 
                Parent = v371
            });
            v371.BackgroundColor3 = v0.color("MenuContainer");
            v371.BackgroundTransparency = v0.transparency("MenuContainer");
        end;
        local _ = l_Create_0("TextLabel")({
            Name = "AlertViewText", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.95, 0, 0.6, 0), 
            Position = UDim2.new(0.025, 0, 0.05, 0), 
            Font = v0.font(Enum.Font.SourceSansBold, "Bold"), 
            TextSize = v0.textSize(36), 
            Text = v365, 
            TextWrapped = true, 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = 10, 
            Parent = v371
        });
        local _ = l_Create_0("ImageLabel")({
            Image = "", 
            BackgroundTransparency = 1
        });
        local v381 = l_HttpService_0:GenerateGUID(false);
        local function v384(_, v383) --[[ Line: 1726 ]]
            -- upvalues: l_VRService_0 (ref), v371 (ref), l_isInExperienceUIVREnabled_0 (ref), l_CorePackages_1 (ref), v368 (copy), l_ContextActionService_0 (ref), v381 (copy), l_GuiService_0 (ref), v367 (copy), v378 (copy)
            if l_VRService_0.VREnabled and (v383 == Enum.UserInputState.Begin or v383 == Enum.UserInputState.Cancel) then
                return;
            elseif not v371 then
                return;
            else
                if l_VRService_0.VREnabled and not l_isInExperienceUIVREnabled_0 then
                    require(l_CorePackages_1.Workspace.Packages.VrCommon).Panel3D.Get("SettingsMenu"):SetSubpanelDepth(v371, 0);
                end;
                v371:Destroy();
                v371 = nil;
                if v368 then
                    v368();
                end;
                l_ContextActionService_0:UnbindCoreAction(v381);
                l_GuiService_0.SelectedCoreObject = nil;
                if v367 then
                    v367:ShowBar();
                end;
                if v378 then
                    v378:Disconnect();
                end;
                return;
            end;
        end;
        local v385 = UDim2.new(1, -20, 0, 60);
        local v386 = UDim2.new(0, 10, 0.65, 0);
        if not v369 then
            v385 = UDim2.new(0, 200, 0, 50);
            v386 = UDim2.new(0.5, -100, 0.65, 0);
        end;
        local v387, v388 = v153("AlertViewButton", v366, v385, v384);
        v387.Position = v386;
        v387.NextSelectionLeft = v387;
        v387.NextSelectionRight = v387;
        v387.NextSelectionUp = v387;
        v387.NextSelectionDown = v387;
        v387.ZIndex = 9;
        v388.ZIndex = v387.ZIndex;
        v387.Parent = v371;
        if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
            l_GuiService_0.SelectedCoreObject = v387;
        end;
        l_GuiService_0.SelectedCoreObject = v387;
        l_ContextActionService_0:BindCoreAction(v381, v384, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonA);
        if v367 and (l_isInExperienceUIVREnabled_0 and true or not l_VRService_0.VREnabled) then
            v367:HideBar();
            v367.Pages.CurrentPage:Hide(1, 1);
        end;
        return;
    end;
end;
local function v485(v390, v391, v392, v393, v394) --[[ Line: 1796 ]] --[[ Name: CreateNewSlider ]]
    -- upvalues: l_HttpService_0 (copy), l_Signal_0 (copy), l_Create_0 (copy), v43 (copy), l_RobloxGui_0 (copy), v0 (copy), l_UserInputService_0 (copy), v4 (copy), v3 (copy), v4 (copy), v102 (copy), v1 (copy), v2 (copy), l_VRService_0 (copy), l_GuiService_0 (copy), l_RunService_0 (copy)
    local v395 = {};
    local v396 = tonumber(v390);
    local l_v391_0 = v391;
    local v398 = 0;
    local v399 = nil;
    local v400 = true;
    local v401 = l_HttpService_0:GenerateGUID(false);
    v390 = "";
    v391 = "";
    if v396 <= 0 then
        error("CreateNewSlider failed because numOfSteps (first arg) is 0 or negative, please supply a positive integer", 2);
        return;
    else
        local v402 = v393 or v394;
        local l_BindableEvent_3 = Instance.new("BindableEvent");
        l_BindableEvent_3.Name = "ValueChanged";
        local v404 = l_Signal_0.new();
        v395.SliderFrame = l_Create_0("ImageButton")({
            Name = "Slider", 
            Image = "", 
            AutoButtonColor = false, 
            NextSelectionLeft = v395.SliderFrame, 
            NextSelectionRight = v395.SliderFrame, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.6, 0, 0, 50), 
            AutomaticSize = if v402 then Enum.AutomaticSize.Y else nil, 
            Position = UDim2.new(1, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            SelectionImageObject = v43, 
            ZIndex = 2
        });
        local v405 = nil;
        if v402 then
            v405 = l_Create_0("Frame")({
                Name = "StepsAndButtonsContainer", 
                Size = UDim2.new(1, 0, 0, 50), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Parent = v395.SliderFrame
            });
            l_Create_0("UIListLayout")({
                Name = "UIListLayout", 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Parent = v395.SliderFrame
            });
            local v406 = l_Create_0("Frame")({
                Name = "SliderLabels", 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Parent = v395.SliderFrame, 
                LayoutOrder = 2
            });
            l_Create_0("UIPadding")({
                Name = "UIPadding", 
                PaddingRight = UDim.new(0, 50), 
                PaddingLeft = UDim.new(0, 50), 
                Parent = v406
            });
            local function _() --[[ Line: 1878 ]] --[[ Name: isWideEnough ]]
                -- upvalues: l_RobloxGui_0 (ref)
                return l_RobloxGui_0.AbsoluteSize.X > 460;
            end;
            if v393 then
                v395.LeftLabel = l_Create_0("TextLabel")({
                    Name = "LeftLabel", 
                    Text = v393, 
                    Font = v0.font(Enum.Font.SourceSans, "UtilityRow"), 
                    TextSize = v0.textSize(18, "UtilityRow"), 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextTransparency = 0.25, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Parent = v406, 
                    Visible = l_RobloxGui_0.AbsoluteSize.X > 460
                });
            end;
            if v394 then
                v395.RightLabel = l_Create_0("TextLabel")({
                    Name = "RightLabel", 
                    Text = v394, 
                    Font = v0.font(Enum.Font.SourceSans, "UtilityRow"), 
                    TextSize = v0.textSize(18, "UtilityRow"), 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextTransparency = 0.25, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Parent = v406, 
                    Visible = l_RobloxGui_0.AbsoluteSize.X > 460
                });
            end;
            l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ Line: 1917 ]]
                -- upvalues: v395 (copy), l_RobloxGui_0 (ref)
                if v395.LeftLabel then
                    v395.LeftLabel.Visible = l_RobloxGui_0.AbsoluteSize.X > 460;
                end;
                if v395.RightLabel then
                    v395.RightLabel.Visible = l_RobloxGui_0.AbsoluteSize.X > 460;
                end;
            end);
        end;
        v395.StepsContainer = l_Create_0("Frame")({
            Name = "StepsContainer", 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -100, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Parent = if v402 then v405 else v395.SliderFrame
        });
        local v408 = l_Create_0("ImageButton")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v43, 
            Active = true, 
            Parent = if v402 then v405 else v395.SliderFrame
        });
        local v409 = l_Create_0("ImageButton")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Size = UDim2.new(0, v0.SelectorArrowButtonWidth, 0, 50), 
            Image = "", 
            ZIndex = 3, 
            Selectable = false, 
            SelectionImageObject = v43, 
            Active = true, 
            Parent = if v402 then v405 else v395.SliderFrame
        });
        local v410 = l_Create_0("ImageLabel")({
            Name = "LeftButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 30, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/Less.png", 
            ZIndex = 4, 
            Parent = v408, 
            ImageColor3 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch and v4 or v3
        });
        local v411 = l_Create_0("ImageLabel")({
            Name = "RightButton", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 30, 0, 30), 
            Image = "rbxasset://textures/ui/Settings/Slider/More.png", 
            ZIndex = 4, 
            Parent = v409, 
            ImageColor3 = l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch and v4 or v3
        });
        if not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) then
            local function v413(v412) --[[ Line: 1988 ]]
                -- upvalues: v3 (ref)
                v412.ImageColor3 = v3;
            end;
            local function v415(v414) --[[ Line: 1990 ]]
                -- upvalues: v4 (ref)
                v414.ImageColor3 = v4;
            end;
            v102(v408, v410, v413, v415);
            v102(v409, v411, v413, v415);
        end;
        v395.Steps = {};
        local v416 = 1 / v396;
        for v417 = 1, v396 do
            local v418 = l_Create_0("ImageButton")({
                Name = "Step" .. tostring(v417), 
                BackgroundColor3 = v1, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                AutoButtonColor = false, 
                Active = false, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new((v417 - 1) * v416, 2, 0.5, 0), 
                Size = UDim2.new(v416, -4, 0, 24), 
                Image = "", 
                ZIndex = 3, 
                Selectable = false, 
                ImageTransparency = 0.36, 
                Parent = v395.StepsContainer, 
                SelectionImageObject = v43
            });
            if l_v391_0 < v417 then
                v418.BackgroundColor3 = v2;
            end;
            if v417 == 1 or v417 == v396 then
                l_Create_0("UICorner")({
                    CornerRadius = v0.DefaultCornerRadius, 
                    Parent = v418
                });
                l_Create_0("Frame")({
                    Name = "Filler", 
                    BackgroundColor3 = v418.BackgroundColor3, 
                    Parent = v418, 
                    Size = UDim2.new(0.25, 0, 1, 0), 
                    BorderSizePixel = 0, 
                    Position = if v417 == 1 then UDim2.new(0.75, 0, 0, 0) else UDim2.new(0, 0, 0, 0)
                });
            end;
            v395.Steps[#v395.Steps + 1] = v418;
        end;
        local function v420() --[[ Line: 2044 ]] --[[ Name: hideSelection ]]
            -- upvalues: v396 (copy), v395 (copy), v2 (ref)
            for v419 = 1, v396 do
                v395.Steps[v419].BackgroundColor3 = v2;
                if v419 == 1 or v419 == v396 then
                    v395.Steps[v419].Filler.BackgroundColor3 = v2;
                end;
            end;
        end;
        local function v422() --[[ Line: 2052 ]] --[[ Name: showSelection ]]
            -- upvalues: v396 (copy), l_v391_0 (ref), v395 (copy), v1 (ref)
            for v421 = 1, v396 do
                if l_v391_0 >= v421 then
                    v395.Steps[v421].BackgroundColor3 = v1;
                    if v421 == 1 or v421 == v396 then
                        v395.Steps[v421].Filler.BackgroundColor3 = v1;
                    end;
                else
                    break;
                end;
            end;
        end;
        local function v424(v423) --[[ Line: 2064 ]] --[[ Name: setCurrentStep ]]
            -- upvalues: v392 (ref), v408 (copy), v409 (copy), v396 (copy), l_v391_0 (ref), v420 (copy), v422 (copy), v399 (ref), v404 (copy), l_BindableEvent_3 (copy)
            if not v392 then
                v392 = 0;
            end;
            v408.Visible = true;
            v409.Visible = true;
            if v423 <= v392 then
                v423 = v392;
                v408.Visible = false;
            end;
            if v396 <= v423 then
                v423 = v396;
                v409.Visible = false;
            end;
            if l_v391_0 == v423 then
                return;
            else
                l_v391_0 = v423;
                v420();
                v422();
                v399 = tick();
                if v404 then
                    v404:fire(l_v391_0);
                    return;
                else
                    l_BindableEvent_3:Fire(l_v391_0);
                    return;
                end;
            end;
        end;
        local function _(v425) --[[ Line: 2098 ]] --[[ Name: isActivateEvent ]]
            if not v425 then
                return false;
            else
                local v426 = true;
                if v425.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    v426 = true;
                    if v425.UserInputType ~= Enum.UserInputType.Touch then
                        v426 = false;
                        if v425.UserInputType == Enum.UserInputType.Gamepad1 then
                            v426 = v425.KeyCode == Enum.KeyCode.ButtonA;
                        end;
                    end;
                end;
                return v426;
            end;
        end;
        local function v441(v428, v429, v430) --[[ Line: 2109 ]] --[[ Name: mouseDownFunc ]]
            -- upvalues: v400 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v395 (copy), v398 (ref), l_v391_0 (ref), v396 (copy), v424 (copy)
            if not v400 then
                return;
            elseif v428 == nil then
                return;
            elseif not (not not v428 and (v428.UserInputType == Enum.UserInputType.MouseButton1 or v428.UserInputType == Enum.UserInputType.Touch or v428.UserInputType == Enum.UserInputType.Gamepad1 and v428.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) and not l_VRService_0.VREnabled then
                    l_GuiService_0.SelectedCoreObject = v395.SliderFrame;
                end;
                if not l_VRService_0.VREnabled then
                    if v430 then
                        v398 = v429 - l_v391_0;
                    else
                        v398 = 0;
                        local v431 = nil;
                        local v432 = nil;
                        v431 = l_UserInputService_0.InputChanged:Connect(function(v433) --[[ Line: 2135 ]]
                            -- upvalues: v396 (ref), v395 (ref), v424 (ref)
                            if v433.UserInputType ~= Enum.UserInputType.MouseMovement then
                                return;
                            else
                                local l_X_0 = v433.Position.X;
                                for v435 = 1, v396 do
                                    local l_X_1 = v395.Steps[v435].AbsolutePosition.X;
                                    local l_X_2 = v395.Steps[v435].AbsoluteSize.X;
                                    if l_X_1 <= l_X_0 and l_X_0 <= l_X_1 + l_X_2 then
                                        v424(v435);
                                        return;
                                    elseif v435 == 1 and l_X_0 < l_X_1 then
                                        v424(0);
                                        return;
                                    elseif v435 == v396 and l_X_1 <= l_X_0 then
                                        v424(v435);
                                        return;
                                    end;
                                end;
                                return;
                            end;
                        end);
                        do
                            local l_v431_0, l_v432_0 = v431, v432;
                            l_v432_0 = l_UserInputService_0.InputEnded:Connect(function(v440) --[[ Line: 2156 ]]
                                -- upvalues: v398 (ref), l_v432_0 (ref), l_v431_0 (ref)
                                if not (not not v440 and (v440.UserInputType == Enum.UserInputType.MouseButton1 or v440.UserInputType == Enum.UserInputType.Touch or v440.UserInputType == Enum.UserInputType.Gamepad1 and v440.KeyCode == Enum.KeyCode.ButtonA)) then
                                    return;
                                else
                                    v398 = 0;
                                    l_v432_0:Disconnect();
                                    l_v431_0:Disconnect();
                                    return;
                                end;
                            end);
                        end;
                    end;
                else
                    v398 = 0;
                end;
                v424(v429);
                return;
            end;
        end;
        local function _(v442) --[[ Line: 2173 ]] --[[ Name: mouseUpFunc ]]
            -- upvalues: v400 (ref), v398 (ref)
            if not v400 then
                return;
            elseif not (not not v442 and (v442.UserInputType == Enum.UserInputType.MouseButton1 or v442.UserInputType == Enum.UserInputType.Touch or v442.UserInputType == Enum.UserInputType.Gamepad1 and v442.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                v398 = 0;
                return;
            end;
        end;
        v395.ValueChanged = l_BindableEvent_3.Event;
        if v404 then
            v395.ValueChanged = v404;
        end;
        v395.SetValue = function(_, v445) --[[ Line: 2190 ]] --[[ Name: SetValue ]]
            -- upvalues: v424 (copy)
            v424(v445);
        end;
        v395.GetValue = function(_) --[[ Line: 2194 ]] --[[ Name: GetValue ]]
            -- upvalues: l_v391_0 (ref)
            return l_v391_0;
        end;
        v395.SetInteractable = function(_, v448) --[[ Line: 2198 ]] --[[ Name: SetInteractable ]]
            -- upvalues: v398 (ref), v400 (ref), v395 (copy), v420 (copy), v422 (copy)
            v398 = 0;
            v400 = v448;
            v395.SliderFrame.Selectable = v448;
            if not v400 then
                v420();
                return;
            else
                v422();
                return;
            end;
        end;
        v395.SetZIndex = function(_, v450) --[[ Line: 2209 ]] --[[ Name: SetZIndex ]]
            -- upvalues: v408 (copy), v409 (copy), v410 (copy), v411 (copy), v395 (copy)
            v408.ZIndex = v450;
            v409.ZIndex = v450;
            v410.ZIndex = v450;
            v411.ZIndex = v450;
            for v451 = 1, #v395.Steps do
                v395.Steps[v451].ZIndex = v450;
            end;
        end;
        v395.SetMinStep = function(_, v453) --[[ Line: 2220 ]] --[[ Name: SetMinStep ]]
            -- upvalues: v396 (copy), v392 (ref), l_v391_0 (ref), v408 (copy), v409 (copy)
            if v453 >= 0 and v453 <= v396 then
                v392 = v453;
            end;
            if l_v391_0 <= v392 then
                l_v391_0 = v392;
                v408.Visible = false;
            end;
            if v396 <= l_v391_0 then
                l_v391_0 = v396;
                v409.Visible = false;
            end;
        end;
        v408.InputBegan:Connect(function(v454) --[[ Line: 2237 ]]
            -- upvalues: l_v391_0 (ref), v400 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v395 (copy), v398 (ref), v424 (copy)
            local v455 = l_v391_0 - 1;
            if not v400 then
                return;
            elseif v454 == nil then
                return;
            elseif not (not not v454 and (v454.UserInputType == Enum.UserInputType.MouseButton1 or v454.UserInputType == Enum.UserInputType.Touch or v454.UserInputType == Enum.UserInputType.Gamepad1 and v454.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) and not l_VRService_0.VREnabled then
                    l_GuiService_0.SelectedCoreObject = v395.SliderFrame;
                end;
                if not l_VRService_0.VREnabled then
                    v398 = v455 - l_v391_0;
                else
                    v398 = 0;
                end;
                v424(v455);
                return;
            end;
        end);
        v408.InputEnded:Connect(function(v456) --[[ Line: 2240 ]]
            -- upvalues: v400 (ref), v398 (ref)
            if not v400 then
                return;
            elseif not (not not v456 and (v456.UserInputType == Enum.UserInputType.MouseButton1 or v456.UserInputType == Enum.UserInputType.Touch or v456.UserInputType == Enum.UserInputType.Gamepad1 and v456.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                v398 = 0;
                return;
            end;
        end);
        v409.InputBegan:Connect(function(v457) --[[ Line: 2243 ]]
            -- upvalues: l_v391_0 (ref), v400 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), v395 (copy), v398 (ref), v424 (copy)
            local v458 = l_v391_0 + 1;
            if not v400 then
                return;
            elseif v457 == nil then
                return;
            elseif not (not not v457 and (v457.UserInputType == Enum.UserInputType.MouseButton1 or v457.UserInputType == Enum.UserInputType.Touch or v457.UserInputType == Enum.UserInputType.Gamepad1 and v457.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) and not l_VRService_0.VREnabled then
                    l_GuiService_0.SelectedCoreObject = v395.SliderFrame;
                end;
                if not l_VRService_0.VREnabled then
                    v398 = v458 - l_v391_0;
                else
                    v398 = 0;
                end;
                v424(v458);
                return;
            end;
        end);
        v409.InputEnded:Connect(function(v459) --[[ Line: 2246 ]]
            -- upvalues: v400 (ref), v398 (ref)
            if not v400 then
                return;
            elseif not (not not v459 and (v459.UserInputType == Enum.UserInputType.MouseButton1 or v459.UserInputType == Enum.UserInputType.Touch or v459.UserInputType == Enum.UserInputType.Gamepad1 and v459.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                v398 = 0;
                return;
            end;
        end);
        local function v463(v460) --[[ Line: 2250 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), v408 (copy), v400 (ref), v409 (copy), v395 (copy), v396 (copy)
            if v460 ~= "VREnabled" then
                return;
            elseif l_VRService_0.VREnabled then
                v408.Selectable = v400;
                v409.Selectable = v400;
                v395.SliderFrame.Selectable = v400;
                for v461 = 1, v396 do
                    v395.Steps[v461].Selectable = v400;
                    v395.Steps[v461].Active = v400;
                end;
                return;
            else
                v408.Selectable = false;
                v409.Selectable = false;
                v395.SliderFrame.Selectable = v400;
                for v462 = 1, v396 do
                    v395.Steps[v462].Selectable = false;
                    v395.Steps[v462].Active = false;
                end;
                return;
            end;
        end;
        l_VRService_0.Changed:Connect(v463);
        v463("VREnabled");
        for v464 = 1, v396 do
            v395.Steps[v464].InputBegan:Connect(function(v465) --[[ Line: 2277 ]]
                -- upvalues: v441 (copy), v464 (copy)
                v441(v465, v464);
            end);
            v395.Steps[v464].InputEnded:Connect(function(v466) --[[ Line: 2280 ]]
                -- upvalues: v400 (ref), v398 (ref)
                if not v400 then
                    return;
                elseif not (not not v466 and (v466.UserInputType == Enum.UserInputType.MouseButton1 or v466.UserInputType == Enum.UserInputType.Touch or v466.UserInputType == Enum.UserInputType.Gamepad1 and v466.KeyCode == Enum.KeyCode.ButtonA)) then
                    return;
                else
                    v398 = 0;
                    return;
                end;
            end);
        end;
        v395.SliderFrame.InputBegan:Connect(function(v467) --[[ Line: 2285 ]]
            -- upvalues: l_VRService_0 (ref), l_GuiService_0 (ref), v395 (copy), v441 (copy), l_v391_0 (ref)
            if l_VRService_0.VREnabled then
                local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_1 or not l_SelectedCoreObject_1:IsDescendantOf(v395.SliderFrame.Parent) then
                    return;
                end;
            end;
            v441(v467, l_v391_0);
        end);
        v395.SliderFrame.InputEnded:Connect(function(v469) --[[ Line: 2294 ]]
            -- upvalues: l_VRService_0 (ref), l_GuiService_0 (ref), v395 (copy), v400 (ref), v398 (ref)
            if l_VRService_0.VREnabled then
                local l_SelectedCoreObject_2 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_2 or not l_SelectedCoreObject_2:IsDescendantOf(v395.SliderFrame.Parent) then
                    return;
                end;
            end;
            if not v400 then
                return;
            elseif not (not not v469 and (v469.UserInputType == Enum.UserInputType.MouseButton1 or v469.UserInputType == Enum.UserInputType.Touch or v469.UserInputType == Enum.UserInputType.Gamepad1 and v469.KeyCode == Enum.KeyCode.ButtonA)) then
                return;
            else
                v398 = 0;
                return;
            end;
        end);
        local function v471() --[[ Line: 2304 ]]
            -- upvalues: v399 (ref), v424 (copy), l_v391_0 (ref), v398 (ref)
            if v399 == nil then
                return;
            else
                if tick() - v399 >= 0.2 then
                    v424(l_v391_0 + v398);
                end;
                return;
            end;
        end;
        local v472 = true;
        local v473 = {
            [Enum.KeyCode.Thumbstick1] = true, 
            [Enum.KeyCode.DPadLeft] = -1, 
            [Enum.KeyCode.DPadRight] = 1, 
            [Enum.KeyCode.Left] = -1, 
            [Enum.KeyCode.Right] = 1, 
            [Enum.KeyCode.A] = -1, 
            [Enum.KeyCode.D] = 1, 
            [Enum.KeyCode.ButtonA] = true
        };
        l_UserInputService_0.InputBegan:Connect(function(v474) --[[ Line: 2330 ]]
            -- upvalues: v400 (ref), v472 (ref), l_GuiService_0 (ref), v395 (copy), v473 (copy), v398 (ref), v424 (copy), l_v391_0 (ref)
            if not v400 then
                return;
            elseif not v472 then
                return;
            elseif v474.UserInputType ~= Enum.UserInputType.Gamepad1 and v474.UserInputType ~= Enum.UserInputType.Keyboard then
                return;
            else
                local l_SelectedCoreObject_3 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_3 or not l_SelectedCoreObject_3:IsDescendantOf(v395.SliderFrame.Parent) then
                    return;
                elseif v473[v474.KeyCode] == -1 then
                    v398 = -1;
                    v424(l_v391_0 - 1);
                    return;
                else
                    if v473[v474.KeyCode] == 1 then
                        v398 = 1;
                        v424(l_v391_0 + 1);
                    end;
                    return;
                end;
            end;
        end);
        l_UserInputService_0.InputEnded:Connect(function(v476) --[[ Line: 2358 ]]
            -- upvalues: v400 (ref), l_GuiService_0 (ref), v395 (copy), v473 (copy), v398 (ref)
            if not v400 then
                return;
            elseif v476.UserInputType ~= Enum.UserInputType.Gamepad1 and v476.UserInputType ~= Enum.UserInputType.Keyboard then
                return;
            else
                local l_SelectedCoreObject_4 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_4 or not l_SelectedCoreObject_4:IsDescendantOf(v395.SliderFrame.Parent) then
                    return;
                else
                    if v473[v476.KeyCode] then
                        v398 = 0;
                    end;
                    return;
                end;
            end;
        end);
        l_UserInputService_0.InputChanged:Connect(function(v478) --[[ Line: 2379 ]]
            -- upvalues: v400 (ref), v398 (ref), v472 (ref), l_GuiService_0 (ref), v395 (copy), v424 (copy), l_v391_0 (ref)
            if not v400 then
                v398 = 0;
                return;
            elseif not v472 then
                v398 = 0;
                return;
            elseif v478.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return;
            else
                local l_SelectedCoreObject_5 = l_GuiService_0.SelectedCoreObject;
                if not l_SelectedCoreObject_5 or not l_SelectedCoreObject_5:IsDescendantOf(v395.SliderFrame.Parent) then
                    return;
                elseif v478.KeyCode ~= Enum.KeyCode.Thumbstick1 then
                    return;
                elseif v478.Position.X > 0.8 and v478.Delta.X > 0 and v398 ~= 1 then
                    v398 = 1;
                    v424(l_v391_0 + 1);
                    return;
                elseif v478.Position.X < -0.8 and v478.Delta.X < 0 and v398 ~= -1 then
                    v398 = -1;
                    v424(l_v391_0 - 1);
                    return;
                else
                    if math.abs(v478.Position.X) < 0.8 then
                        v398 = 0;
                    end;
                    return;
                end;
            end;
        end);
        local v480 = false;
        l_GuiService_0.Changed:Connect(function(v481) --[[ Line: 2420 ]]
            -- upvalues: l_GuiService_0 (ref), v395 (copy), v480 (ref), v399 (ref), l_RunService_0 (ref), v401 (copy), v471 (copy)
            if v481 ~= "SelectedCoreObject" then
                return;
            else
                local l_SelectedCoreObject_6 = l_GuiService_0.SelectedCoreObject;
                if l_SelectedCoreObject_6 and l_SelectedCoreObject_6:IsDescendantOf(v395.SliderFrame.Parent) then
                    if not v480 then
                        v480 = true;
                        v399 = tick();
                        l_RunService_0:BindToRenderStep(v401, Enum.RenderPriority.Input.Value + 1, v471);
                        return;
                    end;
                elseif v480 then
                    v480 = false;
                    l_RunService_0:UnbindFromRenderStep(v401);
                end;
                return;
            end;
        end);
        v395.SliderFrame.AncestryChanged:Connect(function(_, v484) --[[ Line: 2441 ]]
            -- upvalues: v472 (ref)
            v472 = v484;
        end);
        v424(l_v391_0);
        return v395;
    end;
end;
local v486 = 50;
if v37 then
    v486 = 90;
end;
local v487 = {};
local function v541(v488, v489, v490, v491, v492, v493, v494, v495, v496, v497) --[[ Line: 2456 ]] --[[ Name: AddNewRow ]]
    -- upvalues: v487 (copy), l_Create_0 (copy), v486 (ref), v43 (copy), v0 (copy), v37 (copy), l_GuiService_0 (copy), v42 (copy), v485 (copy), v364 (copy), v282 (copy), l_VRService_0 (copy), l_UserInputService_0 (copy), l_CoreGui_0 (copy)
    local v498 = 0;
    local v499 = v490 ~= "TextBox";
    if v487[v488] then
        v498 = v487[v488];
    end;
    local v500 = nil;
    v500 = l_Create_0("ImageButton")({
        Name = v489 .. "Frame", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(2, 2, 18, 18), 
        ImageTransparency = 1, 
        Active = false, 
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 0, v486), 
        AutomaticSize = if not not v494 or v495 or v496 then Enum.AutomaticSize.Y else nil, 
        Position = UDim2.new(0, 0, 0, v498), 
        ZIndex = 2, 
        Selectable = false, 
        SelectionImageObject = v43, 
        Parent = v488.Page
    });
    v500.BackgroundColor3 = v0.color("RowFrameBackground");
    v500.ImageColor3 = v500.BackgroundColor3;
    l_Create_0("UICorner")({
        CornerRadius = v0.DefaultCornerRadius, 
        Parent = v500
    });
    if v500 and v493 then
        v500.Position = UDim2.new(v500.Position.X.Scale, v500.Position.X.Offset, v500.Position.Y.Scale, v500.Position.Y.Offset + v493);
    end;
    local v501 = nil;
    local v502 = nil;
    if v494 then
        v501 = l_Create_0("Frame")({
            Name = v489 .. "RowLabelAndDescriptionFrame", 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 10, 0, 0), 
            Size = UDim2.new(0.4, -20, 0, 50), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Parent = v500
        });
        v502 = l_Create_0("TextLabel")({
            Name = v489 .. "Label", 
            Text = v489, 
            Font = v0.font(Enum.Font.SourceSansBold, "UtilityRow"), 
            TextSize = v0.textSize(16, "UtilityRow"), 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextWrapped = true, 
            ZIndex = 2, 
            Parent = v501, 
            LayoutOrder = 1
        });
        l_Create_0("TextLabel")({
            Name = v489 .. "Description", 
            Text = v494, 
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
            Parent = v501, 
            LayoutOrder = 2
        });
        l_Create_0("UIListLayout")({
            Name = v489 .. "UIListLayout", 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8), 
            Parent = v501
        });
        l_Create_0("UIPadding")({
            Name = v489 .. "UIListLayout", 
            PaddingBottom = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10), 
            Parent = v501
        });
    else
        v502 = l_Create_0("TextLabel")({
            Name = v489 .. "Label", 
            Text = v489, 
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
            Parent = v500
        });
        l_Create_0("UIPadding")({
            Name = v489 .. "UIPadding", 
            PaddingBottom = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10), 
            Parent = v502
        });
    end;
    if not v499 then
        v502.Text = "";
    end;
    local function v505(_, v504) --[[ Line: 2588 ]] --[[ Name: onResized ]]
        -- upvalues: v502 (ref), v0 (ref), v37 (ref)
        if v504 then
            v502.TextSize = v0.textSize(16, "UtilityRow");
            return;
        else
            v502.TextSize = v37 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            return;
        end;
    end;
    local v506 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v507 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    if v507.Y > v507.X then
        v507 = v0.textSize(16, "UtilityRow");
        v502.TextSize = v507;
    else
        v507 = v37 and v0.textSize(36) or v0.textSize(24, "UtilityText");
        v502.TextSize = v507;
    end;
    v42[v500] = v505;
    local v508 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v509 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    if v509.Y > v509.X then
        v509 = v0.textSize(16, "UtilityRow");
        v502.TextSize = v509;
    else
        v509 = v37 and v0.textSize(36) or v0.textSize(24, "UtilityText");
        v502.TextSize = v509;
    end;
    v506 = nil;
    v508 = nil;
    if v490 == "Slider" then
        v508 = v485(v491, v492, nil, v495, v496);
        v508.SliderFrame.Parent = v500;
        v506 = v508.SliderFrame;
    elseif v490 == "Selector" then
        v508 = v364(v491, v492);
        v508.SelectorFrame.Parent = v500;
        v506 = v508.SelectorFrame;
    elseif v490 == "DropDown" then
        v508 = v282(v491, v492, v488.HubRef);
        v508.DropDownFrame.Parent = v500;
        v506 = v508.DropDownFrame;
    elseif v490 == "TextBox" then
        v507 = l_Create_0("ImageLabel")({
            Image = "", 
            BackgroundTransparency = 1
        });
        v508 = {
            HubRef = nil
        };
        v509 = l_Create_0("TextBox")({
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0.6, 0, 1, 0), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Text = v489, 
            TextColor3 = Color3.fromRGB(49, 49, 49), 
            BackgroundTransparency = v0.transparency("ControlInputBackground", 0.5), 
            BorderSizePixel = 0, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Font = v0.font(Enum.Font.SourceSans, "UtilityText"), 
            TextSize = v0.textSize(24, "UtilityText"), 
            ZIndex = 2, 
            SelectionImageObject = v507, 
            ClearTextOnFocus = false, 
            Interactable = v497, 
            Parent = v500
        });
        v506 = v509;
        local l_v509_0 = v509 --[[ copy: 19 -> 25 ]];
        v509.Focused:Connect(function() --[[ Line: 2642 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), l_v509_0 (copy), v489 (copy)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                l_GuiService_0.SelectedCoreObject = l_v509_0;
            end;
            if l_v509_0.Text == v489 then
                l_v509_0.Text = "";
            end;
        end);
        if v493 then
            v509.Position = UDim2.new(v509.Position.X.Scale, v509.Position.X.Offset, v509.Position.Y.Scale, v509.Position.Y.Offset + v493);
        end;
        local l_v509_1 = v509 --[[ copy: 19 -> 26 ]];
        v506.SelectionGained:Connect(function() --[[ Line: 2660 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_v509_1 (copy), v0 (ref), v508 (ref), v506 (ref)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                l_v509_1.BackgroundTransparency = v0.transparency("ControlInputBackground", 0.1);
                if v508.HubRef then
                    v508.HubRef:ScrollToFrame(v506);
                end;
            end;
        end);
        v506.SelectionLost:Connect(function() --[[ Line: 2669 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_v509_1 (copy), v0 (ref)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                l_v509_1.BackgroundTransparency = v0.transparency("ControlInputBackground", 0.5);
            end;
        end);
        local function v514() --[[ Line: 2675 ]]
            -- upvalues: l_CoreGui_0 (ref), v506 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), v488 (copy), l_GuiService_0 (ref)
            local l_DropDownFullscreenFrame_0 = l_CoreGui_0.RobloxGui:FindFirstChild("DropDownFullscreenFrame");
            if l_DropDownFullscreenFrame_0 and l_DropDownFullscreenFrame_0.Visible then
                return;
            else
                local l_v506_0 = v506;
                if l_v506_0 and l_v506_0.Visible and l_v506_0.ZIndex > 1 and not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) and v488.Active then
                    l_GuiService_0.SelectedCoreObject = l_v506_0;
                end;
                return;
            end;
        end;
        local function v516(v515) --[[ Line: 2693 ]] --[[ Name: processInput ]]
            -- upvalues: l_GuiService_0 (ref), v506 (ref), l_v509_1 (copy)
            if v515.UserInputState == Enum.UserInputState.Begin and v515.KeyCode == Enum.KeyCode.Return and l_GuiService_0.SelectedCoreObject == v506 then
                l_v509_1:CaptureFocus();
            end;
        end;
        v509.MouseEnter:Connect(v514);
        l_UserInputService_0.InputBegan:Connect(v516);
    elseif v490 == "TextEntry" then
        v507 = l_Create_0("ImageLabel")({
            Image = "", 
            BackgroundTransparency = 1
        });
        v508 = {
            HubRef = nil
        };
        v509 = l_Create_0("TextBox")({
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0.4, -10, 0, 40), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            Text = v489, 
            TextColor3 = Color3.fromRGB(178, 178, 178), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextWrapped = false, 
            Font = v0.font(Enum.Font.SourceSans, "UtilityText"), 
            TextSize = v0.textSize(24, "UtilityText"), 
            ZIndex = 2, 
            SelectionImageObject = v507, 
            ClearTextOnFocus = false, 
            Parent = v500
        });
        v506 = v509;
        local l_v509_2 = v509 --[[ copy: 19 -> 23 ]];
        v509.Focused:Connect(function() --[[ Line: 2734 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref), l_v509_2 (copy), v489 (copy)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                l_GuiService_0.SelectedCoreObject = l_v509_2;
            end;
            if l_v509_2.Text == v489 then
                l_v509_2.Text = "";
            end;
        end);
        if v493 then
            v509.Position = UDim2.new(v509.Position.X.Scale, v509.Position.X.Offset, v509.Position.Y.Scale, v509.Position.Y.Offset + v493);
        end;
        local l_v509_3 = v509 --[[ copy: 19 -> 24 ]];
        v506.SelectionGained:Connect(function() --[[ Line: 2752 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_v509_3 (copy), v508 (ref), v506 (ref)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                l_v509_3.BackgroundTransparency = 0.8;
                if v508.HubRef then
                    v508.HubRef:ScrollToFrame(v506);
                end;
            end;
        end);
        v506.SelectionLost:Connect(function() --[[ Line: 2761 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), l_v509_3 (copy)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                l_v509_3.BackgroundTransparency = 1;
            end;
        end);
        local function v521() --[[ Line: 2767 ]]
            -- upvalues: l_CoreGui_0 (ref), v506 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), v488 (copy), l_GuiService_0 (ref)
            local l_DropDownFullscreenFrame_1 = l_CoreGui_0.RobloxGui:FindFirstChild("DropDownFullscreenFrame");
            if l_DropDownFullscreenFrame_1 and l_DropDownFullscreenFrame_1.Visible then
                return;
            else
                local l_v506_1 = v506;
                if l_v506_1 and l_v506_1.Visible and l_v506_1.ZIndex > 1 and not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) and v488.Active then
                    l_GuiService_0.SelectedCoreObject = l_v506_1;
                end;
                return;
            end;
        end;
        local function v523(v522) --[[ Line: 2785 ]] --[[ Name: processInput ]]
            -- upvalues: l_GuiService_0 (ref), v506 (ref), l_v509_3 (copy)
            if v522.UserInputState == Enum.UserInputState.Begin and v522.KeyCode == Enum.KeyCode.Return and l_GuiService_0.SelectedCoreObject == v506 then
                l_v509_3:CaptureFocus();
            end;
        end;
        v500.MouseEnter:Connect(v521);
        v508.SetZIndex = function(_, v525) --[[ Line: 2796 ]] --[[ Name: SetZIndex ]]
            -- upvalues: l_v509_3 (copy)
            l_v509_3.ZIndex = v525;
        end;
        v508.SetInteractable = function(_, v527) --[[ Line: 2800 ]] --[[ Name: SetInteractable ]]
            -- upvalues: l_v509_3 (copy)
            l_v509_3.Selectable = v527;
            if not v527 then
                l_v509_3.TextColor3 = Color3.fromRGB(49, 49, 49);
                l_v509_3.ZIndex = 1;
                return;
            else
                l_v509_3.TextColor3 = Color3.fromRGB(178, 178, 178);
                l_v509_3.ZIndex = 2;
                return;
            end;
        end;
        v508.SetValue = function(_, v529) --[[ Line: 2811 ]] --[[ Name: SetValue ]]
            -- upvalues: l_v509_3 (copy)
            l_v509_3.Text = v529;
        end;
        local l_BindableEvent_4 = Instance.new("BindableEvent");
        l_BindableEvent_4.Name = "ValueChanged";
        v509.FocusLost:Connect(function() --[[ Line: 2818 ]]
            -- upvalues: l_BindableEvent_4 (copy), l_v509_3 (copy)
            l_BindableEvent_4:Fire(l_v509_3.Text);
        end);
        v508.ValueChanged = l_BindableEvent_4.Event;
        l_UserInputService_0.InputBegan:Connect(v523);
    end;
    v507 = v489 .. "ValueChanger";
    v508.Name = v507;
    v507 = v508.SetAutoLocalize;
    v508.SetAutoLocalize = function(v531, v532) --[[ Line: 2830 ]]
        -- upvalues: v500 (ref), v507 (copy)
        v500.AutoLocalize = v532;
        if v507 then
            v507(v531, v532);
        end;
    end;
    v498 = v498 + v486;
    if v493 then
        v498 = v498 + v493;
    end;
    v487[v488] = v498;
    if v499 then
        v509 = function() --[[ Line: 2845 ]]
            -- upvalues: l_CoreGui_0 (ref), v508 (ref), l_VRService_0 (ref), l_UserInputService_0 (ref), v488 (copy), l_GuiService_0 (ref)
            local l_DropDownFullscreenFrame_2 = l_CoreGui_0.RobloxGui:FindFirstChild("DropDownFullscreenFrame");
            if l_DropDownFullscreenFrame_2 and l_DropDownFullscreenFrame_2.Visible then
                return;
            else
                local v534 = v508.SliderFrame or v508.SliderFrame or v508.DropDownFrame or v508.SelectorFrame;
                if v534 and v534.Visible and v534.ZIndex > 1 and not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) and v488.Active then
                    l_GuiService_0.SelectedCoreObject = v534;
                end;
                return;
            end;
        end;
        v500.MouseEnter:Connect(v509);
        local function v538(v535) --[[ Line: 2875 ]] --[[ Name: onVREnabled ]]
            -- upvalues: l_VRService_0 (ref), v500 (ref), v506 (ref), l_GuiService_0 (ref), v0 (ref)
            if v535 == "VREnabled" then
                if l_VRService_0.VREnabled then
                    v500.Selectable = true;
                    v500.Active = true;
                    v506.Active = true;
                    l_GuiService_0.Changed:Connect(function(v536) --[[ Line: 2881 ]]
                        -- upvalues: l_GuiService_0 (ref), v500 (ref), v0 (ref)
                        if v536 == "SelectedCoreObject" then
                            local l_SelectedCoreObject_7 = l_GuiService_0.SelectedCoreObject;
                            if l_SelectedCoreObject_7 and (l_SelectedCoreObject_7 == v500 or l_SelectedCoreObject_7:IsDescendantOf(v500)) then
                                v500.ImageTransparency = v0.transparency("RowFrameBackground", 0.5);
                                v500.BackgroundTransparency = 1;
                                return;
                            else
                                v500.ImageTransparency = 1;
                                v500.BackgroundTransparency = 1;
                            end;
                        end;
                    end);
                    return;
                else
                    v500.Selectable = false;
                    v500.Active = false;
                end;
            end;
        end;
        l_VRService_0.Changed:Connect(v538);
        if l_VRService_0.VREnabled then
            v500.Selectable = true;
            v500.Active = true;
            v506.Active = true;
            l_GuiService_0.Changed:Connect(function(v539) --[[ Line: 2881 ]]
                -- upvalues: l_GuiService_0 (ref), v500 (ref), v0 (ref)
                if v539 == "SelectedCoreObject" then
                    local l_SelectedCoreObject_8 = l_GuiService_0.SelectedCoreObject;
                    if l_SelectedCoreObject_8 and (l_SelectedCoreObject_8 == v500 or l_SelectedCoreObject_8:IsDescendantOf(v500)) then
                        v500.ImageTransparency = v0.transparency("RowFrameBackground", 0.5);
                        v500.BackgroundTransparency = 1;
                        return;
                    else
                        v500.ImageTransparency = 1;
                        v500.BackgroundTransparency = 1;
                    end;
                end;
            end);
        else
            v500.Selectable = false;
            v500.Active = false;
        end;
        v506.SelectionGained:Connect(function() --[[ Line: 2902 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), v500 (ref), v0 (ref), v508 (ref)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                if l_VRService_0.VREnabled then
                    v500.ImageTransparency = 0.5;
                    v500.BackgroundTransparency = 1;
                else
                    v500.ImageTransparency = 1;
                    v500.BackgroundTransparency = v0.transparency("RowFrameBackground", 0.5);
                end;
                if v508.HubRef then
                    v508.HubRef:ScrollToFrame(v500);
                end;
            end;
        end);
        v506.SelectionLost:Connect(function() --[[ Line: 2917 ]]
            -- upvalues: l_VRService_0 (ref), l_UserInputService_0 (ref), v500 (ref)
            if not l_VRService_0.VREnabled and (not (l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch) or l_UserInputService_0.GamepadEnabled and true or false) then
                v500.ImageTransparency = 1;
                v500.BackgroundTransparency = 1;
            end;
        end);
    end;
    v488:AddRow(v500, v502, v508, v493, false);
    v508.Selection = v506;
    return v500, v502, v508;
end;
local function v556(v542, v543, v544, v545, v546) --[[ Line: 2932 ]] --[[ Name: AddNewRowObject ]]
    -- upvalues: v487 (copy), l_Create_0 (copy), v486 (ref), v43 (copy), v0 (copy), v37 (copy), v42 (copy), l_GuiService_0 (copy), l_VRService_0 (copy)
    local v547 = 0;
    if v487[v542] then
        v547 = v487[v542];
    end;
    local v548 = l_Create_0("ImageButton")({
        Name = v543 .. "Frame", 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BorderSizePixel = 0, 
        Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(10, 10, 10, 10), 
        ImageTransparency = 1, 
        Active = false, 
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 0, v486), 
        Position = UDim2.new(0, 0, 0, v547), 
        ZIndex = 2, 
        Selectable = false, 
        SelectionImageObject = v43, 
        Parent = v542.Page
    });
    v548.BackgroundColor3 = v0.color("RowFrameBackground");
    v548.ImageColor3 = v548.BackgroundColor3;
    v548.SelectionGained:Connect(function() --[[ Line: 2960 ]]
        -- upvalues: v548 (copy), v0 (ref)
        v548.BackgroundTransparency = v0.transparency("RowFrameBackground", 0.5);
    end);
    v548.SelectionLost:Connect(function() --[[ Line: 2963 ]]
        -- upvalues: v548 (copy)
        v548.BackgroundTransparency = 1;
    end);
    l_Create_0("UICorner")({
        CornerRadius = v0.DefaultCornerRadius, 
        Parent = v548
    });
    local v549 = l_Create_0("TextLabel")({
        Name = v543 .. "Label", 
        Text = v543, 
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
        Parent = v548
    });
    l_Create_0("UIPadding")({
        Name = v543 .. "UIPadding", 
        PaddingBottom = UDim.new(0, 10), 
        PaddingTop = UDim.new(0, 10), 
        Parent = v549
    });
    local function v552(_, v551) --[[ Line: 2995 ]] --[[ Name: onResized ]]
        -- upvalues: v546 (copy), v549 (copy), v0 (ref), v37 (ref)
        if v546 then
            UDim2.new(0, 200, 1, 0);
        end;
        if v551 then
            v549.TextSize = v0.textSize(16, "UtilityRow");
            return;
        else
            v549.TextSize = v37 and v0.textSize(36) or v0.textSize(24, "UtilityText");
            return;
        end;
    end;
    v42[v548] = v552;
    local l_v552_0 = v552;
    local v554 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v555 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    l_v552_0(v554, v555.Y > v555.X);
    if v545 then
        v548.Position = UDim2.new(v548.Position.X.Scale, v548.Position.X.Offset, v548.Position.Y.Scale, v548.Position.Y.Offset + v545);
    end;
    v547 = v547 + v486;
    if v545 then
        v547 = v547 + v545;
    end;
    v487[v542] = v547;
    l_v552_0 = function() --[[ Line: 3023 ]]
        -- upvalues: v548 (copy), l_GuiService_0 (ref)
        if v548.Visible then
            l_GuiService_0.SelectedCoreObject = v548;
        end;
    end;
    v548.MouseEnter:Connect(l_v552_0);
    v544.SelectionImageObject = v43;
    v544.SelectionGained:Connect(function() --[[ Line: 3032 ]]
        -- upvalues: l_VRService_0 (ref), v548 (copy), v0 (ref)
        if l_VRService_0.VREnabled then
            v548.ImageTransparency = v0.transparency("RowFrameBackground", 0.5);
            v548.BackgroundTransparency = 1;
            return;
        else
            v548.ImageTransparency = 1;
            v548.BackgroundTransparency = v0.transparency("RowFrameBackground", 0.5);
            return;
        end;
    end);
    v544.SelectionLost:Connect(function() --[[ Line: 3041 ]]
        -- upvalues: v548 (copy)
        v548.ImageTransparency = 1;
        v548.BackgroundTransparency = 1;
    end);
    v544.Parent = v548;
    v542:AddRow(v548, v549, v544, v545, true);
    return v548;
end;
local v599 = {
    GetEaseLinear = function(_) --[[ Line: 3055 ]] --[[ Name: GetEaseLinear ]]
        -- upvalues: v51 (copy)
        return v51;
    end, 
    GetEaseOutQuad = function(_) --[[ Line: 3058 ]] --[[ Name: GetEaseOutQuad ]]
        -- upvalues: v56 (copy)
        return v56;
    end, 
    GetEaseInOutQuad = function(_) --[[ Line: 3061 ]] --[[ Name: GetEaseInOutQuad ]]
        -- upvalues: v61 (copy)
        return v61;
    end, 
    CreateNewSlider = function(_, v561, v562, v563, v564, v565) --[[ Line: 3065 ]] --[[ Name: CreateNewSlider ]]
        -- upvalues: v485 (copy)
        return v485(v561, v562, v563, v564, v565);
    end, 
    CreateNewSelector = function(_, v567, v568) --[[ Line: 3069 ]] --[[ Name: CreateNewSelector ]]
        -- upvalues: v364 (copy)
        return (v364(v567, v568));
    end, 
    CreateNewDropDown = function(_, v570, v571) --[[ Line: 3073 ]] --[[ Name: CreateNewDropDown ]]
        -- upvalues: v282 (copy)
        return (v282(v570, v571, nil));
    end, 
    AddNewRow = function(_, v573, v574, v575, v576, v577, v578, v579, v580, v581, v582) --[[ Line: 3077 ]] --[[ Name: AddNewRow ]]
        -- upvalues: v541 (copy)
        return v541(v573, v574, v575, v576, v577, v578, v579, v580, v581, v582);
    end, 
    AddNewRowObject = function(_, v584, v585, v586, v587, v588) --[[ Line: 3081 ]] --[[ Name: AddNewRowObject ]]
        -- upvalues: v556 (copy)
        return (v556(v584, v585, v586, v587, v588));
    end, 
    ShowAlert = function(_, v590, v591, v592, v593, v594) --[[ Line: 3085 ]] --[[ Name: ShowAlert ]]
        -- upvalues: v389 (copy)
        v389(v590, v591, v592, v593, v594);
    end, 
    IsSmallTouchScreen = function(_) --[[ Line: 3089 ]] --[[ Name: IsSmallTouchScreen ]]
        -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy)
        local v596 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
        return l_UserInputService_0.TouchEnabled and (v596.Y < 500 or v596.X < 700);
    end, 
    IsPortrait = function(_) --[[ Line: 3093 ]] --[[ Name: IsPortrait ]]
        -- upvalues: l_GuiService_0 (copy)
        local v598 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
        return v598.Y > v598.X;
    end
};
if v18 or v19 then
    local function _() --[[ Line: 3098 ]] --[[ Name: isUsingGamepad ]]
        -- upvalues: v109 (copy), l_UserInputService_0 (copy)
        return v109[l_UserInputService_0:GetLastInputType()] or false;
    end;
    v599.IsUsingGamepad = function(_) --[[ Line: 3102 ]] --[[ Name: IsUsingGamepad ]]
        -- upvalues: v109 (copy), l_UserInputService_0 (copy)
        return v109[l_UserInputService_0:GetLastInputType()] or false;
    end;
end;
v599.MakeStyledButton = function(_, v603, v604, v605, v606, v607, v608) --[[ Line: 3107 ]] --[[ Name: MakeStyledButton ]]
    -- upvalues: v153 (copy)
    return v153(v603, v604, v605, v606, v607, v608);
end;
v599.MakeStyledImageButton = function(_, v610, v611, v612, v613, v614, v615, v616, v617) --[[ Line: 3111 ]] --[[ Name: MakeStyledImageButton ]]
    -- upvalues: v168 (copy)
    return v168(v610, v611, v612, v613, v614, v615, v616, v617);
end;
v599.AddButtonRow = function(_, v619, v620, v621, v622, v623, v624) --[[ Line: 3115 ]] --[[ Name: AddButtonRow ]]
    -- upvalues: v179 (copy)
    return v179(v619, v620, v621, v622, v623, v624);
end;
v599.MakeFocusState = function(_, v626, v627) --[[ Line: 3119 ]] --[[ Name: MakeFocusState ]]
    -- upvalues: v195 (copy)
    return v195(v626, v627);
end;
v599.CreateSignal = function(_) --[[ Line: 3123 ]] --[[ Name: CreateSignal ]]
    -- upvalues: v88 (copy)
    return (v88());
end;
v599.UsesSelectedObject = function(_) --[[ Line: 3127 ]] --[[ Name: UsesSelectedObject ]]
    -- upvalues: l_VRService_0 (copy), l_UserInputService_0 (copy)
    if l_VRService_0.VREnabled then
        return false;
    elseif l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch and not l_UserInputService_0.GamepadEnabled then
        return false;
    else
        return true;
    end;
end;
v599.TweenProperty = function(_, v631, v632, v633, v634, v635, v636, v637) --[[ Line: 3131 ]] --[[ Name: TweenProperty ]]
    return PropertyTweener(v631, v632, v633, v634, v635, v636, v637);
end;
v599.OnResized = function(_, v639, v640) --[[ Line: 3135 ]] --[[ Name: OnResized ]]
    -- upvalues: v108 (copy)
    return v108(v639, v640);
end;
v599.FireOnResized = function(_) --[[ Line: 3139 ]] --[[ Name: FireOnResized ]]
    -- upvalues: l_GuiService_0 (copy), v599 (copy), v42 (copy)
    local v642 = if _G.__TESTEZ_RUNNING_TEST__ then Vector2.new(1024, 1024) else l_GuiService_0:GetHardwareSafeViewport();
    local v643 = v599:IsPortrait();
    for _, v645 in pairs(v42) do
        v645(v642, v643);
    end;
end;
v599.Lerp = function(_, v647, v648, v649) --[[ Line: 3150 ]] --[[ Name: Lerp ]]
    return (1 - v647) * v648 + v647 * v649;
end;
v599.Round = function(_, v651) --[[ Line: 3155 ]] --[[ Name: Round ]]
    return v651 % 1 >= 0.5 and math.ceil(v651) or math.floor(v651);
end;
v599.IsExperienceOlderThanOneWeek = function(_, v653) --[[ Line: 3159 ]] --[[ Name: IsExperienceOlderThanOneWeek ]]
    -- upvalues: l_Workspace_0 (copy)
    if v653 ~= nil and v653.Created ~= nil then
        local l_UnixTimestampMillis_0 = DateTime.fromIsoDate(v653.Created).UnixTimestampMillis;
        if l_Workspace_0:GetServerTimeNow() * 1000 - l_UnixTimestampMillis_0 > 604800000 then
            return true;
        end;
    end;
    return false;
end;
return v599;