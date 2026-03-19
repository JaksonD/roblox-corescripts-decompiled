local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Style);
local _ = require(l_Parent_0.TenFootUiCommon);
local v6 = require(l_ReactNavigationExtend_0.Views.Constants);
local l_useDesignTokens_0 = v4.useDesignTokens;
local l_getVirtualResolutionScale_0 = require(l_Parent_0.Responsive).getVirtualResolutionScale;
local function v15(v9, v10) --[[ Line: 21 ]] --[[ Name: getVariantStyles ]]
    -- upvalues: v6 (copy)
    local l_Y_0 = v6.TOP_BAR_CANVAS_SIZE.Y;
    local l_PAGE_CONTENT_HEIGHT_RATIO_0 = v6.PAGE_CONTENT_HEIGHT_RATIO;
    local v13 = v10.Global.Space_200 / v6.CANVAS_SIZE.Y + l_PAGE_CONTENT_HEIGHT_RATIO_0;
    local v14 = l_Y_0 - v10.Global.Space_300;
    return {
        showOverflowFade = v9.screenKind == "Default", 
        paddingTop = if v9.screenKind == "Default" then v14 else 0, 
        pageHeightRatio = l_PAGE_CONTENT_HEIGHT_RATIO_0, 
        overflowStop = v13
    };
end;
return function(v16) --[[ Line: 34 ]] --[[ Name: TenFootUiOverflowScreen ]]
    -- upvalues: l_useDesignTokens_0 (copy), v15 (copy), v3 (copy), l_getVirtualResolutionScale_0 (copy)
    local v17 = l_useDesignTokens_0();
    local v18 = v15(v16, v17);
    return v3.createElement("CanvasGroup", {
        Name = "TenFootUiOverflowScreen", 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        GroupTransparency = v16.groupTransparency, 
        ResolutionScale = l_getVirtualResolutionScale_0()
    }, v3.createElement("UIPadding", {
        PaddingTop = UDim.new(0, v18.paddingTop)
    }), v16.children, if v18.showOverflowFade then v3.createElement("UIGradient", {
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(v18.pageHeightRatio, 0), 
            NumberSequenceKeypoint.new(v18.overflowStop, 1), 
            NumberSequenceKeypoint.new(1, 1)
        }), 
        Rotation = 270
    }) else nil);
end;