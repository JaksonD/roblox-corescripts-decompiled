local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.SignalsReact);
local v5 = require(l_Parent_0.BuilderIcons);
local v6 = require(l_script_FirstAncestor_0.Stores.GetSelectedUsersStore);
return v2.memo(function() --[[ Line: 13 ]] --[[ Name: FriendCountLabel ]]
    -- upvalues: v6 (copy), v4 (copy), v3 (copy), v2 (copy), v5 (copy)
    local v7 = v6(false);
    local v8 = v4.useSignalBinding(v7.getSelectedUserIdsCount());
    local v9 = v4.useSignalBinding(v7.getMaxSize());
    local v10 = v3.Hooks.useTokens();
    return v2.createElement(v3.View, {
        tag = "col auto-xy padding-y-small gap-small align-x-center"
    }, {
        v2.createElement(v3.Icon, {
            style = v10.Semantic.Color.Icon.Emphasis, 
            name = v5.Migration.uiblox["icons/actions/friend_sort/add_friends"].name, 
            variant = v3.Enums.IconVariant.Filled, 
            size = v3.Enums.IconSize.Large, 
            LayoutOrder = 1
        }); 
        Label = v2.createElement(v3.Text, {
            tag = "auto-xy text-truncate-end text-caption-large content-emphasis", 
            Text = v2.joinBindings({
                v8, 
                v9
            }):map(function(v11) --[[ Line: 32 ]]
                return (("%*/%*"):format(v11[1], v11[2]));
            end), 
            LayoutOrder = 2
        })
    });
end);