local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_Parent_0.FocusNavigationUtils);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.InputHandlers);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.ReactFocusNavigation);
local v8 = require(l_Parent_0.UIBlox);
local l_AppFocusRoot_0 = v3.AppFocusRoot;
local l_FocusNavigationEventNameEnum_0 = v3.FocusNavigationEventNameEnum;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v3.FocusNavigableSurfaceIdentifierEnum;
local l_OverlayProvider_0 = v4.OverlayProvider;
local l_Popover_0 = v4.Popover;
local l_PopoverAlign_0 = v4.Enums.PopoverAlign;
local l_PopoverSide_0 = v4.Enums.PopoverSide;
local l_ScrollBarVisibility_0 = v4.Enums.ScrollBarVisibility;
local l_ScrollView_0 = v4.ScrollView;
local l_Text_0 = v4.Text;
local l_useLayerCollector_0 = v8.Core.Layout.LayerCollector.useLayerCollector;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_View_0 = v4.View;
local v22 = require(l_script_FirstAncestor_0.Common.SideModalDropdownButton);
local v23 = require(l_script_FirstAncestor_0.Common.useScrollbarOffset);
return v6.memo(function(v24) --[[ Line: 44 ]] --[[ Name: DropdownWithPopover ]]
    -- upvalues: l_useLayerCollector_0 (copy), l_useTokens_0 (copy), v6 (copy), v23 (copy), v7 (copy), l_CoreGui_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_OverlayProvider_0 (copy), l_Popover_0 (copy), v22 (copy), l_PopoverAlign_0 (copy), l_PopoverSide_0 (copy), l_AppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v5 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy)
    local v25 = l_useLayerCollector_0();
    local v26 = l_useTokens_0();
    local l_absoluteSize_0 = v25.absoluteSize;
    local v28, v29 = v6.useState(false);
    local v30, v31 = v6.useState({});
    local v32, v33 = v6.useState(Vector2.new(0, 0));
    local v34, v35 = v6.useState(Vector2.new(0, 0));
    local v36, v37 = v6.useState(Vector2.new(0, 0));
    local v38, v39 = v6.useState(Vector2.new(0, 0));
    local v40 = v23(v36, v38);
    local v41 = v7.useFocusGuiObject();
    local v42 = v6.useRef(nil);
    local v43 = v6.useRef(nil);
    local l_VRCentralOverlay_0 = l_CoreGui_0:FindFirstChild("VRCentralOverlay");
    local v45 = if l_VRCentralOverlay_0 then l_VRCentralOverlay_0:FindFirstChild("CentralOverlay_SurfaceGui") else nil;
    local v46 = v6.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v45 (copy), v41 (copy), v42 (copy), v29 (copy)
        if not v45 then
            v41(v42.current);
        end;
        v29(false);
    end, {
        v42.current, 
        v41, 
        v45
    });
    local v51 = v6.useMemo(function() --[[ Line: 76 ]]
        -- upvalues: v24 (copy), v31 (copy), v46 (copy), v6 (ref), l_View_0 (ref), v30 (copy), l_Text_0 (ref)
        local v47 = {};
        for _, v49 in ipairs(v24.cellDatas) do
            local function v50() --[[ Line: 79 ]]
                -- upvalues: v24 (ref), v49 (copy), v31 (ref), v46 (ref)
                v24.onChange(if v49.value == nil then v49.text else v49.value);
                v31(v49);
                v46();
            end;
            table.insert(v47, v6.createElement(l_View_0, {
                onActivated = v50, 
                selection = {
                    Selectable = true
                }, 
                tag = {
                    ["size-full-0"] = true, 
                    ["auto-y"] = true, 
                    ["padding-small"] = true, 
                    ["radius-medium"] = true, 
                    ["bg-shift-200"] = v30 == v49
                }
            }, {
                TextContainer = v6.createElement(l_View_0, {
                    tag = "size-full-0 auto-y"
                }, {
                    Text = v6.createElement(l_Text_0, {
                        Text = v49.text, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        tag = "auto-xy"
                    })
                })
            }));
        end;
        return v47;
    end, {
        v24.cellDatas, 
        v30, 
        v24.onChange, 
        v46
    });
    local v52 = v6.useCallback(function() --[[ Line: 116 ]]
        -- upvalues: v29 (copy), v28 (copy)
        v29(not v28);
    end, {
        v28
    });
    return v6.createElement(l_OverlayProvider_0, {
        gui = v45
    }, {
        DropdownWithPopover = v6.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            ref = v42, 
            onAbsoluteSizeChanged = function(v53) --[[ Line: 126 ]] --[[ Name: onAbsoluteSizeChanged ]]
                -- upvalues: v33 (copy)
                v33(v53.AbsoluteSize);
            end, 
            LayoutOrder = v24.layoutOrder
        }, {
            Popover = v6.createElement(l_Popover_0.Root, {
                isOpen = v28
            }, {
                Anchor = v6.createElement(l_Popover_0.Anchor, nil, v6.createElement(l_View_0, {
                    Size = UDim2.new(0, v32.X, 0, v32.Y)
                }, {
                    DropdownButton = v6.createElement(v22, {
                        onActivated = v52, 
                        text = if v30.text and #v30.text > 0 then v30.text else v24.placeholder, 
                        isDropdownError = v24.errorState
                    })
                })), 
                Content = v6.createElement(l_Popover_0.Content, {
                    align = l_PopoverAlign_0.Center, 
                    side = l_PopoverSide_0.Bottom, 
                    hasArrow = false, 
                    onPressedOutside = v46, 
                    selection = {
                        Selectable = true
                    }
                }, {
                    DropdownPopup = v6.createElement(l_View_0, {
                        tag = "auto-xy"
                    }, {
                        AppFocusRoot = v6.createElement(l_AppFocusRoot_0, {
                            surfaceIdentifier = if v28 then l_FocusNavigableSurfaceIdentifierEnum_0.ModerationOverlay else l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                            isIsolated = v28, 
                            customEventHandlers = {
                                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                                    handler = v5.onRelease(v46)
                                }
                            }
                        }, {
                            v6.createElement(l_ScrollView_0, {
                                Size = UDim2.new(0, math.min(l_absoluteSize_0.X, v34.X + v40), 0, (math.min(l_absoluteSize_0.Y, v34.Y))), 
                                scroll = {
                                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                                    scrollBarVisibility = l_ScrollBarVisibility_0.Always
                                }, 
                                onAbsoluteCanvasSizeChanged = function(v54) --[[ Line: 194 ]] --[[ Name: onAbsoluteCanvasSizeChanged ]]
                                    -- upvalues: v37 (copy)
                                    v37(v54.AbsoluteCanvasSize);
                                end, 
                                onAbsoluteWindowSizeChanged = function(v55) --[[ Line: 197 ]] --[[ Name: onAbsoluteWindowSizeChanged ]]
                                    -- upvalues: v39 (copy)
                                    v39(v55.AbsoluteWindowSize);
                                end, 
                                gradientHeight = 15
                            }, {
                                BaseMenu = v6.createElement(l_View_0, {
                                    Size = UDim2.new(0, v32.X + v26.Stroke.Standard * 2, 0, 0), 
                                    onAbsoluteSizeChanged = function(v56) --[[ Line: 204 ]] --[[ Name: onAbsoluteSizeChanged ]]
                                        -- upvalues: v35 (copy)
                                        v35(v56.AbsoluteSize);
                                    end, 
                                    tag = "auto-y col align-y-center gap-xsmall padding-xsmall", 
                                    ref = v43
                                }, v51)
                            })
                        })
                    })
                })
            })
        })
    });
end);