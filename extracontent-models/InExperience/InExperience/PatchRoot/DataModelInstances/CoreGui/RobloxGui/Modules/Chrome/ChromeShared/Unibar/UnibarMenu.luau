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
local l_FFlagEnableSideSheet_0 = v5.FFlagEnableSideSheet;
local l_FFlagAddIGMToSideSheet_0 = v5.FFlagAddIGMToSideSheet;
local l_FFlagUnibarMenuOpenSubmenu_0 = require(script.Parent.Parent.Parent.Flags).FFlagUnibarMenuOpenSubmenu;
local v17 = require(l_script_FirstAncestor_0.Flags);
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = v17.FFlagTokenizeUnibarConstantsWithStyleProvider;
local l_FFlagFixSpatialSubMenuSizing_0 = v17.FFlagFixSpatialSubMenuSizing;
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v21 = require(l_script_FirstAncestor_0.Service);
local l_UnibarStyle_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).UnibarStyle;
local _ = if l_GetFFlagChromeCentralizedConfiguration_0() then nil else require(l_script_FirstAncestor_0.Parent.Integrations);
local v24 = require(l_script_FirstAncestor_0.Unibar.SubMenu);
local v25 = require(l_script_FirstAncestor_0.Unibar.WindowManager);
local v26 = require(l_script_FirstAncestor_0.Shortcuts.ShortcutBar);
local v27 = require(l_script_FirstAncestor_0.Unibar.Constants);
local v28 = require(l_script_FirstAncestor_0.Hooks.useChromeMenuItems);
local v29 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
local v30 = require(l_script_FirstAncestor_0.Hooks.useMappedObservableValue);
local v31 = require(l_script_FirstAncestor_0.Unibar.ComponentHosts.IconHost);
local v32 = require(l_CorePackages_0.Packages.ReactOtter);
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_FFlagReduceTopBarInsetsWhileHidden_0 = v5.FFlagReduceTopBarInsetsWhileHidden;
local l_Stores_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Stores;
local l_createEffect_0 = require(l_CorePackages_0.Packages.Signals).createEffect;
local v37 = require(l_script_FirstAncestor_0.Parent.Integrations.Party.Constants);
local v38 = require(l_script_FirstAncestor_0.Parent.Integrations.Connect.isConnectUnibarEnabled);
local v39 = require(l_script_FirstAncestor_0.Parent.Integrations.Connect.isConnectDropdownEnabled);
local v40 = if l_FFlagEnableConsoleExpControls_0 then require(l_script_FirstAncestor_0.Parent.Parent.TopBar.Components.GamepadConnector) else nil;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v42 = nil;
local v43 = nil;
local v44 = nil;
if l_isInExperienceUIVREnabled_0 then
    local v45 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
    v42 = v45.Panel3DInSpatialUI;
    v43 = v45.Constants.PanelType;
    v44 = require(l_CorePackages_0.Workspace.Packages.Observable).ObservableValue.new(true);
end;
if not l_GetFFlagChromeCentralizedConfiguration_0() then
    configureUnibar = function() --[[ Line: 77 ]] --[[ Name: configureUnibar ]]
        -- upvalues: v39 (copy), l_GetFFlagDebugEnableUnibarDummyIntegrations_0 (copy), v38 (copy), v37 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), v21 (copy), l_FFlagEnableInExperienceAvatarSwitcher_0 (copy), v27 (copy), l_GuiService_0 (copy), l_FFlagEnableSideSheet_0 (copy), l_FFlagAddIGMToSideSheet_0 (copy)
        local v46 = {
            "leaderboard", 
            "emotes", 
            "backpack"
        };
        table.insert(v46, "respawn");
        table.insert(v46, 1, "trust_and_safety");
        if v39() then
            table.insert(v46, 1, "connect_dropdown");
        end;
        local v47 = {
            "toggle_mic_mute", 
            "chat", 
            "nine_dot"
        };
        table.insert(v47, 2, "join_voice");
        if l_GetFFlagDebugEnableUnibarDummyIntegrations_0() then
            table.insert(v47, 1, "dummy_window");
            table.insert(v47, 1, "dummy_window_2");
        end;
        if v38() then
            table.insert(v47, 1, "connect_unibar");
        end;
        local v48 = table.find(v47, "toggle_mic_mute");
        if v48 then
            table.insert(v47, v48 + 1, v37.TOGGLE_MIC_INTEGRATION_ID);
        end;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            v21:configureMenu({
                {
                    "vr_toggle_button", 
                    "vr_safety_bubble"
                }, 
                v47
            });
        else
            v21:configureMenu({
                v47
            });
        end;
        if l_isInExperienceUIVREnabled_0 then
            if not l_isSpatial_0() then
                table.insert(v46, 2, "camera_entrypoint");
                table.insert(v46, 2, "selfie_view");
            end;
        else
            table.insert(v46, 2, "camera_entrypoint");
            table.insert(v46, 2, "selfie_view");
        end;
        if l_FFlagEnableInExperienceAvatarSwitcher_0 then
            table.insert(v46, 3, v27.AVATAR_SWITCHER_ID);
        end;
        if not l_isSpatial_0() and not l_GuiService_0:IsTenFootInterface() then
            table.insert(v46, 4, "music_entrypoint");
        end;
        if l_FFlagEnableSideSheet_0 and l_FFlagAddIGMToSideSheet_0 then
            table.insert(v46, "people");
        end;
        v21:configureSubMenu("nine_dot", v46);
    end;
    configureUnibar();
    if l_FFlagEnableConsoleExpControls_0 then
        require(script.Parent.Parent.Shortcuts.ConfigureShortcuts)();
    end;
end;
IconDivider = function(v49) --[[ Line: 160 ]] --[[ Name: IconDivider ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v27 (copy), v4 (copy)
    local v50 = l_useStyle_0();
    local _ = nil;
    local v52 = nil;
    v52 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().ICON_DIVIDER_POSITION else v27.ICON_DIVIDER_POSITION;
    return v4.createElement("Frame", {
        Position = v49.position, 
        Size = UDim2.new(0, v27.DIVIDER_CELL_WIDTH, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        DividerBar = v4.createElement("Frame", {
            Position = v52, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = v27.ICON_DIVIDER_SIZE, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v50.Theme.Divider.Color, 
            BackgroundTransparency = if v49.toggleTransition then v49.toggleTransition:map(function(v53) --[[ Line: 184 ]]
                -- upvalues: v50 (copy)
                return v50.Theme.Divider.Transparency + (1 - v53) * (1 - v50.Theme.Divider.Transparency);
            end) else v50.Theme.Divider.Transparency, 
            Visible = v49.visible or true
        })
    });
end;
local function _(v54, v55) --[[ Line: 193 ]] --[[ Name: getSelectedChild ]]
    -- upvalues: v27 (copy)
    return v54.current:FindFirstChild(v27.ICON_NAME_PREFIX .. tostring(v55), true);
end;
AnimationStateHelper = function(v57) --[[ Line: 199 ]] --[[ Name: AnimationStateHelper ]]
    -- upvalues: v29 (copy), v21 (copy), v4 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy), v27 (copy), l_FFlagUnibarMenuOpenSubmenu_0 (copy), v32 (copy), l_GetFIntIconSelectionTimeout_0 (copy)
    local v58 = v29(v21:currentSubMenu());
    local v59 = v29(v21:selectedItem());
    local v60 = v29(v21:inFocusNav());
    v4.useEffect(function() --[[ Line: 205 ]]
        -- upvalues: v60 (copy), l_FFlagEnableConsoleExpControls_0 (ref), l_ContextActionService_0 (ref), v21 (ref), l_GuiService_0 (ref), v57 (copy), v59 (copy), v27 (ref), l_FFlagUnibarMenuOpenSubmenu_0 (ref)
        if v60 then
            if not l_FFlagEnableConsoleExpControls_0 then
                l_ContextActionService_0:BindCoreAction("RBXEscapeUnibar", function(_, v62, _) --[[ Line: 208 ]]
                    -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v21 (ref), l_GuiService_0 (ref)
                    if l_FFlagEnableConsoleExpControls_0 then
                        if v62 == Enum.UserInputState.End then
                            v21:disableFocusNav();
                            l_GuiService_0.SelectedCoreObject = nil;
                            return;
                        end;
                    else
                        v21:disableFocusNav();
                    end;
                end, false, Enum.KeyCode.ButtonB);
            end;
            if l_FFlagEnableConsoleExpControls_0 then
                if v57.menuFrameRef.current then
                    local l_menuFrameRef_0 = v57.menuFrameRef;
                    local l_v59_0 = v59;
                    local l_FirstChild_0 = l_menuFrameRef_0.current:FindFirstChild(v27.ICON_NAME_PREFIX .. tostring(l_v59_0), true);
                    if l_FirstChild_0 then
                        l_GuiService_0.SelectedCoreObject = l_FirstChild_0;
                        return;
                    elseif l_FFlagUnibarMenuOpenSubmenu_0 then
                        if l_FFlagEnableConsoleExpControls_0 then
                            v21:selectedItem():set("nine_dot");
                        end;
                        v21:toggleSubMenu("nine_dot");
                        return;
                    else
                        l_GuiService_0:Select(v57.menuFrameRef.current);
                        return;
                    end;
                end;
            elseif v57.menuFrameRef.current then
                l_GuiService_0:Select(v57.menuFrameRef.current);
                return;
            end;
        else
            l_ContextActionService_0:UnbindCoreAction("RBXEscapeUnibar");
            if l_GuiService_0.SelectedCoreObject and v57.menuFrameRef.current:IsAncestorOf(l_GuiService_0.SelectedCoreObject) then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
    end, {
        v60
    });
    v4.useEffect(function() --[[ Line: 253 ]]
        -- upvalues: v58 (copy), l_FFlagUnibarMenuOpenSubmenu_0 (ref), v60 (copy), l_GuiService_0 (ref), v57 (copy), v32 (ref), v27 (ref)
        if v58 == "nine_dot" then
            if l_FFlagUnibarMenuOpenSubmenu_0 and v60 then
                l_GuiService_0:Select(v57.subMenuHostRef.current);
            end;
            v57.setToggleSubmenuTransition((v32.spring(1, v27.MENU_ANIMATION_SPRING)));
            return;
        else
            v57.setToggleSubmenuTransition((v32.spring(0, v27.MENU_ANIMATION_SPRING)));
            return;
        end;
    end, {
        v58
    });
    v4.useEffect(function() --[[ Line: 264 ]]
        -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v58 (copy), v59 (copy), l_GetFIntIconSelectionTimeout_0 (ref), v57 (copy), v27 (ref), l_GuiService_0 (ref)
        if l_FFlagEnableConsoleExpControls_0 and v58 == v59 then
            return;
        else
            local v71 = coroutine.create(function() --[[ Line: 269 ]]
                -- upvalues: l_GetFIntIconSelectionTimeout_0 (ref), v57 (ref), v59 (ref), l_FFlagEnableConsoleExpControls_0 (ref), v27 (ref), l_GuiService_0 (ref)
                local v67 = 0;
                while true do
                    if v67 < l_GetFIntIconSelectionTimeout_0() then
                        v67 = v67 + 1;
                        task.wait();
                        if v57.menuFrameRef.current and v59 then
                            local v68 = nil;
                            if l_FFlagEnableConsoleExpControls_0 then
                                local l_menuFrameRef_1 = v57.menuFrameRef;
                                local l_v59_1 = v59;
                                v68 = l_menuFrameRef_1.current:FindFirstChild(v27.ICON_NAME_PREFIX .. tostring(l_v59_1), true);
                            else
                                v68 = v57.menuFrameRef.current:FindFirstChild("IconHitArea_" .. v59, true);
                            end;
                            if v68 then
                                l_GuiService_0.SelectedCoreObject = v68;
                                return;
                            end;
                        end;
                    else
                        return;
                    end;
                end;
            end);
            coroutine.resume(v71);
            return;
        end;
    end, {
        v59, 
        if l_FFlagEnableConsoleExpControls_0 then v58 else nil
    });
    return nil;
end;
linearInterpolation = function(v72, v73, v74) --[[ Line: 295 ]] --[[ Name: linearInterpolation ]]
    return v72 * (1 - v74) + v73 * v74;
end;
IconPositionBinding = function(v75, v76, v77, v78, v79, v80, v81, v82, v83) --[[ Line: 299 ]] --[[ Name: IconPositionBinding ]]
    -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v27 (copy), v4 (copy)
    local _ = nil;
    local v85 = nil;
    v85 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().UNIBAR_END_PADDING else v27.UNIBAR_END_PADDING;
    return (v4.joinBindings({
        v75, 
        v79, 
        v80
    }):map(function(v86) --[[ Line: 319 ]]
        -- upvalues: v83 (copy), v77 (copy), v76 (copy), v78 (copy), v82 (copy), v81 (copy), v85 (ref)
        local v87 = 0;
        v87 = if v83.current then linearInterpolation(v77, v76, v86[2]) else linearInterpolation(v76, v77, v86[2]);
        local l_v78_0 = v78;
        if v82 and not v81 then
            l_v78_0 = v78 - v86[3];
        end;
        local v89 = v87 - l_v78_0;
        return UDim2.new(0, v85 + l_v78_0 + v89 * v86[1], 0, 0);
    end));
end;
local function v94(v90, _, _, v93) --[[ Line: 337 ]] --[[ Name: onUnibarSelectionChanged ]]
    -- upvalues: v21 (copy)
    if not v90:IsAncestorOf(v93) then
        v21:disableFocusNav();
    end;
end;
isLeft = function(v95) --[[ Line: 356 ]] --[[ Name: isLeft ]]
    return v95 == Enum.HorizontalAlignment.Left;
end;
Unibar = function(v96) --[[ Line: 360 ]] --[[ Name: Unibar ]]
    -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v27 (copy), v4 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_Stores_0 (copy), v28 (copy), v32 (copy), v21 (copy), l_FFlagReduceTopBarInsetsWhileHidden_0 (copy), v40 (copy), v30 (copy), v31 (copy), l_GetFFlagSimpleChatUnreadMessageCount_0 (copy), l_createEffect_0 (copy), l_useStyle_0 (copy), l_FFlagUnibarMenuOpenSubmenu_0 (copy)
    local v97 = nil;
    local v98 = nil;
    local v99 = nil;
    if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then
        v97 = l_UnibarStyle_0.use();
        v98 = v97.ICON_CELL_WIDTH;
        v99 = v97.UNIBAR_END_PADDING;
    else
        v98 = v27.ICON_CELL_WIDTH;
        v99 = v27.UNIBAR_END_PADDING;
    end;
    local v100 = {};
    local v101 = v4.useRef({});
    local v102 = v4.useRef(Vector2.zero);
    local v103 = v4.useRef(Vector2.zero);
    local v104 = nil;
    if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and l_Stores_0.GetUILessStore then
        v104 = v4.useRef(l_Stores_0.GetUILessStore(false));
    end;
    local v105 = false;
    local v106 = v101.current or {};
    local v107 = v28();
    local v108, v109 = v32.useAnimatedBinding(1);
    local v110, v111 = v32.useAnimatedBinding(1);
    local v112, v113 = v32.useAnimatedBinding(0);
    local v114 = v4.useRef(0);
    local v115, v116 = v32.useAnimatedBinding(1);
    local v117 = v4.useRef(false);
    local v118 = v4.useRef(0);
    local v119 = v21:currentSubMenu():get() == "nine_dot";
    local v120, v121 = v32.useAnimatedBinding(v119 and 1 or 0);
    local v122 = {};
    local v123 = 0;
    local v124 = 0;
    local v125 = 0;
    local v126 = 0;
    local v127 = 0;
    local v131 = v4.useCallback(function(v128) --[[ Line: 408 ]]
        -- upvalues: v102 (copy), v21 (ref), l_FFlagReduceTopBarInsetsWhileHidden_0 (ref), v103 (copy), l_FFlagAddUILessMode_0 (ref), l_FIntAddUILessModeVariant_0 (ref), v104 (ref), v40 (ref), v96 (copy), v27 (ref)
        local l_zero_0 = Vector2.zero;
        local l_zero_1 = Vector2.zero;
        if v128 then
            l_zero_0 = v128.AbsolutePosition;
            l_zero_1 = v128.AbsoluteSize;
            if l_zero_0 ~= v102.current then
                v102.current = l_zero_0;
                v21:setMenuAbsolutePosition(l_zero_0);
            end;
            if l_FFlagReduceTopBarInsetsWhileHidden_0 and l_zero_1 ~= v103.current then
                v103.current = l_zero_1;
            end;
            if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v104.current.getUILessModeEnabled(false) then
                if l_zero_0 ~= v102.current then
                    v102.current = l_zero_0;
                    v21:setMenuAbsolutePosition(l_zero_0);
                end;
                if l_zero_1 ~= v103.current then
                    v103.current = l_zero_1;
                end;
            end;
        end;
        if l_FFlagReduceTopBarInsetsWhileHidden_0 and v40 then
            if v128 and v96.onAreaChanged and v40:getShowTopBar():get() then
                v96.onAreaChanged(v27.UNIBAR_KEEP_OUT_AREA_ID, l_zero_0, l_zero_1);
                return;
            end;
        elseif l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v104.current.getUILessModeEnabled(false) then
            if v128 and v96.onAreaChanged and v104.current.getUIVisible(false) then
                v96.onAreaChanged(v27.UNIBAR_KEEP_OUT_AREA_ID, l_zero_0, l_zero_1);
                return;
            end;
        elseif v128 and v96.onAreaChanged then
            v96.onAreaChanged(v27.UNIBAR_KEEP_OUT_AREA_ID, l_zero_0, v128.AbsoluteSize);
        end;
    end, {});
    local v133 = v4.joinBindings({
        v110, 
        v112
    }):map(function(v132) --[[ Line: 457 ]]
        -- upvalues: v126 (ref), v98 (ref)
        return UDim2.new(0, linearInterpolation(v126, v132[2], v132[1]), 0, v98);
    end);
    local v134 = v30(v21:orderAlignment(), isLeft);
    for _, v136 in v107 do
        if v136.integration.availability:get() == v21.AvailabilitySignal.Pinned then
            v123 = v123 + 1;
        end;
    end;
    local v137 = 0;
    v137 = v134 and 1 or math.max(v123 - 1, 0);
    for v138, v139 in v107 do
        if v139.isDivider then
            local v140 = v124 + v98 * v137;
            local v141 = v106[v139.id] or v124;
            v100[v139.id] = v124;
            v105 = v105 or v141 ~= v124;
            local v142 = IconPositionBinding(v108, v141, v124, v140, v115, v112, false, v134, v117);
            local v143 = nil;
            v143 = if v134 then v4.joinBindings({
                v142, 
                v133
            }):map(function(v144) --[[ Line: 499 ]]
                -- upvalues: v98 (ref)
                return v144[1].X.Offset >= v98 * 0.5;
            end) else v4.joinBindings({
                v142, 
                v133
            }):map(function(v145) --[[ Line: 504 ]]
                -- upvalues: v98 (ref)
                local v146 = v145[1];
                local v147 = v145[2];
                return v146.X.Offset <= v147.X.Offset - v98;
            end);
            v122[v139.id or "icon" .. v138] = v4.createElement(IconDivider, {
                position = v142, 
                visible = v143, 
                toggleTransition = v110
            });
            v124 = v124 + v27.DIVIDER_CELL_WIDTH;
        elseif v139.integration then
            local v148 = false;
            local v149 = v124 + v98 * v137;
            if v139.integration.availability:get() == v21.AvailabilitySignal.Pinned then
                v148 = true;
                v149 = v125;
            end;
            local v150 = if v106[v139.id] == nil then v124 else v106[v139.id];
            v100[v139.id] = v124;
            v105 = v105 or v150 ~= v124;
            local v151 = IconPositionBinding(v108, v150, v124, v149, v115, v112, v148, v134, v117);
            local v152 = nil;
            v152 = if v134 then v4.joinBindings({
                v151, 
                v133
            }):map(function(v153) --[[ Line: 543 ]]
                -- upvalues: v98 (ref)
                return v153[1].X.Offset >= v98 * 0.5;
            end) else v4.joinBindings({
                v151, 
                v133
            }):map(function(v154) --[[ Line: 548 ]]
                -- upvalues: v98 (ref)
                local v155 = v154[1];
                local v156 = v154[2];
                return v155.X.Offset <= v156.X.Offset - v98 * 1.5;
            end);
            v122[v139.id or "icon" .. v138] = v4.createElement(v31, {
                position = v151, 
                visible = v148 or v152, 
                toggleTransition = v120, 
                integration = v139, 
                disableBadgeNumber = if l_GetFFlagSimpleChatUnreadMessageCount_0() then v139.id == "chat" else false
            });
            v124 = v124 + v98;
            if v148 then
                v125 = v125 + v98;
            end;
        end;
    end;
    v126 = v124;
    if v96.onMinWidthChanged then
        v96.onMinWidthChanged(v126);
    end;
    v127 = v99 * 2 + v124;
    v4.useEffect(function() --[[ Line: 577 ]]
        -- upvalues: v114 (copy), v112 (copy), v113 (copy), v32 (ref), v127 (ref), v27 (ref), v21 (ref), v98 (ref)
        local l_current_0 = v114.current;
        if v112:getValue() == 0 then
            v113((v32.instant(v127)));
            v114.current = v127;
        elseif l_current_0 ~= v127 then
            v113(v32.spring(v127, v27.MENU_ANIMATION_SPRING));
            v114.current = v127;
        end;
        v21:setMenuAbsoluteSize(Vector2.new(v127, v98));
    end, {
        v127
    });
    if v105 then
        v118.current = (v118.current or 0) + 1;
    end;
    v101.current = v100;
    v4.useEffect(function() --[[ Line: 595 ]]
        -- upvalues: v117 (copy), v116 (copy), v32 (ref), v27 (ref)
        if not v117.current then
            v116(v32.spring(0, v27.MENU_ANIMATION_SPRING));
            v117.current = true;
            return;
        else
            v116(v32.spring(1, v27.MENU_ANIMATION_SPRING));
            v117.current = false;
            return;
        end;
    end, {
        v118.current, 
        v117
    });
    v4.useEffect(function() --[[ Line: 607 ]]
        -- upvalues: l_FFlagReduceTopBarInsetsWhileHidden_0 (ref), v40 (ref), v96 (copy), v27 (ref), v102 (copy), v103 (copy)
        if l_FFlagReduceTopBarInsetsWhileHidden_0 and v40 then
            local v158 = v40:getShowTopBar();
            v158:connect(function() --[[ Line: 610 ]]
                -- upvalues: v158 (copy), v96 (ref), v27 (ref), v102 (ref), v103 (ref)
                if v158:get() then
                    v96.onAreaChanged(v27.UNIBAR_KEEP_OUT_AREA_ID, v102.current, v103.current);
                    return;
                else
                    v96.onAreaChanged(v27.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero);
                    return;
                end;
            end);
            v96.onAreaChanged(v27.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero);
        end;
    end, {});
    v4.useEffect(function() --[[ Line: 625 ]]
        -- upvalues: l_FFlagAddUILessMode_0 (ref), l_FIntAddUILessModeVariant_0 (ref), v104 (ref), l_createEffect_0 (ref), v96 (copy), v27 (ref), v102 (copy), v103 (copy)
        local v159 = nil;
        if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v104.current.getUILessModeEnabled(false) then
            v159 = l_createEffect_0(function(v160) --[[ Line: 628 ]]
                -- upvalues: v104 (ref), v96 (ref), v27 (ref), v102 (ref), v103 (ref)
                if v104.current.getUIVisible(v160) then
                    v96.onAreaChanged(v27.UNIBAR_KEEP_OUT_AREA_ID, v102.current, v103.current);
                    return;
                else
                    v96.onAreaChanged(v27.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero);
                    return;
                end;
            end);
            v96.onAreaChanged(v27.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero);
        end;
        return function() --[[ Line: 642 ]]
            -- upvalues: v159 (ref)
            if v159 then
                v159();
            end;
        end;
    end, {});
    local v161 = l_useStyle_0();
    return v4.createElement("Frame", {
        Size = v133, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        SelectionGroup = true, 
        ref = v96.menuFrameRef, 
        [v4.Change.AbsoluteSize] = v131, 
        [v4.Change.AbsolutePosition] = v131
    }, {
        v4.createElement(AnimationStateHelper, {
            setToggleIconTransition = v109, 
            setToggleWidthTransition = v111, 
            setToggleSubmenuTransition = v121, 
            menuFrameRef = v96.menuFrameRef, 
            subMenuHostRef = if l_FFlagUnibarMenuOpenSubmenu_0 then v96.subMenuHostRef else nil
        }), 
        v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v161.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = v161.Theme.BackgroundUIContrast.Transparency * v161.Settings.PreferredTransparency
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, v122)
    });
end;
local function v176(v162) --[[ Line: 697 ]] --[[ Name: UnibarPills ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v27 (copy), v28 (copy), v21 (copy), v32 (copy), v4 (copy), v31 (copy)
    local v163 = l_useStyle_0();
    local v164 = nil;
    local v165 = nil;
    local v166 = nil;
    if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then
        v164 = l_UnibarStyle_0.use();
        v165 = v164.UNIBAR_END_PADDING;
        v166 = v164.MENU_SUBMENU_PADDING;
    else
        v165 = v27.UNIBAR_END_PADDING;
        v166 = v27.MENU_SUBMENU_PADDING;
    end;
    local v167 = v28();
    local v168 = v21:currentSubMenu():get() == "nine_dot";
    local v169, v170 = v32.useAnimatedBinding(v168 and 1 or 0);
    assert(v167 ~= nil, "Menu items should not be nil");
    local v171 = {};
    local v172 = {};
    for v173, v174 in v167 do
        if v174.integration and v174.isDivider == false then
            v172["icon_host" .. v173] = v4.createElement(v31, {
                toggleTransition = v169, 
                integration = v174
            });
        end;
        if v174.isDivider or v173 == #v167 then
            local v175 = v4.createElement("Frame", {
                Size = UDim2.new(0, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BorderSizePixel = 0, 
                BackgroundColor3 = v163.Theme.BackgroundUIContrast.Color, 
                BackgroundTransparency = v163.Theme.BackgroundUIContrast.Transparency * v163.Settings.PreferredTransparency
            }, {
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), 
                Padding = v4.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v165), 
                    PaddingRight = UDim.new(0, v165)
                }), 
                PillsHorizontalList = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                })
            }, v172);
            v171["pill_" .. v173] = v175;
            v172 = {};
        end;
    end;
    return v4.createElement("Frame", {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        SelectionGroup = true, 
        ref = v162.menuFrameRef, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        v4.createElement(AnimationStateHelper, {
            setToggleSubmenuTransition = v170, 
            menuFrameRef = v162.menuFrameRef, 
            subMenuHostRef = v162.subMenuHostRef
        }), 
        v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v166)
        })
    }, v171);
end;
local function v181(v177) --[[ Line: 789 ]] --[[ Name: SubMenuWrapper ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), v42 (ref), v29 (copy), v21 (copy), v44 (ref), v4 (copy), v24 (copy), l_FFlagFixSpatialSubMenuSizing_0 (copy), v43 (ref)
    if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and v42 then
        local v178 = v29(v21:currentSubMenu());
        v44:set(v178 ~= nil);
    end;
    local v180 = v4.useCallback(function(v179) --[[ Line: 794 ]]
        -- upvalues: v4 (ref), v24 (ref), v177 (copy), l_FFlagFixSpatialSubMenuSizing_0 (ref)
        return (v4.createElement(v24, {
            subMenuHostRef = v177.subMenuHostRef, 
            panelSize = if l_FFlagFixSpatialSubMenuSizing_0 then v179 else nil
        }));
    end, {
        v177.subMenuHostRef
    });
    if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() and v42 then
        return (v4.createElement(v42, {
            panelType = v43.ChromeSubMenu, 
            renderFunction = v180, 
            visibilityObservable = v44
        }));
    else
        return (v4.createElement(v24, {
            subMenuHostRef = v177.subMenuHostRef
        }));
    end;
end;
return v4.memo(function(v182) --[[ Line: 813 ]]
    -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v27 (copy), v4 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagUnibarMenuOpenSubmenu_0 (copy), v30 (copy), v21 (copy), v40 (copy), l_FFlagAddUILessMode_0 (copy), l_FIntAddUILessModeVariant_0 (copy), l_Stores_0 (copy), l_createEffect_0 (copy), v94 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), v176 (copy), v181 (copy), v24 (copy), v26 (copy), v25 (copy)
    local _ = nil;
    local v184 = nil;
    v184 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().MENU_SUBMENU_PADDING else v27.MENU_SUBMENU_PADDING;
    local v185 = v4.useRef(nil);
    if l_FFlagEnableConsoleExpControls_0 and v182.menuRef then
        v185 = v182.menuRef;
    end;
    local v186 = v4.useRef(nil);
    local v187 = nil;
    if l_FFlagUnibarMenuOpenSubmenu_0 then
        v187 = v4.useRef(nil);
    end;
    local function v188() --[[ Line: 835 ]] --[[ Name: updateSize ]]
        -- upvalues: v186 (copy), v185 (ref)
        if v186.current and v185.current then
            v186.current.Size = v185.current.Size;
        end;
    end;
    local v189 = v30(v21:orderAlignment(), isLeft);
    local v190 = nil;
    local v191 = nil;
    local v192 = nil;
    if l_FFlagEnableConsoleExpControls_0 and v40 then
        local v193, v194 = v4.useBinding(v40:getShowTopBar():get());
        v190 = v193;
        v191 = v194;
        v192 = v40:getShowTopBar();
    end;
    local v195 = nil;
    if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and l_Stores_0.GetUILessStore then
        v195 = v4.useRef(l_Stores_0.GetUILessStore(false));
        if v195.current.getUILessModeEnabled(false) then
            local v196, v197 = v4.useBinding(true);
            v190 = v196;
            v191 = v197;
        end;
    end;
    v4.useEffect(function() --[[ Line: 860 ]]
        -- upvalues: v185 (ref), v188 (copy), v186 (copy), l_FFlagEnableConsoleExpControls_0 (ref), v192 (ref), v191 (ref)
        local v198 = nil;
        if v185 and v185.current then
            v198 = v185.current:GetPropertyChangedSignal("Size"):Connect(v188);
        end;
        if v186.current and v185.current then
            v186.current.Size = v185.current.Size;
        end;
        if l_FFlagEnableConsoleExpControls_0 then
            v192:connect(function() --[[ Line: 869 ]]
                -- upvalues: v191 (ref), v192 (ref)
                v191(v192:get());
            end);
        end;
        return function() --[[ Line: 874 ]]
            -- upvalues: v198 (ref)
            if v198 then
                v198:disconnect();
            end;
        end;
    end);
    v4.useEffect(function() --[[ Line: 881 ]]
        -- upvalues: l_FFlagAddUILessMode_0 (ref), l_FIntAddUILessModeVariant_0 (ref), v195 (ref), l_createEffect_0 (ref), v191 (ref)
        local v199 = nil;
        if l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v195.current.getUILessModeEnabled(false) then
            v199 = l_createEffect_0(function(v200) --[[ Line: 884 ]]
                -- upvalues: v191 (ref), v195 (ref)
                v191(v195.current.getUIVisible(v200));
            end);
        end;
        return function() --[[ Line: 889 ]]
            -- upvalues: v199 (ref)
            if v199 then
                v199();
            end;
        end;
    end, {});
    return {
        v4.createElement("Frame", {
            Name = "UnibarMenu", 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v182.layoutOrder, 
            SelectionGroup = true, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = if l_FFlagEnableConsoleExpControls_0 then nil else Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            ref = v186, 
            [v4.Event.SelectionChanged] = if l_FFlagEnableConsoleExpControls_0 then v94 else nil, 
            Visible = if not not l_FFlagEnableConsoleExpControls_0 or l_FFlagAddUILessMode_0 and l_FIntAddUILessModeVariant_0 ~= 0 and v195.current.getUILessModeEnabled(false) then v190 else nil
        }, {
            v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = if v189 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v184)
            }), 
            if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then v4.createElement(v176, {
                menuFrameRef = v185, 
                subMenuHostRef = v187
            }) else v4.createElement(Unibar, {
                menuFrameRef = v185, 
                subMenuHostRef = if l_FFlagUnibarMenuOpenSubmenu_0 then v187 else nil, 
                onAreaChanged = v182.onAreaChanged, 
                onMinWidthChanged = v182.onMinWidthChanged
            }), 
            if l_isInExperienceUIVREnabled_0 then v4.createElement(v181, {
                subMenuHostRef = v187
            }) else v4.createElement(v24, {
                subMenuHostRef = v187
            }), 
            if l_FFlagEnableConsoleExpControls_0 then v4.createElement(v26) else nil, 
            (v4.createElement(v25))
        })
    };
end, function(_, _) --[[ Line: 947 ]]
    return true;
end);