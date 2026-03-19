local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_PlaceId_0 = game.PlaceId;
local v3 = select("#", ...);
if l_PlaceId_0 <= 0 and v3 > 0 then
    l_PlaceId_0 = select(1, ...);
end;
if game:DefineFastFlag("EnableExperienceGenericChallengeRenderingOnLoadingScript", false) then
    coroutine.wrap(function() --[[ Line: 23 ]]
        -- upvalues: l_CorePackages_0 (copy)
        require(l_CorePackages_0.Workspace.Packages.GenericChallenges).Middleware.InitExperienceChallengeInterceptor();
    end)();
end;
local l_loadingScript_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceLoadingScript).loadingScript;
coroutine.wrap(l_loadingScript_0)(l_PlaceId_0, 72);