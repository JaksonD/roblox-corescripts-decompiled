local l_script_FirstAncestor_0 = script:FindFirstAncestor("Achievements");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signal);
local v3 = require(l_script_FirstAncestor_0.Achievement.Achievement);
local v4 = require(l_script_FirstAncestor_0.Logger);
local v5 = require(l_Parent_0.HttpRequest);
local v6 = require(l_script_FirstAncestor_0.Requests.GetUserRecentExperiences);
local v7 = require(l_Parent_0.Dash);
local v8 = require(l_script_FirstAncestor_0.AchievementDataRefresher.TimeRefresher);
local v9 = require(l_script_FirstAncestor_0.AchievementDataRefresher.FriendCountRefresher);
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v14 = v5.config({
    requestFunction = function(v11, v12, v13) --[[ Line: 19 ]] --[[ Name: requestFunction ]]
        -- upvalues: v5 (copy)
        return v5.requestFunctions.HttpRbxApi(v11, v12, v13);
    end, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("InExpAchievementManagerHttpRetryCount", 4) else nil
});
local v15 = nil;
pcall(function() --[[ Line: 29 ]]
    -- upvalues: v15 (ref)
    v15 = game:GetService("PlatformFriendsService");
end);
local v16 = nil;
pcall(function() --[[ Line: 34 ]]
    -- upvalues: v16 (ref)
    v16 = game:GetService("PlatformCloudStorageService");
end);
local v17 = nil;
pcall(function() --[[ Line: 39 ]]
    -- upvalues: v17 (ref)
    v17 = game:GetService("AchievementService");
end);
local l_Players_0 = game:GetService("Players");
local v19 = nil;
pcall(function() --[[ Line: 47 ]]
    -- upvalues: v19 (ref)
    v19 = game:GetService("PlatformService");
end);
local v37 = {
    startUp = function(v20) --[[ Line: 56 ]] --[[ Name: startUp ]]
        -- upvalues: v2 (copy), v8 (copy), v9 (copy), v3 (copy)
        local v21, v22 = v2.createReadableSignal(0);
        local v23, v24 = v2.createReadableSignal(0);
        local v25, v26 = v2.createReadableSignal(0);
        local v27, v28 = v2.createReadableSignal(0);
        v8:init(v22, 3600);
        v9:init(v28, v20.playersService);
        v20.achievementMarathon = v3.newWithRefresher(v3.NAMES.ACHIEVEMENT_MARATHON, v21, v8, v20.achievementService);
        v20.achievementFoursCompany = v3.newWithRefresher(v3.NAMES.ACHIEVEMENT_FOURS_COMPANY, v27, v9, v20.achievementService);
        v20.achievementScout = v3.new(v3.NAMES.ACHIEVEMENT_SCOUT, v23, v20.achievementService);
        v20.achievementExplorer = v3.new(v3.NAMES.ACHIEVEMENT_EXPLORER, v23, v20.achievementService);
        v20.achievementTrailblazer = v3.new(v3.NAMES.ACHIEVEMENT_TRAILBLAZER, v23, v20.achievementService);
        v20.achievementStrengthInNumbers = v3.new(v3.NAMES.ACHIEVEMENT_STRENGTH_IN_NUMBERS, v25, v20.achievementService);
        v20:_checkStrengthInNumbers(v26);
        v20:_checkJoinExperienceAchievements(v24);
    end, 
    _checkJoinExperienceAchievements = function(v29, v30) --[[ Line: 98 ]] --[[ Name: _checkJoinExperienceAchievements ]]
        -- upvalues: v7 (copy), v6 (copy), v4 (copy)
        if v29.achievementScout.hasAchieved == false or v29.achievementExplorer.hasAchieved == false or v29.achievementTrailblazer.hasAchieved == false then
            if v29.platformCloudStorageService and v29.platformCloudStorageService:IsUserDataAvailable() then
                local v31 = v29.platformCloudStorageService:GetUserDataAsync("ExperiencesPlayed").data or {};
                if #v31 < 15 and not v7.includes(v31, game.GameId) then
                    table.insert(v31, game.GameId);
                    v29.platformCloudStorageService:SetUserDataAsync("ExperiencesPlayed", {
                        data = v31
                    });
                end;
                v30(#v31);
                return;
            else
                v6(v29.requestImpl):andThen(function(v32) --[[ Line: 116 ]]
                    -- upvalues: v30 (copy)
                    v30(v32);
                end):catch(function(v33) --[[ Line: 118 ]]
                    -- upvalues: v4 (ref)
                    v4:warning(v33);
                end);
            end;
        end;
    end, 
    _checkStrengthInNumbers = function(v34, v35) --[[ Line: 125 ]] --[[ Name: _checkStrengthInNumbers ]]
        if v34.achievementStrengthInNumbers.hasAchieved == false then
            local l_LocalPlayer_0 = v34.playersService.LocalPlayer;
            if l_LocalPlayer_0 and l_LocalPlayer_0.FollowUserId ~= 0 and (if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_LocalPlayer_0:IsFriendsWithAsync(l_LocalPlayer_0.FollowUserId) else l_LocalPlayer_0:IsFriendsWith(l_LocalPlayer_0.FollowUserId)) and v34.playersService:GetPlayerByUserId(l_LocalPlayer_0.FollowUserId) then
                v35(0);
            end;
        end;
    end
};
v37.new = function(v38, v39, v40, v41, v42, v43) --[[ Line: 142 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy), v15 (ref), v16 (ref), v17 (ref), l_Players_0 (copy), v19 (ref), v37 (copy)
    return (setmetatable({
        requestImpl = v38 or v14, 
        platformFriendsService = v39 or v15, 
        platformCloudStorageService = v40 or v16, 
        achievementService = v41 or v17, 
        playersService = v42 or l_Players_0, 
        platformService = v43 or v19
    }, {
        __index = v37
    }));
end;
return v37;