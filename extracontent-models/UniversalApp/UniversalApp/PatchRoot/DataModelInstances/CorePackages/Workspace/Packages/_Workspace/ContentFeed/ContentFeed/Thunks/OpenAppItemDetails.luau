local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.NavigationRodux);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = v2.Thunks.NavigateDown;
return function(v5) --[[ Line: 14 ]]
    -- upvalues: l_AppPage_0 (copy), v1 (copy), l_NavigateDown_0 (copy)
    return function(v6) --[[ Line: 15 ]]
        -- upvalues: v5 (copy), l_AppPage_0 (ref), v1 (ref), l_NavigateDown_0 (ref)
        local v7 = "Asset" .. v5;
        local v8 = {
            fromContentFeed = true, 
            itemDetailsPeekViewRefs = {}, 
            itemId = v5, 
            itemType = "Asset", 
            mountAnimation = false, 
            mountAsFullView = true
        };
        local v9 = {
            name = l_AppPage_0.AvatarExperienceWrapper, 
            detail = v7, 
            extraProps = {
                routeName = "ItemDetails", 
                params = v1.Dictionary.join(v8, {
                    detail = v7
                })
            }
        };
        v6:dispatch(l_NavigateDown_0(v9));
    end;
end;