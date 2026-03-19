local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagLuaAppSortDeeplinkFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSortDeeplinkFix;
local v2 = game:DefineFastString("FStringDeeplinkOmniSortIdMap", "        Curated = 100000008,\n        Continue = 100000003,\n        Sponsored = 400000000,\n        Favorites = 100000001,\n    ");
local v3 = game:DefineFastString("FStringDeeplinkSortIdMap", "        Continue_Playing = 100000003,\n        Sponsored = 400000000,\n        Top_Earning = Top_Earning_L7RS_V4,\n        Up_And_Coming = Up_And_Coming_V4,\n        Top_Revisited = Top_Revisited_Existing_Users_V4,\n        Top_Trending = Top_Trending_V4,\n        Fun_With_Friends = Fun_With_Friends_V4,\n        Top_Rated = Top_Rated_V4,\n        Most_Engaging = Most_engaging_V4,\n        Top_Paid = Top_Paid_V4,\n        Trending_in_Roleplay = Trending_in_Roleplay_V4,\n        Trending_in_Simulator = Trending_in_Simulator_V4,\n        Trending_in_Fighting = Trending_in_Fighting_V4,\n        Trending_in_Action = Trending_in_Action_V4,\n        Trending_in_Tycoon = Trending_in_Tycoon_V4,\n        Trending_in_Survival = Trending_in_Survival_V4,\n        Trending_in_Obby = Trending_in_Obby_V4,\n        Trending_in_Strategy = Trending_in_Strategy_V4,\n        Trending_in_Racing = Trending_in_Racing_V4,\n        Trending_in_Sports = Trending_in_Sports_V4,\n        Trending_in_Shooting = Trending_in_Shooting_V4,\n        Trending_in_Hangout = Trending_in_Hangout_V4,\n        Only_17_Plus = Only_17_Plus_V4,\n        Learn_And_Explore = Learn_And_Explore_V4,\n        More_When_You_Subscribe = More_When_You_Subscribe_V4,\n    ");
local v4 = game:DefineFastString("FStringOmniSortsList", "100000003, 400000000");
local v5 = {};
local v6 = if l_FFlagLuaAppSortDeeplinkFix_0 then nil else {};
local v7 = false;
return function(v8) --[[ Line: 61 ]]
    -- upvalues: l_FFlagLuaAppSortDeeplinkFix_0 (copy), v7 (ref), v2 (copy), v5 (copy), v3 (copy), v4 (copy), v6 (copy)
    if l_FFlagLuaAppSortDeeplinkFix_0 then
        if not v7 then
            for v9, v10 in v2:gmatch("([_%w]+) ?= ?([_%w]+)") do
                v5[v9:lower()] = v10;
            end;
            v7 = true;
        end;
        local v11 = v5[v8:lower()];
        return v11 or v8:lower(), v11 ~= nil;
    else
        if not v7 then
            for v12, v13 in v3:gmatch("([_%w]+) ?= ?([_%w]+)") do
                v5[v12:lower()] = v13;
            end;
            for v14 in v4:gmatch("(%w+)") do
                v6[v14] = true;
            end;
            v7 = true;
        end;
        local v15 = v5[v8:lower()];
        if v15 then
            return v15, v6[v15] or false;
        else
            return v8, v6[v8] or false;
        end;
    end;
end;