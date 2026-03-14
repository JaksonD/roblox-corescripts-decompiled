local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local v2 = require(l_Parent_0.IXPUtils);
game:DefineFastFlag("AXRecentlyViewedSearchItemsEnabled4", false);
game:DefineFastFlag("AXRecentlyViewedSearchItemsEnabledForAll4", false);
game:DefineFastFlag("AXRecentlyViewedSearchItemsPositionTop4", false);
game:DefineFastFlag("AXRecentlyViewedSearchItemsSaveInCatalog4", false);
return v2.defineIXPTest({
    name = "AvatarMarketplace.UA.RecentlyViewedSearchItems", 
    recordExposure = false, 
    layer = l_AppUserLayers_0.AvatarExperienceUASearchView, 
    getIsUserInExperiment = function(v3) --[[ Line: 25 ]] --[[ Name: getIsUserInExperiment ]]
        local v4 = false;
        if v3.enableRecentlyViewedItems ~= nil then
            v4 = false;
            if v3.recentlyViewedSearchItemsPositionTop ~= nil then
                v4 = v3.recentlyViewedSearchItemsSaveInCatalog ~= nil;
            end;
        end;
        return v4;
    end, 
    getDependentFlagsEnabled = function() --[[ Line: 31 ]] --[[ Name: getDependentFlagsEnabled ]]
        return true;
    end, 
    getEnabledFlag = function() --[[ Line: 35 ]] --[[ Name: getEnabledFlag ]]
        return game:GetFastFlag("AXRecentlyViewedSearchItemsEnabled4");
    end, 
    getEnabledForAllFlag = function() --[[ Line: 39 ]] --[[ Name: getEnabledForAllFlag ]]
        return game:GetFastFlag("AXRecentlyViewedSearchItemsEnabledForAll4");
    end, 
    variables = {
        EnabledForUser = function(v5, v6) --[[ Line: 45 ]] --[[ Name: EnabledForUser ]]
            return v6 or v5.enableRecentlyViewedItems;
        end, 
        EnabledTopVariant = function(v7) --[[ Line: 48 ]] --[[ Name: EnabledTopVariant ]]
            local l_recentlyViewedSearchItemsPositionTop_0 = v7.recentlyViewedSearchItemsPositionTop;
            return game:GetFastFlag("AXRecentlyViewedSearchItemsPositionTop4") or l_recentlyViewedSearchItemsPositionTop_0 == true or false;
        end, 
        EnabledSaveInCatalog = function(v9) --[[ Line: 52 ]] --[[ Name: EnabledSaveInCatalog ]]
            local l_recentlyViewedSearchItemsSaveInCatalog_0 = v9.recentlyViewedSearchItemsSaveInCatalog;
            return game:GetFastFlag("AXRecentlyViewedSearchItemsSaveInCatalog4") or l_recentlyViewedSearchItemsSaveInCatalog_0 == true or false;
        end
    }
});