local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Stats_0 = game:GetService("Stats");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_InGameMenu_0 = l_RobloxGui_0.Modules.InGameMenu;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v6 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v7 = require(l_InGameMenu_0.Utility.SendAnalytics);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Constants;
local v9 = require(l_InGameMenu_0.Resources.Constants);
local v10 = require(script.Parent.Flags.GetFFlagEnableInGameMenuDurationLogger)();
local v11 = if l_Stats_0 then l_Stats_0:FindFirstChild("FrameRateManager") else nil;
local v12 = if v11 then v11:FindFirstChild("RenderAverage") else nil;
local function _() --[[ Line: 26 ]] --[[ Name: getCurrentMenuVersion ]]
    -- upvalues: v6 (copy)
    if v6() then
        return 2;
    else
        return 1;
    end;
end;
local function _(v14) --[[ Line: 33 ]] --[[ Name: getMenuAnimationTime ]]
    -- upvalues: v9 (copy)
    if v14 then
        return v9.ShieldOpenAnimationTweenTime;
    else
        return v9.ShieldCloseAnimationTweenTime;
    end;
end;
local function _() --[[ Line: 40 ]] --[[ Name: getMonoTimeSec ]]
    return os.clock();
end;
local function v17() --[[ Line: 44 ]] --[[ Name: getFps ]]
    -- upvalues: v12 (copy)
    if v12 then
        return 1000 / v12:GetValue();
    else
        return nil;
    end;
end;
local v18 = l_HttpService_0:GenerateGUID();
local v19 = os.clock();
local v20 = os.clock();
local v21 = nil;
local v22 = nil;
local v23 = false;
local v24 = false;
local v25 = 0;
local function v28(v26, v27) --[[ Line: 63 ]] --[[ Name: sendEvent ]]
    -- upvalues: v12 (copy), v6 (copy), v10 (copy), l_default_0 (copy), v7 (copy), l_Constants_0 (copy)
    v27.fps = if v12 then 1000 / v12:GetValue() else nil;
    v27.menu_version = v6() and 2 or 1;
    if v10 then
        v26 = v26 .. "_v" .. v27.menu_version;
    end;
    if v27.menu_session then
        if v10 then
            l_default_0:logEvent(v26, v27);
            return;
        else
            v7(l_Constants_0.AnalyticsInGameMenuName, v26, v27);
        end;
    end;
end;
local function v31() --[[ Line: 89 ]] --[[ Name: sendMenuOpening ]]
    -- upvalues: v10 (copy), l_Constants_0 (copy), v21 (ref), v18 (copy), v25 (ref), v23 (ref), v28 (copy)
    local v29 = if v10 then l_Constants_0.AnalyticsGameMenuOpenStart else l_Constants_0.AnalyticsPerfMenuOpening;
    local v30 = {
        menu_session = v21, 
        game_session = v18, 
        count = v25, 
        interrupted_closing = v23
    };
    if v10 then
        v28(l_Constants_0.AnalyticsGameMenuFlowStart, v30);
    end;
    v28(v29, v30);
end;
local function _(v32, v33) --[[ Line: 105 ]] --[[ Name: sendMenuStarted ]]
    -- upvalues: v10 (copy), l_Constants_0 (copy), v28 (copy), v21 (ref)
    local v34 = if v10 then l_Constants_0.AnalyticsGameMenuOpenEnd else l_Constants_0.AnalyticsPerfMenuStarted;
    v28(v34, {
        menu_session = v21, 
        transition_time_total = v32, 
        transition_time_normalized = v33
    });
end;
local function v40(v36, v37) --[[ Line: 114 ]] --[[ Name: sendMenuClosed ]]
    -- upvalues: v10 (copy), l_Constants_0 (copy), v22 (ref), v28 (copy)
    local v38 = if v10 then l_Constants_0.AnalyticsGameMenuCloseEnd else l_Constants_0.AnalyticsPerfMenuClosed;
    local v39 = {
        menu_session = v22, 
        transition_time_total = v36, 
        transition_time_normalized = v37
    };
    v28(v38, v39);
    if v10 then
        v28(l_Constants_0.AnalyticsGameMenuFlowEnd, v39);
    end;
end;
local function _(v41, v42) --[[ Line: 128 ]] --[[ Name: sendMenuEnding ]]
    -- upvalues: v10 (copy), l_Constants_0 (copy), v28 (copy), v21 (ref), v24 (ref)
    local v43 = v42 and "leaving" or "resume";
    local v44 = if v10 then l_Constants_0.AnalyticsGameMenuCloseStart else l_Constants_0.AnalyticsPerfMenuEnding;
    v28(v44, {
        menu_session = v21, 
        session_time = v41, 
        reason = v43, 
        interrupted_opening = v24
    });
end;
return {
    menuOpenBegin = function() --[[ Line: 140 ]] --[[ Name: menuOpenBegin ]]
        -- upvalues: v21 (ref), v25 (ref), v19 (ref), l_HttpService_0 (copy), v31 (copy), v24 (ref), v23 (ref)
        if v21 then
            return;
        else
            v25 = v25 + 1;
            v19 = os.clock();
            v21 = l_HttpService_0:GenerateGUID();
            v31();
            v24 = true;
            v23 = false;
            return;
        end;
    end, 
    menuOpenComplete = function() --[[ Line: 152 ]] --[[ Name: menuOpenComplete ]]
        -- upvalues: v19 (ref), v9 (copy), v10 (copy), l_Constants_0 (copy), v28 (copy), v21 (ref), v24 (ref)
        local v46 = os.clock() - v19;
        local v47 = v46 - v9.ShieldOpenAnimationTweenTime;
        local v48 = if v10 then l_Constants_0.AnalyticsGameMenuOpenEnd else l_Constants_0.AnalyticsPerfMenuStarted;
        v28(v48, {
            menu_session = v21, 
            transition_time_total = v46, 
            transition_time_normalized = v47
        });
        v24 = false;
    end, 
    menuClose = function() --[[ Line: 159 ]] --[[ Name: menuClose ]]
        -- upvalues: v20 (ref), v19 (ref), v10 (copy), l_Constants_0 (copy), v28 (copy), v21 (ref), v24 (ref), v22 (ref), v23 (ref)
        v20 = os.clock();
        local v49 = v20 - v19;
        local v50 = if v10 then l_Constants_0.AnalyticsGameMenuCloseStart else l_Constants_0.AnalyticsPerfMenuEnding;
        v28(v50, {
            menu_session = v21, 
            session_time = v49, 
            reason = "resume", 
            interrupted_opening = v24
        });
        v22 = v21;
        v21 = nil;
        v24 = false;
        v23 = true;
    end, 
    menuCloseComplete = function() --[[ Line: 168 ]] --[[ Name: menuCloseComplete ]]
        -- upvalues: v20 (ref), v9 (copy), v40 (copy), v22 (ref), v23 (ref)
        local v51 = os.clock() - v20;
        local v52 = v51 - v9.ShieldCloseAnimationTweenTime;
        v40(v51, v52);
        v22 = nil;
        v23 = false;
    end, 
    leavingGame = function() --[[ Line: 176 ]] --[[ Name: leavingGame ]]
        -- upvalues: v19 (ref), v10 (copy), l_Constants_0 (copy), v28 (copy), v21 (ref), v24 (ref)
        local v53 = os.clock() - v19;
        local v54 = if v10 then l_Constants_0.AnalyticsGameMenuCloseStart else l_Constants_0.AnalyticsPerfMenuEnding;
        v28(v54, {
            menu_session = v21, 
            session_time = v53, 
            reason = "leaving", 
            interrupted_opening = v24
        });
        v21 = nil;
    end, 
    getFps = v17
};