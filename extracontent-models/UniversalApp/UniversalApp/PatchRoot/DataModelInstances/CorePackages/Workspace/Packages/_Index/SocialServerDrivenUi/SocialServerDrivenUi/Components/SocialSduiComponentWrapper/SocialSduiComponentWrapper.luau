local l_Parent_0 = script:FindFirstAncestor("SocialServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.Foundation);
local l_getSduiComponentWrapper_0 = require(l_Parent_0.SduiCoreSystem).getSduiComponentWrapper;
local l_View_0 = v3.View;
return v1.memo(function(v6) --[[ Line: 29 ]] --[[ Name: SocialSduiComponentWrapper ]]
    -- upvalues: l_getSduiComponentWrapper_0 (copy), v1 (copy), l_View_0 (copy)
    local v7 = l_getSduiComponentWrapper_0(v6.sduiComponentConfig);
    return v1.createElement(l_View_0, {
        tag = "size-full-0 auto-y", 
        LayoutOrder = v6.layoutOrder, 
        onAbsoluteSizeChanged = v6.onFrameResized
    }, {
        SocialSduiComponentWrapper = v1.createElement(v7, {
            debugName = v6.debugName, 
            componentConfig = v6.sduiComponentConfig, 
            sduiContext = v6.sduiContext, 
            extraLocalProps = {
                index = v6.layoutOrder, 
                pageSideMargin = v6.pageSideMargin, 
                verticalScrollingFrameRef = v6.verticalScrollingFrameRef, 
                scrollViewPositionChangedSignal = v6.scrollViewPositionChangedSignal, 
                testId = v6.testId
            }, 
            localAnalyticsData = v6.analyticsContext
        })
    });
end);