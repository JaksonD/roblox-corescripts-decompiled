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
local _ = require(l_CorePackages_0.Workspace.Packages.Chrome);
local v21 = require(l_script_FirstAncestor_0.Analytics.ChromeAnalytics);
local v22 = require(l_script_FirstAncestor_0.Utility.shouldRejectMultiTouch);
local l_SettingsShowSignal_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal;
local v24 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_FFlagTopBarSignalizeMenuOpen_0 = v24.Flags.FFlagTopBarSignalizeMenuOpen;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v27 = game:DefineFastInt("ChromeWindowLayoutOrder", 2);
local v28 = game:DefineFastFlag("FixWindowDragError", false);
local v29 = game:DefineFastFlag("FixWindowDragStaleConnection", false);
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local v31 = require(l_script_FirstAncestor_0.Hooks.useWindowSize);
local v32 = {
    dampingRatio = 1, 
    frequency = 3
};
local v33 = {
    INTEGRATION = 1, 
    CLOSE_BUTTON = 2, 
    INPUT_SHIELD = 3, 
    INPUT_WRAPPER = 4
};
local v34 = false;
return function(v35) --[[ Line: 71 ]]
    -- upvalues: v31 (copy), v2 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), l_useSelector_0 (copy), v8 (copy), v32 (copy), v9 (copy), v24 (copy), l_SettingsShowSignal_0 (copy), v18 (copy), v19 (copy), v21 (copy), l_UserInputService_0 (copy), v22 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_getUIScale_0 (copy), l_VRService_0 (copy), v34 (ref), l_MouseIconOverrideService_0 (copy), v16 (copy), v29 (copy), v28 (copy), l_TweenService_0 (copy), v27 (copy), l_useStyleSheet_0 (copy), v3 (copy), v17 (copy), l_Interactable_0 (copy), v33 (copy), l_CoreGui_0 (copy)
    local v36 = v31(v35.integration.integration);
    local v37 = v2.useRef(nil);
    local v38 = v2.useRef(nil);
    local v39, v40 = v2.useBinding(false);
    local v41 = 0;
    local v42 = v2.useMemo(function() --[[ Line: 77 ]]
        return nil;
    end, {});
    local v43, v44 = v2.useBinding(false);
    local v45, v46 = v2.useBinding(false);
    local v48 = if l_FFlagTopBarSignalizeMenuOpen_0 then v2.joinBindings({
        v43, 
        v45
    }):map(function(v47) --[[ Line: 85 ]]
        return v47[1] or v47[2];
    end) else nil;
    local v50 = if not l_FFlagTopBarSignalizeMenuOpen_0 then l_useSelector_0(function(v49) --[[ Line: 91 ]]
        return v49.displayOptions.menuOpen or v49.displayOptions.inspectMenuOpen;
    end) else nil;
    local v51, v52 = v2.useBinding(false);
    local v53, v54 = v8.useAnimatedBinding(v36.X.Offset);
    local v55, v56 = v8.useAnimatedBinding(v36.Y.Offset);
    local v57 = v2.useCallback(function() --[[ Line: 102 ]]
        -- upvalues: v53 (copy), v55 (copy), v35 (copy)
        return Vector2.new(v53:getValue(), v55:getValue()) * (v35.integration.integration.windowAnchorPoint or Vector2.zero);
    end, {
        v53, 
        v55, 
        v35.integration
    });
    v2.useEffect(function() --[[ Line: 107 ]]
        -- upvalues: v53 (copy), v54 (copy), v8 (ref), v36 (copy), v32 (ref)
        if v53:getValue() == 0 then
            v54((v8.instant(v36.X.Offset)));
            return;
        else
            v54(v8.spring(v36.X.Offset, v32));
            return;
        end;
    end, {
        v36.X.Offset
    });
    v2.useEffect(function() --[[ Line: 115 ]]
        -- upvalues: v55 (copy), v56 (copy), v8 (ref), v36 (copy), v32 (ref)
        if v55:getValue() == 0 then
            v56((v8.instant(v36.Y.Offset)));
            return;
        else
            v56(v8.spring(v36.Y.Offset, v32));
            return;
        end;
    end, {
        v36.Y.Offset
    });
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        v2.useEffect(function() --[[ Line: 124 ]]
            -- upvalues: v9 (ref), v24 (ref), v46 (copy), l_SettingsShowSignal_0 (ref), v44 (copy)
            local v60 = v9.createEffect(function(v58) --[[ Line: 125 ]]
                -- upvalues: v24 (ref), v46 (ref)
                local v59 = v24.Stores.GetInspectAndBuyStore(v58).getInspectAndBuyOpen(v58);
                v46(v59);
            end);
            l_SettingsShowSignal_0:connect(function(v61) --[[ Line: 130 ]]
                -- upvalues: v44 (ref)
                v44(v61);
            end);
            return function() --[[ Line: 134 ]]
                -- upvalues: v60 (copy)
                v60();
            end;
        end, {});
    end;
    v2.useEffect(function() --[[ Line: 144 ]]
        -- upvalues: v18 (ref), v35 (copy), v37 (copy), v38 (ref), v40 (copy), v54 (copy), v8 (ref), v19 (ref), v56 (copy), v36 (copy), v32 (ref), v21 (ref), l_UserInputService_0 (ref), v22 (ref), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (ref), l_getUIScale_0 (ref)
        local v62 = nil;
        local v63 = nil;
        local v64 = v18:dragConnection(v35.integration.id);
        if v64 then
            v62 = v64.connection;
            v63 = v64.inputObject;
        end;
        assert(v37.current ~= nil);
        assert(v37.current.Parent ~= nil);
        local l_current_0 = v37.current;
        local l_AbsoluteSize_0 = v37.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize;
        if v62 ~= nil then
            v38 = v62;
            v40(true);
            if v38 then
                v54((v8.instant(v19.WINDOW_ICON_SIZE)));
                v56((v8.instant(v19.WINDOW_ICON_SIZE)));
                task.defer(v54, v8.spring(v36.X.Offset, v32));
                task.defer(v56, v8.spring(v36.Y.Offset, v32));
                local v67 = Vector3.new(v37.current.AbsolutePosition.X, v37.current.AbsolutePosition.Y, 0);
                v21.default:setWindowDefaultPosition(v35.integration.id, Vector2.new(v67.X, v67.Y));
                v38.current = l_UserInputService_0.InputChanged:Connect(function(v68, _) --[[ Line: 179 ]]
                    -- upvalues: v22 (ref), v63 (ref), v67 (copy), v67 (copy), l_AbsoluteSize_0 (copy), l_current_0 (copy)
                    local l_Position_0 = v68.Position;
                    if v22(v63, v68) then
                        return;
                    else
                        local v71 = l_Position_0 - v67;
                        local v72 = {
                            X = math.clamp((v71 + v67).X, 0, l_AbsoluteSize_0.X), 
                            Y = math.clamp((v71 + v67).Y, 0, l_AbsoluteSize_0.Y)
                        };
                        l_current_0.Position = UDim2.fromOffset(v72.X, v72.Y);
                        return;
                    end;
                end);
            end;
        else
            local v73 = nil;
            if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 and v35.position then
                local v74 = l_getUIScale_0(false);
                local v75 = v74 * v35.position.X.Offset;
                local v76 = v74 * v35.position.Y.Offset;
                v73 = UDim2.new(v35.position.X.Scale, v75, v35.position.Y.Scale, v76);
            else
                v73 = v35.position or UDim2.new();
            end;
            if v35.integration.integration.cachePosition then
                local v77 = v18:windowPosition(v35.integration.id) or UDim2.new();
                local v78 = if v77.X.Scale == 1 then l_AbsoluteSize_0.X else 0;
                l_current_0.Position = UDim2.new(0, v78 + v77.X.Offset, 0, v77.Y.Offset);
            else
                local v79 = if v73.X.Scale == 1 then l_AbsoluteSize_0.X else 0;
                l_current_0.Position = UDim2.new(0, v79 + v73.X.Offset, 0, v73.Y.Offset);
            end;
        end;
    end, {});
    local v81 = v2.useCallback(function(v80) --[[ Line: 220 ]]
        -- upvalues: v35 (copy), v18 (ref)
        if v35.integration.integration.cachePosition then
            v18:updateWindowPosition(v35.integration.id, v80);
        end;
    end, {
        v35.integration
    });
    local v82 = v2.useCallback(function() --[[ Line: 226 ]]
        -- upvalues: l_VRService_0 (ref), v34 (ref), l_MouseIconOverrideService_0 (ref), v16 (ref)
        if not l_VRService_0.VREnabled then
            v34 = true;
            l_MouseIconOverrideService_0.push(v16, Enum.OverrideMouseIconBehavior.ForceShow);
        end;
    end);
    local v83 = v2.useCallback(function() --[[ Line: 233 ]]
        -- upvalues: v34 (ref), l_MouseIconOverrideService_0 (ref), v16 (ref)
        if v34 then
            v34 = false;
            l_MouseIconOverrideService_0.pop(v16);
        end;
    end);
    local v97 = v2.useCallback(function(_, v85) --[[ Line: 240 ]]
        -- upvalues: v37 (copy), v57 (copy), v21 (ref), v35 (copy), v29 (ref), v38 (ref), v40 (copy), v51 (copy), v28 (ref), v53 (copy), v55 (copy), l_UserInputService_0 (ref), v22 (ref), v41 (ref), v19 (ref)
        assert(v37.current ~= nil);
        assert(v37.current.Parent ~= nil);
        local l_current_1 = v37.current;
        local l_AbsoluteSize_1 = v37.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize;
        local v88 = v57();
        local l_Position_1 = v85.Position;
        local v90 = Vector3.new(v37.current.AbsolutePosition.X + v88.X, v37.current.AbsolutePosition.Y + v88.Y, 0);
        if v85.UserInputType == Enum.UserInputType.MouseButton1 or v85.UserInputType == Enum.UserInputType.Touch then
            v21.default:onWindowTouchBegan(v35.integration.id, Vector2.new(v37.current.AbsolutePosition.X, v37.current.AbsolutePosition.Y));
            if v29 and v38.current then
                v38.current:Disconnect();
                v38.current = nil;
                v40(false);
            end;
            if (v29 and true or not v38.current) and not v51:getValue() then
                local v91 = {
                    X = math.clamp(v90.X, 0, if v28 then math.max(0, l_AbsoluteSize_1.X - (v53:getValue() - v88.X)) else l_AbsoluteSize_1.X - (v53:getValue() - v88.X)), 
                    Y = math.clamp(v90.Y, 0, if v28 then math.max(0, l_AbsoluteSize_1.Y - (v55:getValue() - v88.Y)) else l_AbsoluteSize_1.Y - (v55:getValue() - v88.Y))
                };
                l_current_1.Position = UDim2.fromOffset(v91.X, v91.Y);
                v38.current = l_UserInputService_0.InputChanged:Connect(function(v92, _) --[[ Line: 300 ]]
                    -- upvalues: v22 (ref), v85 (copy), l_Position_1 (copy), v41 (ref), v29 (ref), v19 (ref), v40 (ref), v90 (copy), v88 (copy), v28 (ref), l_AbsoluteSize_1 (copy), v53 (ref), v55 (ref), l_current_1 (copy), v21 (ref), v35 (ref)
                    if v22(v85, v92) then
                        return;
                    else
                        local l_Position_2 = v92.Position;
                        local v95 = l_Position_2 - l_Position_1;
                        v41 = if v29 then v95.Magnitude else v41 + v95.Magnitude;
                        if v41 > v19.WINDOW_MIN_DRAG_DISTANCE then
                            v40(true);
                            local v96 = {
                                X = math.clamp((v95 + v90).X, v88.X, if v28 then math.max(v88.X, l_AbsoluteSize_1.X - (v53:getValue() - v88.X)) else l_AbsoluteSize_1.X - (v53:getValue() - v88.X)), 
                                Y = math.clamp((v95 + v90).Y, v88.Y, if v28 then math.max(v88.Y, l_AbsoluteSize_1.Y - (v55:getValue() - v88.Y)) else l_AbsoluteSize_1.Y - (v55:getValue() - v88.Y))
                            };
                            l_current_1.Position = UDim2.fromOffset(v96.X, v96.Y);
                            v21.default:onWindowDrag(v35.integration.id, l_Position_2);
                        end;
                        return;
                    end;
                end);
            end;
        end;
    end, {
        v57
    });
    local function v105(v98) --[[ Line: 346 ]]
        -- upvalues: v57 (copy), v53 (copy), v55 (copy)
        local l_Parent_0 = v98.Parent;
        local l_Offset_0 = v98.Position.X.Offset;
        local l_Offset_1 = v98.Position.Y.Offset;
        local v102 = v57();
        local l_AbsoluteSize_2 = l_Parent_0.AbsoluteSize;
        local v104 = true;
        if l_Offset_0 >= v102.X then
            v104 = true;
            if l_AbsoluteSize_2.X - (v53:getValue() - v102.X) >= l_Offset_0 then
                v104 = true;
                if l_Offset_1 >= v102.Y then
                    v104 = l_AbsoluteSize_2.Y - (v55:getValue() - v102.Y) < l_Offset_1;
                end;
            end;
        end;
        return v104;
    end;
    local v118 = v2.useCallback(function(v106) --[[ Line: 363 ]]
        -- upvalues: v37 (copy), v42 (ref), v105 (copy), v57 (copy), v53 (copy), v55 (copy), v81 (copy), v52 (copy), l_TweenService_0 (ref)
        if v37 == nil or v37.current == nil then
            return;
        else
            assert(v37.current ~= nil);
            assert(v37.current.Parent ~= nil);
            local l_current_2 = v37.current;
            local l_Offset_2 = l_current_2.Position.X.Offset;
            local l_Offset_3 = l_current_2.Position.Y.Offset;
            if v42 and v42.PlaybackState == Enum.PlaybackState.Playing then
                v42:Cancel();
            end;
            if v105(l_current_2) then
                if l_current_2 == nil then
                    return;
                else
                    local l_Parent_1 = v37.current.Parent;
                    local v111 = v57();
                    local l_AbsoluteSize_3 = l_Parent_1.AbsoluteSize;
                    local v113 = 0;
                    local v114 = 0;
                    if l_AbsoluteSize_3.X > v53:getValue() then
                        v113 = math.clamp(l_Offset_2, v111.X, l_AbsoluteSize_3.X - (v53:getValue() - v111.X));
                    end;
                    if l_AbsoluteSize_3.Y > v55:getValue() then
                        v114 = math.clamp(l_Offset_3, v111.Y, l_AbsoluteSize_3.Y - (v55:getValue() - v111.Y));
                    end;
                    local v115 = UDim2.new(0, v113, 0, v114);
                    v81(v115);
                    if not v106 then
                        v52(true);
                        local v116 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                        v42 = l_TweenService_0:Create(l_current_2, v116, {
                            Position = v115
                        });
                        assert(v42 ~= nil);
                        v42.Completed:Connect(function(_) --[[ Line: 417 ]]
                            -- upvalues: v52 (ref), v42 (ref)
                            v52(false);
                            v42 = nil;
                        end);
                        v42:Play();
                        return;
                    else
                        l_current_2.Position = v115;
                        return;
                    end;
                end;
            else
                v81(UDim2.new(0, l_Offset_2, 0, l_Offset_3));
                return;
            end;
        end;
    end, {
        v57
    });
    local v121 = v2.useCallback(function(_, v120) --[[ Line: 430 ]]
        -- upvalues: v41 (ref), v37 (copy), v21 (ref), v35 (copy), v105 (copy), v38 (ref), v40 (copy), v18 (ref), v118 (copy)
        v41 = 0;
        if v120.UserInputType == Enum.UserInputType.MouseButton1 or v120.UserInputType == Enum.UserInputType.Touch then
            if v37.current then
                v21.default:onWindowTouchEnded(v35.integration.id, Vector2.new(v37.current.AbsolutePosition.X, v37.current.AbsolutePosition.Y), (v105(v37.current)));
            end;
            if v38.current then
                v38.current:Disconnect();
                v38.current = nil;
                v40(false);
                v18:gesture(v35.integration.id, nil);
                v118();
            end;
        end;
    end, {});
    local l_v27_0 = v27;
    local v123 = l_useStyleSheet_0();
    return v3.createPortal({
        Name = v2.createElement("ScreenGui", {
            Name = v19.WINDOW_HOST_GUI_NAME .. ":" .. v35.integration.id, 
            [v2.Change.AbsoluteSize] = v17(function() --[[ Line: 463 ]]
                -- upvalues: v118 (copy)
                v118();
            end, 0.2), 
            DisplayOrder = if l_FFlagTopBarSignalizeMenuOpen_0 and v48 then v48:map(function(v124) --[[ Line: 467 ]]
                -- upvalues: l_v27_0 (copy)
                if v124 then
                    return -1;
                else
                    return l_v27_0;
                end;
            end) else v50 and -1 or l_v27_0, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            WindowFrame = v2.createElement("Frame", {
                Size = v2.joinBindings({
                    v53, 
                    v55
                }):map(function(v125) --[[ Line: 475 ]]
                    -- upvalues: v118 (copy)
                    v118(true);
                    return UDim2.fromOffset(v125[1], v125[2]);
                end), 
                LayoutOrder = 1, 
                ref = v37, 
                BorderSizePixel = 0, 
                AnchorPoint = if v35.integration.integration.windowAnchorPoint then v35.integration.integration.windowAnchorPoint else nil, 
                BackgroundTransparency = 1
            }, {
                WindowWrapper = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    Integration = v35.integration.component(v35) or nil, 
                    InputShield = v2.createElement(l_Interactable_0, {
                        ZIndex = v33.INPUT_SHIELD, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        Visible = v39
                    }), 
                    InputWrapper = v2.createElement("Frame", {
                        ZIndex = v33.INPUT_WRAPPER, 
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        [v2.Event.InputBegan] = v97, 
                        [v2.Event.InputEnded] = v121, 
                        [v2.Event.MouseEnter] = v82, 
                        [v2.Event.MouseLeave] = v83, 
                        [v2.Event.Destroying] = v83
                    })
                })
            }), 
            FoundationStyleLink = v2.createElement("StyleLink", {
                StyleSheet = v123
            })
        })
    }, l_CoreGui_0);
end;