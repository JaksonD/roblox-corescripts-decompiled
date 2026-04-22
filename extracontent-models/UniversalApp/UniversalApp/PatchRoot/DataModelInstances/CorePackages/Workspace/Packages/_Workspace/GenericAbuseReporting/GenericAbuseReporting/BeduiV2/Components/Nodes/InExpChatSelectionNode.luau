local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_DialogSize_0 = v3.Enums.DialogSize;
local l_Dropdown_0 = v3.Dropdown;
local l_Empty_0 = v3.Empty;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_List_0 = v3.List;
local l_ListItemInputType_0 = v3.Enums.ListItemInputType;
local l_Radius_0 = v3.Enums.Radius;
local l_Sheet_0 = v3.Sheet;
local l_Skeleton_0 = v3.Skeleton;
local l_Text_0 = v3.Text;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local v19 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v20 = require(l_script_FirstAncestor_0.BeduiV2.Utils.scrollToItem);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local l_useGroupedListLoader_0 = require(l_script_FirstAncestor_0.BeduiV2.Loaders.useLoader).useGroupedListLoader;
local l_useLayoutSlots_0 = v19.useLayoutSlots;
local function _(v25, v26) --[[ Line: 31 ]] --[[ Name: useScrollToSelected ]]
    -- upvalues: v4 (copy), v20 (copy)
    v4.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v25 (copy), v26 (copy), v20 (ref)
        if not v25 then
            return;
        else
            local v27 = v26.current[v25];
            if not v27 then
                return;
            else
                local l_v27_FirstAncestorWhichIsA_0 = v27:FindFirstAncestorWhichIsA("ScrollingFrame");
                if not l_v27_FirstAncestorWhichIsA_0 then
                    return;
                else
                    local v29 = false;
                    local v30 = {
                        current = l_v27_FirstAncestorWhichIsA_0.Parent
                    };
                    local v31 = {
                        current = v27
                    };
                    local function _() --[[ Line: 54 ]] --[[ Name: performScroll ]]
                        -- upvalues: v29 (ref), v20 (ref), v30 (copy), v31 (copy)
                        if v29 then
                            return;
                        else
                            v20(v30, v31);
                            return;
                        end;
                    end;
                    if v27.AbsoluteSize.Y > 0 then
                        if not v29 then
                            v20(v30, v31);
                        end;
                    else
                        local v33 = nil;
                        do
                            local l_v33_0 = v33;
                            l_v33_0 = v27:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 66 ]]
                                -- upvalues: v27 (copy), l_v33_0 (ref), v29 (ref), v20 (ref), v30 (copy), v31 (copy)
                                if v27.AbsoluteSize.Y > 0 then
                                    l_v33_0:Disconnect();
                                    if v29 then
                                        return;
                                    else
                                        v20(v30, v31);
                                    end;
                                end;
                            end);
                            task.delay(2, function() --[[ Line: 73 ]]
                                -- upvalues: l_v33_0 (ref)
                                if l_v33_0.Connected then
                                    l_v33_0:Disconnect();
                                end;
                            end);
                        end;
                    end;
                    return function() --[[ Line: 80 ]]
                        -- upvalues: v29 (ref)
                        v29 = true;
                    end;
                end;
            end;
        end;
    end, {
        v25
    });
end;
local function v39() --[[ Line: 122 ]] --[[ Name: LoadingContent ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_Sheet_0 (copy), l_View_0 (copy), v2 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local v36 = l_useTokens_0();
    return v4.createElement(l_Sheet_0.Content, nil, {
        SkeletonContainer = v4.createElement(l_View_0, {
            tag = "col gap-medium size-full-0 auto-y"
        }, v2.map(table.create(5, true), function(_, v38) --[[ Line: 129 ]]
            -- upvalues: v4 (ref), l_Skeleton_0 (ref), l_Radius_0 (ref), v36 (copy)
            return v4.createElement(l_Skeleton_0, {
                key = tostring(v38), 
                radius = l_Radius_0.Medium, 
                Size = UDim2.new(1, 0, 0, v36.Size.Size_800)
            });
        end))
    });
end;
local function v42(v40) --[[ Line: 140 ]] --[[ Name: ErrorContent ]]
    -- upvalues: l_useArTranslation_0 (copy), v4 (copy), l_Sheet_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    return v4.createElement(l_Sheet_0.Content, nil, {
        ErrorContainer = v4.createElement(l_View_0, {
            tag = "align-x-center align-y-center gap-medium size-full"
        }, {
            ErrorText = v4.createElement(l_Text_0, {
                Text = l_translateIntoString_0(v40.errorText), 
                RichText = true, 
                tag = "auto-xy text-body-medium text-wrap text-align-x-left"
            }), 
            RetryButton = v4.createElement(l_Button_0, {
                text = l_translateIntoString_0(v40.retryButtonText), 
                variant = l_ButtonVariant_0.Standard, 
                fillBehavior = l_FillBehavior_0.Fit, 
                onActivated = v40.retry or function() --[[ Line: 160 ]]

                end
            })
        })
    });
end;
return v4.memo(function(v43) --[[ Line: 173 ]] --[[ Name: InExpChatSelectionNode ]]
    -- upvalues: v4 (copy), l_useArTranslation_0 (copy), l_useLayoutSlots_0 (copy), l_useGroupedListLoader_0 (copy), v20 (copy), v2 (copy), v39 (copy), v42 (copy), l_Sheet_0 (copy), l_View_0 (copy), l_Empty_0 (copy), l_Dropdown_0 (copy), l_List_0 (copy), l_ListItemInputType_0 (copy), l_DialogSize_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v44, v45 = v4.useState(v43.initialValue or nil);
    local v46 = v4.useRef(nil);
    local v47, v48 = v4.useState(nil);
    local v49, v50 = v4.useState(true);
    local l_translateIntoString_1 = l_useArTranslation_0().translateIntoString;
    local v52 = v4.useRef({});
    local v53 = v4.useRef(false);
    local l_Body_0 = l_useLayoutSlots_0().Body;
    local v55 = l_useGroupedListLoader_0(v43.items);
    local v56 = v55.data or {};
    v4.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v44 (copy), v52 (copy), v20 (ref)
        if not v44 then
            return;
        else
            local v57 = v52.current[v44];
            if not v57 then
                return;
            else
                local l_v57_FirstAncestorWhichIsA_0 = v57:FindFirstAncestorWhichIsA("ScrollingFrame");
                if not l_v57_FirstAncestorWhichIsA_0 then
                    return;
                else
                    local v59 = false;
                    local v60 = {
                        current = l_v57_FirstAncestorWhichIsA_0.Parent
                    };
                    local v61 = {
                        current = v57
                    };
                    local function _() --[[ Line: 54 ]] --[[ Name: performScroll ]]
                        -- upvalues: v59 (ref), v20 (ref), v60 (copy), v61 (copy)
                        if v59 then
                            return;
                        else
                            v20(v60, v61);
                            return;
                        end;
                    end;
                    if v57.AbsoluteSize.Y > 0 then
                        if not v59 then
                            v20(v60, v61);
                        end;
                    else
                        local v63 = nil;
                        do
                            local l_v63_0 = v63;
                            l_v63_0 = v57:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 66 ]]
                                -- upvalues: v57 (copy), l_v63_0 (ref), v59 (ref), v20 (ref), v60 (copy), v61 (copy)
                                if v57.AbsoluteSize.Y > 0 then
                                    l_v63_0:Disconnect();
                                    if v59 then
                                        return;
                                    else
                                        v20(v60, v61);
                                    end;
                                end;
                            end);
                            task.delay(2, function() --[[ Line: 73 ]]
                                -- upvalues: l_v63_0 (ref)
                                if l_v63_0.Connected then
                                    l_v63_0:Disconnect();
                                end;
                            end);
                        end;
                    end;
                    return function() --[[ Line: 80 ]]
                        -- upvalues: v59 (ref)
                        v59 = true;
                    end;
                end;
            end;
        end;
    end, {
        v44
    });
    local v65 = #v56 > 1;
    local v70 = v4.useMemo(function() --[[ Line: 191 ]]
        -- upvalues: v47 (copy), v44 (copy), v56 (copy)
        if v47 then
            return v47;
        else
            if v44 then
                for _, v67 in ipairs(v56) do
                    for _, v69 in ipairs(v67.items) do
                        if v69.id == v44 then
                            return v67.id;
                        end;
                    end;
                end;
            end;
            return v56[1] and v56[1].id or nil;
        end;
    end, {
        v47, 
        v44, 
        v56
    });
    local v74 = v4.useMemo(function() --[[ Line: 207 ]]
        -- upvalues: v56 (copy), v2 (ref), v70 (copy)
        if #v56 == 0 then
            return {};
        else
            local v72 = v2.find(v56, function(v71) --[[ Line: 211 ]]
                -- upvalues: v70 (ref)
                return v71.id == v70;
            end);
            local v73;
            if v72 then
                v73 = v72.items;
                if not v73 then
                    return {};
                end;
            else
                v73 = v56[1] and v56[1].items or {};
            end;
            return v73;
        end;
    end, {
        v56, 
        v70
    });
    local v75 = v4.useCallback(function() --[[ Line: 217 ]]
        -- upvalues: v53 (copy), v50 (copy)
        v53.current = true;
        v50(false);
    end, {});
    local v77 = v4.useMemo(function() --[[ Line: 222 ]]
        -- upvalues: v2 (ref), v56 (copy)
        return v2.map(v56, function(v76) --[[ Line: 223 ]]
            return {
                id = v76.id, 
                text = v76.label
            };
        end);
    end, {
        v56
    });
    local v78 = nil;
    v78 = if v55.loading then v4.createElement(v39) else if v55.error then v4.createElement(v42, {
        retry = v55.retry, 
        errorText = v43.errorText, 
        retryButtonText = v43.retryButtonText
    }) else if #v74 == 0 then v4.createElement(l_Sheet_0.Content, nil, {
        Empty = v4.createElement(l_View_0, {
            tag = "align-x-center align-y-center size-full"
        }, v4.createElement(l_Empty_0, {
            text = l_translateIntoString_1(v43.emptyText)
        }))
    }) else v4.createElement(l_Sheet_0.Content, nil, {
        ChannelDropdown = if v65 then v4.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = 1
        }, {
            Dropdown = v4.createElement(l_Dropdown_0.Root, {
                label = "", 
                value = v70, 
                items = v77, 
                width = UDim.new(1, 0), 
                onItemChanged = function(v79) --[[ Line: 261 ]] --[[ Name: onItemChanged ]]
                    -- upvalues: v45 (copy), v48 (copy)
                    v45(nil);
                    v48((tostring(v79)));
                end
            })
        }) else nil, 
        ItemList = v4.createElement(l_List_0.Root, {
            hasDivider = {
                hasDivider = true, 
                isInset = false
            }, 
            isContained = {
                isContained = false, 
                hasMargin = true
            }, 
            LayoutOrder = 2
        }, {
            v2.map(v74, function(v80, v81) --[[ Line: 279 ]]
                -- upvalues: v4 (ref), l_List_0 (ref), l_translateIntoString_1 (copy), v45 (copy), v46 (copy), l_ListItemInputType_0 (ref), v44 (copy), v52 (copy)
                return v4.createElement(l_List_0.Item, {
                    description = l_translateIntoString_1(v80.label), 
                    onActivated = {
                        onActivated = function() --[[ Line: 284 ]] --[[ Name: onActivated ]]
                            -- upvalues: v45 (ref), v80 (copy), v46 (ref)
                            v45(v80.id);
                            v46.current = v80;
                        end, 
                        inputType = l_ListItemInputType_0.Radio, 
                        isChecked = v44 == v80.id
                    }, 
                    LayoutOrder = v81, 
                    ref = function(v82) --[[ Line: 292 ]] --[[ Name: ref ]]
                        -- upvalues: v52 (ref), v80 (copy)
                        v52.current[v80.id] = v82;
                    end, 
                    key = v80.id
                });
            end)
        })
    });
    return v4.createElement(v4.Fragment, nil, {
        Content = v4.createElement(l_Body_0), 
        ChatSelectionSheet = v4.createElement(l_Sheet_0.Root, {
            isOpen = v49, 
            centerSheetHeight = 1, 
            size = l_DialogSize_0.Medium, 
            preferCenterSheet = true, 
            snapPoints = {
                0.9
            }, 
            onClose = function() --[[ Line: 311 ]] --[[ Name: onClose ]]
                -- upvalues: v53 (copy), v43 (copy), v44 (copy), v46 (copy)
                if v53.current then
                    v53.current = false;
                    if v43.onNext then
                        v43.onNext(v44, v46.current);
                        return;
                    end;
                elseif v43.goBack then
                    v43.goBack();
                end;
            end
        }, {
            SheetHeader = v4.createElement(l_Sheet_0.Header, nil, {
                Title = v4.createElement(l_Text_0, {
                    tag = "align-x-left auto-xy text-title-large text-truncate-end content-emphasis", 
                    Text = l_translateIntoString_1(v43.title)
                })
            }), 
            SheetContent = v78, 
            SheetActions = if not (not not v55.loading or v55.error) and v44 ~= nil then v4.createElement(l_Sheet_0.Actions, nil, {
                Button = v4.createElement(l_Button_0, {
                    variant = l_ButtonVariant_0.Emphasis, 
                    text = l_translateIntoString_1(v43.nextButtonText), 
                    isLoading = v43.isSubmitting, 
                    isDisabled = v43.isSubmitting, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    onActivated = v75
                })
            }) else nil
        })
    });
end);