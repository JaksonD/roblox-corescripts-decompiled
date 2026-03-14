local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Foundation);
local l_ScrollView_0 = v5.ScrollView;
local v7 = require(l_Parent_0.t);
local l_View_0 = v5.View;
local v9 = require(l_Parent_0.UIBlox);
local l_PartialPageModal_0 = v9.App.Dialog.Modal.PartialPageModal;
local l_useLayerCollector_0 = v9.Core.Layout.LayerCollector.useLayerCollector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local _ = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local v16 = require(l_script_FirstAncestor_0.Bedui.Utils.BeduiAnalytics);
local v17 = require(l_script_FirstAncestor_0.Bedui.ReportFlowHandler);
local l_sendAnalyticsEvent_0 = v16.sendAnalyticsEvent;
local l_TelemetryEventType_0 = v16.TelemetryEventType;
local v20 = require(l_script_FirstAncestor_0.Bedui.Provider.useAnalyticsContext);
local v21 = require(l_script_FirstAncestor_0.Common.useOnScreenKeyboardHeight);
local v22 = require(l_script_FirstAncestor_0.Common.useScrollbarOffset);
local v23 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableSurveyPromptOnAbuseReport_0 = v23.FFlagEnableSurveyPromptOnAbuseReport;
local l_FFlagAddThumbnailSelectorReport_0 = v23.FFlagAddThumbnailSelectorReport;
local v26 = {
    mid = l_MessageBus_0.getMessageId("Game", "openSurvey"), 
    validateParams = v7.strictInterface({
        eventType = v7.string, 
        userId = v7.optional(v7.string), 
        customProps = v7.optional(v7.table)
    })
};
return v4.memo(function(v27) --[[ Line: 58 ]] --[[ Name: DynamicReport ]]
    -- upvalues: l_useLayerCollector_0 (copy), v4 (copy), v22 (copy), v21 (copy), l_useLocalization_0 (copy), v20 (copy), l_useSelector_0 (copy), l_sendAnalyticsEvent_0 (copy), l_TelemetryEventType_0 (copy), l_FFlagEnableSurveyPromptOnAbuseReport_0 (copy), l_Players_0 (copy), l_MessageBus_0 (copy), v26 (copy), l_PartialPageModal_0 (copy), l_View_0 (copy), l_ScrollView_0 (copy), l_FFlagAddThumbnailSelectorReport_0 (copy), v17 (copy)
    local l_absoluteSize_0 = l_useLayerCollector_0().absoluteSize;
    local v29, v30 = v4.useBinding(Vector2.new(0, 0));
    local v31, v32 = v4.useState(Vector2.new(0, 0));
    local v33, v34 = v4.useState(Vector2.new(0, 0));
    local v35 = v22(v31, v33);
    local v36 = v21();
    local l_isKeyboardShowing_0 = v36.isKeyboardShowing;
    local l_onScreenKeyboardHeight_0 = v36.onScreenKeyboardHeight;
    local l_keyboardPositionY_0 = v36.keyboardPositionY;
    local v40 = l_useLocalization_0({
        reportTitle = "Feature.ReportAbuse.Label.Report"
    });
    local v41 = v20();
    local l_isReportSubmitted_0 = v41.isReportSubmitted;
    local v44 = l_useSelector_0(function(v43) --[[ Line: 77 ]]
        if v43.GlobalGuiInset then
            return v43.GlobalGuiInset.top;
        else
            return 0;
        end;
    end);
    local v47 = v4.useMemo(function() --[[ Line: 82 ]]
        -- upvalues: l_isKeyboardShowing_0 (copy), l_keyboardPositionY_0 (copy), v44 (copy), l_absoluteSize_0 (copy), l_onScreenKeyboardHeight_0 (copy)
        if not l_isKeyboardShowing_0 then
            return 0;
        else
            local v45 = l_keyboardPositionY_0 - v44;
            local v46 = l_absoluteSize_0.Y - v45;
            if v46 <= 0 then
                return 0;
            else
                return (math.min(v46, l_onScreenKeyboardHeight_0));
            end;
        end;
    end, {
        l_isKeyboardShowing_0, 
        l_keyboardPositionY_0, 
        l_onScreenKeyboardHeight_0, 
        l_absoluteSize_0.Y, 
        v44
    });
    local v48 = v4.useMemo(function() --[[ Line: 105 ]]
        -- upvalues: l_isKeyboardShowing_0 (copy), v47 (copy)
        if not l_isKeyboardShowing_0 then
            return 0;
        else
            return -v47;
        end;
    end, {
        l_isKeyboardShowing_0, 
        v47
    });
    v4.useEffect(function() --[[ Line: 113 ]]
        -- upvalues: l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref), v27 (copy)
        l_sendAnalyticsEvent_0({
            eventType = l_TelemetryEventType_0.Rendered, 
            context = {
                abuseVector = v27.abuseVector
            }
        });
    end, {
        l_sendAnalyticsEvent_0, 
        v27.abuseVector
    });
    local v50 = v4.useCallback(function() --[[ Line: 122 ]]
        -- upvalues: l_isReportSubmitted_0 (copy), l_sendAnalyticsEvent_0 (ref), l_TelemetryEventType_0 (ref), v41 (copy), l_FFlagEnableSurveyPromptOnAbuseReport_0 (ref), l_Players_0 (ref), l_MessageBus_0 (ref), v26 (ref), v27 (copy)
        if not l_isReportSubmitted_0 then
            l_sendAnalyticsEvent_0({
                eventType = l_TelemetryEventType_0.Abandoned, 
                context = v41
            });
        elseif l_FFlagEnableSurveyPromptOnAbuseReport_0 then
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            l_MessageBus_0.publish(v26, {
                eventType = "reportSubmitted", 
                userId = tostring(l_LocalPlayer_0.UserId)
            });
        end;
        v27.onClose();
    end, {
        l_isReportSubmitted_0, 
        l_sendAnalyticsEvent_0, 
        v41, 
        v27.onClose
    });
    return v4.createElement(l_PartialPageModal_0, {
        title = v40.reportTitle, 
        screenSize = Vector2.new(l_absoluteSize_0.X, l_absoluteSize_0.Y), 
        position = if l_isKeyboardShowing_0 then UDim2.new(0.5, 0, 1, v48) else nil, 
        anchorPoint = if l_isKeyboardShowing_0 then Vector2.new(0.5, 1) else nil, 
        onCloseClicked = v50
    }, {
        View = v4.createElement(l_View_0, {
            tag = "size-full-0 auto-y"
        }, {
            ScrollView = v4.createElement(l_ScrollView_0, {
                Size = v29:map(function(v51) --[[ Line: 151 ]]
                    -- upvalues: l_absoluteSize_0 (copy), v47 (copy)
                    return UDim2.new(1, 0, 0, (math.min(l_absoluteSize_0.Y - v47 - 100, (math.ceil(v51.Y)))));
                end), 
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    VerticalScrollBarInset = if l_FFlagAddThumbnailSelectorReport_0 then Enum.ScrollBarInset.ScrollBar else nil
                }, 
                onAbsoluteCanvasSizeChanged = function(v52) --[[ Line: 167 ]] --[[ Name: onAbsoluteCanvasSizeChanged ]]
                    -- upvalues: v32 (copy)
                    v32(v52.AbsoluteCanvasSize);
                end, 
                onAbsoluteWindowSizeChanged = function(v53) --[[ Line: 170 ]] --[[ Name: onAbsoluteWindowSizeChanged ]]
                    -- upvalues: v34 (copy)
                    v34(v53.AbsoluteWindowSize);
                end
            }, {
                Content = v4.createElement(l_View_0, {
                    Size = if l_FFlagAddThumbnailSelectorReport_0 then UDim2.new(0, 0, 0, 0) else UDim2.new(0, -v35, 0, 0), 
                    onAbsoluteSizeChanged = function(v54) --[[ Line: 178 ]] --[[ Name: onAbsoluteSizeChanged ]]
                        -- upvalues: v30 (copy)
                        v30(v54.AbsoluteSize);
                    end, 
                    tag = "auto-xy padding-x-xxsmall padding-top-medium"
                }, {
                    ReportFlowHandler = v4.createElement(v17, {
                        targetId = v27.targetId, 
                        abuseVector = v27.abuseVector, 
                        onSubmit = v27.onSubmit, 
                        custom = v27.custom
                    })
                })
            })
        })
    });
end);