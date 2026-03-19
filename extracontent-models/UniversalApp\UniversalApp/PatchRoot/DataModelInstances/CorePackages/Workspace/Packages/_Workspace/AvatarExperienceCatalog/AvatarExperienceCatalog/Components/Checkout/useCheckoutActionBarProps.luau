local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.tutils);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v5 = require(l_script_FirstAncestor_0.Hooks.useMultiItemShoppingFtux);
local _ = require(l_script_FirstAncestor_0.Components.Checkout.CheckoutActionBar);
local v7 = require(l_Parent_0.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v7.AvatarRoute.Hooks.useAvatarRoute;
local l_ClearTryOns_0 = require(l_Parent_0.AvatarExperienceCommon).State.Actions.ClearTryOns;
local l_AvatarScreen_0 = v7.Enums.AvatarScreen;
local v11 = game:DefineFastInt("AXCheckoutButtonTooltipFtuxDelay", 500);
local v12 = game:DefineFastInt("AXCheckoutButtonTooltipExpireTime", 5000);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local function v16(v15) --[[ Line: 28 ]] --[[ Name: selectTryOnItems ]]
    return v15.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
return function(v17, v18) --[[ Line: 32 ]] --[[ Name: useCheckoutActionBarProps ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), v5 (copy), l_useAvatarRoute_0 (copy), v2 (copy), l_useSelector_0 (copy), v16 (copy), v3 (copy), l_AvatarScreen_0 (copy), l_ClearTryOns_0 (copy), v11 (copy), v12 (copy)
    local v19 = l_useNavigation_0();
    local v20 = l_useDispatch_0();
    local v21 = v5();
    local v22 = l_useAvatarRoute_0();
    local v23 = v22 and v22.opaque and v22.opaque.name;
    local l_routeName_0 = v19.state.routeName;
    local v25, v26 = v2.useState(false);
    local v27 = v2.useRef(nil);
    local v28 = l_useSelector_0(v16, v3.deepEqual);
    local v29 = v3.fieldCount(v28);
    local v31 = v2.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: v17 (copy), v21 (copy), v19 (copy), l_AvatarScreen_0 (ref), v20 (copy), l_ClearTryOns_0 (ref)
        if v17.onClearButtonActivated then
            v17.onClearButtonActivated();
        end;
        if v21.shouldShowClearAllItemsPrompt() then
            v19.navigate(l_AvatarScreen_0.ClearAllItemsOnAvatarPrompt, {
                onConfirm = function(v30) --[[ Line: 56 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v20 (ref), l_ClearTryOns_0 (ref), v21 (ref)
                    v20(l_ClearTryOns_0());
                    if v30 then
                        v21.hideClearAllItemsPrompt();
                    end;
                end
            });
            return;
        else
            v20(l_ClearTryOns_0());
            return;
        end;
    end, {
        v17.onClearButtonActivated, 
        v19, 
        v21, 
        v20
    });
    local v32 = v2.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v19 (copy), v17 (copy), v21 (copy), v27 (copy), v26 (copy)
        v19.navigate("Checkout");
        if v17.onCheckoutButtonActivated then
            v17.onCheckoutButtonActivated();
        end;
        v21.setSeenTooltipOnCheckoutButton();
        if v27.current then
            task.cancel(v27.current);
        end;
        v26(false);
    end, {
        v17.onCheckoutButtonActivated, 
        v26, 
        v19, 
        v21
    });
    local v33 = v2.useCallback(function() --[[ Line: 86 ]]
        -- upvalues: v21 (copy), v27 (copy), v26 (copy)
        v21.setSeenTooltipOnCheckoutButton();
        if v27.current then
            task.cancel(v27.current);
        end;
        v26(false);
    end, {});
    local v34 = v2.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: v11 (ref), v26 (copy), v12 (ref), v21 (copy)
        return task.delay(v11 / 1000, function() --[[ Line: 96 ]]
            -- upvalues: v26 (ref), v12 (ref), v21 (ref)
            v26(true);
            task.delay(v12 / 1000, function() --[[ Line: 99 ]]
                -- upvalues: v21 (ref), v26 (ref)
                v21.setSeenTooltipOnCheckoutButton();
                v26(false);
            end);
        end);
    end, {
        v21
    });
    v2.useEffect(function() --[[ Line: 107 ]]
        -- upvalues: v21 (copy), v22 (copy), v23 (copy), l_AvatarScreen_0 (ref), l_routeName_0 (copy), v27 (copy), v34 (copy)
        if v21.shouldShowTooltipOnCheckoutButton() and v22.isVisible and (v23 == l_AvatarScreen_0.Catalog or v23 == l_AvatarScreen_0.CatalogSearch) and l_routeName_0 == v23 then
            v27.current = v34();
        end;
    end, {
        v21, 
        v23, 
        l_routeName_0, 
        v22
    });
    v2.useEffect(function() --[[ Line: 128 ]]
        -- upvalues: v17 (copy), l_routeName_0 (copy), v23 (copy), v22 (copy), v26 (copy)
        if not v17.Visible or l_routeName_0 ~= v23 or not v22.isVisible then
            v26(false);
        end;
    end, {
        v17.Visible, 
        v26, 
        v22, 
        l_routeName_0, 
        v23
    });
    return {
        onCheckoutButtonActivated = v32, 
        onClearButtonActivated = v31, 
        itemCount = v29, 
        ref = v18, 
        Visible = v17.Visible, 
        showCheckoutButtonTooltip = v25, 
        onTooltipButtonActivated = v33, 
        onAbsoluteSizeChanged = v17.onAbsoluteSizeChanged
    };
end;