local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Toast_0 = require(l_Parent_0.ToastLite).Components.Toast;
local v6 = require(l_script_FirstAncestor_0.Enums.CommercePurchasePromptStateEnum);
local v7 = require(l_script_FirstAncestor_0.Features.CommercePurchaseError.CommercePurchaseErrorContainer);
local l_ScreenSizeContext_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).ScreenSizeContext;
local v9 = require(l_script_FirstAncestor_0.Hooks.useBenefitStatusReceivedListenerEffect);
local v10 = require(l_script_FirstAncestor_0.Hooks.useCommerceProductPurchaseRequestListenerEffect);
local l_FocusNavigationModalSurface_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).FocusNavigationModalSurface;
local v12 = require(l_script_FirstAncestor_0.Hooks.usePurchaseBrowserClosedListenerEffect);
local v13 = require(l_script_FirstAncestor_0.Store.Selectors.selectPromptState);
return function() --[[ Line: 20 ]] --[[ Name: CommercePurchaseApp ]]
    -- upvalues: v3 (copy), l_useSelector_0 (copy), v13 (copy), v9 (copy), v12 (copy), v10 (copy), v6 (copy), l_GuiService_0 (copy), l_ScreenSizeContext_0 (copy), l_FocusNavigationModalSurface_0 (copy), v7 (copy), l_Toast_0 (copy)
    local v14, v15 = v3.useState(Vector2.new(0, 0));
    local v16 = l_useSelector_0(v13);
    v9();
    v12();
    v10();
    v3.useEffect(function() --[[ Line: 28 ]]
        -- upvalues: v16 (copy), v6 (ref), l_GuiService_0 (ref)
        if v16 == v6.None then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end, {
        v16
    });
    if v16 == v6.None then
        return nil;
    else
        return (v3.createElement(l_ScreenSizeContext_0.Provider, {
            value = v14
        }, v3.createElement("ScreenGui", {
            [v3.Change.AbsoluteSize] = function(v17) --[[ Line: 39 ]]
                -- upvalues: v15 (copy)
                v15(v17.AbsoluteSize);
            end, 
            ScreenInsets = Enum.ScreenInsets.None
        }, {
            FocusNavigationEffects = v3.createElement(l_FocusNavigationModalSurface_0, {
                selectionGroupName = "CommercePurchaseApp"
            }, {
                Error = if v16 == v6.Error then v3.createElement(v7) else nil, 
                Toast = v3.createElement(l_Toast_0)
            })
        })));
    end;
end;