local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagDebugEnableUnibarDummyIntegrations_0 = v5.GetFFlagDebugEnableUnibarDummyIntegrations;
local l_GetFIntIconSelectionTimeout_0 = v5.GetFIntIconSelectionTimeout;
local l_GetFFlagChromeCentralizedConfiguration_0 = v5.GetFFlagChromeCentralizedConfiguration;
local l_FFlagEnableConsoleExpControls_0 = v5.FFlagEnableConsoleExpControls;
local l_GetFFlagSimpleChatUnreadMessageCount_0 = v5.GetFFlagSimpleChatUnreadMessageCount;
local l_FFlagAddUILessMode_0 = v5.FFlagAddUILessMode;
local l_FIntAddUILessModeVariant_0 = v5.FIntAddUILessModeVariant;
local l_FFlagEnableInExperienceAvatarSwitcher_0 = v5.FFlagEnableInExperienceAvatarSwitcher;
local l_FFlagUnibarMenuOpenSubmenu_0 = require(script.Parent.Parent.Parent.Flags).FFlagUnibarMenuOpenSubmenu;
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v17 = require(l_script_FirstAncestor_0.Service);
local v18 = require(l_script_FirstAncestor_0.Unibar.UnibarStyle);
local _ = if l_GetFFlagChromeCentralizedConfiguration_0() then nil else require(l_script_FirstAncestor_0.Parent.Integrations);
local v20 = require(l_script_FirstAncestor_0.Unibar.SubMenu);
local v21 = require(l_script_FirstAncestor_0.Unibar.WindowManager);
local v22 = require(l_script_FirstAncestor_0.Shortcuts.ShortcutBar);
local v23 = require(l_script_FirstAncestor_0.Unibar.Constants);
local v24 = require(l_script_FirstAncestor_0.Hooks.useChromeMenuItems);
local v25 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
local v26 = require(l_script_FirstAncestor_0.Hooks.useMappedObservableValue);
local v27 = require(l_script_FirstAncestor_0.Unibar.ComponentHosts.IconHost);
local v28 = require(l_CorePackages_0.Packages.ReactOtter);
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_FFlagReduceTopBarInsetsWhileHidden_0 = v5.FFlagReduceTopBarInsetsWhileHidden;
local l_Stores_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Stores;
local l_createEffect_0 = require(l_CorePackages_0.Packages.Signals).createEffect;
local v33 = require(l_script_FirstAncestor_0.Parent.Integrations.Party.Constants);
local v34 = require(l_script_FirstAncestor_0.Parent.Integrations.Connect.isConnectUnibarEnabled);
local v35 = require(l_script_FirstAncestor_0.Parent.Integrations.Connect.isConnectDropdownEnabled);
local v36 = if l_FFlagEnableConsoleExpControls_0 then require(l_script_FirstAncestor_0.Parent.Parent.TopBar.Components.GamepadConnector) else nil;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v38 = nil;
local v39 = nil;
local v40 = nil;
if l_isInExperienceUIVREnabled_0 then
    local v41 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
    v38 = v41.Panel3DInSpatialUI;
    v39 = v41.Constants.PanelType;
    v40 = require(l_CorePackages_0.Workspace.Packages.Observable).ObservableValue.new(true);
end;
if not l_GetFFlagChromeCentralizedConfiguration_0() then
    configureUnibar = function() --[[ Line: 75 ]] --[[ Name: configureUnibar ]]
        -- upvalues: v35 (copy), l_GetFFlagDebugEnableUnibarDummyIntegrations_0 (copy), v34 (copy), v33 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), v17 (copy), l_FFlagEnableInExperienceAvatarSwitcher_0 (copy), v23 (copy), l_GuiService_0 (copy)
        local v42 = {
            "leaderboard", 
            "emotes", 
            "backpack"
        };
        table.insert(v42, "respawn");
        table.insert(v42, 1, "trust_and_safety");
        if v35() then
            table.insert(v42, 1, "connect_dropdown");
        end;
        local v43 = {
            "toggle_mic_mute", 
            "chat", 
            "nine_dot"
        };
        table.insert(v43, 2, "join_voice");
        if l_GetFFlagDebugEnableUnibarDummyIntegrations_0() then
            table.insert(v43, 1, "dummy_window");
            table.insert(v43, 1, "dummy_window_2");
        end;
        if v34() then
            table.insert(v43, 1, "connect_unibar");
        end;
        local v44 = table.find(v43, "toggle_mic_mute");
        if v44 then
            table.insert(v43, v44 + 1, v33.TOGGLE_MIC_INTEGRATION_ID);
        end;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            v17:configureMenu({
                {
                    "vr_toggle_button", 
                    "vr_safety_bubble"
                }, 
                v43
            });
        else
            v17:configureMenu({
                v43
            });
        end;
        if l_isInExperienceUIVREnabled_0 then
            if not l_isSpatial_0() then
                table.insert(v42, 2, "camera_entrypoint");
                table.insert(v42, 2, "selfie_view");
            end;
        else
            table.insert(v42, 2, "camera_entrypoint");
            table.insert(v42, 2, "selfie_view");
        end;
        if l_FFlagEnableInExperienceAvatarSwitcher_0 then
            table.insert(v42, 3, v23.AVATAR_SWITCHER_ID);
        end;
        if not l_isSpatial_0() and not l_GuiService_0:IsTenFootInterface() then
            table.insert(v42, 4, "music_entrypoint");
        end;
        v17:configureSubMenu("nine_dot", v42);
    end;
    configureUnibar();
    if l_FFlagEnableConsoleExpControls_0 then
        require(script.Parent.Parent.Shortcuts.ConfigureShortcuts)();
    end;
end;
IconDivider = function(v45) --[[ Line: 154 ]] --[[ Name: IconDivider ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v18 (copy), v23 (copy), v4 (copy)
    local v46 = l_useStyle_0();
    local _ = nil;
    local v48 = nil;
    v48 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then v18.use().ICON_DIVIDER_POSITION else v23.ICON_DIVIDER_POSITION;
    return v4.createElement("Frame", {
        Position = v45.position, 
        Size = UDim2.new(0, v23.DIVIDER_CELL_WIDTH, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        DividerBar = v4.createElement("Frame", {
            Position = v48, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = v23.ICON_DIVIDER_SIZE, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v46.Theme.Divider.Color, 
            BackgroundTransparency = if v45.toggleTransition then v45.toggleTransition:map(function(v49) --[[ Line: 178 ]]
                -- upvalues: v46 (copy)
                return v46.Theme.Divider.Transparency + (1 - v49) * (1 - v46.Theme.Divider.Transparency);
            end) else v46.Theme.Divider.Transparency, 
            Visible = v45.visible or true
        })
    });
end;
local function _(v50, v51) --[[ Line: 187 ]] --[[ Name: getSelectedChild ]]
    -- upvalues: v23 (copy)
    return v50.current:FindFirstChild(v23.ICON_NAME_PREFIX .. tostring(v51), true);
end;
AnimationStateHelper = function(v53) --[[ Line: 193 ]] --[[ Name: AnimationStateHelper ]]
    -- upvalues: v25 (copy), v17 (copy), v4 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy), v23 (copy), l_FFlagUnibarMenuOpenSubmenu_0 (copy), v28 (copy), l_GetFIntIconSelectionTimeout_0 (copy)
    local v54 = v25(v17:currentSubMenu());
    local v55 = v25(v17:selectedItem());
    local v56 = v25(v17:inFocusNav());
    v4.useEffect(function() --[[ Line: 199 ]]
        -- upvalues: v56 (copy), l_FFlagEnableConsoleExpControls_0 (ref), l_ContextActionService_0 (ref), v17 (ref), l_GuiService_0 (ref), v53 (copy), v55 (copy), v23 (ref), l_FFlagUnibarMenuOpenSubmenu_0 (ref)
        if v56 then
            if not l_FFlagEnableConsoleExpControls_0 then
                l_ContextActionService_0:BindCoreAction("RBXEscapeUnibar", function(_, v58, _) --[[ Line: 202 ]]
                    -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v17 (ref), l_GuiService_0 (ref)
                    if l_FFlagEnableConsoleExpControls_0 then
                        if v58 == Enum.UserInputState.End then
                            v17:disableFocusNav();
                            l_GuiService_0.SelectedCoreObject = nil;
                            return;
                        end;
                    else
                        v17:disableFocusNav();
                    end;
                end, false, Enum.KeyCode.ButtonB);
            end;
            if l_FFlagEnableConsoleExpControls_0 then
                if v53.menuFrameRef.current then
                    local l_menuFrameRef_0 = v53.menuFrameRef;
                    local l_v55_0 = v55;
                    local l_FirstChild_0 = l_menuFrameRef_0.current:FindFirstChild(v23.ICON_NAME_PREFIX .. tostring(l_v55_0), true);
                    if l_FirstChild_0 then
                        l_GuiService_0.SelectedCoreObject = l_FirstChild_0;
                        return;
                    elseif l_FFlagUnibarMenuOpenSubmenu_0 then
                        if l_FFlagEnableConsoleExpControls_0 then
                            v17:selectedItem():set("nine_dot");
                        end;
                        v17:toggleSubMenu("nine_dot");
                        return;
                    else
                        l_GuiService_0:Select(v53.menuFrameRef.current);
                        return;
                    end;
                end;
            elseif v53.menuFrameRef.current then
                l_GuiService_0:Select(v53.menuFrameRef.current);
                return;
            end;
        else
            l_ContextActionService_0:UnbindCoreAction("RBXEscapeUnibar");
            if l_GuiService_0.SelectedCoreObject and v53.menuFrameRef.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject) then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
    end, {
        v56
    });
    v4.useEffect(function() --[[ Line: 247 ]]
        -- upvalues: v54 (copy), l_FFlagUnibarMenuOpenSubmenu_0 (ref), v56 (copy), l_GuiService_0 (ref), v53 (copy), v28 (ref), v23 (ref)
        if v54 == "nine_dot" then
            if l_FFlagUnibarMenuOpenSubmenu_0 and v56 then
                l_GuiService_0:Select(v53.subMenuHostRef.current);
            end;
            v53.setToggleSubmenuTransition((v28.spring(1, v23.MENU_ANIMATION_SPRING)));
            return;
        else
            v53.setToggleSubmenuTransition((v28.spring(0, v23.MENU_ANIMATION_SPRING)));
            return;
        end;
    end, {
        v54
    });
    v4.useEffect(function() --[[ Line: 258 ]]
        -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v54 (copy), v55 (copy), l_GetFIntIconSelectionTimeout_0 (ref), v53 (copy), v23 (ref), l_GuiService_0 (ref)
        if l_FFlagEnableConsoleExpControls_0 and v54 == v55 then
            return;
        else
            local v67 = coroutine.create(function() --[[ Line: 263 ]]
                -- upvalues: l_GetFIntIconSelectionTimeout_0 (ref), v53 (ref), v55 (ref), l_FFlagEnableConsoleExpControls_0 (ref), v23 (ref), l_GuiService_0 (ref)
                local v63 = 0;
                while true do
                    if v63 < l_GetFIntIconSelectionTimeout_0() then
                        v63 = v63 + 1;
                        task.wait();
                        if v53.menuFrameRef.current and v55 then
                            local v64 = nil;
                            if l_FFlagEnableConsoleExpControls_0 then
                                local l_menuFrameRef_1 = v53.menuFrameRef;
                                local l_v55_1 = v55;
                                v64 = l_menuFrameRef_1.current:FindFirstChild(v23.ICON_NAME_PREFIX .. tostring(l_v55_1), true);
                            else
                                v64 = v53.menuFrameRef.current:FindFirstChild("IconHitArea_" .. v55, true);
                            end;
                            if v64 then
                                l_GuiService_0.SelectedCoreObject = v64;
                                return;
                            end;
                        end;
                    else
                        return;
                    end;
                end;
            end);
            coroutine.resume(v67);
            return;
        end;
    end, {
        v55, 
        if l_FFlagEnableConsoleExpControls_0 then v54 else nil
    });
    return nil;
end;
linearInterpolation = function(v68, v69, v70) --[[ Line: 289 ]] --[[ Name: linearInterpolation ]]
    return v68 * (1 - v70) + v69 * v70;
end;
IconPositionBinding = function(v71, v72, v73, v74, v75, v76, v77, v78, v79) --[[ Line: 293 ]] --[[ Name: IconPositionBinding ]]
    -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v18 (copy), v23 (copy), v4 (copy)
    local _ = nil;
    local v81 = nil;
    v81 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then v18.use().UNIBAR_END_PADDING else v23.UNIBAR_END_PADDING;
    return (v4.joinBindings({
        v71, 
        v75, 
        v76
    }):map(function(v82) --[[ Line: 313 ]]
        -- upvalues: v79 (copy), v73 (copy), v72 (copy), v74 (copy), v78 (copy), v77 (copy), v81 (ref)
        local v83 = 0;
        v83 = if v79.current then linearInterpolation(v73, v72, v82[2]) else linearInterpolation(v72, v73, v82[2]);
        local l_v74_0 = v74;
        if v78 and not v77 then
            l_v74_0 = v74 - v82[3];
        end;
        local v85 = v83 - l_v74_0;
        return UDim2.new(0, v81 + l_v74_0 + v85 * v82[1], 0, 0);
    end));
end;
local function v90(v86, _, _, v89) --[[ Line: 331 ]] --[[ Name: onUnibarSelectionChanged ]]
    -- upvalues: v17 (copy)
    if not v86:IsAncestorOf(v89) then
        v17:disableFocusNav();
    end;
end;
isLeft = function(v91) --[[ Line: 350 ]] --[[ Name: isLeft ]]
    return v91 == Enum.HorizontalAlignment.Left;
end;
Unibar = function(v92) --[[ Line: 354 ]] --[[ Name: Unibar ]]
    -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v18 (copy), v23 (copy), v4 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_Stores_0 (copy), v24 (copy), v28 (copy), v17 (copy), l_FFlagReduceTopBarInsetsWhileHidden_0 (copy), v36 (copy), v26 (copy), v27 (copy), l_GetFFlagSimpleChatUnreadMessageCount_0 (copy), l_createEffect_0 (copy), l_useStyle_0 (copy), l_FFlagUnibarMenuOpenSubmenu_0 (copy)
    local v93 = nil;
    local v94 = nil;
    local v95 = nil;
    if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then
        v93 = v18.use();
        v94 = v93.ICON_CELL_WIDTH;
        v95 = v93.UNIBAR_END_PADDING;
    else
        v94 = v23.ICON_CELL_WIDTH;
        v95 = v23.UNIBAR_END_PADDING;
    end;
    local v96 = {};
    local v97 = v4.useRef({});
    local v98 = v4.useRef(Vector2.zero);
    local v99 = v4.useRef(Vector2.zero);
    local v100 = nil;
    if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and l_Stores_0.GetUILessStore then
        v100 = v4.useRef(l_Stores_0.GetUILessStore(false));
    end;
    local v101 = false;
    local v102 = v97.current or {};
    local v103 = v24();
    local v104, v105 = v28.useAnimatedBinding(1);
    local v106, v107 = v28.useAnimatedBinding(1);
    local v108, v109 = v28.useAnimatedBinding(0);
    local v110 = v4.useRef(0);
    local v111, v112 = v28.useAnimatedBinding(1);
    local v113 = v4.useRef(false);
    local v114 = v4.useRef(0);
    local v115 = v17:currentSubMenu():get() == "nine_dot";
    local v116, v117 = v28.useAnimatedBinding(v115 and 1 or 0);
    local v118 = {};
    local v119 = 0;
    local v120 = 0;
    local v121 = 0;
    local v122 = 0;
    local v123 = 0;
    local v127 = v4.useCallback(function(v124) --[[ Line: 402 ]]
        -- upvalues: v98 (copy), v17 (ref), l_FFlagReduceTopBarInsetsWhileHidden_0 (ref), v99 (copy), l_FFlagAddUILessMode_0 (ref), l_FIntAddUILessModeVariant_0 (ref), v100 (ref), v36 (ref), v92 (copy), v23 (ref)
        local l_zero_0 = Vector2.zero;
        local l_zero_1 = Vector2.zero;
        if v124 then
            l_zero_0 = v124.AbsolutePosition;
            l_zero_1 = v124.AbsoluteSize;
            if l_zero_0 ~= v98.current then
                v98.current = l_zero_0;
                v17:setMenuAbsolutePosition(l_zero_0);
            end;
            if l_FFlagReduceTopBarInsetsWhileHidden_0 and l_zero_1 ~= v99.current then
                v99.current = l_zero_1;
            end;
            if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v100.current.getUILessModeEnabled(false) then
                if l_zero_0 ~= v98.current then
                    v98.current = l_zero_0;
                    v17:setMenuAbsolutePosition(l_zero_0);
                end;
                if l_zero_1 ~= v99.current then
                    v99.current = l_zero_1;
                end;
            end;
        end;
        if l_FFlagReduceTopBarInsetsWhileHidden_0 and v36 then
            if v124 and v92.onAreaChanged and v36:getShowTopBar():get() then
                v92.onAreaChanged(v23.UNIBAR_KEEP_OUT_AREA_ID, l_zero_0, l_zero_1);
                return;
            end;
        elseif l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v100.current.getUILessModeEnabled(false) then
            if v124 and v92.onAreaChanged and v100.current.getUIVisible(false) then
                v92.onAreaChanged(v23.UNIBAR_KEEP_OUT_AREA_ID, l_zero_0, l_zero_1);
                return;
            end;
        elseif v124 and v92.onAreaChanged then
            v92.onAreaChanged(v23.UNIBAR_KEEP_OUT_AREA_ID, l_zero_0, v124.AbsoluteSize);
        end;
    end, {});
    local v129 = v4.joinBindings({
        v106, 
        v108
    }):map(function(v128) --[[ Line: 451 ]]
        -- upvalues: v122 (ref), v94 (ref)
        return UDim2.new(0, linearInterpolation(v122, v128[2], v128[1]), 0, v94);
    end);
    local v130 = v26(v17:orderAlignment(), isLeft);
    for _, v132 in v103 do
        if v132.integration.availability:get() == v17.AvailabilitySignal.Pinned then
            v119 = v119 + 1;
        end;
    end;
    local v133 = 0;
    v133 = v130 and 1 or math.max(v119 - 1, 0);
    for v134, v135 in v103 do
        if v135.isDivider then
            local v136 = v120 + v94 * v133;
            local v137 = v102[v135.id] or v120;
            v96[v135.id] = v120;
            v101 = v101 or v137 ~= v120;
            local v138 = IconPositionBinding(v104, v137, v120, v136, v111, v108, false, v130, v113);
            local v139 = nil;
            v139 = if v130 then v4.joinBindings({
                v138, 
                v129
            }):map(function(v140) --[[ Line: 493 ]]
                -- upvalues: v94 (ref)
                return v140[1].X.Offset >= v94 * 0.5;
            end) else v4.joinBindings({
                v138, 
                v129
            }):map(function(v141) --[[ Line: 498 ]]
                -- upvalues: v94 (ref)
                local v142 = v141[1];
                local v143 = v141[2];
                return v142.X.Offset <= v143.X.Offset - v94;
            end);
            v118[v135.id or "icon" .. v134] = v4.createElement(IconDivider, {
                position = v138, 
                visible = v139, 
                toggleTransition = v106
            });
            v120 = v120 + v23.DIVIDER_CELL_WIDTH;
        elseif v135.integration then
            local v144 = false;
            local v145 = v120 + v94 * v133;
            if v135.integration.availability:get() == v17.AvailabilitySignal.Pinned then
                v144 = true;
                v145 = v121;
            end;
            local v146 = if v102[v135.id] == nil then v120 else v102[v135.id];
            v96[v135.id] = v120;
            v101 = v101 or v146 ~= v120;
            local v147 = IconPositionBinding(v104, v146, v120, v145, v111, v108, v144, v130, v113);
            local v148 = nil;
            v148 = if v130 then v4.joinBindings({
                v147, 
                v129
            }):map(function(v149) --[[ Line: 537 ]]
                -- upvalues: v94 (ref)
                return v149[1].X.Offset >= v94 * 0.5;
            end) else v4.joinBindings({
                v147, 
                v129
            }):map(function(v150) --[[ Line: 542 ]]
                -- upvalues: v94 (ref)
                local v151 = v150[1];
                local v152 = v150[2];
                return v151.X.Offset <= v152.X.Offset - v94 * 1.5;
            end);
            v118[v135.id or "icon" .. v134] = v4.createElement(v27, {
                position = v147, 
                visible = v144 or v148, 
                toggleTransition = v116, 
                integration = v135, 
                disableBadgeNumber = if l_GetFFlagSimpleChatUnreadMessageCount_0() then v135.id == "chat" else false
            });
            v120 = v120 + v94;
            if v144 then
                v121 = v121 + v94;
            end;
        end;
    end;
    v122 = v120;
    if v92.onMinWidthChanged then
        v92.onMinWidthChanged(v122);
    end;
    v123 = v95 * 2 + v120;
    v4.useEffect(function() --[[ Line: 571 ]]
        -- upvalues: v110 (copy), v108 (copy), v109 (copy), v28 (ref), v123 (ref), v23 (ref), v17 (ref), v94 (ref)
        local l_current_0 = v110.current;
        if v108:getValue() == 0 then
            v109((v28.instant(v123)));
            v110.current = v123;
        elseif l_current_0 ~= v123 then
            v109(v28.spring(v123, v23.MENU_ANIMATION_SPRING));
            v110.current = v123;
        end;
        v17:setMenuAbsoluteSize(Vector2.new(v123, v94));
    end, {
        v123
    });
    if v101 then
        v114.current = (v114.current or 0) + 1;
    end;
    v97.current = v96;
    v4.useEffect(function() --[[ Line: 589 ]]
        -- upvalues: v113 (copy), v112 (copy), v28 (ref), v23 (ref)
        if not v113.current then
            v112(v28.spring(0, v23.MENU_ANIMATION_SPRING));
            v113.current = true;
            return;
        else
            v112(v28.spring(1, v23.MENU_ANIMATION_SPRING));
            v113.current = false;
            return;
        end;
    end, {
        v114.current, 
        v113
    });
    v4.useEffect(function() --[[ Line: 601 ]]
        -- upvalues: l_FFlagReduceTopBarInsetsWhileHidden_0 (ref), v36 (ref), v92 (copy), v23 (ref), v98 (copy), v99 (copy)
        if l_FFlagReduceTopBarInsetsWhileHidden_0 and v36 then
            local v154 = v36:getShowTopBar();
            v154:connect(function() --[[ Line: 604 ]]
                -- upvalues: v154 (copy), v92 (ref), v23 (ref), v98 (ref), v99 (ref)
                if v154:get() then
                    v92.onAreaChanged(v23.UNIBAR_KEEP_OUT_AREA_ID, v98.current, v99.current);
                    return;
                else
                    v92.onAreaChanged(v23.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero);
                    return;
                end;
            end);
            v92.onAreaChanged(v23.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero);
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 619 ]]
        -- upvalues: l_FFlagAddUILessMode_0 (ref), l_FIntAddUILessModeVariant_0 (ref), v100 (ref), l_createEffect_0 (ref), v92 (copy), v23 (ref), v98 (copy), v99 (copy)
        local v155 = nil;
        if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v100.current.getUILessModeEnabled(false) then
            v155 = l_createEffect_0(function(v156) --[[ Line: 622 ]]
                -- upvalues: v100 (ref), v92 (ref), v23 (ref), v98 (ref), v99 (ref)
                if v100.current.getUIVisible(v156) then
                    v92.onAreaChanged(v23.UNIBAR_KEEP_OUT_AREA_ID, v98.current, v99.current);
                    return;
                else
                    v92.onAreaChanged(v23.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero);
                    return;
                end;
            end);
            v92.onAreaChanged(v23.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero);
        end;
        return function() --[[ Line: 636 ]]
            -- upvalues: v155 (ref)
            if v155 then
                v155();
            end;
        end;
    end, {});
    local v157 = l_useStyle_0();
    return v4.createElement("Frame", {
        Size = v129, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        SelectionGroup = true, 
        ref = v92.menuFrameRef, 
        [v4.Change.AbsoluteSize] = v127, 
        [v4.Change.AbsolutePosition] = v127
    }, {
        v4.createElement(AnimationStateHelper, {
            setToggleIconTransition = v105, 
            setToggleWidthTransition = v107, 
            setToggleSubmenuTransition = v117, 
            menuFrameRef = v92.menuFrameRef, 
            subMenuHostRef = if l_FFlagUnibarMenuOpenSubmenu_0 then v92.subMenuHostRef else nil
        }), 
        v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v157.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = v157.Theme.BackgroundUIContrast.Transparency * v157.Settings.PreferredTransparency
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, v118)
    });
end;
local function v172(v158) --[[ Line: 691 ]] --[[ Name: UnibarPills ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v18 (copy), v23 (copy), v24 (copy), v17 (copy), v28 (copy), v4 (copy), v27 (copy)
    local v159 = l_useStyle_0();
    local v160 = nil;
    local v161 = nil;
    local v162 = nil;
    if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then
        v160 = v18.use();
        v161 = v160.UNIBAR_END_PADDING;
        v162 = v160.MENU_SUBMENU_PADDING;
    else
        v161 = v23.UNIBAR_END_PADDING;
        v162 = v23.MENU_SUBMENU_PADDING;
    end;
    local v163 = v24();
    local v164 = v17:currentSubMenu():get() == "nine_dot";
    local v165, v166 = v28.useAnimatedBinding(v164 and 1 or 0);
    assert(v163 ~= nil, "Menu items should not be nil");
    local v167 = {};
    local v168 = {};
    for v169, v170 in v163 do
        if v170.integration and v170.isDivider == false then
            v168["icon_host" .. v169] = v4.createElement(v27, {
                toggleTransition = v165, 
                integration = v170
            });
        end;
        if v170.isDivider or v169 == #v163 then
            local v171 = v4.createElement("Frame", {
                Size = UDim2.new(0, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BorderSizePixel = 0, 
                BackgroundColor3 = v159.Theme.BackgroundUIContrast.Color, 
                BackgroundTransparency = v159.Theme.BackgroundUIContrast.Transparency * v159.Settings.PreferredTransparency
            }, {
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), 
                Padding = v4.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v161), 
                    PaddingRight = UDim.new(0, v161)
                }), 
                PillsHorizontalList = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                })
            }, v168);
            v167["pill_" .. v169] = v171;
            v168 = {};
        end;
    end;
    return v4.createElement("Frame", {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        SelectionGroup = true, 
        ref = v158.menuFrameRef, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        v4.createElement(AnimationStateHelper, {
            setToggleSubmenuTransition = v166, 
            menuFrameRef = v158.menuFrameRef, 
            subMenuHostRef = v158.subMenuHostRef
        }), 
        v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v162)
        })
    }, v167);
end;
local function v176(v173) --[[ Line: 783 ]] --[[ Name: SubMenuWrapper ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), v38 (ref), v25 (copy), v17 (copy), v40 (ref), v4 (copy), v20 (copy), v39 (ref)
    if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and v38 then
        local v174 = v25(v17:currentSubMenu());
        v40:set(v174 ~= nil);
    end;
    local v175 = v4.useCallback(function() --[[ Line: 788 ]]
        -- upvalues: v4 (ref), v20 (ref), v173 (copy)
        return (v4.createElement(v20, {
            subMenuHostRef = v173.subMenuHostRef
        }));
    end, {
        v173.subMenuHostRef
    });
    if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and v38 then
        return (v4.createElement(v38, {
            panelType = v39.ChromeSubMenu, 
            renderFunction = v175, 
            visibilityObservable = v40
        }));
    else
        return (v4.createElement(v20, {
            subMenuHostRef = v173.subMenuHostRef
        }));
    end;
end;
return v4.memo(function(v177) --[[ Line: 804 ]]
    -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v18 (copy), v23 (copy), v4 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagUnibarMenuOpenSubmenu_0 (copy), v26 (copy), v17 (copy), v36 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_Stores_0 (copy), l_createEffect_0 (copy), v90 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), v172 (copy), v176 (copy), v20 (copy), v22 (copy), v21 (copy)
    local _ = nil;
    local v179 = nil;
    v179 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then v18.use().MENU_SUBMENU_PADDING else v23.MENU_SUBMENU_PADDING;
    local v180 = v4.useRef(nil);
    if l_FFlagEnableConsoleExpControls_0 and v177.menuRef then
        v180 = v177.menuRef;
    end;
    local v181 = v4.useRef(nil);
    local v182 = nil;
    if l_FFlagUnibarMenuOpenSubmenu_0 then
        v182 = v4.useRef(nil);
    end;
    local function v183() --[[ Line: 826 ]] --[[ Name: updateSize ]]
        -- upvalues: v181 (copy), v180 (ref)
        if v181.current and v180.current then
            v181.current.Size = v180.current.Size;
        end;
    end;
    local v184 = v26(v17:orderAlignment(), isLeft);
    local v185 = nil;
    local v186 = nil;
    local v187 = nil;
    if l_FFlagEnableConsoleExpControls_0 and v36 then
        local v188, v189 = v4.useBinding(v36:getShowTopBar():get());
        v185 = v188;
        v186 = v189;
        v187 = v36:getShowTopBar();
    end;
    local v190 = nil;
    if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and l_Stores_0.GetUILessStore then
        v190 = v4.useRef(l_Stores_0.GetUILessStore(false));
        if v190.current.getUILessModeEnabled(false) then
            local v191, v192 = v4.useBinding(true);
            v185 = v191;
            v186 = v192;
        end;
    end;
    v4.useEffect(function() --[[ Line: 851 ]]
        -- upvalues: v180 (ref), v183 (copy), v181 (copy), l_FFlagEnableConsoleExpControls_0 (ref), v187 (ref), v186 (ref)
        local v193 = nil;
        if v180 and v180.current then
            v193 = v180.current:GetPropertyChangedSignal("Size"):Connect(v183);
        end;
        if v181.current and v180.current then
            v181.current.Size = v180.current.Size;
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            v187:connect(function() --[[ Line: 860 ]]
                -- upvalues: v186 (ref), v187 (ref)
                v186(v187:get());
            end);
        end;
        return function() --[[ Line: 865 ]]
            -- upvalues: v193 (ref)
            if v193 then
                v193:disconnect();
            end;
        end;
    end);
    v4.useEffect(function() --[[ Line: 872 ]]
        -- upvalues: l_FFlagAddUILessMode_0 (ref), l_FIntAddUILessModeVariant_0 (ref), v190 (ref), l_createEffect_0 (ref), v186 (ref)
        local v194 = nil;
        if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v190.current.getUILessModeEnabled(false) then
            v194 = l_createEffect_0(function(v195) --[[ Line: 875 ]]
                -- upvalues: v186 (ref), v190 (ref)
                v186(v190.current.getUIVisible(v195));
            end);
        end;
        return function() --[[ Line: 880 ]]
            -- upvalues: v194 (ref)
            if v194 then
                v194();
            end;
        end;
    end, {});
    return {
        v4.createElement("Frame", {
            Name = "UnibarMenu", 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v177.layoutOrder, 
            SelectionGroup = true, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = if l_FFlagEnableConsoleExpControls_0 then nil else Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            ref = v181, 
            [v4.Event.SelectionChanged] = if l_FFlagEnableConsoleExpControls_0 then v90 else nil, 
            Visible = if not not l_FFlagEnableConsoleExpControls_0 or l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v190.current.getUILessModeEnabled(false) then v185 else nil
        }, {
            v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = if v184 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v179)
            }), 
            if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then v4.createElement(v172, {
                menuFrameRef = v180, 
                subMenuHostRef = v182
            }) else v4.createElement(Unibar, {
                menuFrameRef = v180, 
                subMenuHostRef = if l_FFlagUnibarMenuOpenSubmenu_0 then v182 else nil, 
                onAreaChanged = v177.onAreaChanged, 
                onMinWidthChanged = v177.onMinWidthChanged
            }), 
            if l_isInExperienceUIVREnabled_0 then v4.createElement(v176, {
                subMenuHostRef = v182
            }) else v4.createElement(v20, {
                subMenuHostRef = v182
            }), 
            if l_FFlagEnableConsoleExpControls_0 then v4.createElement(v22) else nil, 
            (v4.createElement(v21))
        })
    };
end, function(_, _) --[[ Line: 938 ]]
    return true;
end);