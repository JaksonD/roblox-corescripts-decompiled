local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.mutedError);
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Actions.SetFullView);
local v4 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local function _(v5) --[[ Line: 12 ]] --[[ Name: getAnalyticsContext ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v6 = v2.AnalyticsContext[v5];
    if v6 == nil then
        if _G.__TESTEZ_RUNNING_TEST__ and v5 == "DummyRoute" then
            return "DummyRoute";
        else
            v1(string.format("opaquePage: %s missing an entry in AXConstants.AnalyticsContext", (tostring(v5))));
            v6 = "";
        end;
    end;
    return v6;
end;
local function _(v8, v9, v10) --[[ Line: 26 ]] --[[ Name: getAnalyticsFunction ]]
    -- upvalues: v4 (copy)
    if v10 == v4.SceneFullView then
        return v8.open3DFullView;
    elseif v10 == v4.UIFullView then
        return v8.openUIFullView;
    elseif v9 == v4.SceneFullView then
        return v8.close3DFullView;
    elseif v9 == v4.UIFullView then
        return v8.closeUIFullView;
    else
        return;
    end;
end;
return function(v12, v13, v14) --[[ Line: 42 ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy), v4 (copy)
    return function(v15) --[[ Line: 43 ]]
        -- upvalues: v13 (copy), v3 (ref), v14 (copy), v2 (ref), v1 (ref), v12 (copy), v4 (ref)
        local v16 = false;
        local v17 = v15:getState().AvatarExperience.Common.FullView[v13];
        v15:dispatch(v3(v13, v14));
        local l_v13_0 = v13;
        local v19 = v2.AnalyticsContext[l_v13_0];
        local v20;
        if v19 == nil then
            if _G.__TESTEZ_RUNNING_TEST__ and l_v13_0 == "DummyRoute" then
                v20 = "DummyRoute";
                v16 = true;
            else
                v1(string.format("opaquePage: %s missing an entry in AXConstants.AnalyticsContext", (tostring(l_v13_0))));
                v19 = "";
            end;
        end;
        if not v16 then
            v20 = v19;
        end;
        v16 = false;
        v19 = v12;
        local l_v14_0 = v14;
        l_v13_0 = if l_v14_0 == v4.SceneFullView then v19.open3DFullView else if l_v14_0 == v4.UIFullView then v19.openUIFullView else if v17 == v4.SceneFullView then v19.close3DFullView else if v17 == v4.UIFullView then v19.closeUIFullView else nil;
        if l_v13_0 then
            l_v13_0(v20);
        end;
    end;
end;