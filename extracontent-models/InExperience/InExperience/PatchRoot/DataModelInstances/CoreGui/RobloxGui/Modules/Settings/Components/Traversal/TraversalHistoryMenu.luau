local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.SignalsReact);
local v6 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon);
local v7 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon);
local v8 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v9 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v10 = require(script.Parent.TraversalLeaveConfirmation);
local l_Parent_0 = script.Parent.Parent.Parent;
local v12 = require(l_Parent_0.EnumReactPage);
local v13 = require(l_Parent_0.ReactPageSignal);
local v14 = require(l_Parent_0.Utility);
local l_View_0 = v3.View;
local l_ThumbnailType_0 = v3.Enums.ThumbnailType;
local l_ThumbnailSize_0 = v3.Enums.ThumbnailSize;
local l_getRbxThumb_0 = v3.Utility.getRbxThumb;
local l_SettingsShowSignal_0 = v6.SettingsShowSignal;
local l_Traversal_0 = v7.Traversal;
local l_default_0 = l_Traversal_0.LocalTraversalHistory.default;
local l_useLastInputMode_0 = v8.useLastInputMode;
local l_GetInputModeStore_0 = v9.GetInputModeStore;
local l_Input_0 = v9.Input;
local l_Constants_0 = l_Traversal_0.Constants;
local l_HistoryMenu_0 = l_Traversal_0.HistoryMenu;
local l_useHistoryItems_0 = l_Traversal_0.useHistoryItems;
local l_useTokens_0 = v3.Hooks.useTokens;
local v29 = require(l_Parent_0.Flags.FFlagAddTraversalHistoryReactMenuButtons);
local l_FFlagTraversalHistoryMenuFocusNavFix_0 = l_Traversal_0.Flags.FFlagTraversalHistoryMenuFocusNavFix;
local l_FFlagTraversalRemoveLastInput_0 = l_Traversal_0.Flags.FFlagTraversalRemoveLastInput;
local l_FFlagTraversalPerfFixes_0 = l_Traversal_0.Flags.FFlagTraversalPerfFixes;
local v33 = game:DefineFastFlag("AsyncLoadingHistoryItems", false);
local function v38(v34) --[[ Line: 50 ]] --[[ Name: historyToMenuItems ]]
    -- upvalues: l_getRbxThumb_0 (copy), l_ThumbnailType_0 (copy), l_ThumbnailSize_0 (copy)
    local v35 = {};
    for _, v37 in v34 do
        table.insert(v35, {
            universeId = v37.universeId, 
            text = v37.name, 
            icon = l_getRbxThumb_0(l_ThumbnailType_0.GameIcon, v37.universeId, l_ThumbnailSize_0.Small)
        });
    end;
    return v35;
end;
return v4.memo(v4.forwardRef(function(v39, _) --[[ Line: 62 ]] --[[ Name: TraversalHistoryMenu ]]
    -- upvalues: v4 (copy), v29 (copy), l_useHistoryItems_0 (copy), l_FFlagTraversalPerfFixes_0 (copy), v38 (copy), l_Constants_0 (copy), l_FFlagTraversalRemoveLastInput_0 (copy), l_useLastInputMode_0 (copy), l_useTokens_0 (copy), v5 (copy), v13 (copy), l_FFlagTraversalHistoryMenuFocusNavFix_0 (copy), l_SettingsShowSignal_0 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy), l_GetInputModeStore_0 (copy), l_Input_0 (copy), v14 (copy), v12 (copy), v33 (copy), l_default_0 (copy), l_View_0 (copy), l_HistoryMenu_0 (copy), v10 (copy)
    local v41 = v4.useRef(v39.anchorParent);
    if v29 and v39.anchorRef then
        v41 = v39.anchorRef;
    end;
    local v42 = l_useHistoryItems_0();
    local v43 = nil;
    v43 = if l_FFlagTraversalPerfFixes_0 then v4.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: v38 (ref), v42 (copy)
        return (v38(v42));
    end, {
        v42
    }) else v38(v42);
    local v44 = if v39.idleButtonStateIsDown ~= nil then v39.idleButtonStateIsDown else l_Constants_0.DEFAULT_CHEVRON_BUTTON_STATE;
    local v45 = nil;
    if not l_FFlagTraversalRemoveLastInput_0 then
        v45 = l_useLastInputMode_0();
    end;
    local v46, v47 = v4.useBinding(Enum.SelectionBehavior.Stop);
    local v48 = nil;
    if l_FFlagTraversalPerfFixes_0 then
        v48 = v4.useMemo(function() --[[ Line: 85 ]]
            -- upvalues: v44 (copy), v46 (copy)
            return {
                SelectionBehaviorUp = if v44 then v46 else Enum.SelectionBehavior.Stop, 
                SelectionBehaviorDown = if not v44 then v46 else Enum.SelectionBehavior.Stop
            };
        end, {
            v44
        });
    end;
    local v49 = l_useTokens_0();
    local v50, v51 = v4.useState(l_Constants_0.NO_UNIVERSE_ID);
    local v52 = v5.useSignalState(v13);
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    if l_FFlagTraversalHistoryMenuFocusNavFix_0 then
        v55 = v4.useCallback(function(v56) --[[ Line: 98 ]]
            -- upvalues: l_SettingsShowSignal_0 (ref), v29 (ref), v39 (copy), l_GuiService_0 (ref)
            return {
                onSettingsVisible = l_SettingsShowSignal_0:connect(function(v57) --[[ Line: 100 ]]
                    -- upvalues: v56 (copy)
                    if not v57 then
                        v56();
                    end;
                end), 
                onPageChanged = if not v29 or v39.currentPageChangeSignal then v39.currentPageChangeSignal:connect(function() --[[ Line: 106 ]]
                    -- upvalues: v56 (copy)
                    v56();
                end) else nil, 
                onNativeClose = l_GuiService_0.NativeClose:Connect(function() --[[ Line: 110 ]]
                    -- upvalues: v56 (copy)
                    v56();
                end)
            };
        end, {
            v39.currentPageChangeSignal, 
            l_SettingsShowSignal_0, 
            l_GuiService_0.NativeClose
        });
    else
        local v58, v59 = v4.useState(false);
        v53 = v58;
        v54 = v59;
        v4.useEffect(function() --[[ Line: 118 ]]
            -- upvalues: l_SettingsShowSignal_0 (ref), v54 (ref), v29 (ref), v39 (copy), l_GuiService_0 (ref)
            local v61 = {
                onSettingsVisible = l_SettingsShowSignal_0:connect(function(v60) --[[ Line: 120 ]]
                    -- upvalues: v54 (ref)
                    if not v60 then
                        v54(true);
                    end;
                end), 
                onPageChanged = if not v29 or v39.currentPageChangeSignal then v39.currentPageChangeSignal:connect(function() --[[ Line: 126 ]]
                    -- upvalues: v54 (ref)
                    v54(true);
                end) else nil, 
                onNativeClose = l_GuiService_0.NativeClose:Connect(function() --[[ Line: 130 ]]
                    -- upvalues: v54 (ref)
                    v54(true);
                end)
            };
            return function() --[[ Line: 133 ]]
                -- upvalues: v61 (ref)
                for _, v63 in v61 do
                    v63:Disconnect();
                end;
                v61 = {};
            end;
        end, {
            v39.currentPageChangeSignal, 
            l_SettingsShowSignal_0, 
            l_GuiService_0.NativeClose
        });
        v4.useEffect(function() --[[ Line: 140 ]]
            -- upvalues: v53 (ref), v54 (ref)
            if v53 then
                v54(false);
            end;
        end, {
            v53, 
            v54
        });
    end;
    local v65 = v4.useCallback(function(v64) --[[ Line: 148 ]]
        -- upvalues: v51 (copy), v47 (copy)
        v51(v64);
        v47(Enum.SelectionBehavior.Stop);
    end, {
        v51
    });
    local v70 = v4.useCallback(function() --[[ Line: 153 ]]
        -- upvalues: v51 (copy), l_Constants_0 (ref), l_FFlagTraversalRemoveLastInput_0 (ref), l_UserInputService_0 (ref), l_GetInputModeStore_0 (ref), l_Input_0 (ref), v45 (ref), v41 (ref), l_GuiService_0 (ref)
        v51(l_Constants_0.NO_UNIVERSE_ID);
        local v66 = nil;
        if l_FFlagTraversalRemoveLastInput_0 then
            local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
            local v68 = l_GetInputModeStore_0().getLastInputType();
            local v69 = true;
            if v68 ~= l_Input_0.Directional then
                v69 = false;
                if v68 == l_Input_0.Pointer then
                    v69 = l_l_UserInputService_0_LastInputType_0 == Enum.UserInputType.Keyboard;
                end;
            end;
            v66 = v69;
        else
            v66 = v45 == "Focus";
        end;
        if v66 and v41.current then
            l_GuiService_0.SelectedCoreObject = v41.current;
        end;
    end, if l_FFlagTraversalRemoveLastInput_0 then {} else {
        v51, 
        v45
    });
    local v72 = v4.useCallback(function(v71) --[[ Line: 168 ]]
        -- upvalues: v47 (copy)
        if v71 then
            v47(Enum.SelectionBehavior.Escape);
            return;
        else
            v47(Enum.SelectionBehavior.Stop);
            return;
        end;
    end, {
        if l_FFlagTraversalPerfFixes_0 then nil else v47
    });
    local v73 = v4.useMemo(function() --[[ Line: 176 ]]
        -- upvalues: v29 (ref), v39 (copy), v49 (copy)
        if v29 and v39.isDarkOnDarkMode then
            return v49.Color.Surface.Surface_0;
        else
            return {
                Color3 = v49.Color.Stroke.Default.Color3, 
                Transparency = 0.33
            };
        end;
    end, {});
    local v74 = v14:IsSmallTouchScreen();
    local v75 = nil;
    if l_FFlagTraversalPerfFixes_0 then
        v75 = v4.useMemo(function() --[[ Line: 191 ]]
            -- upvalues: v74 (copy)
            return {
                ["padding-small"] = v74, 
                ["padding-medium"] = not v74
            };
        end, {
            v74
        });
    end;
    local v76 = nil;
    if l_FFlagTraversalPerfFixes_0 then
        v76 = v4.useCallback(function() --[[ Line: 201 ]]
            -- upvalues: v52 (copy), v12 (ref), l_FFlagTraversalHistoryMenuFocusNavFix_0 (ref), v47 (copy)
            v52.setCurrentReactPage(v12.TraversalHistory);
            if l_FFlagTraversalHistoryMenuFocusNavFix_0 then
                v47(Enum.SelectionBehavior.Stop);
            end;
        end, {
            v52
        });
    end;
    local _ = nil;
    return (if v33 then v4.useMemo(function() --[[ Line: 211 ]]
        -- upvalues: l_default_0 (ref)
        return #l_default_0:getUniverseHistory() > 0;
    end, {}) else next(v43) ~= nil) and v4.createElement(l_View_0, {
        tag = "auto-xy row align-y-center size-0-full", 
        selectionGroup = if l_FFlagTraversalPerfFixes_0 then v48 else {
            SelectionBehaviorUp = if v44 then v46 else Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = if not v44 then v46 else Enum.SelectionBehavior.Stop
        }, 
        ref = if not v29 or v39.anchorRef or v39.anchorParent then nil else v41
    }, {
        DividerLeft = v4.createElement(l_View_0, {
            Size = UDim2.new(0, v49.Stroke.Thick, 1, 0), 
            backgroundStyle = v73
        }), 
        HistoryMenu = v4.createElement(l_HistoryMenu_0, {
            historyButtonTags = if l_FFlagTraversalPerfFixes_0 then v75 else {
                ["padding-small"] = v74, 
                ["padding-medium"] = not v74
            }, 
            historyItems = v43, 
            onHistorySelected = if l_FFlagTraversalPerfFixes_0 then v76 else function() --[[ Line: 239 ]]
                -- upvalues: v52 (copy), v12 (ref), l_FFlagTraversalHistoryMenuFocusNavFix_0 (ref), v47 (copy)
                v52.setCurrentReactPage(v12.TraversalHistory);
                if l_FFlagTraversalHistoryMenuFocusNavFix_0 then
                    v47(Enum.SelectionBehavior.Stop);
                end;
            end, 
            onMenuItemSelected = v65, 
            onMenuToggled = v72, 
            forceMenuClose = if l_FFlagTraversalHistoryMenuFocusNavFix_0 then nil else v53, 
            closeMenuConn = if l_FFlagTraversalHistoryMenuFocusNavFix_0 then v55 else nil, 
            idleButtonStateIsDown = if l_FFlagTraversalPerfFixes_0 then nil else v44, 
            menuSide = if l_FFlagTraversalPerfFixes_0 then v39.menuSide else nil, 
            ref = v41
        })
    }, {
        Dialog = v4.createElement(v10, {
            isDialogOpen = l_Constants_0.NO_UNIVERSE_ID < v50, 
            onCancel = v70, 
            onClose = v70, 
            universeId = v50, 
            source = "history_dropdown"
        })
    });
end));