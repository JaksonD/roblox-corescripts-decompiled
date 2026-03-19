local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.Responsive);
local l_View_0 = v2.View;
local l_IconButton_0 = v2.IconButton;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useDeviceInsets_0 = v3.useDeviceInsets;
local v8 = require(script.Parent.DetailsPageLayoutContext);
return v1.memo(v1.forwardRef(function(v9, v10) --[[ Line: 29 ]] --[[ Name: DetailsPageLayoutHeader ]]
    -- upvalues: l_useTokens_0 (copy), l_useDeviceInsets_0 (copy), v1 (copy), v8 (copy), v2 (copy), l_View_0 (copy), l_IconButton_0 (copy)
    local v11 = l_useTokens_0();
    local v12 = l_useDeviceInsets_0();
    local v13 = v1.useContext(v8);
    local l_setHasHeader_0 = v13.setHasHeader;
    v1.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: l_setHasHeader_0 (copy)
        l_setHasHeader_0(true);
        return function() --[[ Line: 37 ]]
            -- upvalues: l_setHasHeader_0 (ref)
            l_setHasHeader_0(false);
        end;
    end, {});
    local l_hasFullBleed_0 = v13.hasFullBleed;
    local l_headerBarHeight_0 = v13.headerBarHeight;
    local l_stickyHeaderActive_0 = v13.stickyHeaderActive;
    local l_headerOpacity_0 = v13.headerOpacity;
    local l_top_0 = v12.top;
    local l_onClose_0 = v13.onClose;
    local v21 = v9.closeIconName or v2.Enums.IconName.ChevronLargeLeft;
    local l_testId_0 = v13.testId;
    assert(l_testId_0, "DetailsPageLayout.Header must be used within DetailsPageLayout.Root");
    return v1.createElement(l_View_0, {
        ZIndex = 2, 
        Size = UDim2.new(1, 0, 0, l_headerBarHeight_0), 
        tag = "col", 
        backgroundStyle = if not l_hasFullBleed_0 then {
            Color3 = v11.Color.Surface.Surface_0.Color3, 
            Transparency = v11.Color.Surface.Surface_0.Transparency
        } else if l_headerOpacity_0 then l_headerOpacity_0:map(function(v23) --[[ Line: 62 ]]
            -- upvalues: v11 (copy)
            return {
                Color3 = v11.Color.Surface.Surface_0.Color3, 
                Transparency = math.lerp(1, v11.Color.Surface.Surface_0.Transparency, v23)
            };
        end) else nil, 
        ref = v10
    }, {
        HeaderContent = v1.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "row size-full-0 auto-y fill align-y-center padding-x-medium"
        }, {
            SafeAreaPadding = if l_top_0 > 0 then v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_top_0)
            }) else nil, 
            Container = v1.createElement(l_View_0, {
                tag = "auto-xy bg-over-media-0 radius-medium"
            }, {
                CloseButton = if l_onClose_0 then v1.createElement(l_IconButton_0, {
                    variant = v2.Enums.ButtonVariant.Utility, 
                    icon = v21, 
                    onActivated = l_onClose_0, 
                    testId = if l_testId_0 then ("%*--close-button"):format(l_testId_0) else nil
                }) else nil
            }), 
            Children = if l_stickyHeaderActive_0 then v1.createElement(l_View_0, {
                tag = "auto-y fill", 
                LayoutOrder = 1
            }, {
                Children = v1.createElement(v1.Fragment, nil, v9.children)
            }) else nil
        }), 
        BottomBorder = v1.createElement(l_View_0, {
            LayoutOrder = 2, 
            backgroundStyle = if l_headerOpacity_0 then l_headerOpacity_0:map(function(v24) --[[ Line: 104 ]]
                -- upvalues: v11 (copy)
                return {
                    Color3 = v11.Color.Stroke.Muted.Color3, 
                    Transparency = math.lerp(1, v11.Color.Stroke.Muted.Transparency, v24)
                };
            end) else nil, 
            testId = if l_testId_0 then ("%*--header--bottom-border"):format(l_testId_0) else nil, 
            Size = UDim2.new(1, 0, 0, v11.Stroke.Standard)
        })
    });
end));