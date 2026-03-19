local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_CorePackages_0.Workspace.Packages.SquadsCore);
local l_SquadRootViewType_0 = v6.Enums.SquadRootViewType;
local l_makeSquadContract_0 = v6.SquadExternalContractProvider.makeSquadContract;
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local v12 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local l_SquadContract_0 = v12.Contracts.SquadContract.SquadContract;
local l_useChatIsVisible_0 = v12.Hooks.useChatIsVisible;
local l_FFlagEnableSquadTopBannerWideMode_0 = v4.FFlagEnableSquadTopBannerWideMode;
return (l_makeSquadContract_0(v2.Dictionary.union(l_SquadContract_0, {
    setSquadPrompt = function(v16, v17) --[[ Line: 25 ]]
        -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
        v16:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.SquadPrompt, v17));
    end, 
    showSearchOverlay = function(v18, v19) --[[ Line: 29 ]]
        -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v2 (copy)
        v18(l_SetCentralOverlay_0(l_CentralOverlayType_0.SearchPageOverlay, v2.Dictionary.join({
            isFocused = true, 
            initialSearchText = "", 
            searchType = "Games"
        }, v19 or {})));
    end, 
    closeSquadPrompt = l_CloseCentralOverlay_0, 
    useSquadRootView = function() --[[ Line: 40 ]]
        -- upvalues: l_FFlagEnableSquadTopBannerWideMode_0 (copy), l_useSelector_0 (copy), l_AppPage_0 (copy), l_useChatIsVisible_0 (copy), l_SquadRootViewType_0 (copy)
        if if l_FFlagEnableSquadTopBannerWideMode_0 then l_useSelector_0(function(v20) --[[ Line: 42 ]]
            -- upvalues: l_AppPage_0 (ref)
            if not v20.Navigation then
                return true;
            else
                local l_history_0 = v20.Navigation.history;
                if not l_history_0 then
                    return false;
                else
                    local v22 = l_history_0[#l_history_0];
                    if not v22 then
                        return false;
                    else
                        for _, v24 in v22 do
                            if v24.name == l_AppPage_0.Chat then
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
    useSquadTopBannerManager = function() --[[ Line: 71 ]]
        -- upvalues: v3 (copy), v2 (copy)
        local v25, v26 = v3.useState({});
        local v30 = v3.useCallback(function(v27, v28) --[[ Line: 74 ]]
            -- upvalues: v26 (copy), v2 (ref)
            v26(function(v29) --[[ Line: 75 ]]
                -- upvalues: v27 (copy), v28 (copy), v2 (ref)
                if v29[v27] == true == v28 then
                    return v29;
                else
                    return v2.Dictionary.join(v29, {
                        [v27] = v28 and true or v2.None
                    });
                end;
            end);
        end, {
            v26
        });
        local v33 = v3.useCallback(function() --[[ Line: 85 ]]
            -- upvalues: v25 (copy)
            for _, v32 in pairs(v25) do
                if v32 == true then
                    return true;
                end;
            end;
            return false;
        end, {
            v25
        });
        return {
            disableSquadTopBanner = v30, 
            useSquadTopBannerDisabled = v33
        };
    end
})));