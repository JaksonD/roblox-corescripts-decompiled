local l_Parent_0 = script.Parent.Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastInt("FlyoutTestVariantRollout11", -1);
local v3 = game:DefineFastFlag("EnableFlyoutIxp11", false);
local v4 = game:DefineFastString("FlyoutIxpLayer", "Universality.MorePage");
local v5 = game:DefineFastString("FlyoutIxpVariantKey", "flyout_side_panel_type");
local v6 = game:DefineFastInt("IxpFlyoutControl", 0);
local v7 = game:DefineFastInt("IxpFlyoutVariantAlternateEntry", 1);
local v8 = game:DefineFastInt("IxpFlyoutVariantHamburger", 2);
local v9 = game:DefineFastInt("IxpFlyoutVariantNoSubTabs", 3);
local v10 = game:DefineFastInt("IxpFlyoutVariantRemovalRobuxIcon", 4);
local v11 = game:DefineFastFlag("EnableFlyoutExposure", false);
local v12 = game:DefineFastFlag("FlyoutHamburgerEnableProfileEntry", false);
local v13 = game:DefineFastFlag("FlyoutFacepileEnableProfileEntry", false);
local v14 = nil;
local function v17() --[[ Line: 23 ]] --[[ Name: getIXPVariant ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy), v14 (ref), l_ExperimentCacheManager_0 (copy), v4 (copy), v11 (copy), v5 (copy)
    if v2 ~= -1 then
        return v2;
    elseif not v3 then
        return v6;
    else
        if v14 == nil then
            local v15 = l_ExperimentCacheManager_0.default:getLayerVariables(v4);
            if v11 and v15 ~= nil then
                l_ExperimentCacheManager_0.default:logLayerExposure(v4);
            end;
            v14 = v15 or {};
        end;
        local v16 = v14[v5];
        if v16 == nil then
            return v6;
        else
            return (tonumber(v16));
        end;
    end;
end;
return {
    isFlyoutSidePanelEnabled = function() --[[ Line: 44 ]] --[[ Name: isFlyoutSidePanelEnabled ]]
        -- upvalues: v17 (copy), v6 (copy)
        return v17() ~= v6;
    end, 
    isRobloxLogoEnabled = function() --[[ Line: 50 ]] --[[ Name: isRobloxLogoEnabled ]]
        -- upvalues: v17 (copy), v6 (copy)
        return v17() ~= v6;
    end, 
    isProfileEntryRemoved = function() --[[ Line: 56 ]] --[[ Name: isProfileEntryRemoved ]]
        -- upvalues: v17 (copy), v12 (copy), v8 (copy), v13 (copy), v7 (copy), v9 (copy), v6 (copy)
        local v18 = v17();
        if v12 and v18 == v8 then
            return false;
        elseif v13 and (v18 == v7 or v18 == v9) then
            return false;
        else
            return v18 ~= v6;
        end;
    end, 
    isAlternateEntryPointEnabled = function() --[[ Line: 71 ]] --[[ Name: isAlternateEntryPointEnabled ]]
        -- upvalues: v17 (copy), v7 (copy), v9 (copy)
        local v19 = v17();
        local v20 = true;
        if v19 ~= v7 then
            v20 = v19 == v9;
        end;
        return v20;
    end, 
    isRobuxIconRemoved = function() --[[ Line: 77 ]] --[[ Name: isRobuxIconRemoved ]]
        -- upvalues: v17 (copy), v10 (copy)
        return v17() == v10;
    end, 
    isScrollAwayEnabled = function() --[[ Line: 83 ]] --[[ Name: isScrollAwayEnabled ]]
        -- upvalues: v17 (copy), v6 (copy)
        return v17() ~= v6;
    end, 
    isHomeSubTabEnabled = function() --[[ Line: 88 ]] --[[ Name: isHomeSubTabEnabled ]]
        -- upvalues: v17 (copy), v7 (copy), v8 (copy)
        local v21 = v17();
        local v22 = true;
        if v21 ~= v7 then
            v22 = v21 == v8;
        end;
        return v22;
    end
};