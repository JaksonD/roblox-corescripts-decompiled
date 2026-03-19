local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.AvatarExperienceNavigation);
local v3 = require(script.Parent.useMakeupFtux);
local l_AvatarScreen_0 = v2.Enums.AvatarScreen;
local v5 = game:DefineFastInt("AXMakeupReleaseFtuxPromptDelayMS", 500);
return function(v6, v7, v8) --[[ Line: 15 ]] --[[ Name: useCatalogPageMakeupReleaseFtuxHook ]]
    -- upvalues: v3 (copy), v1 (copy), l_AvatarScreen_0 (copy), v5 (copy)
    local v9 = v3();
    local v10 = v6 and v6.opaque and v6.opaque.name;
    local l_routeName_0 = v7.state.routeName;
    v1.useEffect(function() --[[ Line: 24 ]]
        -- upvalues: v9 (copy), v10 (copy), l_AvatarScreen_0 (ref), l_routeName_0 (copy), v5 (ref), v7 (copy), v8 (copy)
        local v12 = nil;
        if v9.shouldShowMakeupReleasePrompt() and v10 == l_AvatarScreen_0.Catalog and l_routeName_0 == v10 then
            v12 = task.delay(v5 / 1000, function() --[[ Line: 32 ]]
                -- upvalues: v7 (ref), l_AvatarScreen_0 (ref), v9 (ref), v8 (ref)
                v7.navigate(l_AvatarScreen_0.MakeupReleaseFtuxPrompt, {
                    onView = function() --[[ Line: 34 ]] --[[ Name: onView ]]
                        -- upvalues: v9 (ref), v8 (ref)
                        v9.setShownMakeupReleasePrompt();
                        v8();
                    end, 
                    onDismiss = function() --[[ Line: 38 ]] --[[ Name: onDismiss ]]
                        -- upvalues: v9 (ref)
                        v9.setShownMakeupReleasePrompt();
                    end
                });
            end);
        end;
        return function() --[[ Line: 45 ]]
            -- upvalues: v12 (ref)
            if v12 then
                task.cancel(v12);
            end;
        end;
    end, {
        v9, 
        v7, 
        v10, 
        l_routeName_0, 
        v8
    });
end;