local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.ReactRoblox);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_TweenService_0 = game:GetService("TweenService");
local l_VRService_0 = game:GetService("VRService");
local v8 = require(l_CorePackages_0.Packages.ReactOtter);
local v9 = require(l_CorePackages_0.Packages.Signals);
local l_getUIScale_0 = require(l_CorePackages_0.Workspace.Packages.Display).GetDisplayStore(false).getUIScale;
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local v12 = require(l_CorePackages_0.Packages.Foundation);
local l_Interactable_0 = v11.Core.Control.Interactable;
local l_useStyleSheet_0 = v12.Hooks.useStyleSheet;
local l_MouseIconOverrideService_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService;
local v16 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol.named("SelfieViewCursorOverride");
local v17 = require(l_script_FirstAncestor_0.Utility.debounce);
local v18 = require(l_script_FirstAncestor_0.Service);
local v19 = require(l_script_FirstAncestor_0.Unibar.Constants);
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v21 = require(l_script_FirstAncestor_0.Analytics.ChromeAnalytics);
local v22 = require(l_script_FirstAncestor_0.Utility.shouldRejectMultiTouch);
local l_SettingsShowSignal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal;
local v24 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeMenuOpen_0 = v24.Flags.FFlagTopBarSignalizeMenuOpen;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v27 = game:DefineFastInt("ChromeWindowLayoutOrder", 2);
local v28 = game:DefineFastFlag("FixWindowDragError", false);
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local v30 = require(l_script_FirstAncestor_0.Hooks.useWindowSize);
local v31 = {
    dampingRatio = 1, 
    frequency = 3
};
local v32 = {
    INTEGRATION = 1, 
    CLOSE_BUTTON = 2, 
    INPUT_SHIELD = 3, 
    INPUT_WRAPPER = 4
};
local v33 = false;
return function(v34) --[[ Line: 68 ]]
    -- upvalues: v30 (copy), v2 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), l_useSelector_0 (copy), v8 (copy), v31 (copy), v9 (copy), v24 (copy), l_SettingsShowSignal_0 (copy), v18 (copy), v19 (copy), v21 (copy), l_UserInputService_0 (copy), v22 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_getUIScale_0 (copy), l_VRService_0 (copy), v33 (ref), l_MouseIconOverrideService_0 (copy), v16 (copy), v28 (copy), l_TweenService_0 (copy), v27 (copy), l_useStyleSheet_0 (copy), v3 (copy), v17 (copy), l_Interactable_0 (copy), v32 (copy), l_CoreGui_0 (copy)
    local v35 = v30(v34.integration.integration);
    local v36 = v2.useRef(nil);
    local v37 = v2.useRef(nil);
    local v38, v39 = v2.useBinding(false);
    local v40 = 0;
    local v41 = v2.useMemo(function() --[[ Line: 74 ]]
        return nil;
    end, {});
    local v42, v43 = v2.useBinding(false);
    local v44, v45 = v2.useBinding(false);
    local v47 = if l_FFlagTopBarSignalizeMenuOpen_0 then v2.joinBindings({
        v42, 
        v44
    }):map(function(v46) --[[ Line: 82 ]]
        return v46[1] or v46[2];
    end) else nil;
    local v49 = if not l_FFlagTopBarSignalizeMenuOpen_0 then l_useSelector_0(function(v48) --[[ Line: 88 ]]
        return v48.displayOptions.menuOpen or v48.displayOptions.inspectMenuOpen;
    end) else nil;
    local v50, v51 = v2.useBinding(false);
    local v52, v53 = v8.useAnimatedBinding(v35.X.Offset);
    local v54, v55 = v8.useAnimatedBinding(v35.Y.Offset);
    local v56 = v2.useCallback(function() --[[ Line: 99 ]]
        -- upvalues: v52 (copy), v54 (copy), v34 (copy)
        return Vector2.new(v52:getValue(), v54:getValue()) * (v34.integration.integration.windowAnchorPoint or Vector2.zero);
    end, {
        v52, 
        v54, 
        v34.integration
    });
    v2.useEffect(function() --[[ Line: 104 ]]
        -- upvalues: v52 (copy), v53 (copy), v8 (ref), v35 (copy), v31 (ref)
        if v52:getValue() == 0 then
            v53((v8.instant(v35.X.Offset)));
            return;
        else
            v53(v8.spring(v35.X.Offset, v31));
            return;
        end;
    end, {
        v35.X.Offset
    });
    v2.useEffect(function() --[[ Line: 112 ]]
        -- upvalues: v54 (copy), v55 (copy), v8 (ref), v35 (copy), v31 (ref)
        if v54:getValue() == 0 then
            v55((v8.instant(v35.Y.Offset)));
            return;
        else
            v55(v8.spring(v35.Y.Offset, v31));
            return;
        end;
    end, {
        v35.Y.Offset
    });
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        v2.useEffect(function() --[[ Line: 121 ]]
            -- upvalues: v9 (ref), v24 (ref), v45 (copy), l_SettingsShowSignal_0 (ref), v43 (copy)
            local v59 = v9.createEffect(function(v57) --[[ Line: 122 ]]
                -- upvalues: v24 (ref), v45 (ref)
                local v58 = v24.Stores.GetInspectAndBuyStore(v57).getInspectAndBuyOpen(v57);
                v45(v58);
            end);
            l_SettingsShowSignal_0:connect(function(v60) --[[ Line: 127 ]]
                -- upvalues: v43 (ref)
                v43(v60);
            end);
            return function() --[[ Line: 131 ]]
                -- upvalues: v59 (copy)
                v59();
            end;
        end, {});
    end;
    v2.useEffect(function() --[[ Line: 141 ]]
        -- upvalues: v18 (ref), v34 (copy), v36 (copy), v37 (ref), v39 (copy), v53 (copy), v8 (ref), v19 (ref), v55 (copy), v35 (copy), v31 (ref), v21 (ref), l_UserInputService_0 (ref), v22 (ref), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (ref), l_getUIScale_0 (ref)
        local v61 = nil;
        local v62 = nil;
        local v63 = v18:dragConnection(v34.integration.id);
        if v63 then
            v61 = v63.connection;
            v62 = v63.inputObject;
        end;
        assert(v36.current ~= nil);
        assert(v36.current.Parent ~= nil);
        local l_current_0 = v36.current;
        local l_AbsoluteSize_0 = v36.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize;
        if v61 ~= nil then
            v37 = v61;
            v39(true);
            if v37 then
                v53((v8.instant(v19.WINDOW_ICON_SIZE)));
                v55((v8.instant(v19.WINDOW_ICON_SIZE)));
                task.defer(v53, v8.spring(v35.X.Offset, v31));
                task.defer(v55, v8.spring(v35.Y.Offset, v31));
                local v66 = Vector3.new(v36.current.AbsolutePosition.X, v36.current.AbsolutePosition.Y, 0);
                v21.default:setWindowDefaultPosition(v34.integration.id, Vector2.new(v66.X, v66.Y));
                v37.current = l_UserInputService_0.InputChanged:Connect(function(v67, _) --[[ Line: 176 ]]
                    -- upvalues: v22 (ref), v62 (ref), v66 (copy), v66 (copy), l_AbsoluteSize_0 (copy), l_current_0 (copy)
                    local l_Position_0 = v67.Position;
                    if v22(v62, v67) then
                        return;
                    else
                        local v70 = l_Position_0 - v66;
                        local v71 = {
                            X = math.clamp((v70 + v66).X, 0, l_AbsoluteSize_0.X), 
                            Y = math.clamp((v70 + v66).Y, 0, l_AbsoluteSize_0.Y)
                        };
                        l_current_0.Position = UDim2.fromOffset(v71.X, v71.Y);
                        return;
                    end;
                end);
            end;
        else
            local v72 = nil;
            if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 and v34.position then
                local v73 = l_getUIScale_0(false);
                local v74 = v73 * v34.position.X.Offset;
                local v75 = v73 * v34.position.Y.Offset;
                v72 = UDim2.new(v34.position.X.Scale, v74, v34.position.Y.Scale, v75);
            else
                v72 = v34.position or UDim2.new();
            end;
            if v34.integration.integration.cachePosition then
                local v76 = v18:windowPosition(v34.integration.id) or UDim2.new();
                local v77 = if v76.X.Scale == 1 then l_AbsoluteSize_0.X else 0;
                l_current_0.Position = UDim2.new(0, v77 + v76.X.Offset, 0, v76.Y.Offset);
            else
                local v78 = if v72.X.Scale == 1 then l_AbsoluteSize_0.X else 0;
                l_current_0.Position = UDim2.new(0, v78 + v72.X.Offset, 0, v72.Y.Offset);
            end;
        end;
    end, {});
    local v80 = v2.useCallback(function(v79) --[[ Line: 217 ]]
        -- upvalues: v34 (copy), v18 (ref)
        if v34.integration.integration.cachePosition then
            v18:updateWindowPosition(v34.integration.id, v79);
        end;
    end, {
        v34.integration
    });
    local v81 = v2.useCallback(function() --[[ Line: 223 ]]
        -- upvalues: l_VRService_0 (ref), v33 (ref), l_MouseIconOverrideService_0 (ref), v16 (ref)
        if not l_VRService_0.VREnabled then
            v33 = true;
            l_MouseIconOverrideService_0.push(v16, Enum.OverrideMouseIconBehavior.ForceShow);
        end;
    end);
    local v82 = v2.useCallback(function() --[[ Line: 230 ]]
        -- upvalues: v33 (ref), l_MouseIconOverrideService_0 (ref), v16 (ref)
        if v33 then
            v33 = false;
            l_MouseIconOverrideService_0.pop(v16);
        end;
    end);
    local v96 = v2.useCallback(function(_, v84) --[[ Line: 237 ]]
        -- upvalues: v36 (copy), v56 (copy), v21 (ref), v34 (copy), v37 (ref), v50 (copy), v28 (ref), v52 (copy), v54 (copy), l_UserInputService_0 (ref), v22 (ref), v40 (ref), v19 (ref), v39 (copy)
        assert(v36.current ~= nil);
        assert(v36.current.Parent ~= nil);
        local l_current_1 = v36.current;
        local l_AbsoluteSize_1 = v36.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize;
        local v87 = v56();
        local l_Position_1 = v84.Position;
        local v89 = Vector3.new(v36.current.AbsolutePosition.X + v87.X, v36.current.AbsolutePosition.Y + v87.Y, 0);
        if v84.UserInputType == Enum.UserInputType.MouseButton1 or v84.UserInputType == Enum.UserInputType.Touch then
            v21.default:onWindowTouchBegan(v34.integration.id, Vector2.new(v36.current.AbsolutePosition.X, v36.current.AbsolutePosition.Y));
            if not v37.current and not v50:getValue() then
                local v90 = {
                    X = math.clamp(v89.X, 0, if v28 then math.max(0, l_AbsoluteSize_1.X - (v52:getValue() - v87.X)) else l_AbsoluteSize_1.X - (v52:getValue() - v87.X)), 
                    Y = math.clamp(v89.Y, 0, if v28 then math.max(0, l_AbsoluteSize_1.Y - (v54:getValue() - v87.Y)) else l_AbsoluteSize_1.Y - (v54:getValue() - v87.Y))
                };
                l_current_1.Position = UDim2.fromOffset(v90.X, v90.Y);
                v37.current = l_UserInputService_0.InputChanged:Connect(function(v91, _) --[[ Line: 286 ]]
                    -- upvalues: v22 (ref), v84 (copy), l_Position_1 (copy), v40 (ref), v19 (ref), v39 (ref), v89 (copy), v87 (copy), v28 (ref), l_AbsoluteSize_1 (copy), v52 (ref), v54 (ref), l_current_1 (copy), v21 (ref), v34 (ref)
                    if v22(v84, v91) then
                        return;
                    else
                        local l_Position_2 = v91.Position;
                        local v94 = l_Position_2 - l_Position_1;
                        v40 = v40 + v94.Magnitude;
                        if v40 > v19.WINDOW_MIN_DRAG_DISTANCE then
                            v39(true);
                            local v95 = {
                                X = math.clamp((v94 + v89).X, v87.X, if v28 then math.max(v87.X, l_AbsoluteSize_1.X - (v52:getValue() - v87.X)) else l_AbsoluteSize_1.X - (v52:getValue() - v87.X)), 
                                Y = math.clamp((v94 + v89).Y, v87.Y, if v28 then math.max(v87.Y, l_AbsoluteSize_1.Y - (v54:getValue() - v87.Y)) else l_AbsoluteSize_1.Y - (v54:getValue() - v87.Y))
                            };
                            l_current_1.Position = UDim2.fromOffset(v95.X, v95.Y);
                            v21.default:onWindowDrag(v34.integration.id, l_Position_2);
                        end;
                        return;
                    end;
                end);
            end;
        end;
    end, {
        v56
    });
    local function v104(v97) --[[ Line: 329 ]]
        -- upvalues: v56 (copy), v52 (copy), v54 (copy)
        local l_Parent_0 = v97.Parent;
        local l_Offset_0 = v97.Position.X.Offset;
        local l_Offset_1 = v97.Position.Y.Offset;
        local v101 = v56();
        local l_AbsoluteSize_2 = l_Parent_0.AbsoluteSize;
        local v103 = true;
        if l_Offset_0 >= v101.X then
            v103 = true;
            if l_AbsoluteSize_2.X - (v52:getValue() - v101.X) >= l_Offset_0 then
                v103 = true;
                if l_Offset_1 >= v101.Y then
                    v103 = l_AbsoluteSize_2.Y - (v54:getValue() - v101.Y) < l_Offset_1;
                end;
            end;
        end;
        return v103;
    end;
    local v117 = v2.useCallback(function(v105) --[[ Line: 346 ]]
        -- upvalues: v36 (copy), v41 (ref), v104 (copy), v56 (copy), v52 (copy), v54 (copy), v80 (copy), v51 (copy), l_TweenService_0 (ref)
        if v36 == nil or v36.current == nil then
            return;
        else
            assert(v36.current ~= nil);
            assert(v36.current.Parent ~= nil);
            local l_current_2 = v36.current;
            local l_Offset_2 = l_current_2.Position.X.Offset;
            local l_Offset_3 = l_current_2.Position.Y.Offset;
            if v41 and v41.PlaybackState == Enum.PlaybackState.Playing then
                v41:Cancel();
            end;
            if v104(l_current_2) then
                if l_current_2 == nil then
                    return;
                else
                    local l_Parent_1 = v36.current.Parent;
                    local v110 = v56();
                    local l_AbsoluteSize_3 = l_Parent_1.AbsoluteSize;
                    local v112 = 0;
                    local v113 = 0;
                    if l_AbsoluteSize_3.X > v52:getValue() then
                        v112 = math.clamp(l_Offset_2, v110.X, l_AbsoluteSize_3.X - (v52:getValue() - v110.X));
                    end;
                    if l_AbsoluteSize_3.Y > v54:getValue() then
                        v113 = math.clamp(l_Offset_3, v110.Y, l_AbsoluteSize_3.Y - (v54:getValue() - v110.Y));
                    end;
                    local v114 = UDim2.new(0, v112, 0, v113);
                    v80(v114);
                    if not v105 then
                        v51(true);
                        local v115 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                        v41 = l_TweenService_0:Create(l_current_2, v115, {
                            Position = v114
                        });
                        assert(v41 ~= nil);
                        v41.Completed:Connect(function(_) --[[ Line: 400 ]]
                            -- upvalues: v51 (ref), v41 (ref)
                            v51(false);
                            v41 = nil;
                        end);
                        v41:Play();
                        return;
                    else
                        l_current_2.Position = v114;
                        return;
                    end;
                end;
            else
                v80(UDim2.new(0, l_Offset_2, 0, l_Offset_3));
                return;
            end;
        end;
    end, {
        v56
    });
    local v120 = v2.useCallback(function(_, v119) --[[ Line: 413 ]]
        -- upvalues: v40 (ref), v36 (copy), v21 (ref), v34 (copy), v104 (copy), v37 (ref), v39 (copy), v18 (ref), v117 (copy)
        v40 = 0;
        if v119.UserInputType == Enum.UserInputType.MouseButton1 or v119.UserInputType == Enum.UserInputType.Touch then
            if v36.current then
                v21.default:onWindowTouchEnded(v34.integration.id, Vector2.new(v36.current.AbsolutePosition.X, v36.current.AbsolutePosition.Y), (v104(v36.current)));
            end;
            if v37.current then
                v37.current:Disconnect();
                v37.current = nil;
                v39(false);
                v18:gesture(v34.integration.id, nil);
                v117();
            end;
        end;
    end, {});
    local l_v27_0 = v27;
    local v122 = l_useStyleSheet_0();
    return v3.createPortal({
        Name = v2.createElement("ScreenGui", {
            Name = v19.WINDOW_HOST_GUI_NAME .. ":" .. v34.integration.id, 
            [v2.Change.AbsoluteSize] = v17(function() --[[ Line: 446 ]]
                -- upvalues: v117 (copy)
                v117();
            end, 0.2), 
            DisplayOrder = if l_FFlagTopBarSignalizeMenuOpen_0 and v47 then v47:map(function(v123) --[[ Line: 450 ]]
                -- upvalues: l_v27_0 (copy)
                if v123 then
                    return -1;
                else
                    return l_v27_0;
                end;
            end) else v49 and -1 or l_v27_0, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            WindowFrame = v2.createElement("Frame", {
                Size = v2.joinBindings({
                    v52, 
                    v54
                }):map(function(v124) --[[ Line: 458 ]]
                    -- upvalues: v117 (copy)
                    v117(true);
                    return UDim2.fromOffset(v124[1], v124[2]);
                end), 
                LayoutOrder = 1, 
                ref = v36, 
                BorderSizePixel = 0, 
                AnchorPoint = if v34.integration.integration.windowAnchorPoint then v34.integration.integration.windowAnchorPoint else nil, 
                BackgroundTransparency = 1
            }, {
                WindowWrapper = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    Integration = v34.integration.component(v34) or nil, 
                    InputShield = v2.createElement(l_Interactable_0, {
                        ZIndex = v32.INPUT_SHIELD, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        Visible = v38
                    }), 
                    InputWrapper = v2.createElement("Frame", {
                        ZIndex = v32.INPUT_WRAPPER, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        [v2.Event.InputBegan] = v96, 
                        [v2.Event.InputEnded] = v120, 
                        [v2.Event.MouseEnter] = v81, 
                        [v2.Event.MouseLeave] = v82, 
                        [v2.Event.Destroying] = v82
                    })
                })
            }), 
            FoundationStyleLink = v2.createElement("StyleLink", {
                StyleSheet = v122
            })
        })
    }, l_CoreGui_0);
end;