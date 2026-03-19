local l_IXPService_0 = game:GetService("IXPService");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay;
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v10 = require(l_Modules_0.LuaApp.getCurrentPage);
local v11 = require(l_Modules_0.LuaApp.Thunks.WaitUntilIXPUserInit);
local v12 = game:DefineFastString("LuaAppVngAppIxpUserLayer", "PlayerApp.HomePageUpsell.VNGApp");
local v13 = game:DefineFastString("LuaAppVngIxpFrequency", "frequency");
local v14 = game:DefineFastString("LuaAppVngIxpDismissable", "dismissable");
local v15 = game:DefineFastString("LuaAppVngIxpEnabled", "enabled");
local v16 = game:DefineFastInt("LuaAppVngUpsellNagFrequencySec", 86400);
local v17 = game:DefineFastFlag("LuaAppVngUpsellAlwaysEnabled", false);
local v18 = game:DefineFastFlag("LuaAppVngUpsellAlwaysCanClose", false);
local v19 = nil;
return function(_) --[[ Line: 25 ]] --[[ Name: CheckForVngAppUpsellForVnUsers ]]
    -- upvalues: v3 (copy), l_useSelector_0 (copy), v10 (copy), l_useDispatch_0 (copy), v17 (copy), l_useUserExperiment_0 (copy), v12 (copy), v15 (copy), v14 (copy), v13 (copy), l_Players_0 (copy), v11 (copy), l_IXPService_0 (copy), v19 (ref), v16 (copy), v18 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    local v21, v22 = v3.useState(false);
    local v23 = l_useSelector_0(v10);
    local v24 = l_useDispatch_0();
    local v25 = {};
    if not v17 then
        v25 = l_useUserExperiment_0({
            v12
        }, function(v26) --[[ Line: 34 ]]
            -- upvalues: v12 (ref), v15 (ref), v14 (ref), v13 (ref)
            local v27 = v26[v12] or {};
            local v28 = tostring(v27[v15]);
            local v29 = tostring(v27[v14]);
            return {
                upsellEnabled = v28 and v28 == "true" or false, 
                upsellFrequency = v27[v13], 
                upsellDismissable = v29 and v29 == "true" or false
            };
        end);
        v3.useEffect(function() --[[ Line: 47 ]]
            -- upvalues: v21 (copy), l_Players_0 (ref), v24 (copy), v11 (ref), l_IXPService_0 (ref), v22 (copy)
            if not v21 then
                local v30 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
                v24(v11(l_IXPService_0, v30)):andThen(function() --[[ Line: 50 ]]
                    -- upvalues: v22 (ref)
                    v22(true);
                end);
            end;
        end, {
            v21
        });
    end;
    v3.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v17 (ref), v21 (copy), v25 (ref), v19 (ref), v16 (ref), v18 (ref), v24 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        if (v17 or v21 and v25.upsellEnabled) and (not v19 or v19 < DateTime.now().UnixTimestampMillis) then
            local l_v16_0 = v16;
            if v25.upsellFrequency then
                l_v16_0 = tonumber(v25.upsellFrequency);
            end;
            v19 = DateTime.now().UnixTimestampMillis + l_v16_0 * 1000;
            local l_v18_0 = v18;
            if v25.upsellDismissable then
                l_v18_0 = v25.upsellDismissable;
            end;
            v24(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngAppUpsell, {
                isDismissable = l_v18_0
            }));
        end;
    end, {
        v19, 
        v23, 
        v25, 
        v21
    });
    return nil;
end;