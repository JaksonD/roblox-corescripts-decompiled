local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.TitleDropDown);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v11 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v12 = v4.strictInterface({
    formFactor = v4.string, 
    isCompactView = v4.boolean, 
    isSearching = v4.boolean, 
    setVisible = v3.isCallable, 
    cancelSearch = v3.isCallable, 
    activateSearch = v3.isCallable, 
    buttonRef = v4.optional(v4.table), 
    navigateWithLock = v4.callback, 
    navigation = v4.table
});
return function(v13, v14) --[[ Line: 41 ]] --[[ Name: makeTopBarTitleDropDown ]]
    -- upvalues: v2 (copy), v12 (copy), l_withLocalization_0 (copy), v5 (copy), v9 (copy), l_AvatarScreen_0 (copy), v6 (copy), v11 (copy), v7 (copy)
    local function v18(v15) --[[ Line: 42 ]] --[[ Name: TopBarTitleDropDown ]]
        -- upvalues: v2 (ref), v12 (ref), l_withLocalization_0 (ref), v13 (copy), v5 (ref), v9 (ref), l_AvatarScreen_0 (ref), v14 (copy)
        v2.assert(v12(v15));
        return l_withLocalization_0({
            title = v13
        })(function(v16) --[[ Line: 47 ]]
            -- upvalues: v5 (ref), v9 (ref), v15 (copy), l_AvatarScreen_0 (ref), v14 (ref)
            return v5.createElement(v9, {
                Text = v16.title or "", 
                onActivated = function() --[[ Line: 50 ]] --[[ Name: onActivated ]]
                    -- upvalues: v15 (ref), l_AvatarScreen_0 (ref), v14 (ref)
                    local function v17() --[[ Line: 51 ]]
                        -- upvalues: v15 (ref), l_AvatarScreen_0 (ref), v14 (ref)
                        v15.navigation.navigate(l_AvatarScreen_0.AXTransitionContextualMenu, {
                            onOverlayClosed = v14
                        });
                    end;
                    v15.navigateWithLock(v17);
                end, 
                [v5.Ref] = v15.buttonRef
            });
        end);
    end;
    v18 = v6.connect(nil, function(v19) --[[ Line: 63 ]]
        -- upvalues: v11 (ref)
        return {
            navigateWithLock = function(v20) --[[ Line: 65 ]] --[[ Name: navigateWithLock ]]
                -- upvalues: v19 (copy), v11 (ref)
                v19(v11(v20));
            end
        };
    end)(v18);
    return (v7.withNavigation(v18));
end;