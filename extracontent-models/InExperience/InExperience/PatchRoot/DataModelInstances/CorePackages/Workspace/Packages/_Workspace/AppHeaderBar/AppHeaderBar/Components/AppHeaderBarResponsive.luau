local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.UIBlox);
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_1.Responsive);
local v6 = require(script.Parent.AppHeaderBarComponent);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useBreakpointXOrLarger_0 = v5.useBreakpointXOrLarger;
local l_usePreferredInput_0 = v5.usePreferredInput;
local _ = require(l_Parent_0.Types);
return function(v11) --[[ Line: 19 ]] --[[ Name: AppHeaderBarResponsive ]]
    -- upvalues: l_useBreakpointXOrLarger_0 (copy), v5 (copy), l_usePreferredInput_0 (copy), l_useStyle_0 (copy), v2 (copy), v4 (copy), v6 (copy)
    local v12 = l_useBreakpointXOrLarger_0(v5.Keys.Medium);
    local v13 = l_useBreakpointXOrLarger_0(v5.Keys.Large);
    local v14 = l_usePreferredInput_0() == v5.Input.Directional;
    local l_Tokens_0 = l_useStyle_0().Tokens;
    local l_titleFontStyle_0 = v11.titleFontStyle;
    local l_shouldRenderTitle_0 = v11.shouldRenderTitle;
    local l_shouldRenderCenter_0 = v11.shouldRenderCenter;
    local l_isTitleCentered_0 = v11.isTitleCentered;
    local l_utilitiesGap_0 = v11.utilitiesGap;
    local l_paddingTop_0 = v11.paddingTop;
    local l_paddingBottom_0 = v11.paddingBottom;
    local l_onMedia_0 = v11.onMedia;
    local v27 = v2.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v13 (copy), v14 (copy), v4 (ref), l_shouldRenderCenter_0 (copy), l_paddingTop_0 (copy), l_Tokens_0 (copy), l_paddingBottom_0 (copy), l_onMedia_0 (copy), l_shouldRenderTitle_0 (copy), v12 (copy), l_isTitleCentered_0 (copy), l_titleFontStyle_0 (copy), l_utilitiesGap_0 (copy)
        local v24 = {
            title = if v13 and v14 then v4.None else nil, 
            renderCenter = if not (not v13 or v14) or l_shouldRenderCenter_0 then nil else v4.None, 
            renderUserInfo = if v13 then nil else v4.None, 
            avatarActionIcon = if v13 then v4.None else nil, 
            searchActionIcon = if not v13 or v14 then nil else v4.None, 
            paddingTop = if not v13 or l_paddingTop_0 then nil else UDim.new(0, l_Tokens_0.Global.Space_200), 
            paddingBottom = if not v13 or l_paddingBottom_0 then nil else UDim.new(0, l_Tokens_0.Global.Space_200), 
            onMedia = v13 and v14 and l_onMedia_0 == nil or nil
        };
        if l_shouldRenderTitle_0 then
            v24.title = nil;
        end;
        local v25 = if not v12 or l_isTitleCentered_0 then l_Tokens_0.Semantic.Typography.Header else l_Tokens_0.Semantic.Typography.Title;
        v24.titleFontStyle = if l_titleFontStyle_0 then nil else v25;
        local v26 = if v12 then UDim.new(0, l_Tokens_0.Global.Space_300) else UDim.new(0, l_Tokens_0.Global.Space_200);
        v24.utilitiesGap = if l_utilitiesGap_0 then nil else v26;
        return v24;
    end, {
        v12, 
        v13, 
        v14, 
        l_Tokens_0, 
        l_titleFontStyle_0, 
        l_shouldRenderCenter_0, 
        l_isTitleCentered_0, 
        l_utilitiesGap_0, 
        l_paddingTop_0, 
        l_paddingBottom_0, 
        l_onMedia_0
    });
    local v28 = v4.Dictionary.join(v11, v27);
    return v2.createElement(v6, v28);
end;