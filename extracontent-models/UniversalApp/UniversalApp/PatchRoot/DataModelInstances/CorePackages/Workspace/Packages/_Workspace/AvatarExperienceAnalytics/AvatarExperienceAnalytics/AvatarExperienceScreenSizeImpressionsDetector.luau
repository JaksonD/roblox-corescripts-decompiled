local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactRodux);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.AvatarExperienceImpressionsDetector);
local v5 = v1.PureComponent:extend("AvatarExperienceScreenSizeImpressionsDetector");
v5.validateProps = v3.strictInterface({
    parentRef = v3.table, 
    onRequestImpressionsSignal = v3.table, 
    appPage = v3.optional(v3.string), 
    pageFilter = v3.optional(v3.callback), 
    collectObjectsFunc = v3.optional(v3.callback), 
    filterImpressionFunc = v3.optional(v3.callback), 
    onImpressionsDetected = v3.callback, 
    screenSize = v3.Vector2, 
    globalGuiInset = v3.table, 
    topBarHeight = v3.number
});
v5.render = function(v6) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy)
    local l_screenSize_0 = v6.props.screenSize;
    local l_topBarHeight_0 = v6.props.topBarHeight;
    local l_globalGuiInset_0 = v6.props.globalGuiInset;
    return v1.createElement(v4, {
        parentRef = v6.props.parentRef, 
        onRequestImpressionsSignal = v6.props.onRequestImpressionsSignal, 
        viewPortBounds = {
            min = Vector2.new(0, l_topBarHeight_0), 
            max = Vector2.new(l_screenSize_0.X, l_screenSize_0.Y - l_globalGuiInset_0.bottom)
        }, 
        appPage = v6.props.appPage, 
        pageFilter = v6.props.pageFilter, 
        collectObjectsFunc = v6.props.collectObjectsFunc, 
        filterImpressionFunc = v6.props.filterImpressionFunc, 
        onImpressionsDetected = v6.props.onImpressionsDetected
    });
end;
return (v2.connect(function(v10, _) --[[ Line: 48 ]]
    return {
        topBarHeight = v10.TopBar.topBarHeight, 
        globalGuiInset = v10.GlobalGuiInset, 
        screenSize = v10.ScreenSize
    };
end)(v5));