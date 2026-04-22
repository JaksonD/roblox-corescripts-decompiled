local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_CorePackages_0.Workspace.Packages.SquadsCore);
local l_SquadRootViewType_0 = v7.Enums.SquadRootViewType;
local l_makeSquadContract_0 = v7.SquadExternalContractProvider.makeSquadContract;
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local v13 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local l_SquadContract_0 = v13.Contracts.SquadContract.SquadContract;
local l_useChatIsVisible_0 = v13.Hooks.useChatIsVisible;
local l_FFlagEnableSquadTopBannerWideMode_0 = v4.FFlagEnableSquadTopBannerWideMode;
local l_FFlagUseNavigationSelectors_0 = v4.FFlagUseNavigationSelectors;
return (l_makeSquadContract_0(v2.Dictionary.union(l_SquadContract_0, {
    setSquadPrompt = function(v18, v19) --[[ Line: 27 ]]
        -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
        v18:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.SquadPrompt, v19));
    end, 
    showSearchOverlay = function(v20, v21) --[[ Line: 31 ]]
        -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v2 (copy)
        v20(l_SetCentralOverlay_0(l_CentralOverlayType_0.SearchPageOverlay, v2.Dictionary.join({
            isFocused = true, 
            initialSearchText = "", 
            searchType = "Games"
        }, v21 or {})));
    end, 
    closeSquadPrompt = l_CloseCentralOverlay_0, 
    useSquadRootView = function() --[[ Line: 42 ]]
        -- upvalues: l_FFlagEnableSquadTopBannerWideMode_0 (copy), l_useSelector_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_AppPage_0 (copy), l_useChatIsVisible_0 (copy), l_SquadRootViewType_0 (copy)
        if if l_FFlagEnableSquadTopBannerWideMode_0 then l_useSelector_0(function(v22) --[[ Line: 44 ]]
            -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_AppPage_0 (ref)
            if not v22.Navigation then
                return true;
            else
                local v23 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v22) else v22.Navigation.history;
                if not v23 then
                    return false;
                else
                    local v24 = v23[#v23];
                    if not v24 then
                        return false;
                    else
                        for _, v26 in v24 do
                            if v26.name == l_AppPage_0.Chat then
                                return true;
                            end;
                        end;
                        return false;
                    end;
                end;
            end;
        end) else l_useChatIsVisible_0() then
            return l_SquadRootViewType_0.UAAppChatPage;
        else
            return l_SquadRootViewType_0.None;
        end;
    end, 
    useSquadTopBannerManager = function() --[[ Line: 75 ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v27, v28 = v3.useState({});
        local v32 = v3.useCallback(function(v29, v30) --[[ Line: 78 ]]
            -- upvalues: v28 (copy), v2 (ref)
            v28(function(v31) --[[ Line: 79 ]]
                -- upvalues: v29 (copy), v30 (copy), v2 (ref)
                if v31[v29] == true == v30 then
                    return v31;
                else
                    return v2.Dictionary.join(v31, {
                        [v29] = v30 and true or v2.None
                    });
                end;
            end);
        end, {
            v28
        });
        local v35 = v3.useCallback(function() --[[ Line: 89 ]]
            -- upvalues: v27 (copy)
            for _, v34 in pairs(v27) do
                if v34 == true then
                    return true;
                end;
            end;
            return false;
        end, {
            v27
        });
        return {
            disableSquadTopBanner = v32, 
            useSquadTopBannerDisabled = v35
        };
    end
})));