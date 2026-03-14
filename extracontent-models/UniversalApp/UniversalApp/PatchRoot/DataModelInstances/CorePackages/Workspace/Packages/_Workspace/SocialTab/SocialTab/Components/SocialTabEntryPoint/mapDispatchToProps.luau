local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_fetchChatMetadata_0 = v1.AppChat.Conversations.Thunks.fetchChatMetadata;
local l_NavigateIntoChat_0 = v1.AppChat.Actions.NavigateIntoChat;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
return function(v8) --[[ Line: 14 ]]
    -- upvalues: l_fetchChatMetadata_0 (copy), l_NavigateIntoChat_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    return {
        fetchChatSettings = function(_) --[[ Line: 16 ]] --[[ Name: fetchChatSettings ]]
            -- upvalues: v8 (copy), l_fetchChatMetadata_0 (ref)
            return v8(l_fetchChatMetadata_0()):andThen(function(_) --[[ Line: 17 ]]

            end);
        end, 
        navigateIntoChat = function(v11) --[[ Line: 19 ]] --[[ Name: navigateIntoChat ]]
            -- upvalues: v8 (copy), l_NavigateIntoChat_0 (ref)
            v8(l_NavigateIntoChat_0(v11));
        end, 
        navigateToAddFriends = if l_FFlagCreateConnectionsHub_0 then nil else function() --[[ Line: 24 ]]
            -- upvalues: v8 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v8(l_NavigateDown_0({
                name = l_AppPage_0.AddFriendsPage
            }));
        end
    };
end;