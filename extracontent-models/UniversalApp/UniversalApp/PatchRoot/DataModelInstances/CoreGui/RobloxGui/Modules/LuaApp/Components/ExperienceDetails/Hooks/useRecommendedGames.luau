local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = v2.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v2.Hooks.RoactRodux.useSelector;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v8 = require(l_Modules_0.LuaApp.Thunks.Games.RecommendedGames);
local v9 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPage);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v12 = {};
return function(v13, v14) --[[ Line: 26 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v9 (copy), v8 (copy), v12 (copy), v1 (copy)
    local v15 = l_useDispatch_0();
    local v16 = l_useRoactService_0(l_RoactNetworking_0);
    local v18 = l_useSelector_0(function(v17) --[[ Line: 30 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v14 (copy), v13 (copy), v9 (ref), v8 (ref)
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v14 then
            return v13 and v9.GetFetchingStatus(v17, v13) or nil;
        else
            return v13 and v8.GetFetchingStatus(v17, v13) or nil;
        end;
    end);
    local v21 = l_useSelector_0(function(v19) --[[ Line: 41 ]]
        -- upvalues: v13 (copy), v12 (ref)
        local v20 = v19.RecommendedGameEntries and v19.RecommendedGameEntries[v13] or nil;
        if not v20 then
            return v12;
        else
            return v20;
        end;
    end);
    local v22 = v1.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v14 (copy), v15 (copy), v8 (ref), v16 (copy), v13 (copy)
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v14 then
            return;
        else
            v15(v8.Fetch(v16, v13, {
                maxRows = 6
            }));
            return;
        end;
    end, {
        v15, 
        v16, 
        v13, 
        v14
    });
    v1.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v14 (copy), v22 (copy)
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v14 then
            return;
        else
            v22();
            return;
        end;
    end, {
        v22, 
        v14
    });
    return {
        fetchStatus = v18, 
        refetchRecommendedGames = v22, 
        recommendedGames = v21
    };
end;