local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
if require(l_Modules_0.LuaApp.Flags.GetFFlagUsePackageUsernameValidation)() then
    local l_CorePackages_0 = game:GetService("CorePackages");
    return require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.UsernameValidationContext;
else
    return {
        Unknown = "Unknown", 
        Signup = "Signup", 
        UsernameChange = "UsernameChange"
    };
end;