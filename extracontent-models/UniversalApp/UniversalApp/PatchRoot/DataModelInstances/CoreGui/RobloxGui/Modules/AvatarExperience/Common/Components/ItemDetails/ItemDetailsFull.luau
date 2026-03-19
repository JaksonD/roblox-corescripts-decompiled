local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local v7 = require(l_CorePackages_0.Packages.React);
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadUtils;
local l_useDescendantHasFocus_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).useDescendantHasFocus;
local l_AnimatedScrollingFrame_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.AnimatedScrollingFrame.AnimatedScrollingFrame;
local v11 = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus;
local v14 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXMigrateItemDetailsFullToFocusNavigation", false);
local v15 = l_FFlagAXMigrateAXToGlobalAutofocus_0 and game:DefineFastFlag("AXMigrateItemDetailsFullToAutoFocus", false);
local v16 = UDim.new(1, 0);
local function v17() --[[ Line: 49 ]]
    return nil;
end;
return function(v18) --[[ Line: 53 ]]
    -- upvalues: v17 (copy), v7 (copy), v14 (copy), l_useDescendantHasFocus_0 (copy), l_GamepadUtils_0 (copy), v16 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v5 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy), l_AnimatedScrollingFrame_0 (copy), v11 (copy), v15 (copy)
    local l_renderContent_0 = v18.renderContent;
    local v20 = v18.renderTopBar or v17;
    local v21 = v18.renderBottomBar or v17;
    local v22 = v18.topBarHeight or 0;
    local v23 = v18.bottomBarHeight or 0;
    local v24 = v7.useRef(nil);
    local v25 = if v14 then v7.useRef(nil) else nil;
    local v26 = if v14 and v25 then l_useDescendantHasFocus_0(v25.current) else nil;
    if v14 then
        local v32 = v7.useCallback(function(v27, v28) --[[ Line: 66 ]]
            -- upvalues: v26 (copy), v24 (copy), l_GamepadUtils_0 (ref), v16 (ref)
            if not v26 then
                return;
            else
                local v29 = Vector2.new(v27.Position.X, v27.Position.Y);
                local l_current_0 = v24.current;
                if l_current_0 then
                    local v31 = l_current_0.CanvasPosition.Y + v28 * -l_GamepadUtils_0.normalizeStickByDeadzone(v29).Y * 1000;
                    if v31 <= l_current_0.AbsoluteSize.Y * v16.Scale + v16.Offset then
                        l_current_0.CanvasPosition = Vector2.new(0, v31);
                    end;
                end;
                return;
            end;
        end, {
            v26
        });
        v7.useEffect(function() --[[ Line: 86 ]]
            -- upvalues: l_RunService_0 (ref), v32 (copy), l_UserInputService_0 (ref)
            local v33 = nil;
            local v35 = l_RunService_0.Heartbeat:Connect(function(v34) --[[ Line: 88 ]]
                -- upvalues: v33 (ref), v32 (ref)
                if v33 and v33.KeyCode == Enum.KeyCode.Thumbstick2 then
                    v32(v33, v34);
                end;
            end);
            local v38 = l_UserInputService_0.InputChanged:Connect(function(v36, _) --[[ Line: 93 ]]
                -- upvalues: v33 (ref)
                if v36.KeyCode == Enum.KeyCode.Thumbstick2 then
                    if v36.UserInputState == Enum.UserInputState.Change then
                        v33 = v36;
                        return;
                    elseif v36.UserInputState == Enum.UserInputState.End then
                        v33 = nil;
                    end;
                end;
            end);
            return function() --[[ Line: 103 ]]
                -- upvalues: v35 (copy), v38 (copy)
                v35:Disconnect();
                v38:Disconnect();
            end;
        end, {
            v32
        });
    end;
    return v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = v18.viewSize, 
        Position = v18.viewPosition, 
        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil, 
        [v4.Ref] = if v14 then v25 else nil, 
        inputBindings = if not (not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v14) and v24 and v24.current ~= nil then {
            ScrollPeekView = v5.Input.onStep(Enum.KeyCode.Thumbstick2, function(v39, v40) --[[ Line: 124 ]]
                -- upvalues: v24 (copy), l_GamepadUtils_0 (ref), v16 (ref)
                local l_Position_0 = v39.Position;
                local l_current_1 = v24.current;
                local v43 = l_current_1.CanvasPosition.Y + v40 * -l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0).Y * 1000;
                if v43 <= l_current_1.AbsoluteSize.Y * v16.Scale + v16.Offset then
                    l_current_1.CanvasPosition = Vector2.new(0, v43);
                end;
            end)
        } else nil
    }, {
        TopBar = v20(), 
        ScrollingContent = v4.createElement(if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then l_AnimatedScrollingFrame_0 else "ScrollingFrame", {
            ScrollingEnabled = if v11() then v18.scrollingEnabled else nil, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, -(v22 + v23)), 
            Position = UDim2.new(0, 0, 0, v22), 
            ScrollBarThickness = 0, 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            ElasticBehavior = Enum.ElasticBehavior.Never, 
            [v4.Ref] = v24, 
            Selectable = not v15 and nil
        }, {
            Content = l_renderContent_0()
        }), 
        BottomBar = v21()
    });
end;