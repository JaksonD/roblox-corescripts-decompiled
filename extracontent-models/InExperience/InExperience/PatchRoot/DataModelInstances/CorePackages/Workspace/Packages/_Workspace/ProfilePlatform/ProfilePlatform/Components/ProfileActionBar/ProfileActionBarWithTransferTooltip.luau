local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v6 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.ProfileActionBar);
local v7 = require(l_script_FirstAncestor_0.Flags.GetFIntProfilePlatformCurrencyTransferTooltipMaxImpressions);
local _ = require(l_script_FirstAncestor_0.Types.UpsellTooltipProps);
return function(v9) --[[ Line: 26 ]] --[[ Name: ProfileActionBarWithTransferTooltip ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), v3 (copy), v7 (copy), l_AppStorageService_0 (copy), v6 (copy)
    local v10 = l_useLocalization_0({
        plusMoreMenuTooltipBody = v5.CurrencyTransferTooltipBody
    });
    local v11, v12 = v3.useState(false);
    local v13 = v3.useRef(false);
    local l_game_EngineFeature_0 = game:GetEngineFeature("CurrencyTransferProfileActionTooltipStorageKey");
    v3.useEffect(function() --[[ Line: 34 ]]
        -- upvalues: v13 (copy), l_game_EngineFeature_0 (copy), v7 (ref), l_AppStorageService_0 (ref), v12 (copy)
        if v13.current then
            return;
        else
            if l_game_EngineFeature_0 then
                local v15 = v7();
                local v16 = tonumber(l_AppStorageService_0:GetItem("CurrencyTransferProfileActionTooltipImpressionsCount")) or 0;
                if v15 <= v16 then
                    return;
                else
                    l_AppStorageService_0:SetItem("CurrencyTransferProfileActionTooltipImpressionsCount", (tostring(v16 + 1)));
                    l_AppStorageService_0:Flush();
                end;
            end;
            v13.current = true;
            v12(true);
            return;
        end;
    end, {
        l_game_EngineFeature_0
    });
    local v18 = v3.useCallback(function() --[[ Line: 54 ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v7 (ref), l_AppStorageService_0 (ref), v12 (copy)
        if l_game_EngineFeature_0 then
            local v17 = v7();
            l_AppStorageService_0:SetItem("CurrencyTransferProfileActionTooltipImpressionsCount", (tostring(v17)));
            l_AppStorageService_0:Flush();
        end;
        v12(false);
    end, {
        l_game_EngineFeature_0
    });
    local v19 = v3.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v12 (copy)
        v12(false);
    end, {});
    local v20 = v3.useMemo(function() --[[ Line: 69 ]]
        -- upvalues: v10 (copy), v18 (copy), v19 (copy)
        return {
            plusMoreMenuTooltipTitle = nil, 
            plusMoreMenuTooltipBody = v10.plusMoreMenuTooltipBody, 
            onPlusMoreMenuTooltipClose = v18, 
            onPlusMoreMenuTooltipDismiss = v19
        };
    end, {
        v10.plusMoreMenuTooltipBody, 
        v18, 
        v19
    });
    return v3.createElement(v6, {
        isContextualMenuOpen = v9.isContextualMenuOpen, 
        layoutOrder = v9.layoutOrder, 
        openContextualMenu = v9.openContextualMenu, 
        profileActions = v9.profileActions, 
        primaryButtonRef = v9.primaryButtonRef, 
        moreButtonRef = v9.moreButtonRef, 
        showPlusMoreMenuTooltip = v11, 
        upsellTooltipProps = if v11 then v20 else nil
    });
end;