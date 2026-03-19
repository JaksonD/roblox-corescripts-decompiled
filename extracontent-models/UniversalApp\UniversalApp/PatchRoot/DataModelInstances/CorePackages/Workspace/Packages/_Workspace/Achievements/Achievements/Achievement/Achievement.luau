local l_Parent_0 = script:FindFirstAncestor("Achievements").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local _ = require(l_Parent_0.Signal);
local v3 = require(script.Parent.AchievementRules);
local v4 = require(script.Parent.AchievementConstants);
local v5 = require(script.Parent.AchievementTelemetry);
local v19 = {
    NAMES = v4.ACHIEVEMENT_NAMES, 
    _init = function(v6, v7, v8, v9) --[[ Line: 28 ]] --[[ Name: _init ]]
        -- upvalues: v3 (copy)
        v6.achievementService = v9;
        v6.achievementName = v7;
        v6.achievementRule = v3[v7];
        v6.achievementAwardedCallbacks = {};
        v6.hasAchieved = nil;
        assert(v6.achievementRule, "Achievement rule not found for " .. tostring(v7));
        if v6.achievementService:IsAvailable() then
            pcall(function() --[[ Line: 37 ]]
                -- upvalues: v6 (copy), v7 (copy)
                v6.hasAchieved = v6.achievementService:HasAchieved(v7);
            end);
            if v6.hasAchieved == false then
                v6.achievementDataSubscription = v8:subscribe(function(v10) --[[ Line: 42 ]]
                    -- upvalues: v6 (copy)
                    if v6.achievementRule(v10) then
                        v6:grantAchievement(v6.achievementName);
                    end;
                end);
            end;
        end;
    end, 
    grantAchievement = function(v11, v12) --[[ Line: 51 ]] --[[ Name: grantAchievement ]]
        -- upvalues: v1 (copy), v5 (copy)
        if v11.hasAchieved == false then
            local _, l_result_0 = pcall(function() --[[ Line: 53 ]]
                -- upvalues: v11 (copy), v12 (copy)
                return v11.achievementService:GrantAchievement(v12);
            end);
            v1.default:logRobloxTelemetryEvent(v5, nil, {
                achievementName = v12, 
                grantedState = tostring(l_result_0)
            });
            if l_result_0 == true then
                v11.hasAchieved = true;
                v11.achievementDataSubscription:unsubscribe();
                for _, v16 in v11.achievementAwardedCallbacks do
                    v16(v12);
                end;
            end;
        end;
    end, 
    registerOnAchievementAwardedListener = function(v17, v18) --[[ Line: 72 ]] --[[ Name: registerOnAchievementAwardedListener ]]
        v17.achievementAwardedCallbacks[v18] = v18;
        return {
            unsubscribe = function() --[[ Line: 77 ]] --[[ Name: unsubscribe ]]
                -- upvalues: v17 (copy), v18 (copy)
                v17.achievementAwardedCallbacks[v18] = nil;
            end
        };
    end
};
v19.new = function(v20, v21, v22) --[[ Line: 83 ]] --[[ Name: new ]]
    -- upvalues: v19 (copy)
    local v23 = {};
    setmetatable(v23, {
        __index = v19
    });
    v23:_init(v20, v21, v22);
    return v23;
end;
v19.newWithRefresher = function(v24, v25, v26, v27) --[[ Line: 94 ]] --[[ Name: newWithRefresher ]]
    -- upvalues: v19 (copy)
    local v28 = v19.new(v24, v25, v27);
    if v28.hasAchieved == false then
        v26:start();
        v28:registerOnAchievementAwardedListener(function() --[[ Line: 104 ]]
            -- upvalues: v26 (copy)
            v26:stop();
        end);
    end;
    return v28;
end;
return v19;