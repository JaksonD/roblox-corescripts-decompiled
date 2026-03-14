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
local l_OmniFeedImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedImpressionsDetector;
local v11 = require(script.Parent.OmniFeedItemsContainer);
local v12 = {};
return function(v13) --[[ Line: 35 ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v1 (copy), l_Signal_0 (copy), l_useDesignTokens_0 (copy), l_useSelector_0 (copy), v12 (copy), v11 (copy), l_OmniFeedImpressionsDetector_0 (copy)
    local v15 = l_useAppPolicy_0(function(v14) --[[ Line: 36 ]]
        return v14.useGridPageLayout();
    end);
    local v16 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    v15 = v15 and not v16;
    local v17 = v1.useRef(l_Signal_0.new());
    local v18 = l_useDesignTokens_0();
    local l_BackgroundColor_0 = v18.LuaApps.App.Page.BackgroundColor;
    local l_BackgroundTransparency_0 = v18.LuaApps.App.Page.BackgroundTransparency;
    local v21 = v1.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: v18 (copy), v15 (ref)
        return v18.LuaApps.HomeOmniFeed.getLayoutSpacing(v15);
    end, {
        v15, 
        v18
    });
    local v22 = v13.topPadding or v21.topMargin;
    local v23 = v13.bottomPadding or 80;
    local v25 = l_useSelector_0(function(v24) --[[ Line: 59 ]]
        -- upvalues: v13 (copy)
        return v24.OmniRecommendations[v13.pageContext];
    end);
    local v26 = v25 and v25.sorts or v12;
    return v1.createElement("Frame", {
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.fromScale(1, 0), 
        BackgroundColor3 = l_BackgroundColor_0, 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        OmniFeed = v1.createElement(v11, {
            omniFeedItems = v13.omniFeedItems, 
            pageContext = v13.pageContext, 
            sduiContext = v13.sduiContext, 
            impressionsTag = v13.impressionsTag, 
            topMargin = v22, 
            bottomMargin = v23, 
            layoutPadding = v21.layoutPadding, 
            onItemsUpdatedSignalRef = v17, 
            defaultContainerSize = v13.defaultContainerSize, 
            sortsData = v26, 
            omniFeedPageSection = v13.omniFeedPageSection, 
            enableRelativeGui = v13.enableRelativeGui
        }), 
        OmniFeedImpressionsDetector = v1.createElement(l_OmniFeedImpressionsDetector_0, {
            onItemsUpdatedSignal = v17.current, 
            impressionsTag = v13.impressionsTag, 
            omniFeedItems = v13.omniFeedItems, 
            eventContext = v13.analyticsContext
        })
    });
end;