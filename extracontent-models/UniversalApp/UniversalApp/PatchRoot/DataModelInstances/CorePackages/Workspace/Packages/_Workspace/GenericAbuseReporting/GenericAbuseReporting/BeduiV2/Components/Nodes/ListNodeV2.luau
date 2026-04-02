local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Empty_0 = v3.Empty;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_Skeleton_0 = v3.Skeleton;
local l_Radius_0 = v3.Enums.Radius;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local v13 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext);
local v14 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local v15 = require(l_script_FirstAncestor_0.BeduiV2.Components.Eyebrow);
local v16 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v17 = require(l_script_FirstAncestor_0.Common.List);
local v18 = require(l_script_FirstAncestor_0.BeduiV2.Utils.scrollToItem);
local v19 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local l_useListLoader_0 = require(l_script_FirstAncestor_0.BeduiV2.Loaders.useLoader).useListLoader;
local l_TelemetryEventType_0 = v14.TelemetryEventType;
local l_useAbuseReportAnalytics_0 = v13.useAbuseReportAnalytics;
local l_useLayoutSlots_0 = v16.useLayoutSlots;
local function v31(v26) --[[ Line: 56 ]] --[[ Name: ListNodeLoading ]]
    -- upvalues: v4 (copy), v15 (copy), v19 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local l_body_0 = v26.body;
    local l_title_0 = v26.title;
    local l_eyebrow_0 = v26.eyebrow;
    local l_tokens_0 = v26.tokens;
    return v4.createElement(l_body_0, nil, {
        Eyebrow = l_eyebrow_0 and v4.createElement(v15, {
            eyebrow = l_eyebrow_0, 
            layoutOrder = 0
        }), 
        Title = v4.createElement(v19, {
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
local function v33(v32) --[[ Line: 104 ]] --[[ Name: ListNodeError ]]
    -- upvalues: v4 (copy), v15 (copy), v19 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), v3 (copy)
    return v4.createElement(v32.body, nil, {
        Eyebrow = v32.eyebrow and v4.createElement(v15, {
            eyebrow = v32.eyebrow, 
            layoutOrder = 0
        }), 
        Title = v4.createElement(v19, {
            input = v32.title, 
            tag = "size-full-0 auto-y text-heading-medium", 
            layoutOrder = 1
        }), 
        ErrorText = v4.createElement(v19, {
            input = "Something went wrong. Please try again later.", 
            tag = "size-full-0 auto-y text-body-small", 
            layoutOrder = 2
        }), 
        RetryButton = v4.createElement(l_Button_0, {
            text = "Retry", 
            variant = l_ButtonVariant_0.Standard, 
            fillBehavior = v3.Enums.FillBehavior.Fit, 
            onActivated = v32.retry, 
            LayoutOrder = 3
        })
    });
end;
return v4.memo(function(v34) --[[ Line: 139 ]] --[[ Name: ListNode ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_useArTranslation_0 (copy), l_useAbuseReportAnalytics_0 (copy), l_useLayoutSlots_0 (copy), v18 (copy), v2 (copy), l_TelemetryEventType_0 (copy), l_useListLoader_0 (copy), v31 (copy), v33 (copy), l_Empty_0 (copy), v15 (copy), v19 (copy), l_View_0 (copy), v17 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v35 = l_useTokens_0();
    local v36, v37 = v4.useState(v34.initialValue or nil);
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local l_sendEvent_0 = l_useAbuseReportAnalytics_0().sendEvent;
    local v40 = v4.useRef(nil);
    local v41, v42 = v4.useState(false);
    local v43, v44 = v4.useState(false);
    local v45 = l_useLayoutSlots_0();
    local l_Body_0 = v45.Body;
    local l_Actions_0 = v45.Actions;
    v4.useEffect(function() --[[ Line: 153 ]]
        -- upvalues: v40 (copy), v42 (copy), v44 (copy)
        local l_current_0 = v40.current;
        if not l_current_0 then
            return;
        else
            local l_l_current_0_FirstChildWhichIsA_0 = l_current_0:FindFirstChildWhichIsA("ScrollingFrame", true);
            if not l_l_current_0_FirstChildWhichIsA_0 then
                return;
            else
                local function v51() --[[ Line: 166 ]] --[[ Name: checkScrollbar ]]
                    -- upvalues: l_l_current_0_FirstChildWhichIsA_0 (copy), v42 (ref)
                    local v50 = l_l_current_0_FirstChildWhichIsA_0.AbsoluteCanvasSize.Y > l_l_current_0_FirstChildWhichIsA_0.AbsoluteWindowSize.Y;
                    v42(v50);
                end;
                local function v52() --[[ Line: 171 ]] --[[ Name: onScroll ]]
                    -- upvalues: l_l_current_0_FirstChildWhichIsA_0 (copy), v44 (ref)
                    if l_l_current_0_FirstChildWhichIsA_0.CanvasPosition.Y > 0 then
                        v44(true);
                    end;
                end;
                local v53 = l_l_current_0_FirstChildWhichIsA_0.AbsoluteCanvasSize.Y > l_l_current_0_FirstChildWhichIsA_0.AbsoluteWindowSize.Y;
                v42(v53);
                v53 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v51);
                local v54 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(v51);
                local v55 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("CanvasPosition"):Connect(v52);
                return function() --[[ Line: 184 ]]
                    -- upvalues: v53 (copy), v54 (copy), v55 (copy)
                    v53:Disconnect();
                    v54:Disconnect();
                    v55:Disconnect();
                end;
            end;
        end;
    end, {});
    local v56 = v4.useRef({});
    local v57 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 194 ]]
        -- upvalues: v36 (copy), v57 (copy), v56 (copy), v18 (ref), v40 (copy)
        if v36 then
            v57.current = v56.current[v36];
            v18(v40, v57);
            return;
        else
            v57.current = nil;
            return;
        end;
    end, {
        v36
    });
    local v62 = v4.useCallback(function(v58) --[[ Line: 203 ]]
        -- upvalues: v37 (copy), v2 (ref), v34 (copy), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v41 (copy), v43 (copy)
        v37(v58);
        local v59 = 0;
        v2.forEach(v34.items, function(v60, v61) --[[ Line: 207 ]]
            -- upvalues: v58 (copy), v59 (ref)
            if v60.id == v58 then
                v59 = v61;
                return;
            else
                return;
            end;
        end);
        l_sendEvent_0({
            sub_event_type = l_TelemetryEventType_0.SelectItem, 
            select_item_detail = {
                selected_index = v59, 
                list_length = #v34.items, 
                has_scroll = v41, 
                did_scroll = v43
            }
        });
    end, {
        l_sendEvent_0, 
        v41, 
        v43, 
        v34.items
    });
    local v65 = v4.useCallback(function() --[[ Line: 224 ]]
        -- upvalues: v2 (ref), v34 (copy), v36 (copy)
        local v64 = v2.find(v34.items, function(v63) --[[ Line: 225 ]]
            -- upvalues: v36 (ref)
            return v63.id == v36;
        end);
        if v34.onNext then
            v34.onNext(v36, v64);
        end;
    end, {
        v34.items, 
        v34.onNext, 
        v36
    });
    local v66 = l_useListLoader_0(v34.items);
    local l_loading_0 = v66.loading;
    local l_error_0 = v66.error;
    local l_retry_0 = v66.retry;
    local l_data_0 = v66.data;
    if l_loading_0 then
        return v4.createElement(v31, {
            body = l_Body_0, 
            title = v34.title, 
            eyebrow = v34.eyebrow, 
            tokens = v35
        });
    elseif l_error_0 then
        return v4.createElement(v33, {
            body = l_Body_0, 
            title = v34.title, 
            eyebrow = v34.eyebrow, 
            tokens = v35, 
            retry = l_retry_0
        });
    else
        return v4.createElement(v4.Fragment, nil, {
            Content = v4.createElement(l_Body_0, {
                ref = v40
            }, if not (l_data_0 ~= nil) or #l_data_0 == 0 then {
                Empty = v4.createElement(l_Empty_0)
            } else {
                Eyebrow = v4.createElement(v15, {
                    eyebrow = v34.eyebrow, 
                    layoutOrder = 0
                }), 
                Title = v4.createElement(v19, {
                    input = v34.title, 
                    tag = "size-full-0 auto-y text-heading-medium", 
                    layoutOrder = 1
                }), 
                ItemListContainer = v4.createElement(l_View_0, {
                    tag = "size-full-0 auto-y", 
                    LayoutOrder = 2
                }, {
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, -v35.Padding.XLarge), 
                        PaddingRight = UDim.new(0, -v35.Padding.XLarge)
                    }), 
                    ItemList = v4.createElement(v17.Root, {
                        value = v36, 
                        onValueChanged = v62
                    }, {
                        v2.map(l_data_0, function(v71, v72) --[[ Line: 290 ]]
                            -- upvalues: v4 (ref), v17 (ref), l_translateIntoString_0 (copy), l_data_0 (copy), v56 (copy)
                            return v4.createElement(v17.Item, {
                                value = v71.id, 
                                title = l_translateIntoString_0(v71.label), 
                                description = if v71.description then l_translateIntoString_0(v71.description) else nil, 
                                trailingAccessory = "Radio", 
                                hasDivider = v72 ~= #l_data_0, 
                                hasMargin = true, 
                                ref = function(v73) --[[ Line: 300 ]] --[[ Name: ref ]]
                                    -- upvalues: v56 (ref), v71 (copy)
                                    v56.current[v71.id] = v73;
                                end
                            });
                        end)
                    })
                })
            }), 
            Actions = if v34.onNext and v36 ~= nil then v4.createElement(l_Actions_0, nil, {
                Button = v4.createElement(l_Button_0, {
                    text = if v34.nextButtonText then l_translateIntoString_0(v34.nextButtonText) else "Continue", 
                    variant = l_ButtonVariant_0.Emphasis, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    isLoading = v34.isSubmitting, 
                    isDisabled = v34.isSubmitting, 
                    onActivated = v65
                })
            }) else nil
        });
    end;
end);