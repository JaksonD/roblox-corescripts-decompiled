local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabsPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v4 = require(l_Parent_0.UserList);
local l_UserListLayoutAdaptor_0 = v4.UserListLayoutAdaptor;
local l_LayoutMode_0 = v4.Enums.LayoutMode;
local l_EntityType_0 = v4.Enums.EntityType;
local v8 = require(l_script_FirstAncestor_0.Contexts.useSocialTabsContext);
local v9 = require(l_script_FirstAncestor_0.Hooks.useMutualsList);
local v10 = require(l_script_FirstAncestor_0.Hooks.useFetchPresences);
local v11 = require(l_script_FirstAncestor_0.Hooks.useUserPresence);
local function v14(v12) --[[ Line: 18 ]] --[[ Name: MutualFriendRow ]]
    -- upvalues: v11 (copy)
    local v13 = v11(v12.entity.id);
    return v12.createRow({
        presence = v13
    });
end;
return function() --[[ Line: 26 ]] --[[ Name: MutualsTabContent ]]
    -- upvalues: v8 (copy), v9 (copy), v2 (copy), l_EntityType_0 (copy), v10 (copy), v14 (copy), l_View_0 (copy), l_UserListLayoutAdaptor_0 (copy), l_LayoutMode_0 (copy)
    local l_profileId_0 = v8().profileId;
    local v16 = v9(l_profileId_0);
    local v20 = v2.useMemo(function() --[[ Line: 32 ]]
        -- upvalues: v16 (copy), l_EntityType_0 (ref)
        local v17 = {};
        for _, v19 in v16.mutualFriends do
            table.insert(v17, {
                id = v19.id, 
                type = l_EntityType_0.User
            });
        end;
        return v17;
    end, {
        v16.mutualFriends
    });
    local v24 = v2.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: v20 (copy)
        local v21 = {};
        for _, v23 in v20 do
            table.insert(v21, v23.id);
        end;
        return v21;
    end, {
        v20
    });
    v10(v24);
    local v28 = v2.useCallback(function(v25, v26, _) --[[ Line: 50 ]]
        -- upvalues: v2 (ref), v14 (ref)
        return v2.createElement(v14, {
            createRow = v25, 
            entity = v26
        });
    end, {});
    if v16.isLoading and #v20 == 0 then
        return v2.createElement(l_View_0, {
            tag = "size-full"
        });
    else
        return v2.createElement(l_View_0, {
            tag = "col size-full padding-x-xlarge"
        }, {
            MutualsList = v2.createElement(l_UserListLayoutAdaptor_0, {
                entities = v20, 
                layoutMode = l_LayoutMode_0.Vertical, 
                isScrollEnabled = true, 
                hasMore = v16.hasMore, 
                onLoadMore = if v16.hasMore then v16.loadMore else nil, 
                renderRow = v28
            })
        });
    end;
end;