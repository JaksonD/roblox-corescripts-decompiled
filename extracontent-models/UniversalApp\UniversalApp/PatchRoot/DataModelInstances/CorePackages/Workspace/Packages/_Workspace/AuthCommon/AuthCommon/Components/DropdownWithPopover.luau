local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.FocusNavigationUtils);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.InputHandlers);
local v5 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_AppFocusRoot_0 = v2.AppFocusRoot;
local l_FocusNavigationEventNameEnum_0 = v2.FocusNavigationEventNameEnum;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v2.FocusNavigableSurfaceIdentifierEnum;
local l_useLastInputMode_0 = v2.useLastInputMode;
local l_Popover_0 = v3.Popover;
local l_PopoverAlign_0 = v3.Enums.PopoverAlign;
local l_PopoverSide_0 = v3.Enums.PopoverSide;
local l_ScrollBarVisibility_0 = v3.Enums.ScrollBarVisibility;
local l_ScrollView_0 = v3.ScrollView;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local v19 = require(l_script_FirstAncestor_0.Components.SideModalDropdownButton);
local v20 = require(l_Parent_0.ReactFocusNavigation);
local l_FFlagUseBirthdayDropdownForGamepad_0 = require(l_Parent_0.SharedFlags).FFlagUseBirthdayDropdownForGamepad;
local function v23(v22) --[[ Line: 54 ]] --[[ Name: selectScreenSize ]]
    return v22.ScreenSize;
end;
return v5.memo(function(v24) --[[ Line: 58 ]] --[[ Name: DropdownWithPopover ]]
    -- upvalues: l_useTokens_0 (copy), l_useSelector_0 (copy), v23 (copy), v5 (copy), l_FFlagUseBirthdayDropdownForGamepad_0 (copy), l_useLastInputMode_0 (copy), v20 (copy), l_View_0 (copy), l_Text_0 (copy), l_Popover_0 (copy), v19 (copy), l_PopoverAlign_0 (copy), l_PopoverSide_0 (copy), l_AppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy)
    local v25 = l_useTokens_0();
    local v26 = l_useSelector_0(v23);
    local v27, v28 = v5.useState(false);
    local v29, v30 = v5.useState({});
    local v31, v32 = v5.useState(Vector2.new(0, 0));
    local v33, v34 = v5.useState(Vector2.new(0, 0));
    local v35 = v5.useRef(nil);
    local v36 = v5.useRef(nil);
    local v37 = if l_FFlagUseBirthdayDropdownForGamepad_0 then l_useLastInputMode_0() == "Focus" else nil;
    local v38 = if l_FFlagUseBirthdayDropdownForGamepad_0 then v20.useFocusGuiObject() else nil;
    v5.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v24 (copy), v30 (copy)
        if v24.value ~= nil then
            for _, v40 in ipairs(v24.cellDatas) do
                if v40.value == v24.value then
                    v30(v40);
                    return;
                end;
            end;
            return;
        else
            v30({});
            return;
        end;
    end, {
        v24.value, 
        v24.cellDatas
    });
    local v41 = v5.useCallback(function() --[[ Line: 86 ]]
        -- upvalues: l_FFlagUseBirthdayDropdownForGamepad_0 (ref), v38 (copy), v37 (copy), v35 (copy), v28 (copy)
        if l_FFlagUseBirthdayDropdownForGamepad_0 and v38 and v37 then
            v38(v35.current);
        end;
        v28(false);
    end, {
        v35.current, 
        v37
    });
    v5.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: l_FFlagUseBirthdayDropdownForGamepad_0 (ref), v38 (copy), v24 (copy), v35 (copy)
        if l_FFlagUseBirthdayDropdownForGamepad_0 and v38 and v24.focusOnMount then
            v38(v35.current);
        end;
    end, {
        v35.current
    });
    v5.useEffect(function() --[[ Line: 99 ]]
        -- upvalues: v24 (copy), v27 (copy)
        if v24.onDropdownOpened then
            v24.onDropdownOpened(v27);
        end;
    end, {
        v27
    });
    local v46 = v5.useMemo(function() --[[ Line: 106 ]]
        -- upvalues: v24 (copy), v41 (copy), v5 (ref), l_View_0 (ref), v29 (copy), l_Text_0 (ref)
        local v42 = {};
        for _, v44 in ipairs(v24.cellDatas) do
            local function v45() --[[ Line: 109 ]]
                -- upvalues: v24 (ref), v44 (copy), v41 (ref)
                v24.onChange(v44.value);
                v41();
            end;
            table.insert(v42, v5.createElement(l_View_0, {
                onActivated = v45, 
                selection = {
                    Selectable = true
                }, 
                tag = {
                    ["size-full-0"] = true, 
                    ["auto-y"] = true, 
                    ["padding-small"] = true, 
                    ["radius-medium"] = true, 
                    ["bg-shift-200"] = v29 == v44
                }
            }, {
                TextContainer = v5.createElement(l_View_0, {
                    tag = "size-full-0 auto-y"
                }, {
                    Text = v5.createElement(l_Text_0, {
                        Text = v44.text, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        tag = "auto-xy"
                    })
                })
            }));
        end;
        return v42;
    end, {
        v24.cellDatas, 
        v29, 
        v24.onChange, 
        v41
    });
    local v47 = v5.useCallback(function() --[[ Line: 147 ]]
        -- upvalues: v28 (copy), v27 (copy)
        v28(not v27);
    end, {
        v27
    });
    return v5.createElement(l_View_0, {
        tag = "size-full-0 auto-y", 
        ref = v35, 
        onAbsoluteSizeChanged = function(v48) --[[ Line: 154 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: v32 (copy)
            v32(v48.AbsoluteSize);
        end, 
        LayoutOrder = v24.layoutOrder
    }, {
        Popover = v5.createElement(l_Popover_0.Root, {
            isOpen = v27
        }, {
            Anchor = v5.createElement(l_Popover_0.Anchor, nil, v5.createElement(l_View_0, {
                Size = UDim2.new(0, v31.X, 0, v31.Y)
            }, {
                DropdownButton = v5.createElement(v19, {
                    onActivated = v47, 
                    text = if v29.text and #v29.text > 0 then v29.text else if v24.placeholder then v24.placeholder else "", 
                    isDropdownError = v24.errorState, 
                    backgroundColorToken = if l_FFlagUseBirthdayDropdownForGamepad_0 then v24.backgroundColorToken else nil, 
                    height = if l_FFlagUseBirthdayDropdownForGamepad_0 then v24.dropdownHeight else nil, 
                    fixSizeToParent = if l_FFlagUseBirthdayDropdownForGamepad_0 then v24.fixSizeToParent else nil
                })
            })), 
            Content = v5.createElement(l_Popover_0.Content, {
                align = l_PopoverAlign_0.Center, 
                side = l_PopoverSide_0.Bottom, 
                hasArrow = false, 
                selection = {
                    Selectable = true
                }
            }, {
                DropdownPopup = v5.createElement(l_View_0, {
                    tag = "auto-xy"
                }, {
                    AppFocusRoot = v5.createElement(l_AppFocusRoot_0, {
                        surfaceIdentifier = if v27 then l_FocusNavigableSurfaceIdentifierEnum_0.ModerationOverlay else l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                        isIsolated = v27, 
                        customEventHandlers = {
                            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                                handler = v4.onRelease(v41)
                            }
                        }
                    }, {
                        v5.createElement(l_ScrollView_0, {
                            Size = UDim2.new(0, math.min(v26.X, v33.X), 0, (math.min(500, v26.Y - (v24.topOffset or 0), v33.Y))), 
                            scroll = {
                                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                                CanvasSize = UDim2.new(1, 0, 0, 0), 
                                ScrollingDirection = Enum.ScrollingDirection.Y, 
                                scrollBarVisibility = l_ScrollBarVisibility_0.Always
                            }, 
                            gradientHeight = 15
                        }, {
                            BaseMenu = v5.createElement(l_View_0, {
                                Size = UDim2.new(0, v31.X + v25.Stroke.Standard * 2, 0, 0), 
                                onAbsoluteSizeChanged = function(v49) --[[ Line: 231 ]] --[[ Name: onAbsoluteSizeChanged ]]
                                    -- upvalues: v34 (copy)
                                    v34(v49.AbsoluteSize);
                                end, 
                                tag = "auto-y col align-y-center gap-xsmall padding-xsmall", 
                                ref = v36
                            }, v46)
                        })
                    })
                })
            })
        })
    });
end);