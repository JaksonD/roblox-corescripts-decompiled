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
local v15 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v16 = require(l_script_FirstAncestor_0.Common.List);
local v17 = require(l_script_FirstAncestor_0.BeduiV2.Utils.scrollToItem);
local v18 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local l_TelemetryEventType_0 = v13.TelemetryEventType;
local l_useAbuseReportAnalytics_0 = v12.useAbuseReportAnalytics;
local l_useLayoutSlots_0 = v15.useLayoutSlots;
local l_FFlagSupportSubmissionOnAllReportNodes_0 = v5.FFlagSupportSubmissionOnAllReportNodes;
local l_FFlagAddLayoutSlotsToReport_0 = v5.FFlagAddLayoutSlotsToReport;
local l_FFlagRemoveHardcodedStringsInReportNodes_0 = v5.FFlagRemoveHardcodedStringsInReportNodes;
return v4.memo(function(v27) --[[ Line: 55 ]] --[[ Name: ListNode ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_useArTranslation_0 (copy), l_useAbuseReportAnalytics_0 (copy), l_FFlagAddLayoutSlotsToReport_0 (copy), l_useLayoutSlots_0 (copy), v17 (copy), v2 (copy), l_TelemetryEventType_0 (copy), l_Sheet_0 (copy), v14 (copy), v18 (copy), l_View_0 (copy), v16 (copy), l_Button_0 (copy), l_FFlagRemoveHardcodedStringsInReportNodes_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), l_FFlagSupportSubmissionOnAllReportNodes_0 (copy)
    local v28 = l_useTokens_0();
    local v29, v30 = v4.useState(v27.initialValue or nil);
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local l_sendEvent_0 = l_useAbuseReportAnalytics_0().sendEvent;
    local v33 = v4.useRef(nil);
    local v34, v35 = v4.useState(false);
    local v36, v37 = v4.useState(false);
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    if l_FFlagAddLayoutSlotsToReport_0 then
        v38 = l_useLayoutSlots_0();
        v39 = v38.Body;
        v40 = v38.Actions;
    end;
    v4.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v33 (copy), v35 (copy), v37 (copy)
        local l_current_0 = v33.current;
        if not l_current_0 then
            return;
        else
            local l_l_current_0_FirstChildWhichIsA_0 = l_current_0:FindFirstChildWhichIsA("ScrollingFrame", true);
            if not l_l_current_0_FirstChildWhichIsA_0 then
                return;
            else
                local function v44() --[[ Line: 85 ]] --[[ Name: checkScrollbar ]]
                    -- upvalues: l_l_current_0_FirstChildWhichIsA_0 (copy), v35 (ref)
                    local v43 = l_l_current_0_FirstChildWhichIsA_0.AbsoluteCanvasSize.Y > l_l_current_0_FirstChildWhichIsA_0.AbsoluteWindowSize.Y;
                    v35(v43);
                end;
                local function v45() --[[ Line: 90 ]] --[[ Name: onScroll ]]
                    -- upvalues: l_l_current_0_FirstChildWhichIsA_0 (copy), v37 (ref)
                    if l_l_current_0_FirstChildWhichIsA_0.CanvasPosition.Y > 0 then
                        v37(true);
                    end;
                end;
                local v46 = l_l_current_0_FirstChildWhichIsA_0.AbsoluteCanvasSize.Y > l_l_current_0_FirstChildWhichIsA_0.AbsoluteWindowSize.Y;
                v35(v46);
                v46 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v44);
                local v47 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(v44);
                local v48 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("CanvasPosition"):Connect(v45);
                return function() --[[ Line: 103 ]]
                    -- upvalues: v46 (copy), v47 (copy), v48 (copy)
                    v46:Disconnect();
                    v47:Disconnect();
                    v48:Disconnect();
                end;
            end;
        end;
    end, {});
    local v49 = v4.useRef({});
    local v50 = v4.useRef(nil);
    v4.useEffect(function() --[[ Line: 113 ]]
        -- upvalues: v29 (copy), v50 (copy), v49 (copy), v17 (ref), v33 (copy)
        if v29 then
            v50.current = v49.current[v29];
            v17(v33, v50);
            return;
        else
            v50.current = nil;
            return;
        end;
    end, {
        v29
    });
    local v55 = v4.useCallback(function(v51) --[[ Line: 122 ]]
        -- upvalues: v30 (copy), v2 (ref), v27 (copy), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v34 (copy), v36 (copy)
        v30(v51);
        local v52 = 0;
        v2.forEach(v27.items, function(v53, v54) --[[ Line: 126 ]]
            -- upvalues: v51 (copy), v52 (ref)
            if v53.id == v51 then
                v52 = v54;
                return;
            else
                return;
            end;
        end);
        l_sendEvent_0({
            sub_event_type = l_TelemetryEventType_0.SelectItem, 
            select_item_detail = {
                selected_index = v52, 
                list_length = #v27.items, 
                has_scroll = v34, 
                did_scroll = v36
            }
        });
    end, {
        l_sendEvent_0, 
        v34, 
        v36, 
        v27.items
    });
    local v58 = v4.useCallback(function() --[[ Line: 143 ]]
        -- upvalues: v2 (ref), v27 (copy), v29 (copy)
        local v57 = v2.find(v27.items, function(v56) --[[ Line: 144 ]]
            -- upvalues: v29 (ref)
            return v56.id == v29;
        end);
        if v27.onNext then
            v27.onNext(v29, v57);
        end;
    end, {
        v27.items, 
        v27.onNext, 
        v29
    });
    return v4.createElement(v4.Fragment, nil, {
        Content = if v27.items ~= nil then v4.createElement(if l_FFlagAddLayoutSlotsToReport_0 then v39 else l_Sheet_0.Content, {
            ref = v33
        }, {
            Eyebrow = v4.createElement(v14, {
                eyebrow = v27.eyebrow, 
                layoutOrder = 0
            }), 
            Title = v4.createElement(v18, {
                input = v27.title, 
                tag = "size-full-0 auto-y text-heading-medium", 
                layoutOrder = 1
            }), 
            ItemListContainer = v4.createElement(l_View_0, {
                tag = "size-full-0 auto-y", 
                LayoutOrder = 2
            }, {
                UIPadding = v4.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, -v28.Padding.XLarge), 
                    PaddingRight = UDim.new(0, -v28.Padding.XLarge)
                }), 
                ItemList = v4.createElement(v16.Root, {
                    value = v29, 
                    onValueChanged = v55
                }, {
                    v2.map(v27.items, function(v59, v60) --[[ Line: 178 ]]
                        -- upvalues: v4 (ref), v16 (ref), l_translateIntoString_0 (copy), v27 (copy), v49 (copy)
                        return v4.createElement(v16.Item, {
                            value = v59.id, 
                            title = l_translateIntoString_0(v59.label), 
                            description = if v59.description then l_translateIntoString_0(v59.description) else nil, 
                            trailingAccessory = "Radio", 
                            hasDivider = v60 ~= #v27.items, 
                            hasMargin = true, 
                            ref = function(v61) --[[ Line: 186 ]] --[[ Name: ref ]]
                                -- upvalues: v49 (ref), v59 (copy)
                                v49.current[v59.id] = v61;
                            end
                        });
                    end)
                })
            })
        }) else nil, 
        Actions = if v27.onNext and v29 ~= nil then v4.createElement(if l_FFlagAddLayoutSlotsToReport_0 then v40 else l_Sheet_0.Actions, nil, {
            Button = v4.createElement(l_Button_0, {
                text = if l_FFlagRemoveHardcodedStringsInReportNodes_0 then l_translateIntoString_0(v27.nextButtonText) else if v27.nextButtonText then l_translateIntoString_0(v27.nextButtonText) else "Continue", 
                variant = l_ButtonVariant_0.Emphasis, 
                fillBehavior = l_FillBehavior_0.Fill, 
                isLoading = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v27.isSubmitting else false, 
                isDisabled = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v27.isSubmitting else false, 
                onActivated = v58
            })
        }) else nil
    });
end);