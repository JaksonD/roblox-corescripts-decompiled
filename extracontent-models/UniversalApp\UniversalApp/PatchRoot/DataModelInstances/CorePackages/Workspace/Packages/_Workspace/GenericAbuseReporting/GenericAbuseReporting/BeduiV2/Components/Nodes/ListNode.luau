local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.SharedFlags);
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_Sheet_0 = v3.Sheet;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local v12 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext);
local v13 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local v14 = require(l_script_FirstAncestor_0.BeduiV2.Components.Eyebrow);
local v15 = require(l_script_FirstAncestor_0.Common.List);
local v16 = require(l_script_FirstAncestor_0.BeduiV2.Utils.scrollToItem);
local v17 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local l_TelemetryEventType_0 = v13.TelemetryEventType;
local l_useAbuseReportAnalytics_0 = v12.useAbuseReportAnalytics;
local l_FFlagRemoveTitleAddEyebrowReport_0 = v5.FFlagRemoveTitleAddEyebrowReport;
local l_FFlagSupportSubmissionOnAllReportNodes_0 = v5.FFlagSupportSubmissionOnAllReportNodes;
return v4.memo(function(v24) --[[ Line: 52 ]] --[[ Name: ListNode ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_useArTranslation_0 (copy), l_useAbuseReportAnalytics_0 (copy), v16 (copy), v2 (copy), l_TelemetryEventType_0 (copy), l_Sheet_0 (copy), l_FFlagRemoveTitleAddEyebrowReport_0 (copy), v14 (copy), v17 (copy), l_View_0 (copy), v15 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), l_FFlagSupportSubmissionOnAllReportNodes_0 (copy)
    local v25 = l_useTokens_0();
    local v26, v27 = v4.useState(v24.initialValue or nil);
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local l_sendEvent_0 = l_useAbuseReportAnalytics_0().sendEvent;
    local v30 = v4.useRef(nil);
    local v31, v32 = v4.useState(false);
    local v33, v34 = v4.useState(false);
    v4.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v30 (copy), v32 (copy), v34 (copy)
        local l_current_0 = v30.current;
        if not l_current_0 then
            return;
        else
            local l_l_current_0_FirstChildWhichIsA_0 = l_current_0:FindFirstChildWhichIsA("ScrollingFrame", true);
            if not l_l_current_0_FirstChildWhichIsA_0 then
                return;
            else
                local function v38() --[[ Line: 75 ]] --[[ Name: checkScrollbar ]]
                    -- upvalues: l_l_current_0_FirstChildWhichIsA_0 (copy), v32 (ref)
                    local v37 = l_l_current_0_FirstChildWhichIsA_0.AbsoluteCanvasSize.Y > l_l_current_0_FirstChildWhichIsA_0.AbsoluteWindowSize.Y;
                    v32(v37);
                end;
                local function v39() --[[ Line: 80 ]] --[[ Name: onScroll ]]
                    -- upvalues: l_l_current_0_FirstChildWhichIsA_0 (copy), v34 (ref)
                    if l_l_current_0_FirstChildWhichIsA_0.CanvasPosition.Y > 0 then
                        v34(true);
                    end;
                end;
                local v40 = l_l_current_0_FirstChildWhichIsA_0.AbsoluteCanvasSize.Y > l_l_current_0_FirstChildWhichIsA_0.AbsoluteWindowSize.Y;
                v32(v40);
                v40 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v38);
                local v41 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(v38);
                local v42 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("CanvasPosition"):Connect(v39);
                return function() --[[ Line: 93 ]]
                    -- upvalues: v40 (copy), v41 (copy), v42 (copy)
                    v40:Disconnect();
                    v41:Disconnect();
                    v42:Disconnect();
                end;
            end;
        end;
    end, {});
    local v43 = v4.useRef({});
    local v44 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 103 ]]
        -- upvalues: v26 (copy), v44 (copy), v43 (copy), v16 (ref), v30 (copy)
        if v26 then
            v44.current = v43.current[v26];
            v16(v30, v44);
            return;
        else
            v44.current = nil;
            return;
        end;
    end, {
        v26
    });
    local v49 = v4.useCallback(function(v45) --[[ Line: 112 ]]
        -- upvalues: v27 (copy), v2 (ref), v24 (copy), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v31 (copy), v33 (copy)
        v27(v45);
        local v46 = 0;
        v2.forEach(v24.items, function(v47, v48) --[[ Line: 116 ]]
            -- upvalues: v45 (copy), v46 (ref)
            if v47.id == v45 then
                v46 = v48;
                return;
            else
                return;
            end;
        end);
        l_sendEvent_0({
            sub_event_type = l_TelemetryEventType_0.SelectItem, 
            select_item_detail = {
                selected_index = v46, 
                list_length = #v24.items, 
                has_scroll = v31, 
                did_scroll = v33
            }
        });
    end, {
        l_sendEvent_0, 
        v31, 
        v33, 
        v24.items
    });
    local v52 = v4.useCallback(function() --[[ Line: 133 ]]
        -- upvalues: v2 (ref), v24 (copy), v26 (copy)
        local v51 = v2.find(v24.items, function(v50) --[[ Line: 134 ]]
            -- upvalues: v26 (ref)
            return v50.id == v26;
        end);
        if v24.onNext then
            v24.onNext(v26, v51);
        end;
    end, {
        v24.items, 
        v24.onNext, 
        v26
    });
    return v4.createElement(v4.Fragment, nil, {
        Content = if v24.items ~= nil then v4.createElement(l_Sheet_0.Content, {
            ref = v30
        }, {
            Eyebrow = if l_FFlagRemoveTitleAddEyebrowReport_0 then v4.createElement(v14, {
                eyebrow = v24.eyebrow, 
                layoutOrder = 0
            }) else nil, 
            Title = v4.createElement(v17, {
                input = v24.title, 
                tag = "size-full-0 auto-y text-heading-medium", 
                layoutOrder = 1
            }), 
            ItemListContainer = v4.createElement(l_View_0, {
                tag = "size-full-0 auto-y", 
                LayoutOrder = 2
            }, {
                UIPadding = v4.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, -v25.Padding.XLarge), 
                    PaddingRight = UDim.new(0, -v25.Padding.XLarge)
                }), 
                ItemList = v4.createElement(v15.Root, {
                    value = v26, 
                    onValueChanged = v49
                }, {
                    v2.map(v24.items, function(v53, v54) --[[ Line: 170 ]]
                        -- upvalues: v4 (ref), v15 (ref), l_translateIntoString_0 (copy), v24 (copy), v43 (copy)
                        return v4.createElement(v15.Item, {
                            value = v53.id, 
                            title = l_translateIntoString_0(v53.label), 
                            description = if v53.description then l_translateIntoString_0(v53.description) else nil, 
                            trailingAccessory = "Radio", 
                            hasDivider = v54 ~= #v24.items, 
                            hasMargin = true, 
                            ref = function(v55) --[[ Line: 178 ]] --[[ Name: ref ]]
                                -- upvalues: v43 (ref), v53 (copy)
                                v43.current[v53.id] = v55;
                            end
                        });
                    end)
                })
            })
        }) else nil, 
        Actions = if v24.onNext and v26 ~= nil then v4.createElement(l_Sheet_0.Actions, nil, {
            Button = v4.createElement(l_Button_0, {
                text = if v24.nextButtonText then l_translateIntoString_0(v24.nextButtonText) else "Continue", 
                variant = l_ButtonVariant_0.Emphasis, 
                fillBehavior = l_FillBehavior_0.Fill, 
                isLoading = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v24.isSubmitting else false, 
                isDisabled = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v24.isSubmitting else false, 
                onActivated = v52
            })
        }) else nil
    });
end);