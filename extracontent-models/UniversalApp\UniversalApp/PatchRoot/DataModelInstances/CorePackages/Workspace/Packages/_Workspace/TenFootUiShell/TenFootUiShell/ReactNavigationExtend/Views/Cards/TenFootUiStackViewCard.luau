local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v3 = require(l_Parent_0.React);
local v4 = require(l_ReactNavigationExtend_0.Hooks.useStackAnimation);
local v5 = require(l_ReactNavigationExtend_0.Views.Cards.TenFootUiBaseViewCard);
local _ = require(l_Parent_0.TenFootUiCommon);
local _ = require(l_Parent_0.Navigation);
return function(v8) --[[ Line: 26 ]] --[[ Name: TenFootUiStackViewCard ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy)
    local v9 = v4({
        isTopOfStack = v8.isTopOfStack, 
        totalInStack = v8.totalInStack, 
        viewState = v8.viewState, 
        onAnimationComplete = v8.onAnimationComplete
    });
    return v3.createElement(v5, {
        descriptor = v8.descriptor, 
        screenProps = v8.screenProps, 
        navigation = v8.navigation, 
        isActiveCard = v8.isTopOfStack, 
        isVisible = v9.isVisible, 
        adorneeCFrame = v9.cFrame, 
        groupTransparency = v9.transparency
    });
end;