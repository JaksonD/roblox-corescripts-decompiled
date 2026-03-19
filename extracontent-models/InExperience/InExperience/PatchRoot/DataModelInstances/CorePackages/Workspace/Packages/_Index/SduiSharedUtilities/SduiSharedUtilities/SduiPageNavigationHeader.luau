local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_IconButton_0 = v3.IconButton;
local v6 = require(l_Parent_0.BuilderIcons);
local v7 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v7.usePreferredInput;
local v9 = require(l_Parent_0.SignalsReact);
local l_GetDisplayStore_0 = require(l_Parent_0.Display).GetDisplayStore;
local v11 = require(l_Parent_0.AppHeaderBar);
local l_NavButtonType_0 = require(l_script_FirstAncestor_0.SduiIntegrationTypes).NavButtonType;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiCoreBadgeDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiCoreBadgeDetailsSupport;
local function v18(v15) --[[ Line: 33 ]] --[[ Name: calculateSize ]]
    -- upvalues: l_GetDisplayStore_0 (copy)
    local v16 = l_GetDisplayStore_0(v15);
    local v17 = v16.getGuiInset(v15);
    return UDim2.new(1, 0, 0, v16.getTopBarHeight(v15) - v17.top or 0);
end;
return v2.memo(function(v19) --[[ Line: 41 ]] --[[ Name: SduiPageNavigationHeader ]]
    -- upvalues: l_useTokens_0 (copy), l_usePreferredInput_0 (copy), v7 (copy), v9 (copy), v18 (copy), v2 (copy), l_NavButtonType_0 (copy), l_IconButton_0 (copy), v3 (copy), v6 (copy), l_FFlagSduiCoreBadgeDetailsSupport_0 (copy), v11 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy)
    local l_closeCallback_0 = v19.closeCallback;
    local l_pageSideMargin_0 = v19.pageSideMargin;
    local v22 = l_useTokens_0();
    local v23 = l_usePreferredInput_0() == v7.Input.Directional;
    local v24 = v9.useSignalBinding(v18);
    local v25 = v2.useMemo(function() --[[ Line: 50 ]]
        -- upvalues: v23 (copy), l_closeCallback_0 (copy), v19 (copy), l_NavButtonType_0 (ref), v2 (ref), v22 (copy), l_IconButton_0 (ref), v3 (ref), v6 (ref), l_FFlagSduiCoreBadgeDetailsSupport_0 (ref)
        if not v23 and l_closeCallback_0 and (v19.navButtonType == l_NavButtonType_0.back or v19.navButtonType == l_NavButtonType_0.close) then
            return function() --[[ Line: 55 ]]
                -- upvalues: v2 (ref), v22 (ref), l_IconButton_0 (ref), l_closeCallback_0 (ref), v3 (ref), v19 (ref), l_NavButtonType_0 (ref), v6 (ref), l_FFlagSduiCoreBadgeDetailsSupport_0 (ref)
                return v2.createElement("Frame", {
                    Size = UDim2.new(0, v22.Size.Size_1400, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, -v22.Size.Size_250)
                    }), 
                    IconButton = v2.createElement(l_IconButton_0, {
                        SelectionOrder = 10, 
                        onActivated = l_closeCallback_0, 
                        isCircular = true, 
                        size = v3.Enums.InputSize.Large, 
                        icon = {
                            name = if v19.navButtonType == l_NavButtonType_0.close then v6.Icon.X else v6.Icon.ChevronLargeLeft, 
                            variant = if l_FFlagSduiCoreBadgeDetailsSupport_0 then v3.Enums.IconVariant.Regular else v3.Enums.IconVariant.Filled
                        }
                    })
                });
            end;
        else
            return nil;
        end;
    end, {
        v23, 
        v19.navButtonType, 
        l_closeCallback_0
    });
    return v2.createElement("Frame", {
        BackgroundColor3 = v22.Color.Surface.Surface_0.Color3, 
        Size = v24, 
        BorderSizePixel = 0, 
        LayoutOrder = v19.layoutOrder or -1, 
        AutomaticSize = if v25 then Enum.AutomaticSize.Y else nil
    }, {
        AppHeaderBarLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        }), 
        AppHeaderBar = v2.createElement(v11.AppHeaderBar, {
            renderNavigation = v25, 
            title = v19.title, 
            renderUtilities = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then v19.renderUtilities else nil, 
            automaticHeight = true, 
            paddingLeft = UDim.new(0, l_pageSideMargin_0), 
            isTitleCentered = v19.navButtonType ~= l_NavButtonType_0.back, 
            shouldRenderTitle = true, 
            onMedia = false
        })
    });
end);