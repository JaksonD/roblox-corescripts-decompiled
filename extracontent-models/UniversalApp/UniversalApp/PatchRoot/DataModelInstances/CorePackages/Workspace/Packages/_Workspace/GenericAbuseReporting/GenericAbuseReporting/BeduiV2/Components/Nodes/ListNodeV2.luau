local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Empty_0 = v3.Empty;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_IconName_0 = v3.Enums.IconName;
local l_List_0 = v3.List;
local l_ListItemInputType_0 = v3.Enums.ListItemInputType;
local l_Skeleton_0 = v3.Skeleton;
local l_Radius_0 = v3.Enums.Radius;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local v16 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext);
local v17 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local v18 = require(l_script_FirstAncestor_0.BeduiV2.Components.Eyebrow);
local v19 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v20 = require(l_script_FirstAncestor_0.BeduiV2.Utils.scrollToItem);
local v21 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local l_useListLoader_0 = require(l_script_FirstAncestor_0.BeduiV2.Loaders.useLoader).useListLoader;
local l_TelemetryEventType_0 = v17.TelemetryEventType;
local l_useAbuseReportAnalytics_0 = v16.useAbuseReportAnalytics;
local l_useLayoutSlots_0 = v19.useLayoutSlots;
local v28 = {
    chevron = nil, 
    radio = l_ListItemInputType_0.Radio, 
    toggle = l_ListItemInputType_0.Toggle, 
    checkbox = l_ListItemInputType_0.Checkbox
};
local function v34(v29) --[[ Line: 69 ]] --[[ Name: ListNodeLoading ]]
    -- upvalues: v4 (copy), v18 (copy), v21 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local l_body_0 = v29.body;
    local l_title_0 = v29.title;
    local l_eyebrow_0 = v29.eyebrow;
    local l_tokens_0 = v29.tokens;
    return v4.createElement(l_body_0, nil, {
        Eyebrow = l_eyebrow_0 and v4.createElement(v18, {
            eyebrow = l_eyebrow_0, 
            layoutOrder = 0
        }), 
        Title = v4.createElement(v21, {
            input = l_title_0, 
            tag = "size-full-0 auto-y text-heading-medium", 
            layoutOrder = 1
        }), 
        SkeletonContainer = v4.createElement(l_View_0, {
            tag = "col size-full-0 auto-y gap-medium", 
            LayoutOrder = 2
        }, {
            Skeleton1 = v4.createElement(l_Skeleton_0, {
                radius = l_Radius_0.Medium, 
                Size = UDim2.new(1, 0, 0, l_tokens_0.Size.Size_600)
            }), 
            Skeleton2 = v4.createElement(l_Skeleton_0, {
                radius = l_Radius_0.Medium, 
                Size = UDim2.new(1, 0, 0, l_tokens_0.Size.Size_600)
            }), 
            Skeleton3 = v4.createElement(l_Skeleton_0, {
                radius = l_Radius_0.Medium, 
                Size = UDim2.new(1, 0, 0, l_tokens_0.Size.Size_600)
            }), 
            Skeleton4 = v4.createElement(l_Skeleton_0, {
                radius = l_Radius_0.Medium, 
                Size = UDim2.new(1, 0, 0, l_tokens_0.Size.Size_600)
            }), 
            Skeleton5 = v4.createElement(l_Skeleton_0, {
                radius = l_Radius_0.Medium, 
                Size = UDim2.new(1, 0, 0, l_tokens_0.Size.Size_600)
            })
        })
    });
end;
local function v37(v35) --[[ Line: 117 ]] --[[ Name: ListNodeError ]]
    -- upvalues: l_useArTranslation_0 (copy), v4 (copy), v18 (copy), v21 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), v3 (copy)
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    return v4.createElement(v35.body, nil, {
        Eyebrow = v35.eyebrow and v4.createElement(v18, {
            eyebrow = v35.eyebrow, 
            layoutOrder = 0
        }), 
        Title = v4.createElement(v21, {
            input = v35.title, 
            tag = "size-full-0 auto-y text-heading-medium", 
            layoutOrder = 1
        }), 
        ErrorText = v4.createElement(v21, {
            input = l_translateIntoString_0(v35.errorText), 
            tag = "size-full-0 auto-y text-body-small", 
            layoutOrder = 2
        }), 
        RetryButton = v4.createElement(l_Button_0, {
            text = l_translateIntoString_0(v35.retryButtonText), 
            variant = l_ButtonVariant_0.Standard, 
            fillBehavior = v3.Enums.FillBehavior.Fit, 
            onActivated = v35.retry, 
            LayoutOrder = 3
        })
    });
end;
return v4.memo(function(v38) --[[ Line: 156 ]] --[[ Name: ListNode ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_useArTranslation_0 (copy), l_useAbuseReportAnalytics_0 (copy), l_useLayoutSlots_0 (copy), v20 (copy), l_useListLoader_0 (copy), v2 (copy), l_TelemetryEventType_0 (copy), v34 (copy), v37 (copy), l_Empty_0 (copy), v18 (copy), v21 (copy), l_View_0 (copy), l_List_0 (copy), l_IconName_0 (copy), v28 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v39 = l_useTokens_0();
    local v40, v41 = v4.useState(v38.initialValue or nil);
    local l_translateIntoString_1 = l_useArTranslation_0().translateIntoString;
    local l_sendEvent_0 = l_useAbuseReportAnalytics_0().sendEvent;
    local v44 = v4.useRef(nil);
    local v45, v46 = v4.useState(false);
    local v47, v48 = v4.useState(false);
    local v49 = l_useLayoutSlots_0();
    local l_Body_0 = v49.Body;
    local l_Actions_0 = v49.Actions;
    v4.useEffect(function() --[[ Line: 170 ]]
        -- upvalues: v44 (copy), v46 (copy), v48 (copy)
        local l_current_0 = v44.current;
        if not l_current_0 then
            return;
        else
            local l_l_current_0_FirstChildWhichIsA_0 = l_current_0:FindFirstChildWhichIsA("ScrollingFrame", true);
            if not l_l_current_0_FirstChildWhichIsA_0 then
                return;
            else
                local function v55() --[[ Line: 183 ]] --[[ Name: checkScrollbar ]]
                    -- upvalues: l_l_current_0_FirstChildWhichIsA_0 (copy), v46 (ref)
                    local v54 = l_l_current_0_FirstChildWhichIsA_0.AbsoluteCanvasSize.Y > l_l_current_0_FirstChildWhichIsA_0.AbsoluteWindowSize.Y;
                    v46(v54);
                end;
                local function v56() --[[ Line: 188 ]] --[[ Name: onScroll ]]
                    -- upvalues: l_l_current_0_FirstChildWhichIsA_0 (copy), v48 (ref)
                    if l_l_current_0_FirstChildWhichIsA_0.CanvasPosition.Y > 0 then
                        v48(true);
                    end;
                end;
                local v57 = l_l_current_0_FirstChildWhichIsA_0.AbsoluteCanvasSize.Y > l_l_current_0_FirstChildWhichIsA_0.AbsoluteWindowSize.Y;
                v46(v57);
                v57 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v55);
                local v58 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(v55);
                local v59 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("CanvasPosition"):Connect(v56);
                return function() --[[ Line: 201 ]]
                    -- upvalues: v57 (copy), v58 (copy), v59 (copy)
                    v57:Disconnect();
                    v58:Disconnect();
                    v59:Disconnect();
                end;
            end;
        end;
    end, {});
    local v60 = v4.useRef({});
    local v61 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 211 ]]
        -- upvalues: v40 (copy), v61 (copy), v60 (copy), v20 (ref), v44 (copy)
        if v40 then
            v61.current = v60.current[v40];
            v20(v44, v61);
            return;
        else
            v61.current = nil;
            return;
        end;
    end, {
        v40
    });
    local v62 = l_useListLoader_0(v38.items);
    local l_loading_0 = v62.loading;
    local l_error_0 = v62.error;
    local l_retry_0 = v62.retry;
    local l_data_0 = v62.data;
    local v67 = v38.variant or "radio";
    local v68 = v67 == "chevron";
    local v73 = v4.useCallback(function(v69) --[[ Line: 229 ]]
        -- upvalues: l_data_0 (copy), v41 (copy), v2 (ref), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v45 (copy), v47 (copy)
        if not l_data_0 then
            return;
        else
            v41(v69);
            local v70 = 0;
            v2.forEach(l_data_0, function(v71, v72) --[[ Line: 237 ]]
                -- upvalues: v69 (copy), v70 (ref)
                if v71.id == v69 then
                    v70 = v72;
                    return;
                else
                    return;
                end;
            end);
            l_sendEvent_0({
                sub_event_type = l_TelemetryEventType_0.SelectItem, 
                select_item_detail = {
                    selected_index = v70, 
                    list_length = #l_data_0, 
                    has_scroll = v45, 
                    did_scroll = v47
                }
            });
            return;
        end;
    end, {
        l_sendEvent_0, 
        v45, 
        v47, 
        l_data_0
    });
    local v76 = v4.useCallback(function() --[[ Line: 254 ]]
        -- upvalues: l_data_0 (copy), v2 (ref), v40 (copy), v38 (copy)
        if not l_data_0 then
            return;
        else
            local v75 = v2.find(l_data_0, function(v74) --[[ Line: 259 ]]
                -- upvalues: v40 (ref)
                return v74.id == v40;
            end);
            if v38.onNext then
                v38.onNext(v40, v75);
            end;
            return;
        end;
    end, {
        l_data_0, 
        v38.onNext, 
        v40
    });
    if l_loading_0 then
        return v4.createElement(v34, {
            body = l_Body_0, 
            title = v38.title, 
            eyebrow = v38.eyebrow, 
            tokens = v39
        });
    elseif l_error_0 then
        return v4.createElement(v37, {
            body = l_Body_0, 
            title = v38.title, 
            eyebrow = v38.eyebrow, 
            errorText = v38.errorText, 
            retryButtonText = v38.retryButtonText, 
            tokens = v39, 
            retry = l_retry_0
        });
    else
        return v4.createElement(v4.Fragment, nil, {
            Content = v4.createElement(l_Body_0, {
                ref = v44
            }, if not (l_data_0 ~= nil) or #l_data_0 == 0 then {
                Empty = v4.createElement(l_Empty_0)
            } else {
                Eyebrow = v4.createElement(v18, {
                    eyebrow = v38.eyebrow, 
                    layoutOrder = 0
                }), 
                Title = v4.createElement(v21, {
                    input = v38.title, 
                    tag = "size-full-0 auto-y text-heading-medium", 
                    layoutOrder = 1
                }), 
                ItemListContainer = v4.createElement(l_View_0, {
                    tag = "size-full-0 auto-y", 
                    LayoutOrder = 2
                }, {
                    ItemList = v4.createElement(l_List_0.Root, {
                        hasDivider = {
                            hasDivider = true, 
                            isInset = false
                        }, 
                        isContained = {
                            isContained = false, 
                            hasMargin = true
                        }
                    }, {
                        v2.map(l_data_0, function(v77, v78) --[[ Line: 323 ]]
                            -- upvalues: v4 (ref), l_List_0 (ref), l_IconName_0 (ref), l_translateIntoString_1 (copy), v68 (copy), v38 (copy), v73 (copy), v28 (ref), v67 (copy), v40 (copy), v60 (copy)
                            return v4.createElement(l_List_0.Item, {
                                leading = if type(v77.leading) == "string" then l_IconName_0[v77.leading] else v77.leading, 
                                title = l_translateIntoString_1(v77.label), 
                                description = if v77.description then l_translateIntoString_1(v77.description) else nil, 
                                onActivated = {
                                    onActivated = v68 and function() --[[ Line: 334 ]]
                                        -- upvalues: v38 (ref), v77 (copy)
                                        if v38.onNext then
                                            v38.onNext(v77.id, v77);
                                        end;
                                    end or function() --[[ Line: 339 ]]
                                        -- upvalues: v73 (ref), v77 (copy)
                                        v73(v77.id);
                                    end, 
                                    inputType = v28[v67], 
                                    isChecked = v40 == v77.id
                                }, 
                                LayoutOrder = v78, 
                                ref = function(v79) --[[ Line: 346 ]] --[[ Name: ref ]]
                                    -- upvalues: v60 (ref), v77 (copy)
                                    v60.current[v77.id] = v79;
                                end
                            });
                        end)
                    })
                })
            }), 
            Actions = if not (not v38.onNext or v68) and v40 ~= nil then v4.createElement(l_Actions_0, nil, {
                Button = v4.createElement(l_Button_0, {
                    text = l_translateIntoString_1(v38.nextButtonText), 
                    variant = l_ButtonVariant_0.Emphasis, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    isLoading = v38.isSubmitting, 
                    isDisabled = v38.isSubmitting, 
                    onActivated = v76
                })
            }) else nil
        });
    end;
end);