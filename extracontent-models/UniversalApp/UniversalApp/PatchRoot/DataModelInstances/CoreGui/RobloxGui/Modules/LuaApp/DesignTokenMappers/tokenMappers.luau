local l_CorePackages_0 = game:GetService("CorePackages");
local l_engagementScreenTokenMapper_0 = require(l_CorePackages_0.Workspace.Packages.EngagementScreen).engagementScreenTokenMapper;
local v2 = if require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAbuseReport10ft() then require(l_CorePackages_0.Workspace.Packages.AbuseReporting).abuseReportingTokenMapper else nil;
local l_experienceDetailsTokenMapper_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.DesignTokenMappers.experienceDetailsTokenMapper;
local l_GetFFlagEnableMultiPageSignup_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableMultiPageSignup;
local v5 = nil;
local v6 = nil;
if l_GetFFlagEnableMultiPageSignup_0() then
    v5 = require(l_CorePackages_0.Workspace.Packages.MultiPageSignup).Components.MultiPageSignupTokenMapper;
    v6 = require(l_CorePackages_0.Workspace.Packages.UserActivationFramework).Components.ActivationFrameworkTokenMapper;
end;
return {
    App = require(script.Parent.appTokenMapper), 
    HomeOmniFeed = require(script.Parent.homeOmniFeedTokenMapper), 
    Search = require(script.Parent.searchTokenMapper), 
    SeeAll = require(script.Parent.seeAllTokenMapper), 
    ExperienceDetails = l_experienceDetailsTokenMapper_0, 
    EngagementScreen = l_engagementScreenTokenMapper_0, 
    LoginView = require(script.Parent.loginViewTokenMapper), 
    SignUpView = require(script.Parent.signUpPageViewTokenMapper), 
    AuthCompliance = require(script.Parent.complianceTokenMapper), 
    LandingPage = require(script.Parent.landingPageTokenMapper), 
    Layout = require(script.Parent.layoutTokenMapper), 
    AbuseReporting = v2, 
    More = require(script.Parent.moreTokenMappers), 
    CrossDeviceLogin = require(script.Parent.crossDeviceLoginTokenMapper), 
    FriendsLanding = require(script.Parent.friendsLandingTokenMapper), 
    GamepadDisconnect = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadDisconnectTokenMapper, 
    Banner = require(script.Parent.bannerTokenMapper), 
    MultiPageSignup = v5, 
    ActivationFramework = v6
};