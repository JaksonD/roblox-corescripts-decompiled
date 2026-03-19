local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Actions.Authentication.SetSignUpBirthday);
local l_Birthday_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Models.Birthday;
return require(l_CorePackages_0.Packages.Rodux).createReducer(l_Birthday_0.new(), {
    [v2.name] = function(_, v5) --[[ Line: 9 ]]
        -- upvalues: l_Birthday_0 (copy)
        assert(l_Birthday_0.is(v5.birthday), "SignUpBirthday must be a Birthday model");
        return v5.birthday;
    end
});