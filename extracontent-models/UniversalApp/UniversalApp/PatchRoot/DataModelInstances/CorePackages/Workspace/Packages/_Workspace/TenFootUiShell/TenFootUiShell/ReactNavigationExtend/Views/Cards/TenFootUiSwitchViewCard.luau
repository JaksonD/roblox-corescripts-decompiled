local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v4 = require(l_ReactNavigationExtend_0.Hooks.useTabAnimation);
local v5 = require(l_ReactNavigationExtend_0.Views.Cards.TenFootUiBaseViewCard);
local _ = require(l_Parent_0.TenFootUiCommon);
local _ = require(l_Parent_0.Navigation);
return function(v8) --[[ Line: 24 ]] --[[ Name: TenFootUiSwitchViewCard ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy)
    local v9 = v4({
        isActiveTab = v8.isActiveTab, 
        currentTabIndex = v8.currentTabIndex, 
        previousTabIndex = v8.previousTabIndex
    });
    return v2.createElement(v5, {
        descriptor = v8.descriptor, 
        screenProps = v8.screenProps, 
        navigation = v8.navigation, 
        isActiveCard = v8.isActiveTab, 
        isVisible = v9.isVisible, 
        adorneeCFrame = v9.cFrame, 
        groupTransparency = v9.transparency
    });
end;