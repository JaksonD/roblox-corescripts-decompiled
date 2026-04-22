local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Service);
local v3 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local l_SideSheetPlacement_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enums.SideSheetPlacement;
local v5 = require(script.Parent.InGameMenuIntegrationUtils);
local v6 = v5.createPageOpenSignal("PlayersPage");
return v2:register({
    initialAvailability = v2.AvailabilitySignal.Available, 
    id = "people", 
    label = "CoreScripts.InGameMenu.PageTitle.Players", 
    sideSheetPlacement = l_SideSheetPlacement_0.Page, 
    activated = function(_) --[[ Line: 19 ]] --[[ Name: activated ]]
        -- upvalues: v5 (copy), v6 (copy)
        v5.toggleIGMPage("PlayersPage", v6:get());
    end, 
    isActivated = function() --[[ Line: 22 ]] --[[ Name: isActivated ]]
        -- upvalues: v6 (copy)
        return v6:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 26 ]] --[[ Name: Icon ]]
            -- upvalues: v3 (copy), v6 (copy)
            return v3("icons/menu/friends", "icons/menu/friendsOn", v6);
        end
    }
});