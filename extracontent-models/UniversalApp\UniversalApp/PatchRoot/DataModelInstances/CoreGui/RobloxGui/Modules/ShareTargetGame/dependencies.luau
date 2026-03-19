local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps);
local v3 = v2.SocialLibraries.config({});
local v4 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger:new("ShareTargetGame");
local v5 = require(l_CorePackages_0.Packages.HttpRequest);
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v10 = v5.config({
    requestFunction = function(v7, v8, v9) --[[ Line: 12 ]] --[[ Name: requestFunction ]]
        -- upvalues: v4 (copy), v5 (copy)
        v4:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v8, v7));
        return v5.requestFunctions.HttpRbxApi(v7, v8, v9);
    end, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("ShareTargetGameHttpRetryCount", 4) else nil
});
return {
    Diag = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.Diag, 
    EventStream = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream, 
    Roact = require(l_CorePackages_0.Packages.Roact), 
    Rodux = require(l_CorePackages_0.Packages.Rodux), 
    RoactRodux = require(l_CorePackages_0.Packages.RoactRodux), 
    SocialLibraries = v3, 
    Text = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text, 
    UIBlox = require(l_CorePackages_0.Packages.UIBlox), 
    User = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel, 
    UniversalAppPolicy = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy, 
    withLocalization = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization, 
    LocalizationProvider = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider, 
    Promise = require(l_CorePackages_0.Packages.Promise), 
    request = v10, 
    SharedFlags = require(l_CorePackages_0.Workspace.Packages.SharedFlags), 
    RoactServices = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices, 
    RoactLocalization = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.Services.RoactLocalization), 
    Mock = v2.Mock
};