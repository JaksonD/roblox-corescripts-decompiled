local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_HeaderBar_0 = v2.UIBlox.App.Bar.HeaderBar;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local l_GetFFlagFixConnectTabSearchBarHeight_0 = v2.GetFFlagFixConnectTabSearchBarHeight;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_Parent_0.SharedFlags).FFlagEnableLeftNavOnConsole;
local v10 = require(l_Parent_0.React);
return function(v11) --[[ Line: 18 ]] --[[ Name: FriendsLandingHeaderBarPresentational ]]
    -- upvalues: l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v7 (copy), l_useDesignTokens_0 (copy), v10 (copy), l_HeaderBar_0 (copy), l_GetFFlagFixConnectTabSearchBarHeight_0 (copy)
    local v12 = l_useUiModeInfo_0();
    local v13 = false;
    if v12.uiMode == l_UiMode_0.TenFoot then
        v13 = not l_FFlagEnableLeftNavOnConsole_0;
    end;
    if v13 then
        return nil;
    else
        local l_TOP_BAR_HEIGHT_0 = v7.TOP_BAR_HEIGHT;
        if l_FFlagEnableLeftNavOnConsole_0 then
            l_TOP_BAR_HEIGHT_0 = l_useDesignTokens_0().Global.Size_1200;
        end;
        return v10.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, l_TOP_BAR_HEIGHT_0), 
            LayoutOrder = -1, 
            ZIndex = 2
        }, {
            headerBar = v10.createElement(l_HeaderBar_0, {
                title = v11.title, 
                barHeight = l_TOP_BAR_HEIGHT_0, 
                renderLeft = v11.renderLeft, 
                renderCenter = v11.renderCenter, 
                renderRight = v11.renderRight, 
                isSecondary = v11.isSecondary, 
                shouldHideSecondaryLeftItem = v11.shouldHideSecondaryLeftItem, 
                paddingTop = if l_GetFFlagFixConnectTabSearchBarHeight_0() then UDim.new(0, 0) else nil, 
                paddingBottom = if l_GetFFlagFixConnectTabSearchBarHeight_0() then UDim.new(0, 0) else nil
            })
        });
    end;
end;