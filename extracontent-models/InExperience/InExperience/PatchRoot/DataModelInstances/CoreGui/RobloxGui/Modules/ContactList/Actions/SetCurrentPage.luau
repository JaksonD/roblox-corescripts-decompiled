local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContactList_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList;
local _ = require(l_ContactList_0.Enums.Pages);
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v4) --[[ Line: 9 ]]
    return {
        page = v4
    };
end);