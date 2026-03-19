local l_Parent_0 = script.Parent.Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastInt("FlyoutTestVariantRollout7", -1);
local v3 = game:DefineFastFlag("EnableFlyoutIxp7", false);
local v4 = game:DefineFastString("FlyoutIxpLayer", "Universality.MorePage");
local v5 = game:DefineFastString("FlyoutIxpVariantKey", "flyout_side_panel_type");
local v6 = game:DefineFastInt("IxpFlyoutControl", 0);
local v7 = game:DefineFastInt("IxpFlyoutVariantPrimary", 1);
local v8 = game:DefineFastInt("IxpFlyoutVariantAlternateEntry", 2);
local v9 = game:DefineFastInt("IxpFlyoutVariantRemovalRobuxIcon", 4);
local v10 = game:DefineFastFlag("EnableFlyoutExposure", false);
local v11 = nil;
local function v14() --[[ Line: 21 ]] --[[ Name: getIXPVariant ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy), v11 (ref), l_ExperimentCacheManager_0 (copy), v4 (copy), v10 (copy), v5 (copy)
    if v2 ~= -1 then
        return v2;
    elseif not v3 then
        return v6;
    else
        if v11 == nil then
            local v12 = l_ExperimentCacheManager_0.default:getLayerVariables(v4);
            if v10 and v12 ~= nil then
                l_ExperimentCacheManager_0.default:logLayerExposure(v4);
            end;
            v11 = v12 or {};
        end;
        local v13 = v11[v5];
        if v13 == nil then
            return v6;
        else
            return (tonumber(v13));
        end;
    end;
end;
return {
    isFlyoutSidePanelEnabled = function() --[[ Line: 42 ]] --[[ Name: isFlyoutSidePanelEnabled ]]
        -- upvalues: v14 (copy), v6 (copy)
        return v14() ~= v6;
    end, 
    isRobloxLogoEnabled = function() --[[ Line: 48 ]] --[[ Name: isRobloxLogoEnabled ]]
        -- upvalues: v14 (copy), v6 (copy)
        return v14() ~= v6;
    end, 
    isProfileEntryRemoved = function() --[[ Line: 54 ]] --[[ Name: isProfileEntryRemoved ]]
        -- upvalues: v14 (copy), v6 (copy)
        return v14() ~= v6;
    end, 
    isAlternateEntryPointEnabled = function() --[[ Line: 61 ]] --[[ Name: isAlternateEntryPointEnabled ]]
        -- upvalues: v14 (copy), v8 (copy)
        return v14() == v8;
    end, 
    isRobuxIconRemoved = function() --[[ Line: 67 ]] --[[ Name: isRobuxIconRemoved ]]
        -- upvalues: v14 (copy), v9 (copy)
        return v14() == v9;
    end, 
    isScrollAwayEnabled = function() --[[ Line: 72 ]] --[[ Name: isScrollAwayEnabled ]]
        -- upvalues: v14 (copy), v7 (copy), v8 (copy)
        local v15 = v14();
        local v16 = true;
        if v15 ~= v7 then
            v16 = v15 == v8;
        end;
        return v16;
    end, 
    isHomeSubTabEnabled = function() --[[ Line: 78 ]] --[[ Name: isHomeSubTabEnabled ]]
        -- upvalues: v14 (copy), v6 (copy)
        return v14() ~= v6;
    end
};