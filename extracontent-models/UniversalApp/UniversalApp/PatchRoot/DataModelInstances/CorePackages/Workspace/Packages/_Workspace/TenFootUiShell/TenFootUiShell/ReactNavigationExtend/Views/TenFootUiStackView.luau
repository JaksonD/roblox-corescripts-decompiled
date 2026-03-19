local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Navigation);
local l_useStackScreens_0 = v4.useStackScreens;
local l_ViewState_0 = v4.ViewState;
local v7 = require(l_ReactNavigationExtend_0.Views.Cards.TenFootUiStackViewCard);
local _ = require(l_Parent_0.TenFootUiCommon);
return function(v9) --[[ Line: 26 ]] --[[ Name: TenFootUiStackView ]]
    -- upvalues: l_useStackScreens_0 (copy), v3 (copy), v7 (copy), l_ViewState_0 (copy)
    local l_descriptors_0 = v9.descriptors;
    local l_navigation_0 = v9.navigation;
    local l_state_0 = l_navigation_0.state;
    local l_key_0 = l_state_0.routes[l_state_0.index].key;
    local v14 = l_useStackScreens_0({
        navigation = l_navigation_0, 
        descriptors = l_descriptors_0
    });
    local v15 = {};
    for _, v17 in v14 do
        v15[v17.descriptor.key] = v3.createElement(v7, {
            descriptor = v17.descriptor, 
            screenProps = v9.screenProps, 
            navigation = l_navigation_0, 
            isTopOfStack = v17.descriptor.key == l_key_0, 
            totalInStack = l_state_0.index, 
            viewState = v17.viewState, 
            onAnimationComplete = function() --[[ Line: 48 ]] --[[ Name: onAnimationComplete ]]
                -- upvalues: v17 (copy), l_ViewState_0 (ref)
                if v17.viewState == l_ViewState_0.Opening or v17.viewState == l_ViewState_0.Opened then
                    v17.setOpened();
                    return;
                else
                    if v17.viewState == l_ViewState_0.Closing then
                        v17.setClosed();
                    end;
                    return;
                end;
            end
        });
    end;
    return v15;
end;