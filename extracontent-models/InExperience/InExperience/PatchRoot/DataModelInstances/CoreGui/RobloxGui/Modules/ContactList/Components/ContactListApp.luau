local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_ContactList_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList;
local v7 = require(l_ContactList_0.Components.ContactListContainer);
local v8 = require(l_ContactList_0.Components.CallBarContainer);
local v9 = require(l_ContactList_0.Components.CallDialogContainer);
local v10 = require(l_ContactList_0.Components.PlayerMenuContainer);
return function() --[[ Line: 19 ]]
    -- upvalues: v2 (copy), v3 (copy), v7 (copy), l_SoundManager_0 (copy), l_SoundGroups_0 (copy), v9 (copy), v10 (copy), v8 (copy)
    local v11 = v2.useMemo(function() --[[ Line: 23 ]]
        -- upvalues: v3 (ref), v7 (ref)
        return v3.createAppContainer(v3.createRobloxStackNavigator({
            {
                ContactList = {
                    screen = v7
                }
            }
        }, {
            defaultNavigationOptions = {
                absorbInput = false
            }
        }));
    end, {});
    v2.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: l_SoundManager_0 (ref), l_SoundGroups_0 (ref)
        l_SoundManager_0:CreateSoundGroup(l_SoundGroups_0.Iris.Name);
    end, {});
    return v2.createElement("Folder", {}, {
        CallDialogContainer = v2.createElement(v9), 
        ContactListContainer = v2.createElement(v11), 
        PlayerMenuContainer = v2.createElement(v10), 
        CallBarContainer = v2.createElement(v8)
    });
end;