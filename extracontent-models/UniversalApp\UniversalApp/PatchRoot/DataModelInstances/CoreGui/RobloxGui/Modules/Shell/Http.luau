local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.Shell.Utility);
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v6 = {};
local v7 = game:GetService("ContentProvider").BaseUrl:lower();
v7 = string.gsub(v7, "/m.", "/www.");
v7 = string.gsub(v7, "http://", "https://");
local v8 = string.gsub(v7, "https://www.", "https://assetgame.");
local _ = string.gsub(v7, "https://www.", "https://accountsettings.");
v6.BaseUrl = v7;
v6.AssetGameBaseUrl = v8;
local v10 = require(l_Modules_0.Shell.Flags.GetFStringAppLocationForAppPresence);
local function _(v11) --[[ Line: 47 ]] --[[ Name: decodeJSON ]]
    -- upvalues: l_HttpService_0 (copy)
    if v11 == nil or #v11 == 0 then
        return nil;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), v11 (copy)
            return l_HttpService_0:JSONDecode(v11);
        end);
        if not l_status_0 then
            return nil;
        else
            return l_result_0;
        end;
    end;
end;
local function _(v15, v16) --[[ Line: 62 ]] --[[ Name: rbxGetAsync ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v15 (copy)
        return game:HttpGetAsync(v15);
    end);
    if not l_status_1 then
        return nil;
    elseif v16 then
        return l_result_1;
    elseif l_result_1 == nil or #l_result_1 == 0 then
        return nil;
    else
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_1 (copy)
            return l_HttpService_0:JSONDecode(l_result_1);
        end);
        if not l_status_2 then
            return nil;
        else
            return l_result_2;
        end;
    end;
end;
local function _(v22, v23, v24) --[[ Line: 77 ]] --[[ Name: rbxPostAsync ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 78 ]]
        -- upvalues: v22 (copy), v23 (copy), v24 (copy)
        return game:HttpPostAsync(v22, v23, v24);
    end);
    if not l_status_3 then
        return nil;
    elseif l_result_3 == nil or #l_result_3 == 0 then
        return nil;
    else
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_3 (copy)
            return l_HttpService_0:JSONDecode(l_result_3);
        end);
        if not l_status_4 then
            return nil;
        else
            return l_result_4;
        end;
    end;
end;
local function _(v30) --[[ Line: 89 ]] --[[ Name: rbxApiGetAsync ]]
    -- upvalues: l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 90 ]]
        -- upvalues: l_HttpRbxApiService_0 (ref), v30 (copy)
        return l_HttpRbxApiService_0:GetAsync(v30);
    end);
    if not l_status_5 then
        return nil;
    elseif l_result_5 == nil or #l_result_5 == 0 then
        return nil;
    else
        local l_status_6, l_result_6 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_5 (copy)
            return l_HttpService_0:JSONDecode(l_result_5);
        end);
        if not l_status_6 then
            return nil;
        else
            return l_result_6;
        end;
    end;
end;
local function _(v36, v37, v38, v39) --[[ Line: 101 ]] --[[ Name: rbxApiPostAsync ]]
    -- upvalues: l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    local l_status_7, l_result_7 = pcall(function() --[[ Line: 102 ]]
        -- upvalues: l_HttpRbxApiService_0 (ref), v36 (copy), v37 (copy), v38 (copy), v39 (copy)
        return l_HttpRbxApiService_0:PostAsync(v36, v37, v38, v39);
    end);
    if not l_status_7 then
        return nil;
    elseif l_result_7 == nil or #l_result_7 == 0 then
        return nil;
    else
        local l_status_8, l_result_8 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_7 (copy)
            return l_HttpService_0:JSONDecode(l_result_7);
        end);
        if not l_status_8 then
            return nil;
        else
            return l_result_8;
        end;
    end;
end;
local function _(v45, v46, v47, v48) --[[ Line: 113 ]] --[[ Name: rbxApiPostAsyncFullUrl ]]
    -- upvalues: l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    local l_status_9, l_result_9 = pcall(function() --[[ Line: 114 ]]
        -- upvalues: l_HttpRbxApiService_0 (ref), v45 (copy), v46 (copy), v47 (copy), v48 (copy)
        return l_HttpRbxApiService_0:PostAsyncFullUrl(v45, v46, v47, v48);
    end);
    if not l_status_9 then
        return nil;
    elseif l_result_9 == nil or #l_result_9 == 0 then
        return nil;
    else
        local l_status_10, l_result_10 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_9 (copy)
            return l_HttpService_0:JSONDecode(l_result_9);
        end);
        if not l_status_10 then
            return nil;
        else
            return l_result_10;
        end;
    end;
end;
local function _(v54) --[[ Line: 125 ]] --[[ Name: rbxRequestInternal ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy)
    local v55 = nil;
    local v56 = v4.Signal();
    l_HttpService_0:RequestInternal(v54):Start(function(v57, v58) --[[ Line: 130 ]]
        -- upvalues: v55 (ref), l_HttpService_0 (ref), v56 (copy)
        if v57 and v58.StatusCode ~= 401 and v58.StatusCode >= 200 and v58.StatusCode < 400 then
            local l_Body_0 = v58.Body;
            local v60;
            if l_Body_0 == nil or #l_Body_0 == 0 then
                v60 = nil;
            else
                local l_status_11, l_result_11 = pcall(function() --[[ Line: 52 ]]
                    -- upvalues: l_HttpService_0 (ref), l_Body_0 (copy)
                    return l_HttpService_0:JSONDecode(l_Body_0);
                end);
                v60 = if not l_status_11 then nil else l_result_11;
            end;
            v55 = v60;
        end;
        v56:fire();
    end);
    v56:wait();
    return v55;
end;
local function v65(v64) --[[ Line: 145 ]] --[[ Name: buildServiceUrl ]]
    -- upvalues: v7 (ref)
    return string.gsub(v7, "https://www.", "https://" .. v64 .. ".");
end;
local function _(v66) --[[ Line: 149 ]] --[[ Name: isStringNilOrEmpty ]]
    local v67 = true;
    if v66 ~= nil then
        v67 = #v66 == 0;
    end;
    return v67;
end;
v6.GetCuratedSortAsync = function(v69, v70) --[[ Line: 192 ]] --[[ Name: GetCuratedSortAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v71 = string.format("%sgames/set?GameSetTargetId=%d&MaxRows=%d", v7, v69, v70);
    local l_status_12, l_result_12 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v71 (copy)
        return game:HttpGetAsync(v71);
    end);
    if not l_status_12 then
        return nil;
    elseif l_result_12 == nil or #l_result_12 == 0 then
        return nil;
    else
        local l_status_13, l_result_13 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_12 (copy)
            return l_HttpService_0:JSONDecode(l_result_12);
        end);
        if not l_status_13 then
            return nil;
        else
            return l_result_13;
        end;
    end;
end;
v6.GetCuratedSortByUrlAsync = function(v76) --[[ Line: 200 ]] --[[ Name: GetCuratedSortByUrlAsync ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_14, l_result_14 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v76 (copy)
        return game:HttpGetAsync(v76);
    end);
    if not l_status_14 then
        return nil;
    elseif l_result_14 == nil or #l_result_14 == 0 then
        return nil;
    else
        local l_status_15, l_result_15 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_14 (copy)
            return l_HttpService_0:JSONDecode(l_result_14);
        end);
        if not l_status_15 then
            return nil;
        else
            return l_result_15;
        end;
    end;
end;
v6.GetUserPlacesAsync = function(v81, v82, v83) --[[ Line: 234 ]] --[[ Name: GetUserPlacesAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v84 = string.format("%sgames/list-users-games-json?userid=%d&startIndex=%d&pageSize=%d", v7, v83, v81, v82);
    local l_status_16, l_result_16 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v84 (copy)
        return game:HttpGetAsync(v84);
    end);
    if not l_status_16 then
        return nil;
    elseif l_result_16 == nil or #l_result_16 == 0 then
        return nil;
    else
        local l_status_17, l_result_17 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_16 (copy)
            return l_HttpService_0:JSONDecode(l_result_16);
        end);
        if not l_status_17 then
            return nil;
        else
            return l_result_17;
        end;
    end;
end;
v6.SearchGamesAsync = function(v89, v90, v91) --[[ Line: 242 ]] --[[ Name: SearchGamesAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v92 = string.format("%sgames/list-json?keyword=%s&StartRows=%d&MaxRows=%d&filterByDeviceType=true", v7, l_HttpService_0:UrlEncode(v91), v89, v90);
    local l_status_18, l_result_18 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v92 (copy)
        return game:HttpGetAsync(v92);
    end);
    if not l_status_18 then
        return nil;
    elseif l_result_18 == nil or #l_result_18 == 0 then
        return nil;
    else
        local l_status_19, l_result_19 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_18 (copy)
            return l_HttpService_0:JSONDecode(l_result_18);
        end);
        if not l_status_19 then
            return nil;
        else
            return l_result_19;
        end;
    end;
end;
v6.GetGamesAsync = function(v97) --[[ Line: 305 ]] --[[ Name: GetGamesAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v98 = string.gsub(v7, "https://www.", "https://games.") .. "v1/games?universeIds=" .. table.concat(v97, ",");
    local l_status_20, l_result_20 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v98 (copy)
        return game:HttpGetAsync(v98);
    end);
    if not l_status_20 then
        return nil;
    elseif l_result_20 == nil or #l_result_20 == 0 then
        return nil;
    else
        local l_status_21, l_result_21 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_20 (copy)
            return l_HttpService_0:JSONDecode(l_result_20);
        end);
        if not l_status_21 then
            return nil;
        else
            return l_result_21;
        end;
    end;
end;
v6.PostExperienceGuidelines = function(v103) --[[ Line: 343 ]] --[[ Name: PostExperienceGuidelines ]]
    -- upvalues: v65 (copy), l_HttpService_0 (copy), v4 (copy)
    local v104 = {
        Url = string.format("%sexperience-guidelines-api/experience-guidelines/get-age-recommendation", v65("apis")), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            universeId = v103
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    local v105 = nil;
    local v106 = v4.Signal();
    l_HttpService_0:RequestInternal(v104):Start(function(v107, v108) --[[ Line: 130 ]]
        -- upvalues: v105 (ref), l_HttpService_0 (ref), v106 (copy)
        if v107 and v108.StatusCode ~= 401 and v108.StatusCode >= 200 and v108.StatusCode < 400 then
            local l_Body_1 = v108.Body;
            local v110;
            if l_Body_1 == nil or #l_Body_1 == 0 then
                v110 = nil;
            else
                local l_status_22, l_result_22 = pcall(function() --[[ Line: 52 ]]
                    -- upvalues: l_HttpService_0 (ref), l_Body_1 (copy)
                    return l_HttpService_0:JSONDecode(l_Body_1);
                end);
                v110 = if not l_status_22 then nil else l_result_22;
            end;
            v105 = v110;
        end;
        v106:fire();
    end);
    v106:wait();
    return v105;
end;
v6.GetGameIconIdAsync = function(v113) --[[ Line: 369 ]] --[[ Name: GetGameIconIdAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v114 = v7 .. "places/icons/json?placeId=" .. tostring(v113);
    local l_status_23, l_result_23 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v114 (copy)
        return game:HttpGetAsync(v114);
    end);
    if not l_status_23 then
        return nil;
    elseif l_result_23 == nil or #l_result_23 == 0 then
        return nil;
    else
        local l_status_24, l_result_24 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_23 (copy)
            return l_HttpService_0:JSONDecode(l_result_23);
        end);
        if not l_status_24 then
            return nil;
        else
            return l_result_24;
        end;
    end;
end;
v6.GetGameVotesAsync = function(v119) --[[ Line: 388 ]] --[[ Name: GetGameVotesAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v120 = v7 .. "PlaceItem/GameDetailsVotingPanelJson?placeId=" .. tostring(v119);
    local l_status_25, l_result_25 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v120 (copy)
        return game:HttpGetAsync(v120);
    end);
    if not l_status_25 then
        return nil;
    elseif l_result_25 == nil or #l_result_25 == 0 then
        return nil;
    else
        local l_status_26, l_result_26 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_25 (copy)
            return l_HttpService_0:JSONDecode(l_result_25);
        end);
        if not l_status_26 then
            return nil;
        else
            return l_result_26;
        end;
    end;
end;
v6.GetRecommendedGamesAsync = function(v125) --[[ Line: 415 ]] --[[ Name: GetRecommendedGamesAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v126 = v7 .. "Games/GetRecommendedGamesJson?currentPlaceId=" .. tostring(v125);
    local l_status_27, l_result_27 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v126 (copy)
        return game:HttpGetAsync(v126);
    end);
    if not l_status_27 then
        return nil;
    elseif l_result_27 == nil or #l_result_27 == 0 then
        return nil;
    else
        local l_status_28, l_result_28 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_27 (copy)
            return l_HttpService_0:JSONDecode(l_result_27);
        end);
        if not l_status_28 then
            return nil;
        else
            return l_result_28;
        end;
    end;
end;
v6.GetGameThumbnailsAsync = function(v131) --[[ Line: 444 ]] --[[ Name: GetGameThumbnailsAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v132 = v7 .. "thumbnail/place-thumbnails?placeId=" .. tostring(v131);
    local l_status_29, l_result_29 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v132 (copy)
        return game:HttpGetAsync(v132);
    end);
    if not l_status_29 then
        return nil;
    elseif l_result_29 == nil or #l_result_29 == 0 then
        return nil;
    else
        local l_status_30, l_result_30 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_29 (copy)
            return l_HttpService_0:JSONDecode(l_result_29);
        end);
        if not l_status_30 then
            return nil;
        else
            return l_result_30;
        end;
    end;
end;
v6.GetBadgesForUniverseAsync = function(v137, v138) --[[ Line: 476 ]] --[[ Name: GetBadgesForUniverseAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v139 = string.format("%sv1/universes/%d/badges?sortOrder=Asc&limit=100", string.gsub(v7, "https://www.", "https://badges."), v137);
    if v138 then
        v139 = string.format(v139 .. "&cursor=%s", v138);
    end;
    local l_v139_0 = v139;
    local l_status_31, l_result_31 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: l_v139_0 (copy)
        return game:HttpGetAsync(l_v139_0);
    end);
    if not l_status_31 then
        return nil;
    elseif l_result_31 == nil or #l_result_31 == 0 then
        return nil;
    else
        local l_status_32, l_result_32 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_31 (copy)
            return l_HttpService_0:JSONDecode(l_result_31);
        end);
        if not l_status_32 then
            return nil;
        else
            return l_result_32;
        end;
    end;
end;
v6.GetUserAwardedBadgesAsync = function(v145, v146) --[[ Line: 497 ]] --[[ Name: GetUserAwardedBadgesAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v147 = table.concat(v146, ",");
    local v148 = string.format("%sv1/users/%d/badges/awarded-dates?badgeIds=%s", string.gsub(v7, "https://www.", "https://badges."), v145, v147);
    local l_status_33, l_result_33 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v148 (copy)
        return game:HttpGetAsync(v148);
    end);
    if not l_status_33 then
        return nil;
    elseif l_result_33 == nil or #l_result_33 == 0 then
        return nil;
    else
        local l_status_34, l_result_34 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_33 (copy)
            return l_HttpService_0:JSONDecode(l_result_33);
        end);
        if not l_status_34 then
            return nil;
        else
            return l_result_34;
        end;
    end;
end;
v6.PostFavoriteToggleAsync = function(v153) --[[ Line: 510 ]] --[[ Name: PostFavoriteToggleAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v154 = v7 .. "favorite/toggle?assetID=" .. tostring(v153);
    local l_pcall_0 = pcall;
    local v156 = "favoriteToggle";
    local v157 = nil;
    local l_v156_0 = v156 --[[ copy: 5 -> 7 ]];
    local l_v157_0 = v157 --[[ copy: 6 -> 8 ]];
    local v160;
    l_pcall_0, v160 = l_pcall_0(function() --[[ Line: 78 ]]
        -- upvalues: v154 (copy), l_v156_0 (copy), l_v157_0 (copy)
        return game:HttpPostAsync(v154, l_v156_0, l_v157_0);
    end);
    if not l_pcall_0 then
        return nil;
    elseif v160 == nil or #v160 == 0 then
        return nil;
    else
        v156, v157 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), v160 (copy)
            return l_HttpService_0:JSONDecode(v160);
        end);
        if not v156 then
            return nil;
        else
            return v157;
        end;
    end;
end;
v6.PostGameVoteAsync = function(v161, v162) --[[ Line: 531 ]] --[[ Name: PostGameVoteAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v163 = v7 .. "voting/vote?assetId=" .. tostring(v161) .. "&vote=" .. tostring(v162);
    local l_pcall_1 = pcall;
    local v165 = "vote";
    local v166 = nil;
    local l_v165_0 = v165 --[[ copy: 6 -> 8 ]];
    local l_v166_0 = v166 --[[ copy: 7 -> 9 ]];
    local v169;
    l_pcall_1, v169 = l_pcall_1(function() --[[ Line: 78 ]]
        -- upvalues: v163 (copy), l_v165_0 (copy), l_v166_0 (copy)
        return game:HttpPostAsync(v163, l_v165_0, l_v166_0);
    end);
    if not l_pcall_1 then
        return nil;
    elseif v169 == nil or #v169 == 0 then
        return nil;
    else
        v165, v166 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), v169 (copy)
            return l_HttpService_0:JSONDecode(v169);
        end);
        if not v165 then
            return nil;
        else
            return v166;
        end;
    end;
end;
v6.RegisterAppPresence = function() --[[ Line: 542 ]] --[[ Name: RegisterAppPresence ]]
    -- upvalues: v65 (copy), v10 (copy), l_HttpService_0 (copy)
    local v170 = string.format("%s/v1/presence/register-app-presence", v65("presence"));
    local v171 = {
        location = v10()
    };
    local v172 = l_HttpService_0:JSONEncode(v171);
    local l_pcall_2 = pcall;
    local v174 = nil;
    local l_v174_0 = v174 --[[ copy: 6 -> 8 ]];
    local v176;
    l_pcall_2, v176 = l_pcall_2(function() --[[ Line: 78 ]]
        -- upvalues: v170 (copy), v172 (copy), l_v174_0 (copy)
        return game:HttpPostAsync(v170, v172, l_v174_0);
    end);
    if not l_pcall_2 then
        return nil;
    elseif v176 == nil or #v176 == 0 then
        return nil;
    else
        local v177;
        v174, v177 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), v176 (copy)
            return l_HttpService_0:JSONDecode(v176);
        end);
        if not v174 then
            return nil;
        else
            return v177;
        end;
    end;
end;
v6.GetCrossplayEnabledStatusAsync = function() --[[ Line: 565 ]] --[[ Name: GetCrossplayEnabledStatusAsync ]]
    -- upvalues: v65 (copy), v4 (copy), l_HttpService_0 (copy)
    local v178 = {
        Url = string.format("%suser-settings-api/v1/user-settings?requestedUserSettings=xboxCrossPlayStatusIsEnabled", v65("apis")), 
        Method = "GET"
    };
    local v179 = nil;
    local v180 = v4.Signal();
    l_HttpService_0:RequestInternal(v178):Start(function(v181, v182) --[[ Line: 130 ]]
        -- upvalues: v179 (ref), l_HttpService_0 (ref), v180 (copy)
        if v181 and v182.StatusCode ~= 401 and v182.StatusCode >= 200 and v182.StatusCode < 400 then
            local l_Body_2 = v182.Body;
            local v184;
            if l_Body_2 == nil or #l_Body_2 == 0 then
                v184 = nil;
            else
                local l_status_35, l_result_35 = pcall(function() --[[ Line: 52 ]]
                    -- upvalues: l_HttpService_0 (ref), l_Body_2 (copy)
                    return l_HttpService_0:JSONDecode(l_Body_2);
                end);
                v184 = if not l_status_35 then nil else l_result_35;
            end;
            v179 = v184;
        end;
        v180:fire();
    end);
    v180:wait();
    return v179;
end;
v6.PostCrossplayStatusAsync = function(v187) --[[ Line: 578 ]] --[[ Name: PostCrossplayStatusAsync ]]
    -- upvalues: v65 (copy), l_HttpService_0 (copy), v4 (copy)
    local v188 = {
        Url = string.format("%suser-settings-api/v1/user-settings", v65("apis")), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            xboxCrossPlayStatusIsEnabled = v187
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    local v189 = nil;
    local v190 = v4.Signal();
    l_HttpService_0:RequestInternal(v188):Start(function(v191, v192) --[[ Line: 130 ]]
        -- upvalues: v189 (ref), l_HttpService_0 (ref), v190 (copy)
        if v191 and v192.StatusCode ~= 401 and v192.StatusCode >= 200 and v192.StatusCode < 400 then
            local l_Body_3 = v192.Body;
            local v194;
            if l_Body_3 == nil or #l_Body_3 == 0 then
                v194 = nil;
            else
                local l_status_36, l_result_36 = pcall(function() --[[ Line: 52 ]]
                    -- upvalues: l_HttpService_0 (ref), l_Body_3 (copy)
                    return l_HttpService_0:JSONDecode(l_Body_3);
                end);
                v194 = if not l_status_36 then nil else l_result_36;
            end;
            v189 = v194;
        end;
        v190:fire();
    end);
    v190:wait();
    return v189;
end;
v6.GetRecommendedUsersndsAsync = function() --[[ Line: 604 ]] --[[ Name: GetRecommendedUsersndsAsync ]]
    -- upvalues: v65 (copy), l_HttpService_0 (copy)
    local v197 = string.format("%s/v1/recommended-users", v65("friends"));
    local l_status_37, l_result_37 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v197 (copy)
        return game:HttpGetAsync(v197);
    end);
    if not l_status_37 then
        return nil;
    elseif l_result_37 == nil or #l_result_37 == 0 then
        return nil;
    else
        local l_status_38, l_result_38 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_37 (copy)
            return l_HttpService_0:JSONDecode(l_result_37);
        end);
        if not l_status_38 then
            return nil;
        else
            return l_result_38;
        end;
    end;
end;
v6.GetUsersPresenceAsync = function(v202) --[[ Line: 626 ]] --[[ Name: GetUsersPresenceAsync ]]
    -- upvalues: l_HttpService_0 (copy), v65 (copy)
    local v203 = {
        userIds = v202
    };
    v203 = l_HttpService_0:JSONEncode(v203);
    local v204 = string.format("%s/v1/presence/users", v65("presence"));
    local l_v203_0 = v203;
    local l_pcall_3 = pcall;
    local v207 = nil;
    local l_v207_0 = v207 --[[ copy: 7 -> 9 ]];
    local v209;
    l_pcall_3, v209 = l_pcall_3(function() --[[ Line: 78 ]]
        -- upvalues: v204 (copy), l_v203_0 (copy), l_v207_0 (copy)
        return game:HttpPostAsync(v204, l_v203_0, l_v207_0);
    end);
    if not l_pcall_3 then
        return nil;
    elseif v209 == nil or #v209 == 0 then
        return nil;
    else
        local v210;
        v207, v210 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), v209 (copy)
            return l_HttpService_0:JSONDecode(v209);
        end);
        if not v207 then
            return nil;
        else
            return v210;
        end;
    end;
end;
v6.GetPlatformUserBalanceAsync = function() --[[ Line: 644 ]] --[[ Name: GetPlatformUserBalanceAsync ]]
    -- upvalues: v65 (copy), l_HttpService_0 (copy)
    local v211 = string.format("%sv1/user/currency", v65("economy"));
    local l_status_39, l_result_39 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v211 (copy)
        return game:HttpGetAsync(v211);
    end);
    if not l_status_39 then
        return nil;
    elseif l_result_39 == nil or #l_result_39 == 0 then
        return nil;
    else
        local l_status_40, l_result_40 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_39 (copy)
            return l_HttpService_0:JSONDecode(l_result_39);
        end);
        if not l_status_40 then
            return nil;
        else
            return l_result_40;
        end;
    end;
end;
v6.GetTotalUserBalanceAsync = function() --[[ Line: 655 ]] --[[ Name: GetTotalUserBalanceAsync ]]
    -- upvalues: v65 (copy), l_HttpService_0 (copy)
    local v216 = string.format("%sv1/user/currency", v65("economy"));
    local l_status_41, l_result_41 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v216 (copy)
        return game:HttpGetAsync(v216);
    end);
    if not l_status_41 then
        return nil;
    elseif l_result_41 == nil or #l_result_41 == 0 then
        return nil;
    else
        local l_status_42, l_result_42 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_41 (copy)
            return l_HttpService_0:JSONDecode(l_result_41);
        end);
        if not l_status_42 then
            return nil;
        else
            return l_result_42;
        end;
    end;
end;
v6.GetUserOwnedPackagesAsync = function(v221, v222) --[[ Line: 747 ]] --[[ Name: GetUserOwnedPackagesAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    v222 = v222 or 1;
    local v223 = v7 .. "users/inventory/list-json?userId=" .. tostring(v221) .. "&assetTypeId=" .. tostring(32) .. "&pageNumber=" .. tostring(v222);
    local l_status_43, l_result_43 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v223 (copy)
        return game:HttpGetAsync(v223);
    end);
    if not l_status_43 then
        return nil;
    elseif l_result_43 == nil or #l_result_43 == 0 then
        return nil;
    else
        local l_status_44, l_result_44 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_43 (copy)
            return l_HttpService_0:JSONDecode(l_result_43);
        end);
        if not l_status_44 then
            return nil;
        else
            return l_result_44;
        end;
    end;
end;
v6.GetCurrentlyWearingAsync = function(v228) --[[ Line: 763 ]] --[[ Name: GetCurrentlyWearingAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v229 = string.format("%s/v1/users/%d/currently-wearing", string.gsub(v7, "https://www.", "https://avatar."), v228);
    local l_status_45, l_result_45 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v229 (copy)
        return game:HttpGetAsync(v229);
    end);
    if not l_status_45 then
        return nil;
    elseif l_result_45 == nil or #l_result_45 == 0 then
        return nil;
    else
        local l_status_46, l_result_46 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_45 (copy)
            return l_HttpService_0:JSONDecode(l_result_45);
        end);
        if not l_status_46 then
            return nil;
        else
            return l_result_46;
        end;
    end;
end;
v6.SetWearingAssetsAsync = function(v234) --[[ Line: 791 ]] --[[ Name: SetWearingAssetsAsync ]]
    -- upvalues: l_HttpService_0 (copy), v65 (copy), v4 (copy)
    local v235 = {
        assetIds = v234
    };
    v235 = l_HttpService_0:JSONEncode(v235);
    local v236 = {
        Url = string.format("%s/v1/avatar/set-wearing-assets", v65("avatar")), 
        Method = "POST", 
        Body = v235, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    local v237 = nil;
    local v238 = v4.Signal();
    l_HttpService_0:RequestInternal(v236):Start(function(v239, v240) --[[ Line: 130 ]]
        -- upvalues: v237 (ref), l_HttpService_0 (ref), v238 (copy)
        if v239 and v240.StatusCode ~= 401 and v240.StatusCode >= 200 and v240.StatusCode < 400 then
            local l_Body_4 = v240.Body;
            local v242;
            if l_Body_4 == nil or #l_Body_4 == 0 then
                v242 = nil;
            else
                local l_status_47, l_result_47 = pcall(function() --[[ Line: 52 ]]
                    -- upvalues: l_HttpService_0 (ref), l_Body_4 (copy)
                    return l_HttpService_0:JSONDecode(l_Body_4);
                end);
                v242 = if not l_status_47 then nil else l_result_47;
            end;
            v237 = v242;
        end;
        v238:fire();
    end);
    v238:wait();
    return v237;
end;
v6.PurchaseProductAsync = function(v245, v246, v247, v248) --[[ Line: 848 ]] --[[ Name: PurchaseProductAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v249 = string.format("%s/v1/purchases/products/%d", string.gsub(v7, "https://www.", "https://economy."), v245);
    local v250 = l_HttpService_0:JSONEncode({
        expectedCurrency = v248, 
        expectedPrice = v246, 
        expectedSellerId = v247
    });
    local l_pcall_4 = pcall;
    local v252 = nil;
    local l_v252_0 = v252 --[[ copy: 9 -> 11 ]];
    local v254;
    l_pcall_4, v254 = l_pcall_4(function() --[[ Line: 78 ]]
        -- upvalues: v249 (copy), v250 (copy), l_v252_0 (copy)
        return game:HttpPostAsync(v249, v250, l_v252_0);
    end);
    if not l_pcall_4 then
        return nil;
    elseif v254 == nil or #v254 == 0 then
        return nil;
    else
        local v255;
        v252, v255 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), v254 (copy)
            return l_HttpService_0:JSONDecode(v254);
        end);
        if not v252 then
            return nil;
        else
            return v255;
        end;
    end;
end;
v6.MultiGetBundleDetailsAsync = function(v256) --[[ Line: 889 ]] --[[ Name: MultiGetBundleDetailsAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v257 = table.concat(v256, ",");
    local v258 = string.format("%sv1/bundles/details?bundleIds=%s", string.gsub(v7, "https://www.", "https://catalog."), v257);
    local l_status_48, l_result_48 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v258 (copy)
        return game:HttpGetAsync(v258);
    end);
    if not l_status_48 then
        return nil;
    elseif l_result_48 == nil or #l_result_48 == 0 then
        return nil;
    else
        local l_status_49, l_result_49 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_48 (copy)
            return l_HttpService_0:JSONDecode(l_result_48);
        end);
        if not l_status_49 then
            return nil;
        else
            return l_result_49;
        end;
    end;
end;
v6.GetUserOwnedBundlesAsync = function(v263, v264) --[[ Line: 914 ]] --[[ Name: GetUserOwnedBundlesAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v265 = string.format("%sv1/users/%s/bundles?sortOrder=Asc&limit=100", string.gsub(v7, "https://www.", "https://catalog."), (tostring(v263)));
    if v264 then
        v265 = string.format(v265 .. "&cursor=%s", v264);
    end;
    local l_v265_0 = v265;
    local l_status_50, l_result_50 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: l_v265_0 (copy)
        return game:HttpGetAsync(l_v265_0);
    end);
    if not l_status_50 then
        return nil;
    elseif l_result_50 == nil or #l_result_50 == 0 then
        return nil;
    else
        local l_status_51, l_result_51 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_50 (copy)
            return l_HttpService_0:JSONDecode(l_result_50);
        end);
        if not l_status_51 then
            return nil;
        else
            return l_result_51;
        end;
    end;
end;
v6.GetAssetThumbnailBatchAsync = function(v271, v272, v273) --[[ Line: 938 ]] --[[ Name: GetAssetThumbnailBatchAsync ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy)
    local v274 = string.gsub(v7, "https://www.", "https://games.") .. "v1/games/game-thumbnails?%s&height=" .. tostring(v273) .. "&width=" .. tostring(v272);
    local v275 = "imageTokens=" .. table.concat(v271, "&imageTokens=");
    local v276 = string.format(v274, v275);
    local l_status_52, l_result_52 = pcall(function() --[[ Line: 63 ]]
        -- upvalues: v276 (copy)
        return game:HttpGetAsync(v276);
    end);
    if not l_status_52 then
        return nil;
    elseif l_result_52 == nil or #l_result_52 == 0 then
        return nil;
    else
        local l_status_53, l_result_53 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_52 (copy)
            return l_HttpService_0:JSONDecode(l_result_52);
        end);
        if not l_status_53 then
            return nil;
        else
            return l_result_53;
        end;
    end;
end;
v6.ReportAbuseAsyncV2 = function(v281, v282, v283, v284, v285, v286, v287, v288, v289) --[[ Line: 952 ]] --[[ Name: ReportAbuseAsyncV2 ]]
    -- upvalues: l_HttpService_0 (copy), l_Url_0 (copy), l_HttpRbxApiService_0 (copy)
    local v290 = {
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = v286
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = v281
                    }
                }
            }, 
            REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v283
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v288
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v287
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v289
                    }
                }
            }, 
            REPORT_TARGET_ASSET_ID = {
                valueList = {
                    {
                        data = v282
                    }
                }
            }, 
            REPORT_TARGET_ASSET_NAME = {
                valueList = {
                    {
                        data = v284
                    }
                }
            }, 
            REPORT_TARGET_ASSET_DESCRIPTION = {
                valueList = {
                    {
                        data = v285
                    }
                }
            }
        }
    };
    local v291 = l_HttpService_0:JSONEncode(v290);
    local v292 = l_Url_0.APIS_URL .. "abuse-reporting/v2/abuse-report";
    if v291 then
        local l_Default_0 = Enum.ThrottlingPriority.Default;
        local l_ApplicationJson_0 = Enum.HttpContentType.ApplicationJson;
        local l_status_54, l_result_54 = pcall(function() --[[ Line: 114 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v292 (copy), v291 (copy), l_Default_0 (copy), l_ApplicationJson_0 (copy)
            return l_HttpRbxApiService_0:PostAsyncFullUrl(v292, v291, l_Default_0, l_ApplicationJson_0);
        end);
        if not l_status_54 then
            return nil;
        elseif l_result_54 == nil or #l_result_54 == 0 then
            return nil;
        else
            local l_status_55, l_result_55 = pcall(function() --[[ Line: 52 ]]
                -- upvalues: l_HttpService_0 (ref), l_result_54 (copy)
                return l_HttpService_0:JSONDecode(l_result_54);
            end);
            if not l_status_55 then
                return nil;
            else
                return l_result_55;
            end;
        end;
    else
        return nil;
    end;
end;
v6.GetConsecutiveDaysLoggedInAsync = function() --[[ Line: 1035 ]] --[[ Name: GetConsecutiveDaysLoggedInAsync ]]
    -- upvalues: v65 (copy), v4 (copy), l_HttpService_0 (copy)
    local v299 = {
        Url = string.format("%sv1/xbox/get-login-consecutive-days", v65("auth")), 
        Method = "GET"
    };
    local v300 = nil;
    local v301 = v4.Signal();
    l_HttpService_0:RequestInternal(v299):Start(function(v302, v303) --[[ Line: 130 ]]
        -- upvalues: v300 (ref), l_HttpService_0 (ref), v301 (copy)
        if v302 and v303.StatusCode ~= 401 and v303.StatusCode >= 200 and v303.StatusCode < 400 then
            local l_Body_5 = v303.Body;
            local v305;
            if l_Body_5 == nil or #l_Body_5 == 0 then
                v305 = nil;
            else
                local l_status_56, l_result_56 = pcall(function() --[[ Line: 52 ]]
                    -- upvalues: l_HttpService_0 (ref), l_Body_5 (copy)
                    return l_HttpService_0:JSONDecode(l_Body_5);
                end);
                v305 = if not l_status_56 then nil else l_result_56;
            end;
            v300 = v305;
        end;
        v301:fire();
    end);
    v301:wait();
    return v300;
end;
v6.IsValidUsername = function(v308, v309) --[[ Line: 1051 ]] --[[ Name: IsValidUsername ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy), v4 (copy)
    local v310 = true;
    if v308 ~= nil then
        v310 = #v308 == 0;
    end;
    if not v310 then
        v310 = true;
        if v309 ~= nil then
            v310 = #v309 == 0;
        end;
        if not v310 then
            local v311 = {
                Url = string.format("%sv2/usernames/validate?request.username=%s&request.birthday=%s", string.gsub(v7, "https://www.", "https://auth."), l_HttpService_0:UrlEncode(v308), v309), 
                Method = "GET"
            };
            local v312 = nil;
            local v313 = v4.Signal();
            l_HttpService_0:RequestInternal(v311):Start(function(v314, v315) --[[ Line: 130 ]]
                -- upvalues: v312 (ref), l_HttpService_0 (ref), v313 (copy)
                if v314 and v315.StatusCode ~= 401 and v315.StatusCode >= 200 and v315.StatusCode < 400 then
                    local l_Body_6 = v315.Body;
                    local v317;
                    if l_Body_6 == nil or #l_Body_6 == 0 then
                        v317 = nil;
                    else
                        local l_status_57, l_result_57 = pcall(function() --[[ Line: 52 ]]
                            -- upvalues: l_HttpService_0 (ref), l_Body_6 (copy)
                            return l_HttpService_0:JSONDecode(l_Body_6);
                        end);
                        v317 = if not l_status_57 then nil else l_result_57;
                    end;
                    v312 = v317;
                end;
                v313:fire();
            end);
            v313:wait();
            return v312;
        end;
    end;
end;
v6.IsValidPassword = function(v320, v321) --[[ Line: 1073 ]] --[[ Name: IsValidPassword ]]
    -- upvalues: v7 (ref), l_HttpService_0 (copy), v4 (copy)
    local v322 = true;
    if v320 ~= nil then
        v322 = #v320 == 0;
    end;
    if not v322 then
        v322 = true;
        if v321 ~= nil then
            v322 = #v321 == 0;
        end;
        if not v322 then
            local v323 = {
                Url = string.format("%sv2/passwords/validate?request.username=%s&request.password=%s", string.gsub(v7, "https://www.", "https://auth."), l_HttpService_0:UrlEncode(v320), l_HttpService_0:UrlEncode(v321)), 
                Method = "GET"
            };
            local v324 = nil;
            local v325 = v4.Signal();
            l_HttpService_0:RequestInternal(v323):Start(function(v326, v327) --[[ Line: 130 ]]
                -- upvalues: v324 (ref), l_HttpService_0 (ref), v325 (copy)
                if v326 and v327.StatusCode ~= 401 and v327.StatusCode >= 200 and v327.StatusCode < 400 then
                    local l_Body_7 = v327.Body;
                    local v329;
                    if l_Body_7 == nil or #l_Body_7 == 0 then
                        v329 = nil;
                    else
                        local l_status_58, l_result_58 = pcall(function() --[[ Line: 52 ]]
                            -- upvalues: l_HttpService_0 (ref), l_Body_7 (copy)
                            return l_HttpService_0:JSONDecode(l_Body_7);
                        end);
                        v329 = if not l_status_58 then nil else l_result_58;
                    end;
                    v324 = v329;
                end;
                v325:fire();
            end);
            v325:wait();
            return v324;
        end;
    end;
end;
v6.PostSponsoredGameClickAsync = function(v332) --[[ Line: 1100 ]] --[[ Name: PostSponsoredGameClickAsync ]]
    -- upvalues: v65 (copy), l_HttpService_0 (copy)
    local v333 = string.format("%sv1/sponsored-games/click", v65("ads"));
    local v334, v335 = string.format("\"%s\"", v332);
    local l_status_59, l_result_59 = pcall(function() --[[ Line: 78 ]]
        -- upvalues: v333 (copy), v334 (copy), v335 (copy)
        return game:HttpPostAsync(v333, v334, v335);
    end);
    if not l_status_59 then
        return nil;
    elseif l_result_59 == nil or #l_result_59 == 0 then
        return nil;
    else
        local l_status_60, l_result_60 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), l_result_59 (copy)
            return l_HttpService_0:JSONDecode(l_result_59);
        end);
        if not l_status_60 then
            return nil;
        else
            return l_result_60;
        end;
    end;
end;
v6.GetUserVoteCountFromVotingApiAsync = function() --[[ Line: 1117 ]] --[[ Name: GetUserVoteCountFromVotingApiAsync ]]
    -- upvalues: v65 (copy), v4 (copy), l_HttpService_0 (copy)
    local v340 = {
        Url = string.format("%svoting-api/user/get-vote-count?targetType=Place", v65("apis")), 
        Method = "GET"
    };
    local v341 = nil;
    local v342 = v4.Signal();
    l_HttpService_0:RequestInternal(v340):Start(function(v343, v344) --[[ Line: 130 ]]
        -- upvalues: v341 (ref), l_HttpService_0 (ref), v342 (copy)
        if v343 and v344.StatusCode ~= 401 and v344.StatusCode >= 200 and v344.StatusCode < 400 then
            local l_Body_8 = v344.Body;
            local v346;
            if l_Body_8 == nil or #l_Body_8 == 0 then
                v346 = nil;
            else
                local l_status_61, l_result_61 = pcall(function() --[[ Line: 52 ]]
                    -- upvalues: l_HttpService_0 (ref), l_Body_8 (copy)
                    return l_HttpService_0:JSONDecode(l_Body_8);
                end);
                v346 = if not l_status_61 then nil else l_result_61;
            end;
            v341 = v346;
        end;
        v342:fire();
    end);
    v342:wait();
    return v341;
end;
v6.CreateCrossDeviceLoginCode = function() --[[ Line: 1134 ]] --[[ Name: CreateCrossDeviceLoginCode ]]
    -- upvalues: v65 (copy), l_HttpService_0 (copy)
    local v349 = string.format("%sauth-token-service/v1/login/create", v65("apis"));
    local l_pcall_5 = pcall;
    local v351 = "";
    local v352 = nil;
    local l_v351_0 = v351 --[[ copy: 4 -> 6 ]];
    local l_v352_0 = v352 --[[ copy: 5 -> 7 ]];
    local v355;
    l_pcall_5, v355 = l_pcall_5(function() --[[ Line: 78 ]]
        -- upvalues: v349 (copy), l_v351_0 (copy), l_v352_0 (copy)
        return game:HttpPostAsync(v349, l_v351_0, l_v352_0);
    end);
    if not l_pcall_5 then
        return nil;
    elseif v355 == nil or #v355 == 0 then
        return nil;
    else
        v351, v352 = pcall(function() --[[ Line: 52 ]]
            -- upvalues: l_HttpService_0 (ref), v355 (copy)
            return l_HttpService_0:JSONDecode(v355);
        end);
        if not v351 then
            return nil;
        else
            return v352;
        end;
    end;
end;
v6.CheckCrossDeviceLoginStatus = function(v356, v357) --[[ Line: 1148 ]] --[[ Name: CheckCrossDeviceLoginStatus ]]
    -- upvalues: v65 (copy), l_HttpService_0 (copy), v4 (copy)
    local v358 = {
        Url = string.format("%sauth-token-service/v1/login/status", v65("apis")), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            code = v356, 
            privateKey = v357
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    local v359 = nil;
    local v360 = v4.Signal();
    l_HttpService_0:RequestInternal(v358):Start(function(v361, v362) --[[ Line: 130 ]]
        -- upvalues: v359 (ref), l_HttpService_0 (ref), v360 (copy)
        if v361 and v362.StatusCode ~= 401 and v362.StatusCode >= 200 and v362.StatusCode < 400 then
            local l_Body_9 = v362.Body;
            local v364;
            if l_Body_9 == nil or #l_Body_9 == 0 then
                v364 = nil;
            else
                local l_status_62, l_result_62 = pcall(function() --[[ Line: 52 ]]
                    -- upvalues: l_HttpService_0 (ref), l_Body_9 (copy)
                    return l_HttpService_0:JSONDecode(l_Body_9);
                end);
                v364 = if not l_status_62 then nil else l_result_62;
            end;
            v359 = v364;
        end;
        v360:fire();
    end);
    v360:wait();
    return v359;
end;
v6.CancelCrossDeviceLogin = function(v367) --[[ Line: 1167 ]] --[[ Name: CancelCrossDeviceLogin ]]
    -- upvalues: v65 (copy), l_HttpService_0 (copy), v4 (copy)
    local v368 = {
        Url = string.format("%sauth-token-service/v1/login/cancel", v65("apis")), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            code = v367
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    local v369 = nil;
    local v370 = v4.Signal();
    l_HttpService_0:RequestInternal(v368):Start(function(v371, v372) --[[ Line: 130 ]]
        -- upvalues: v369 (ref), l_HttpService_0 (ref), v370 (copy)
        if v371 and v372.StatusCode ~= 401 and v372.StatusCode >= 200 and v372.StatusCode < 400 then
            local l_Body_10 = v372.Body;
            local v374;
            if l_Body_10 == nil or #l_Body_10 == 0 then
                v374 = nil;
            else
                local l_status_63, l_result_63 = pcall(function() --[[ Line: 52 ]]
                    -- upvalues: l_HttpService_0 (ref), l_Body_10 (copy)
                    return l_HttpService_0:JSONDecode(l_Body_10);
                end);
                v374 = if not l_status_63 then nil else l_result_63;
            end;
            v369 = v374;
        end;
        v370:fire();
    end);
    v370:wait();
    return v369;
end;
return v6;