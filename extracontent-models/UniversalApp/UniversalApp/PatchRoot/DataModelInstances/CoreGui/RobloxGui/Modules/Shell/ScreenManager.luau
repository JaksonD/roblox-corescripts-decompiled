local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_Shell_0 = l_RobloxGui_0:FindFirstChild("Modules"):FindFirstChild("Shell");
local v4 = require(script.Parent.Analytics);
local v5 = require(script.Parent.AppState);
local v6 = require(script.Parent.GlobalSettings);
local v7 = require(script.Parent.Models.ScreenItem);
local v8 = require(script.Parent.PageHeartbeatTimer);
local v9 = require(script.Parent.Actions.InsertScreen);
local v10 = require(script.Parent.Actions.RemoveScreen);
local l_contentHistory_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("contentHistory"));
local v12 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v14 = {};
local v15 = {};
local v16 = {
    [1] = l_RobloxGui_0
};
local function _(v17) --[[ Line: 25 ]] --[[ Name: getScreenPriority ]]
    -- upvalues: v6 (copy)
    local l_DefaultPriority_0 = v6.DefaultPriority;
    if v17.GetPriority ~= nil then
        l_DefaultPriority_0 = v17:GetPriority();
    end;
    return l_DefaultPriority_0;
end;
local function v23(v20, v21) --[[ Line: 33 ]] --[[ Name: setRBXEventStream_Screen ]]
    -- upvalues: v4 (copy)
    if v20 and type(v20.GetAnalyticsInfo) == "function" then
        local l_v20_AnalyticsInfo_0 = v20:GetAnalyticsInfo();
        if type(l_v20_AnalyticsInfo_0) == "table" and l_v20_AnalyticsInfo_0[v4.WidgetNames("WidgetId")] then
            l_v20_AnalyticsInfo_0.Status = v21;
            v4.SetRBXEventStream("Widget", l_v20_AnalyticsInfo_0);
        end;
    end;
end;
v14.GetScreenGuiByPriority = function(_, v25) --[[ Line: 43 ]] --[[ Name: GetScreenGuiByPriority ]]
    -- upvalues: v16 (copy), l_Create_0 (copy), l_CoreGui_0 (copy)
    v25 = math.max(1, v25);
    if not v16[v25] then
        for v26 = 1, v25 do
            if not v16[v26] then
                v16[v26] = l_Create_0("ScreenGui")({
                    Name = "AppShell" .. tostring(v26), 
                    Parent = l_CoreGui_0
                });
            end;
        end;
    end;
    return v16[v25];
end;
v14.OpenScreen = function(_, v28, v29) --[[ Line: 60 ]] --[[ Name: OpenScreen ]]
    -- upvalues: v15 (copy), v7 (copy), v6 (copy), v12 (copy), v14 (copy), l_contentHistory_0 (copy), v5 (copy), v9 (copy)
    if v29 == nil then
        v29 = true;
    end;
    local v30 = {
        hidePrevious = v29
    };
    local v31 = tostring(v28);
    v15[v31] = {
        screen = v28, 
        isShown = false
    };
    local l_new_0 = v7.new;
    local l_v31_0 = v31;
    local l_DefaultPriority_1 = v6.DefaultPriority;
    if v28.GetPriority ~= nil then
        l_DefaultPriority_1 = v28:GetPriority();
    end;
    l_new_0 = l_new_0(l_v31_0, l_DefaultPriority_1, v30);
    if v12() > 0 then
        l_v31_0 = v14:GetTopScreen();
        if l_v31_0 then
            l_contentHistory_0:setLastSelectedContent(l_v31_0);
        end;
    end;
    v5.store:dispatch(v9(l_new_0));
end;
v14.CloseCurrent = function(_, v36) --[[ Line: 87 ]] --[[ Name: CloseCurrent ]]
    -- upvalues: v5 (copy), v15 (copy), v10 (copy)
    local l_ScreenList_0 = v5.store:getState().ScreenList;
    local v38 = false;
    if #l_ScreenList_0 > 0 then
        v38 = l_ScreenList_0[1];
    end;
    if not v38 or not v15[v38.id] then
        return;
    elseif v36 and v38.id ~= tostring(v36) then
        return;
    else
        v5.store:dispatch(v10(v38));
        return;
    end;
end;
local function v50(v39) --[[ Line: 104 ]] --[[ Name: handleScreensRemoved ]]
    -- upvalues: v15 (copy), v23 (copy)
    local v40 = {};
    for _, v42 in ipairs(v39) do
        v40[v42.id] = true;
    end;
    local v43 = {};
    for v44, _ in pairs(v15) do
        if not v40[v44] then
            table.insert(v43, v44);
        end;
    end;
    for _, v47 in ipairs(v43) do
        local v48 = v15[v47];
        if v48 then
            local l_screen_0 = v48.screen;
            l_screen_0:RemoveFocus();
            l_screen_0:Hide();
            if l_screen_0.ScreenRemoved then
                l_screen_0:ScreenRemoved();
            end;
            v23(l_screen_0, "Close");
        end;
        v15[v47] = nil;
    end;
end;
local function v58(v51) --[[ Line: 136 ]] --[[ Name: handleScreensAdded ]]
    -- upvalues: v15 (copy), v23 (copy), v8 (copy), v4 (copy)
    for v52 = #v51, 1, -1 do
        local v53 = v15[v51[v52].id];
        if v53 then
            local l_screen_1 = v53.screen;
            if v52 > 1 then
                local v55 = true;
                local v56 = v51[v52 - 1];
                if v56 and v56.data then
                    v55 = v56.data.hidePrevious;
                end;
                l_screen_1:RemoveFocus();
                if v55 then
                    l_screen_1:Hide();
                    v53.isShown = false;
                end;
                if not v53.isShown and not v55 then
                    l_screen_1:Show();
                    v53.isShown = true;
                end;
            else
                if not v53.isShown then
                    l_screen_1:Show();
                    v53.isShown = true;
                    v23(l_screen_1, "Show");
                end;
                l_screen_1:Focus();
                v23(l_screen_1, "Focus");
                local v57 = v53.screen.GetAnalyticsInfo and v53.screen.GetAnalyticsInfo();
                if v57 then
                    v8.onPageChanged(v57[v4.WidgetNames("WidgetId")]);
                end;
            end;
        end;
    end;
    v4.reportPageChanged();
end;
local function _(v59) --[[ Line: 181 ]] --[[ Name: update ]]
    -- upvalues: v50 (copy), v58 (copy)
    v50(v59);
    v58(v59);
end;
v5.store.changed:connect(function(v61, v62) --[[ Line: 186 ]]
    -- upvalues: v50 (copy), v58 (copy)
    local l_ScreenList_1 = v61.ScreenList;
    if l_ScreenList_1 == v62.ScreenList then
        return;
    else
        v50(l_ScreenList_1);
        v58(l_ScreenList_1);
        return;
    end;
end);
v14.GetTopScreen = function(_) --[[ Line: 197 ]] --[[ Name: GetTopScreen ]]
    -- upvalues: v5 (copy), v15 (copy)
    local l_ScreenList_2 = v5.store:getState().ScreenList;
    if l_ScreenList_2 and #l_ScreenList_2 > 0 then
        return v15[l_ScreenList_2[1].id].screen;
    else
        return nil;
    end;
end;
return v14;