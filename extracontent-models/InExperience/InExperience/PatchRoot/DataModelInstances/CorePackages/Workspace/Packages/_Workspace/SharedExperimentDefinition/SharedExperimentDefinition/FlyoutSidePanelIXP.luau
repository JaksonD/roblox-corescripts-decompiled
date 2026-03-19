local l_Parent_0 = script.Parent.Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastInt("FlyoutTestVariantRollout9", -1);
local v3 = game:DefineFastFlag("EnableFlyoutIxp9", false);
local v4 = game:DefineFastString("FlyoutIxpLayer", "Universality.MorePage");
local v5 = game:DefineFastString("FlyoutIxpVariantKey", "flyout_side_panel_type");
local v6 = game:DefineFastInt("IxpFlyoutControl", 0);
local v7 = game:DefineFastInt("IxpFlyoutVariantAlternateEntry", 1);
local v8 = game:DefineFastInt("IxpFlyoutVariantHamburger", 2);
local v9 = game:DefineFastInt("IxpFlyoutVariantNoSubTabs", 3);
local v10 = game:DefineFastInt("IxpFlyoutVariantRemovalRobuxIcon", 4);
local v11 = game:DefineFastFlag("EnableFlyoutExposure", false);
local v12 = nil;
local function v15() --[[ Line: 21 ]] --[[ Name: getIXPVariant ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy), v12 (ref), l_ExperimentCacheManager_0 (copy), v4 (copy), v11 (copy), v5 (copy)
    if v2 ~= -1 then
        return v2;
    elseif not v3 then
        return v6;
    else
        if v12 == nil then
            local v13 = l_ExperimentCacheManager_0.default:getLayerVariables(v4);
            if v11 and v13 ~= nil then
                l_ExperimentCacheManager_0.default:logLayerExposure(v4);
            end;
            v12 = v13 or {};
        end;
        local v14 = v12[v5];
        if v14 == nil then
            return v6;
        else
            return (tonumber(v14));
        end;
    end;
end;
return {
    isFlyoutSidePanelEnabled = function() --[[ Line: 42 ]] --[[ Name: isFlyoutSidePanelEnabled ]]
        -- upvalues: v15 (copy), v6 (copy)
        return v15() ~= v6;
    end, 
    isRobloxLogoEnabled = function() --[[ Line: 48 ]] --[[ Name: isRobloxLogoEnabled ]]
        -- upvalues: v15 (copy), v6 (copy)
        return v15() ~= v6;
    end, 
    isProfileEntryRemoved = function() --[[ Line: 54 ]] --[[ Name: isProfileEntryRemoved ]]
        -- upvalues: v15 (copy), v6 (copy)
        return v15() ~= v6;
    end, 
    isAlternateEntryPointEnabled = function() --[[ Line: 60 ]] --[[ Name: isAlternateEntryPointEnabled ]]
        -- upvalues: v15 (copy), v7 (copy), v9 (copy)
        local v16 = v15();
        local v17 = true;
        if v16 ~= v7 then
            v17 = v16 == v9;
        end;
        return v17;
    end, 
    isRobuxIconRemoved = function() --[[ Line: 66 ]] --[[ Name: isRobuxIconRemoved ]]
        -- upvalues: v15 (copy), v10 (copy)
        return v15() == v10;
    end, 
    isScrollAwayEnabled = function() --[[ Line: 72 ]] --[[ Name: isScrollAwayEnabled ]]
        -- upvalues: v15 (copy), v6 (copy)
        return v15() ~= v6;
    end, 
    isHomeSubTabEnabled = function() --[[ Line: 77 ]] --[[ Name: isHomeSubTabEnabled ]]
        -- upvalues: v15 (copy), v7 (copy), v8 (copy)
        local v18 = v15();
        local v19 = true;
        if v18 ~= v7 then
            v19 = v18 == v8;
        end;
        return v19;
    end
};