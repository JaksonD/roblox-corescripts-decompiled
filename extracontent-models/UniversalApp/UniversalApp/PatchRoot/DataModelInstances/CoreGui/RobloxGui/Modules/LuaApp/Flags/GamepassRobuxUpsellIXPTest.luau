local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
game:DefineFastFlag("GamepassRobuxUpsellIXPV2", false);
game:DefineFastFlag("GamepassRobuxUpsellIXPRolledOutV2", false);
game:DefineFastFlag("GamepassRobuxUpsellEnabledV2", false);
local function v2() --[[ Line: 18 ]] --[[ Name: isEnabledForAll ]]
    return game:GetFastFlag("GamepassRobuxUpsellEnabledV2");
end;
local function _() --[[ Line: 22 ]] --[[ Name: isRolledOut ]]
    return game:GetFastFlag("GamepassRobuxUpsellEnabledV2") or game:GetFastFlag("GamepassRobuxUpsellIXPRolledOutV2");
end;
return {
    isEnabled = function() --[[ Line: 26 ]] --[[ Name: isEnabled ]]
        return game:GetFastFlag("GamepassRobuxUpsellEnabledV2") or game:GetFastFlag("GamepassRobuxUpsellIXPV2");
    end, 
    isEnabledForAll = v2, 
    isUserEnrolled = function(v4) --[[ Line: 30 ]] --[[ Name: isUserEnrolled ]]
        -- upvalues: l_AppUserLayers_0 (copy)
        if game:GetFastFlag("GamepassRobuxUpsellEnabledV2") then
            return true;
        elseif not (game:GetFastFlag("GamepassRobuxUpsellEnabledV2") or game:GetFastFlag("GamepassRobuxUpsellIXPV2")) then
            return false;
        else
            local v5 = v4[l_AppUserLayers_0.GamepassRobuxUpsellLayer] or {};
            if not v5.isInExperiment then
                if game:GetFastFlag("GamepassRobuxUpsellEnabledV2") or game:GetFastFlag("GamepassRobuxUpsellIXPRolledOutV2") then
                    return true;
                else
                    return false;
                end;
            else
                return v5.isInExperiment ~= 0;
            end;
        end;
    end
};