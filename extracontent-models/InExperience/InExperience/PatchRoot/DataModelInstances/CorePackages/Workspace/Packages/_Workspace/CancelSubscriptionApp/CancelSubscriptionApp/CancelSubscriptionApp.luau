local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_script_FirstAncestor_0.Features.CancelSubscriptionRequest.CancelUserSubscriptionRequestContainer);
local v6 = require(l_script_FirstAncestor_0.Features.CancelSubscriptionError.CancelUserSubscriptionErrorContainer);
local v7 = require(l_script_FirstAncestor_0.Features.CancelSubscriptionSuccess.CancelUserSubscriptionSuccessContainer);
local l_ScreenSizeContext_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).ScreenSizeContext;
local v9 = require(l_script_FirstAncestor_0.Hooks.useCancelSubscriptionRequestedListenerEffect);
local v10 = require(l_script_FirstAncestor_0.Store.Selectors.selectPromptState);
local v11 = require(l_script_FirstAncestor_0.Enums.CancelUserSubscriptionAsyncPromptStateEnum);
local l_FocusNavigationModalSurface_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).FocusNavigationModalSurface;
return function() --[[ Line: 20 ]] --[[ Name: CancelSubscriptionApp ]]
    -- upvalues: v3 (copy), l_useSelector_0 (copy), v10 (copy), v9 (copy), v11 (copy), l_GuiService_0 (copy), l_ScreenSizeContext_0 (copy), l_FocusNavigationModalSurface_0 (copy), v6 (copy), v7 (copy), v5 (copy)
    local v13, v14 = v3.useState(Vector2.new(0, 0));
    local v15 = l_useSelector_0(v10);
    v9(v15);
    v3.useEffect(function() --[[ Line: 26 ]]
        -- upvalues: v15 (copy), v11 (ref), l_GuiService_0 (ref)
        if v15 == v11.None then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end, {
        v15
    });
    if v15 == v11.None then
        return nil;
    else
        return (v3.createElement(l_ScreenSizeContext_0.Provider, {
            value = v13
        }, v3.createElement("ScreenGui", {
            [v3.Change.AbsoluteSize] = function(v16) --[[ Line: 37 ]]
                -- upvalues: v14 (copy)
                v14(v16.AbsoluteSize);
            end, 
            ScreenInsets = Enum.ScreenInsets.None
        }, {
            FocusNavigationEffects = v3.createElement(l_FocusNavigationModalSurface_0, {
                selectionGroupName = "CancelSubscriptionApp"
            }, {
                Error = if v15 == v11.Error then v3.createElement(v6) else nil, 
                Success = if v15 == v11.Success then v3.createElement(v7) else nil, 
                Request = if v15 == v11.Request then v3.createElement(v5) else nil
            })
        })));
    end;
end;