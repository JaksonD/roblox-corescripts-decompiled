local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabsPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local v6 = require(l_script_FirstAncestor_0.Contexts.useSocialTabsContext);
return function() --[[ Line: 11 ]] --[[ Name: FriendsTabContent ]]
    -- upvalues: v6 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy)
    local _ = v6().profileId;
    return v2.createElement(l_View_0, {
        tag = "col align-x-center align-y-center size-full"
    }, {
        Placeholder = v2.createElement(l_Text_0, {
            tag = "auto-xy text-body-large content-default", 
            Text = ""
        })
    });
end;