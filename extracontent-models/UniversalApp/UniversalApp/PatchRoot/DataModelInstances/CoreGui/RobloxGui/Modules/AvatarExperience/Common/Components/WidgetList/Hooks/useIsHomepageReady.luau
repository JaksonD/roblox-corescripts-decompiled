local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).AppStartupSequence.default;
local v3 = game:DefineFastInt("HomepageReadyFailsafeTimeoutSeconds", 20);
local l_AXPrefetchMarketplaceIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXPrefetchMarketplaceIXP;
local v5 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v6 = game:DefineFastFlag("AXEnablePrefetchMarketplaceFailsafe", false);
return function() --[[ Line: 39 ]] --[[ Name: useIsHomepageReady ]]
    -- upvalues: v1 (copy), l_default_0 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), v5 (copy), v6 (copy), v3 (copy)
    local v7, v8 = v1.useState(l_default_0.isInteractive);
    local v9, v10 = v1.useState(false);
    local v11 = if l_AXPrefetchMarketplaceIXP_0.isEnabled() then v5.readTestVariable(l_AXPrefetchMarketplaceIXP_0.EnabledForUser) else nil;
    v1.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v11 (copy), v8 (copy), l_default_0 (ref), v7 (copy)
        if not v11 then
            return;
        else
            v8(l_default_0.isInteractive);
            if not v7 then
                local v12 = l_default_0.changed:connect(function() --[[ Line: 56 ]]
                    -- upvalues: v8 (ref), l_default_0 (ref)
                    v8(l_default_0.isInteractive);
                end);
                return function() --[[ Line: 59 ]]
                    -- upvalues: v12 (copy)
                    v12:disconnect();
                end;
            else
                return function() --[[ Line: 63 ]]

                end;
            end;
        end;
    end, {
        v7, 
        v11
    });
    if v6 then
        v1.useEffect(function() --[[ Line: 68 ]]
            -- upvalues: v11 (copy), v7 (copy), v3 (ref), v10 (copy)
            if not v11 then
                return;
            elseif v7 then
                return function() --[[ Line: 75 ]]

                end;
            else
                local v13 = task.delay(v3, function() --[[ Line: 78 ]]
                    -- upvalues: v10 (ref)
                    v10(true);
                end);
                return function() --[[ Line: 82 ]]
                    -- upvalues: v13 (copy)
                    task.cancel(v13);
                end;
            end;
        end, {
            v7, 
            v11
        });
    end;
    local l_v7_0 = v7;
    if not l_v7_0 then
        if v6 then
            return v9;
        else
            l_v7_0 = false;
        end;
    end;
    return l_v7_0;
end;