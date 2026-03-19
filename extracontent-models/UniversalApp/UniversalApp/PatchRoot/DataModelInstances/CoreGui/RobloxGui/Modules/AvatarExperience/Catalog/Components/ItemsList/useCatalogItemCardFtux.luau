local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_WearTimeConstants_0 = v4.WearTimeConstants;
local l_WearTimeFTUXStatusSessionEnum_0 = v5.Enums.WearTimeFTUXStatusSessionEnum;
local l_WearTimeFTUXStatusEnum_0 = v4.Components.CatalogItemCard.WearTimeFTUXStatusEnum;
local l_SafeAppStorageService_0 = v4.Lib.SafeAppStorageService;
local v13 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v14 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_CentralOverlayType_0 = v3.CentralOverlayType;
local l_FFlagAXTimedOptionsFTUXModalUseMemStorage_0 = v6.FFlagAXTimedOptionsFTUXModalUseMemStorage;
local l_FFlagAXWearTimeSupport_0 = v7.FFlagAXWearTimeSupport;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function(v19) --[[ Line: 31 ]] --[[ Name: useCatalogItemCardFtux ]]
    -- upvalues: l_useDispatch_0 (copy), l_FFlagAXWearTimeSupport_0 (copy), l_FFlagAXTimedOptionsFTUXModalUseMemStorage_0 (copy), v2 (copy), l_SafeAppStorageService_0 (copy), l_WearTimeConstants_0 (copy), l_WearTimeFTUXStatusSessionEnum_0 (copy), l_WearTimeFTUXStatusEnum_0 (copy), v13 (copy), l_CentralOverlayType_0 (copy), v14 (copy)
    local v20 = l_useDispatch_0();
    if l_FFlagAXWearTimeSupport_0 then
        local v21 = false;
        if v19.itemData ~= nil then
            v21 = false;
            if v19.itemData.timedOptions ~= nil then
                v21 = #v19.itemData.timedOptions > 0;
            end;
        end;
        if l_FFlagAXTimedOptionsFTUXModalUseMemStorage_0 or game:GetEngineFeature("AXWearTimeFTUXTooltipStorageKey") then
            v2.useEffect(function() --[[ Line: 43 ]]
                -- upvalues: v19 (copy), v21 (copy), l_SafeAppStorageService_0 (ref), l_WearTimeConstants_0 (ref), l_WearTimeFTUXStatusSessionEnum_0 (ref), l_FFlagAXTimedOptionsFTUXModalUseMemStorage_0 (ref), l_WearTimeFTUXStatusEnum_0 (ref), v20 (copy), v13 (ref), l_CentralOverlayType_0 (ref), v14 (ref)
                if v19.isSelected and v21 and l_SafeAppStorageService_0.getItem(l_WearTimeConstants_0.TOOLTIP_FTUX_SESSION_TRACKER_KEY, true) ~= l_WearTimeFTUXStatusSessionEnum_0.Shown then
                    local v22 = l_SafeAppStorageService_0.getItem(l_WearTimeConstants_0.TOOLTIP_FTUX_APP_STORAGE_KEY, l_FFlagAXTimedOptionsFTUXModalUseMemStorage_0);
                    if v22 == l_WearTimeFTUXStatusEnum_0.Undefined or v22 == l_WearTimeFTUXStatusEnum_0.Displayed then
                        v20(v13(l_CentralOverlayType_0.WearTimeInfoModal, {
                            onClose = function() --[[ Line: 60 ]] --[[ Name: onClose ]]
                                -- upvalues: l_SafeAppStorageService_0 (ref), l_WearTimeConstants_0 (ref), l_WearTimeFTUXStatusEnum_0 (ref), l_FFlagAXTimedOptionsFTUXModalUseMemStorage_0 (ref), v20 (ref), v14 (ref)
                                l_SafeAppStorageService_0.setItem(l_WearTimeConstants_0.TOOLTIP_FTUX_APP_STORAGE_KEY, l_WearTimeFTUXStatusEnum_0.Dismissed, l_FFlagAXTimedOptionsFTUXModalUseMemStorage_0);
                                v20(v14());
                            end
                        }));
                        l_SafeAppStorageService_0.setItem(l_WearTimeConstants_0.TOOLTIP_FTUX_SESSION_TRACKER_KEY, l_WearTimeFTUXStatusSessionEnum_0.Shown, true);
                        if v22 == l_WearTimeFTUXStatusEnum_0.Undefined then
                            l_SafeAppStorageService_0.setItem(l_WearTimeConstants_0.TOOLTIP_FTUX_APP_STORAGE_KEY, l_WearTimeFTUXStatusEnum_0.Displayed, l_FFlagAXTimedOptionsFTUXModalUseMemStorage_0);
                            return;
                        elseif v22 == l_WearTimeFTUXStatusEnum_0.Displayed then
                            l_SafeAppStorageService_0.setItem(l_WearTimeConstants_0.TOOLTIP_FTUX_APP_STORAGE_KEY, l_WearTimeFTUXStatusEnum_0.DisplayedTwice, l_FFlagAXTimedOptionsFTUXModalUseMemStorage_0);
                        end;
                    end;
                end;
            end, {
                v20, 
                v19.isSelected, 
                v21
            });
        end;
    end;
end;