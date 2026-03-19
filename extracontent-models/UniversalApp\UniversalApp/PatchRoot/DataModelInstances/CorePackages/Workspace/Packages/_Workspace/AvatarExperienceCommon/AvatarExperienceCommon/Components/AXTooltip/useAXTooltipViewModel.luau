local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useIsSpatial_0 = require(l_Parent_0.Responsive).useIsSpatial;
local l_useEarlyIsFocused_0 = require(l_Parent_0.Navigation).useEarlyIsFocused;
local v6 = require(l_Parent_0.SignalsReact);
local v7 = require(l_script_FirstAncestor_0.Stores.AXTooltipStore);
local v8 = game:DefineFastInt("AXTooltipTimeToDismiss", 5);
local _ = require(l_Parent_0.AvatarExperienceUIKit);
return function(v10) --[[ Line: 36 ]] --[[ Name: useAXTooltipViewModel ]]
    -- upvalues: v7 (copy), l_useLocalization_0 (copy), l_useIsSpatial_0 (copy), l_useEarlyIsFocused_0 (copy), v6 (copy), v2 (copy), v8 (copy)
    local v11 = v7(false);
    local v12 = l_useLocalization_0({
        tooltipText = v10.tooltipLocalizationKey
    });
    local v13 = v10.localizedText or v12.tooltipText;
    local v14 = l_useIsSpatial_0();
    local v15 = l_useEarlyIsFocused_0();
    local v16 = v6.useSignalState(v11.getIsTooltipAllowedToBeShown(v10.tooltipStorageKey));
    local v17 = v10.showTooltip and v16 and v15 and not v14;
    local v18 = v2.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: v11 (copy), v10 (copy)
        v11.dismissTooltip(v10.tooltipStorageKey);
    end, {
        v10.tooltipStorageKey
    });
    if v10.dismissTooltipRef and v10.showTooltip then
        v10.dismissTooltipRef.current = v18;
    end;
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v17 (copy), v8 (ref), v11 (copy), v10 (copy)
        if v17 then
            task.spawn(function() --[[ Line: 59 ]]
                -- upvalues: v8 (ref), v11 (ref), v10 (ref)
                task.wait(v8);
                v11.dismissTooltip(v10.tooltipStorageKey, true);
            end);
        end;
    end, {
        v17
    });
    return {
        isOpen = v17, 
        popoverSide = v10.popoverSide, 
        tooltipText = v13, 
        onTooltipActivated = v18
    };
end;