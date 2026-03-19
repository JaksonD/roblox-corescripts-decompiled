local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(script.Parent);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local v5 = require(script.Parent.friendsWithPresence);
return function(v6) --[[ Line: 10 ]]
    -- upvalues: l_Roact_0 (copy), v2 (copy), l_llama_0 (copy), v5 (copy)
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        frame = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(0, 150, 0, 0), 
            BackgroundTransparency = 1
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 6)
            }), 
            OnlineFriend = l_Roact_0.createElement(v2, l_llama_0.Dictionary.join(v6, {
                user = v5.OnlineFriend
            })), 
            DeletedFriend = l_Roact_0.createElement(v2, l_llama_0.Dictionary.join(v6, {
                user = v5.DeletedFriend
            })), 
            OfflineFriend = l_Roact_0.createElement(v2, l_llama_0.Dictionary.join(v6, {
                user = v5.OfflineFriend
            })), 
            InGameFriend = l_Roact_0.createElement(v2, l_llama_0.Dictionary.join(v6, {
                user = v5.InGameFriend
            })), 
            InGameWithoutLastLocationFriend = l_Roact_0.createElement(v2, l_llama_0.Dictionary.join(v6, {
                user = v5.InGameWithoutLastLocationFriend
            })), 
            InStudioFriend = l_Roact_0.createElement(v2, l_llama_0.Dictionary.join(v6, {
                user = v5.InStudioFriend
            })), 
            InStudioWithoutLastLocationFriend = l_Roact_0.createElement(v2, l_llama_0.Dictionary.join(v6, {
                user = v5.InStudioWithoutLastLocationFriend
            }))
        })
    });
end;