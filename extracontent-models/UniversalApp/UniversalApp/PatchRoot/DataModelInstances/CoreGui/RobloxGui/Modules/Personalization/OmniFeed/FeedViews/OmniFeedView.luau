local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local _ = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local _ = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local l_FFlagLuaAppCompositionSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionSupport;
local l_OmniFeedImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedImpressionsDetector;
local v12 = require(script.Parent.OmniFeedItemsContainer);
local v13 = {};
return function(v14) --[[ Line: 40 ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v1 (copy), l_Signal_0 (copy), l_useDesignTokens_0 (copy), l_useSelector_0 (copy), v13 (copy), v12 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_OmniFeedImpressionsDetector_0 (copy)
    local v16 = l_useAppPolicy_0(function(v15) --[[ Line: 41 ]]
        return v15.useGridPageLayout();
    end);
    local v17 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    v16 = v16 and not v17;
    local v18 = v1.useRef(l_Signal_0.new());
    local v19 = l_useDesignTokens_0();
    local l_BackgroundColor_0 = v19.LuaApps.App.Page.BackgroundColor;
    local l_BackgroundTransparency_0 = v19.LuaApps.App.Page.BackgroundTransparency;
    local v22 = v1.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v19 (copy), v16 (ref)
        return v19.LuaApps.HomeOmniFeed.getLayoutSpacing(v16);
    end, {
        v16, 
        v19
    });
    local v23 = v14.topPadding or v22.topMargin;
    local v24 = v14.bottomPadding or 80;
    local v26 = l_useSelector_0(function(v25) --[[ Line: 64 ]]
        -- upvalues: v14 (copy)
        return v25.OmniRecommendations[v14.pageContext];
    end);
    local v27 = v26 and v26.sorts or v13;
    return v1.createElement("Frame", {
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.fromScale(1, 0), 
        BackgroundColor3 = l_BackgroundColor_0, 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        OmniFeed = v1.createElement(v12, {
            omniFeedItems = v14.omniFeedItems, 
            pageContext = v14.pageContext, 
            sduiContext = v14.sduiContext, 
            impressionsTag = v14.impressionsTag, 
            topMargin = v23, 
            bottomMargin = v24, 
            layoutPadding = v22.layoutPadding, 
            onItemsUpdatedSignalRef = v18, 
            defaultContainerSize = v14.defaultContainerSize, 
            sortsData = v27, 
            omniFeedPageSection = v14.omniFeedPageSection, 
            enableRelativeGui = v14.enableRelativeGui, 
            appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v14.appCompositionEnabled else nil, 
            contentTag = if l_FFlagLuaAppCompositionSupport_0 then v14.contentTag else nil
        }), 
        OmniFeedImpressionsDetector = v1.createElement(l_OmniFeedImpressionsDetector_0, {
            onItemsUpdatedSignal = v18.current, 
            impressionsTag = v14.impressionsTag, 
            omniFeedItems = v14.omniFeedItems, 
            eventContext = v14.analyticsContext
        })
    });
end;