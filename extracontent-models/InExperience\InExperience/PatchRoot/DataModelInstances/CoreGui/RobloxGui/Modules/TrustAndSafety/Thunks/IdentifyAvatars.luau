local _ = game:GetService("CoreGui");
local v1 = nil;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarIdentification_0 = require(l_CorePackages_0.Workspace.Packages.TnSAvatarIdentification).AvatarIdentification;
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Actions.Hide);
local v7 = require(l_Parent_0.Actions.Show);
local v8 = require(l_Parent_0.Actions.SetIdentifiedAvatars);
local v9 = require(l_Parent_0.Utility.ScreenshotHookManager);
local l_getVisibleAvatars_0 = l_AvatarIdentification_0.getVisibleAvatars;
if game:GetEngineFeature("ReportAnythingScreenshot") then
    v1 = game:GetService("SafetyService");
end;
return function() --[[ Line: 22 ]]
    -- upvalues: v1 (ref), v9 (copy), v6 (copy), l_getVisibleAvatars_0 (copy), l_RunService_0 (copy), v7 (copy), v8 (copy)
    return function(v11) --[[ Line: 23 ]]
        -- upvalues: v1 (ref), v9 (ref), v6 (ref), l_getVisibleAvatars_0 (ref), l_RunService_0 (ref), v7 (ref), v8 (ref)
        if v1 == nil then
            return;
        else
            coroutine.wrap(function() --[[ Line: 29 ]]
                -- upvalues: v9 (ref), v11 (copy), v6 (ref), v1 (ref), l_getVisibleAvatars_0 (ref), l_RunService_0 (ref), v7 (ref), v8 (ref)
                v9.doPreScreenshot();
                v11:dispatch(v6());
                local _ = v1:TakeScreenshot({
                    registerContent = 1
                });
                local v13, _ = l_getVisibleAvatars_0();
                for _ = 1, 61 do
                    l_RunService_0.RenderStepped:Wait();
                end;
                v11:dispatch(v7());
                v9.doPostScreenshot();
                v11:dispatch(v8(v13));
            end)();
            return;
        end;
    end;
end;