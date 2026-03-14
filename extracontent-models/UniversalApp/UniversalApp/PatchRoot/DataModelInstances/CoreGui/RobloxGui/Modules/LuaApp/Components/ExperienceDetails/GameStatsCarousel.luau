local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_CorePackages_0.Workspace.Packages.Localization);
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useAbbreviatedNumberLocalization_0 = v3.Hooks.useAbbreviatedNumberLocalization;
local l_usePlayerCountText_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).usePlayerCountText;
local l_InfoCarousel_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).InfoCarousel;
local l_useGameInfosSelector_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).useGameInfosSelector;
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
return function(v12) --[[ Line: 30 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useSelector_0 (copy), l_Images_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_useGameInfosSelector_0 (copy), l_usePlayerCountText_0 (copy), l_useAbbreviatedNumberLocalization_0 (copy), v1 (copy), l_InfoCarousel_0 (copy)
    local v13 = v12.showIcons or false;
    local v14 = {};
    local function _(v15, v16, v17, v18) --[[ Line: 34 ]]
        -- upvalues: v14 (copy)
        if v15 and v16 then
            table.insert(v14, {
                headerText = v15, 
                bodyText = v16, 
                icon = v17, 
                onActivated = v18
            });
        end;
    end;
    local v20 = l_useLocalization_0({
        rating = "Feature.GameDetails.Label.Rating", 
        active = "Feature.GameDetails.Label.Playing", 
        visits = "Feature.GameDetails.Label.Visits", 
        maturity = "Feature.GameDetails.Label.Maturity", 
        unavailable = "Feature.GameDetails.Label.Unavailable", 
        age = "Feature.GameDetails.Label.Age"
    });
    local v26 = l_useSelector_0(function(v21) --[[ Line: 54 ]]
        -- upvalues: v12 (copy)
        local v22 = v21.GameVotes[v12.universeId];
        if v22 then
            local l_upVotes_0 = v22.upVotes;
            local l_downVotes_0 = v22.downVotes;
            if l_upVotes_0 and l_downVotes_0 then
                local v25 = l_upVotes_0 + l_downVotes_0;
                if v25 > 0 then
                    return math.floor(l_upVotes_0 / v25 * 100) .. "%";
                end;
            end;
        end;
        return "--";
    end);
    local l_rating_0 = v20.rating;
    local v28 = if v13 then l_Images_0["icons/status/games/rating_small"] else nil;
    if l_rating_0 and v26 then
        table.insert(v14, {
            headerText = l_rating_0, 
            bodyText = v26, 
            icon = v28, 
            onActivated = nil
        });
    end;
    l_rating_0 = l_useSelector_0(function(v29) --[[ Line: 70 ]]
        -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v12 (copy)
        if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v12.shouldHydrateLegacyIxp then
            return v29.GameDetailsV2[v12.universeId];
        else
            return v29.GameDetails[v12.universeId];
        end;
    end);
    v28 = l_useGameInfosSelector_0(v12.universeId);
    local v30 = l_rating_0 and l_rating_0.playing or v28 and v28.playerCount;
    local v31 = l_usePlayerCountText_0(v30);
    local l_active_0 = v20.active;
    local v33 = if v13 then l_Images_0["icons/status/games/people-playing_small"] else nil;
    if l_active_0 and v31 then
        table.insert(v14, {
            headerText = l_active_0, 
            bodyText = v31, 
            icon = v33, 
            onActivated = nil
        });
    end;
    l_active_0 = l_useSelector_0(function(v34) --[[ Line: 84 ]]
        -- upvalues: v12 (copy)
        local v35 = v34.AgeRecommendations[v12.universeId];
        return v35 and v35.summary;
    end);
    v33 = if l_active_0 and l_active_0.ageRecommendation then l_active_0.ageRecommendation.minimumAgeDisplay else nil;
    local v37 = l_useSelector_0(function(v36) --[[ Line: 93 ]]
        return v36.AgeRecommendationHeaders.headerDisplayNameShort;
    end) or v20.maturity;
    local v38 = if l_active_0 and l_active_0.ageRecommendation then l_active_0.ageRecommendation.displayName else v20.unavailable;
    local v39 = l_rating_0 and l_rating_0.visits;
    local v40 = l_useAbbreviatedNumberLocalization_0(v39) or "--";
    if v33 and v33 ~= "" then
        local l_age_0 = v20.age;
        if l_age_0 and v33 then
            table.insert(v14, {
                headerText = l_age_0, 
                bodyText = v33, 
                icon = nil, 
                onActivated = nil
            });
        end;
        if v37 and v38 then
            table.insert(v14, {
                headerText = v37, 
                bodyText = v38, 
                icon = nil, 
                onActivated = nil
            });
        end;
        l_age_0 = v20.visits;
        local v42 = if v13 then l_Images_0["icons/status/games/sessions_small"] else nil;
        if l_age_0 and v40 then
            table.insert(v14, {
                headerText = l_age_0, 
                bodyText = v40, 
                icon = v42, 
                onActivated = nil
            });
        end;
    else
        local l_visits_0 = v20.visits;
        local v44 = if v13 then l_Images_0["icons/status/games/sessions_small"] else nil;
        if l_visits_0 and v40 then
            table.insert(v14, {
                headerText = l_visits_0, 
                bodyText = v40, 
                icon = v44, 
                onActivated = nil
            });
        end;
        if v37 and v38 then
            table.insert(v14, {
                headerText = v37, 
                bodyText = v38, 
                icon = nil, 
                onActivated = nil
            });
        end;
    end;
    return v1.createElement(l_InfoCarousel_0, {
        LayoutOrder = v12.LayoutOrder, 
        data = v14
    });
end;