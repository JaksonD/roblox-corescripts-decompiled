local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v6 = require(l_script_FirstAncestor_0.Enums.BulkPurchasePromptStateEnum);
local v7 = require(l_script_FirstAncestor_0.Features.BulkPurchaseError.BulkPurchaseErrorContainer);
local v8 = require(l_script_FirstAncestor_0.Features.BulkPurchaseSuccess.BulkPurchaseSuccessContainer);
local v9 = require(l_script_FirstAncestor_0.Features.BulkPurchasePartialSuccess.BulkPurchasePartialSuccessContainer);
local v10 = require(l_script_FirstAncestor_0.Features.BulkPurchaseRequest.BulkPurchaseRequestContainer);
local l_ScreenSizeContext_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).ScreenSizeContext;
local v12 = require(l_script_FirstAncestor_0.Hooks.useBulkPurchaseRequestListenerEffect);
local l_useFocusNavigationSurface_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).useFocusNavigationSurface;
local l_FocusNavigationModalSurface_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).FocusNavigationModalSurface;
local v15 = require(l_script_FirstAncestor_0.Store.Selectors.selectPromptState);
local v16 = game:DefineFastFlag("FixBulkPurchaseInputPerf", false);
return function() --[[ Line: 24 ]] --[[ Name: BulkPurchaseApp ]]
    -- upvalues: v3 (copy), l_useSelector_0 (copy), v15 (copy), v16 (copy), l_useFocusNavigationSurface_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v12 (copy), v6 (copy), l_GuiService_0 (copy), l_ScreenSizeContext_0 (copy), l_FocusNavigationModalSurface_0 (copy), v7 (copy), v8 (copy), v10 (copy), v9 (copy)
    local v17, v18 = v3.useState(Vector2.new(0, 0));
    local v19 = l_useSelector_0(v15);
    local v20 = if v16 then nil else l_useFocusNavigationSurface_0({
        selectionGroupName = "BulkPurchaseApp", 
        focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
    });
    v12();
    v3.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: v19 (copy), v6 (ref), l_GuiService_0 (ref)
        if v19 == v6.None then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end, {
        v19
    });
    return v3.createElement(l_ScreenSizeContext_0.Provider, {
        value = v17
    }, v3.createElement("ScreenGui", {
        [v3.Change.AbsoluteSize] = function(v21) --[[ Line: 46 ]]
            -- upvalues: v18 (copy)
            v18(v21.AbsoluteSize);
        end, 
        ScreenInsets = Enum.ScreenInsets.None
    }, {
        FocusNavigationEffects = if v16 then if v19 ~= v6.None then v3.createElement(l_FocusNavigationModalSurface_0, {
            selectionGroupName = "BulkPurchaseApp"
        }, {
            Error = if v19 == v6.Error then v3.createElement(v7) else nil, 
            Success = if v19 == v6.Success then v3.createElement(v8) else nil, 
            Request = if v19 == v6.Request then v3.createElement(v10) else nil, 
            PartialSuccess = if v19 == v6.PartialSuccess then v3.createElement(v9) else nil
        }) else nil else v3.createElement("Frame", {
            ref = if v19 == v6.None then nil else v20, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop
        }, {
            Error = if v19 == v6.Error then v3.createElement(v7) else nil, 
            Success = if v19 == v6.Success then v3.createElement(v8) else nil, 
            Request = if v19 == v6.Request then v3.createElement(v10) else nil, 
            PartialSuccess = if v19 == v6.PartialSuccess then v3.createElement(v9) else nil
        })
    }));
end;