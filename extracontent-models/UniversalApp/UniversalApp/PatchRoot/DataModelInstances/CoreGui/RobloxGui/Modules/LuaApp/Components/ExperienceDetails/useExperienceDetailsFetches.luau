local l_CorePackages_0 = game:GetService("CorePackages");
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v2 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Thunks.Games.FetchGameDetailsPageData);
local v5 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local v6 = require(l_CorePackages_0.Packages.SignalsReact);
local v7 = require(script.Parent.EdpSduiUtils);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
return function(v11, v12, v13) --[[ Line: 19 ]] --[[ Name: useExperienceDetailsFetches ]]
    -- upvalues: l_useDispatch_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v2 (copy), v5 (copy), v7 (copy), v6 (copy), v4 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    local v14 = l_useDispatch_0();
    local v15 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        local v17 = v2.useMemo(function() --[[ Line: 27 ]]
            -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v13 (copy), v11 (copy), v5 (ref), v7 (ref)
            return function(v16) --[[ Line: 28 ]]
                -- upvalues: l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v13 (ref), v11 (ref), v5 (ref), v7 (ref)
                if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v13) and v11 then
                    return (v5.getSduiFeedStore(v7.getEdpStoreKey((tostring(v11)))).getDataUpdatedTimestamp(v16));
                else
                    return nil;
                end;
            end;
        end, {
            v11, 
            v13
        });
        v15 = v6.useSignalState(v17);
    end;
    return (v2.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v14 (copy), v4 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v12 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v13 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), v15 (ref)
        return {
            fetchGameDetailsPageData = function(v18, v19, v20) --[[ Line: 48 ]] --[[ Name: fetchGameDetailsPageData ]]
                -- upvalues: v14 (ref), v4 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v12 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v13 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), v15 (ref)
                return v14(v4(v18, v19, v20, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v12 else nil, if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v13 else nil, if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v13 or l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 then v15 else nil));
            end
        };
    end, {
        v14, 
        v15, 
        if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v13 else nil, 
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v12 else nil
    }));
end;