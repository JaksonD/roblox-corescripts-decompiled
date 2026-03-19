local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.AvatarExperienceNavigation);
local v3 = require(script.Parent.useMultiItemShoppingFtux);
local l_AvatarScreen_0 = v2.Enums.AvatarScreen;
local v5 = game:DefineFastInt("AXMISIntroFtuxPromptDelay", 500);
return function(v6, v7) --[[ Line: 12 ]] --[[ Name: useCatalogPageMISIntroFtuxHook ]]
    -- upvalues: v3 (copy), v1 (copy), l_AvatarScreen_0 (copy), v5 (copy)
    local v8 = v3();
    local v9 = v6 and v6.opaque and v6.opaque.name;
    local l_routeName_0 = v7.state.routeName;
    v1.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: v8 (copy), v9 (copy), l_AvatarScreen_0 (ref), l_routeName_0 (copy), v5 (ref), v7 (copy)
        if v8.shouldShowIntroPrompt() and v9 == l_AvatarScreen_0.Catalog and l_routeName_0 == v9 then
            task.delay(v5 / 1000, function() --[[ Line: 23 ]]
                -- upvalues: v7 (ref), l_AvatarScreen_0 (ref), v8 (ref)
                v7.navigate(l_AvatarScreen_0.TryOnMultipleItemsFtuxPrompt, {
                    onConfirm = function() --[[ Line: 25 ]] --[[ Name: onConfirm ]]
                        -- upvalues: v8 (ref)
                        v8.setShowIntroPromptCount();
                    end
                });
            end);
        end;
    end, {
        v8, 
        v7, 
        v9, 
        l_routeName_0
    });
end;