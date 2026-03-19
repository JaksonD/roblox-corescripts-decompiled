local l_GuiService_0 = game:GetService("GuiService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_Parent_0.FocusNavigationUtils);
local _ = require(l_script_FirstAncestor_0.Types);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v7.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigableSurfaceRegistry_0 = v7.FocusNavigableSurfaceRegistry;
local l_useRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useDeRegisterFocusNavigableSurface;
local l_useAutoFocus_0 = v7.useAutoFocus;
local l_useDescendantHasFocus_0 = v7.useDescendantHasFocus;
local l_useLastInputMode_0 = v7.useLastInputMode;
local function v17(v16) --[[ Line: 52 ]] --[[ Name: selectItemBeingPurchased ]]
    return v16.itemBeingPurchased;
end;
return function() --[[ Line: 56 ]] --[[ Name: useInspectAndBuyFocusNavigation ]]
    -- upvalues: v5 (copy), l_useSelector_0 (copy), v17 (copy), l_useRegisterFocusNavigableSurface_0 (copy), l_useDeRegisterFocusNavigableSurface_0 (copy), l_useAutoFocus_0 (copy), l_useDescendantHasFocus_0 (copy), l_useLastInputMode_0 (copy), l_MarketplaceService_0 (copy), l_Players_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_GuiService_0 (copy)
    local v18, v19 = v5.useState(nil);
    local v20, v21 = v5.useState(false);
    local v22 = l_useSelector_0(v17);
    local v23 = v22 and v22.itemId ~= nil;
    local v24 = l_useRegisterFocusNavigableSurface_0();
    local v25 = l_useDeRegisterFocusNavigableSurface_0();
    local v26 = l_useAutoFocus_0({
        v18
    }, 0.1);
    local v27 = l_useDescendantHasFocus_0(v18);
    local v28 = l_useLastInputMode_0() == "Focus";
    local v29 = v23 or v20;
    v5.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: l_MarketplaceService_0 (ref), l_Players_0 (ref), v21 (copy)
        local v31 = l_MarketplaceService_0.PromptBulkPurchaseRequested:Connect(function(v30) --[[ Line: 78 ]]
            -- upvalues: l_Players_0 (ref), v21 (ref)
            if v30 == l_Players_0.LocalPlayer then
                v21(true);
            end;
        end);
        local v33 = l_MarketplaceService_0.PromptBulkPurchaseFinished:Connect(function(v32) --[[ Line: 83 ]]
            -- upvalues: l_Players_0 (ref), v21 (ref)
            if v32 == l_Players_0.LocalPlayer then
                v21(false);
            end;
        end);
        return function() --[[ Line: 89 ]]
            -- upvalues: v31 (copy), v33 (copy)
            v31:Disconnect();
            v33:Disconnect();
        end;
    end, {});
    v5.useEffect(function() --[[ Line: 96 ]]
        -- upvalues: v29 (copy), v25 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v18 (copy), l_GuiService_0 (ref), v24 (copy)
        if v29 then
            v25(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, v18);
            l_GuiService_0:RemoveSelectionGroup("InspectAndBuyApp");
            return function() --[[ Line: 102 ]]

            end;
        else
            if v18 then
                v24(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, v18);
                l_GuiService_0:AddSelectionParent("InspectAndBuyApp", v18);
            else
                v25(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, v18);
                l_GuiService_0:RemoveSelectionGroup("InspectAndBuyApp");
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            return function() --[[ Line: 114 ]]
                -- upvalues: v25 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v18 (ref), l_GuiService_0 (ref)
                v25(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, v18);
                l_GuiService_0:RemoveSelectionGroup("InspectAndBuyApp");
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
    end, {
        v18, 
        v29, 
        v25, 
        v24
    });
    local v34 = v28 and v18 and not v27 and not v29;
    v5.useEffect(function() --[[ Line: 124 ]]
        -- upvalues: v34 (copy), v26 (copy)
        local v35 = nil;
        if v34 then
            v35 = v26();
        end;
        return function() --[[ Line: 129 ]]
            -- upvalues: v35 (ref)
            if v35 then
                v35.cancel();
            end;
        end;
    end, {
        v34, 
        v26
    });
    return {
        setFocusRef = v19, 
        focusNavigationProps = {
            SelectionGroup = true, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop
        }
    };
end;