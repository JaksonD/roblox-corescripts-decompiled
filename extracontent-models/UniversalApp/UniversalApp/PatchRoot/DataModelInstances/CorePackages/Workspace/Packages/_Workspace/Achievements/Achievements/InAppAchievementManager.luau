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
local v11 = game:DefineFastFlag("FixOneNameManyFacesDisconnectCrash", false);
local v15 = v7.config({
    requestFunction = function(v12, v13, v14) --[[ Line: 17 ]] --[[ Name: requestFunction ]]
        -- upvalues: v7 (copy)
        return v7.requestFunctions.HttpRbxApi(v12, v13, v14);
    end, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("InAppAchievementManagerHttpRetryCount", 4) else nil
});
local v16 = nil;
pcall(function() --[[ Line: 26 ]]
    -- upvalues: v16 (ref)
    v16 = game:GetService("PlatformCloudStorageService");
end);
local v17 = nil;
pcall(function() --[[ Line: 33 ]]
    -- upvalues: v17 (ref)
    v17 = game:GetService("AchievementService");
end);
local v34 = {
    startUp = function(v18) --[[ Line: 39 ]] --[[ Name: startUp ]]
        task.spawn(function() --[[ Line: 40 ]]
            -- upvalues: v18 (copy)
            v18:initAchievements();
        end);
    end, 
    initAchievements = function(v19) --[[ Line: 45 ]] --[[ Name: initAchievements ]]
        -- upvalues: v3 (copy), v9 (copy), v4 (copy)
        local v20, v21 = v3.createReadableSignal(0);
        local v22, v23 = v3.createReadableSignal(0);
        local v24, v25 = v3.createReadableSignal(false);
        v9:init(v21, v19.store, v19.requestImpl, v19.platformCloudStorageService);
        v19.achievementPollster = v4.newWithRefresher(v4.NAMES.ACHIEVEMENT_POLLSTER, v20, v9, v19.achievementService);
        v19.achievement3DayRoll = v4.new(v4.NAMES.ACHIEVEMENT_3_DAY_ROLL, v22, v19.achievementService);
        v19.achievement10DayRoll = v4.new(v4.NAMES.ACHIEVEMENT_10_DAY_ROLL, v22, v19.achievementService);
        v19.achievement20DayRoll = v4.new(v4.NAMES.ACHIEVEMENT_20_DAY_ROLL, v22, v19.achievementService);
        v19.achievementOneNameManyFaces = v4.new(v4.NAMES.ACHIEVEMENT_ONE_NAME_MANY_FACES, v24, v19.achievementService);
        v19:setupAchievements(v23, v25);
    end, 
    setupAchievements = function(v26, v27, v28) --[[ Line: 77 ]] --[[ Name: setupAchievements ]]
        -- upvalues: v8 (copy), v5 (copy), v11 (copy)
        if v26.achievement3DayRoll.hasAchieved == false or v26.achievement10DayRoll.hasAchieved == false or v26.achievement20DayRoll.hasAchieved == false then
            v8(v26.requestImpl):andThen(function(v29) --[[ Line: 83 ]]
                -- upvalues: v5 (ref), v27 (copy)
                if v29.responseBody == nil then
                    v5:warning("Response body is empty.");
                    return;
                else
                    local l_count_0 = v29.responseBody.count;
                    if l_count_0 == nil then
                        v5:warning("Day count is missing.");
                        return;
                    else
                        v27(l_count_0);
                        return;
                    end;
                end;
            end):catch(function(v31) --[[ Line: 96 ]]
                -- upvalues: v5 (ref)
                v5:warning(v31);
            end);
        end;
        if v26.achievementOneNameManyFaces.hasAchieved == false then
            v26.saveAvatarCompletedConnection = v26.avatarEditorService.PromptSaveAvatarCompleted:Connect(function(v32) --[[ Line: 103 ]]
                -- upvalues: v28 (copy), v11 (ref), v26 (copy)
                if v32 == Enum.AvatarPromptResult.Success then
                    v28(true);
                    if v11 then
                        if v26.saveAvatarCompletedConnection and v26.saveAvatarCompletedConnection.Connected then
                            v26.saveAvatarCompletedConnection:Disconnect();
                        end;
                        v26.saveAvatarCompletedConnection = nil;
                        return;
                    else
                        v26.saveAvatarCompletedConnection:Disconnect();
                        v26.saveAvatarCompletedConnection = nil;
                    end;
                end;
            end);
        end;
    end, 
    shutDown = function(v33) --[[ Line: 121 ]] --[[ Name: shutDown ]]
        -- upvalues: v9 (copy)
        v33.achievementPollster = nil;
        v33.achievement3DayRoll = nil;
        v33.achievement10DayRoll = nil;
        v33.achievement20DayRoll = nil;
        v9:stop();
        if v33.saveAvatarCompletedConnection and v33.saveAvatarCompletedConnection.Connected then
            v33.saveAvatarCompletedConnection:Disconnect();
            v33.saveAvatarCompletedConnection = nil;
        end;
    end
};
v34.new = function(v35, v36, v37, v38, v39) --[[ Line: 134 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy), l_AvatarEditorService_0 (copy), v16 (ref), v17 (ref), v34 (copy), l_LoginStatus_0 (copy)
    local v40 = setmetatable({
        store = v35, 
        requestImpl = v36 or v15, 
        avatarEditorService = v37 or l_AvatarEditorService_0, 
        platformCloudStorageService = v38 or v16, 
        achievementService = v39 or v17
    }, {
        __index = v34
    });
    v35.changed:connect(function(v41, v42) --[[ Line: 149 ]]
        -- upvalues: l_LoginStatus_0 (ref), v40 (copy)
        local v43 = if v41.AuthenticationStatus then v41.AuthenticationStatus.status else l_LoginStatus_0.UNKNOWN;
        if v43 ~= if v42.AuthenticationStatus then v42.AuthenticationStatus.status else l_LoginStatus_0.UNKNOWN then
            if v43 == l_LoginStatus_0.LOGGED_IN then
                v40:startUp();
                return;
            elseif v43 == l_LoginStatus_0.LOGGED_OUT then
                v40:shutDown();
            end;
        end;
    end);
    return v40;
end;
return v34;