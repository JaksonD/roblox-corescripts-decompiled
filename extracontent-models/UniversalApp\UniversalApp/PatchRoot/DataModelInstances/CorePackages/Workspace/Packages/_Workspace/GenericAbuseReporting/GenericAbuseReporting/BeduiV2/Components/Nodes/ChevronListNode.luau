local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local v7 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext);
local v8 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local v9 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation);
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Components.Eyebrow);
local v11 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v12 = require(l_script_FirstAncestor_0.Common.List);
local v13 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_TelemetryEventType_0 = v8.TelemetryEventType;
local l_useArTranslation_0 = v9.useArTranslation;
local l_useAbuseReportAnalytics_0 = v7.useAbuseReportAnalytics;
local l_useLayoutSlots_0 = v11.useLayoutSlots;
return v4.memo(function(v19) --[[ Line: 49 ]] --[[ Name: ChevronListNode ]]
    -- upvalues: l_useTokens_0 (copy), l_useArTranslation_0 (copy), l_useAbuseReportAnalytics_0 (copy), v4 (copy), l_useLayoutSlots_0 (copy), v2 (copy), l_TelemetryEventType_0 (copy), v10 (copy), v13 (copy), l_View_0 (copy), v12 (copy)
    local v20 = l_useTokens_0();
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local l_sendEvent_0 = l_useAbuseReportAnalytics_0().sendEvent;
    local v23 = v4.useRef(nil);
    local v24, v25 = v4.useState(false);
    local v26, v27 = v4.useState(false);
    local l_Body_0 = l_useLayoutSlots_0().Body;
    v4.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v23 (copy), v25 (copy), v27 (copy)
        local l_current_0 = v23.current;
        if not l_current_0 then
            return;
        else
            local l_l_current_0_FirstChildWhichIsA_0 = l_current_0:FindFirstChildWhichIsA("ScrollingFrame", true);
            if not l_l_current_0_FirstChildWhichIsA_0 then
                return;
            else
                local function v32() --[[ Line: 74 ]] --[[ Name: checkScrollbar ]]
                    -- upvalues: l_l_current_0_FirstChildWhichIsA_0 (copy), v25 (ref)
                    local v31 = l_l_current_0_FirstChildWhichIsA_0.AbsoluteCanvasSize.Y > l_l_current_0_FirstChildWhichIsA_0.AbsoluteWindowSize.Y;
                    v25(v31);
                end;
                local function v33() --[[ Line: 79 ]] --[[ Name: onScroll ]]
                    -- upvalues: l_l_current_0_FirstChildWhichIsA_0 (copy), v27 (ref)
                    if l_l_current_0_FirstChildWhichIsA_0.CanvasPosition.Y > 0 then
                        v27(true);
                    end;
                end;
                local v34 = l_l_current_0_FirstChildWhichIsA_0.AbsoluteCanvasSize.Y > l_l_current_0_FirstChildWhichIsA_0.AbsoluteWindowSize.Y;
                v25(v34);
                v34 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(v32);
                local v35 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(v32);
                local v36 = l_l_current_0_FirstChildWhichIsA_0:GetPropertyChangedSignal("CanvasPosition"):Connect(v33);
                return function() --[[ Line: 92 ]]
                    -- upvalues: v34 (copy), v35 (copy), v36 (copy)
                    v34:Disconnect();
                    v35:Disconnect();
                    v36:Disconnect();
                end;
            end;
        end;
    end, {});
    local v41 = v4.useCallback(function(v37) --[[ Line: 99 ]]
        -- upvalues: v2 (ref), v19 (copy), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v24 (copy), v26 (copy)
        local v38 = 0;
        v2.forEach(v19.items, function(v39, v40) --[[ Line: 102 ]]
            -- upvalues: v37 (copy), v38 (ref)
            if v39.id == v37 then
                v38 = v40;
                return;
            else
                return;
            end;
        end);
        l_sendEvent_0({
            sub_event_type = l_TelemetryEventType_0.SelectItem, 
            select_item_detail = {
                selected_index = v38, 
                list_length = #v19.items, 
                has_scroll = v24, 
                did_scroll = v26
            }
        });
        v19.onNext(v37, v19.items[v38]);
    end, {
        l_sendEvent_0, 
        v24, 
        v26, 
        v19.items, 
        v19.onNext
    });
    return v4.createElement(v4.Fragment, nil, {
        Content = v4.createElement(l_Body_0, {
            ref = v23
        }, {
            Eyebrow = v4.createElement(v10, {
                eyebrow = v19.eyebrow, 
                layoutOrder = 0
            }), 
            Title = v4.createElement(v13, {
                input = v19.title, 
                tag = "size-full-0 auto-y text-title-large", 
                layoutOrder = 1
            }), 
            ItemListContainer = v4.createElement(l_View_0, {
                padding = {
                    left = UDim.new(0, -v20.Padding.XLarge), 
                    right = UDim.new(0, -v20.Padding.XLarge)
                }, 
                tag = "size-full-0 auto-y", 
                LayoutOrder = 2
            }, {
                ItemList = v4.createElement(v12.Root, {
                    onValueChanged = v41
                }, {
                    v2.map(v19.items, function(v42, v43) --[[ Line: 144 ]]
                        -- upvalues: v4 (ref), v12 (ref), l_translateIntoString_0 (copy), v19 (copy)
                        return v4.createElement(v12.Item, {
                            value = v42.id, 
                            title = l_translateIntoString_0(v42.label), 
                            description = if v42.description then l_translateIntoString_0(v42.description) else nil, 
                            trailingAccessory = "Chevron", 
                            hasDivider = v43 ~= #v19.items, 
                            hasMargin = true
                        });
                    end)
                })
            })
        })
    });
end);