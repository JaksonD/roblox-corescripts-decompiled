local l_script_FirstAncestor_0 = script:FindFirstAncestor("Achievements");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Signal);
local v4 = require(l_script_FirstAncestor_0.Achievement.Achievement);
local v5 = require(l_script_FirstAncestor_0.Logger);
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local v7 = require(l_Parent_0.HttpRequest);
local v8 = require(l_script_FirstAncestor_0.Requests.GetXboxLoginConsecutiveDays);
local v9 = require(l_script_FirstAncestor_0.AchievementDataRefresher.VoteCountRefresher);
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v14 = v7.config({
    requestFunction = function(v11, v12, v13) --[[ Line: 16 ]] --[[ Name: requestFunction ]]
        -- upvalues: v7 (copy)
        return v7.requestFunctions.HttpRbxApi(v11, v12, v13);
    end, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("InAppAchievementManagerHttpRetryCount", 4) else nil
});
local v15 = nil;
pcall(function() --[[ Line: 25 ]]
    -- upvalues: v15 (ref)
    v15 = game:GetService("PlatformCloudStorageService");
end);
local v16 = nil;
pcall(function() --[[ Line: 32 ]]
    -- upvalues: v16 (ref)
    v16 = game:GetService("AchievementService");
end);
local v33 = {
    startUp = function(v17) --[[ Line: 38 ]] --[[ Name: startUp ]]
        task.spawn(function() --[[ Line: 39 ]]
            -- upvalues: v17 (copy)
            v17:initAchievements();
        end);
    end, 
    initAchievements = function(v18) --[[ Line: 44 ]] --[[ Name: initAchievements ]]
        -- upvalues: v3 (copy), v9 (copy), v4 (copy)
        local v19, v20 = v3.createReadableSignal(0);
        local v21, v22 = v3.createReadableSignal(0);
        local v23, v24 = v3.createReadableSignal(false);
        v9:init(v20, v18.store, v18.requestImpl, v18.platformCloudStorageService);
        v18.achievementPollster = v4.newWithRefresher(v4.NAMES.ACHIEVEMENT_POLLSTER, v19, v9, v18.achievementService);
        v18.achievement3DayRoll = v4.new(v4.NAMES.ACHIEVEMENT_3_DAY_ROLL, v21, v18.achievementService);
        v18.achievement10DayRoll = v4.new(v4.NAMES.ACHIEVEMENT_10_DAY_ROLL, v21, v18.achievementService);
        v18.achievement20DayRoll = v4.new(v4.NAMES.ACHIEVEMENT_20_DAY_ROLL, v21, v18.achievementService);
        v18.achievementOneNameManyFaces = v4.new(v4.NAMES.ACHIEVEMENT_ONE_NAME_MANY_FACES, v23, v18.achievementService);
        v18:setupAchievements(v22, v24);
    end, 
    setupAchievements = function(v25, v26, v27) --[[ Line: 76 ]] --[[ Name: setupAchievements ]]
        -- upvalues: v8 (copy), v5 (copy)
        if v25.achievement3DayRoll.hasAchieved == false or v25.achievement10DayRoll.hasAchieved == false or v25.achievement20DayRoll.hasAchieved == false then
            v8(v25.requestImpl):andThen(function(v28) --[[ Line: 82 ]]
                -- upvalues: v5 (ref), v26 (copy)
                if v28.responseBody == nil then
                    v5:warning("Response body is empty.");
                    return;
                else
                    local l_count_0 = v28.responseBody.count;
                    if l_count_0 == nil then
                        v5:warning("Day count is missing.");
                        return;
                    else
                        v26(l_count_0);
                        return;
                    end;
                end;
            end):catch(function(v30) --[[ Line: 95 ]]
                -- upvalues: v5 (ref)
                v5:warning(v30);
            end);
        end;
        if v25.achievementOneNameManyFaces.hasAchieved == false then
            v25.saveAvatarCompletedConnection = v25.avatarEditorService.PromptSaveAvatarCompleted:Connect(function(v31) --[[ Line: 102 ]]
                -- upvalues: v27 (copy), v25 (copy)
                if v31 == Enum.AvatarPromptResult.Success then
                    v27(true);
                    v25.saveAvatarCompletedConnection:Disconnect();
                    v25.saveAvatarCompletedConnection = nil;
                end;
            end);
        end;
    end, 
    shutDown = function(v32) --[[ Line: 113 ]] --[[ Name: shutDown ]]
        -- upvalues: v9 (copy)
        v32.achievementPollster = nil;
        v32.achievement3DayRoll = nil;
        v32.achievement10DayRoll = nil;
        v32.achievement20DayRoll = nil;
        v9:stop();
        if v32.saveAvatarCompletedConnection and v32.saveAvatarCompletedConnection.Connected then
            v32.saveAvatarCompletedConnection:Disconnect();
            v32.saveAvatarCompletedConnection = nil;
        end;
    end
};
v33.new = function(v34, v35, v36, v37, v38) --[[ Line: 126 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy), l_AvatarEditorService_0 (copy), v15 (ref), v16 (ref), v33 (copy), l_LoginStatus_0 (copy)
    local v39 = setmetatable({
        store = v34, 
        requestImpl = v35 or v14, 
        avatarEditorService = v36 or l_AvatarEditorService_0, 
        platformCloudStorageService = v37 or v15, 
        achievementService = v38 or v16
    }, {
        __index = v33
    });
    v34.changed:connect(function(v40, v41) --[[ Line: 141 ]]
        -- upvalues: l_LoginStatus_0 (ref), v39 (copy)
        local v42 = if v40.AuthenticationStatus then v40.AuthenticationStatus.status else l_LoginStatus_0.UNKNOWN;
        if v42 ~= if v41.AuthenticationStatus then v41.AuthenticationStatus.status else l_LoginStatus_0.UNKNOWN then
            if v42 == l_LoginStatus_0.LOGGED_IN then
                v39:startUp();
                return;
            elseif v42 == l_LoginStatus_0.LOGGED_OUT then
                v39:shutDown();
            end;
        end;
    end);
    return v39;
end;
return v33;