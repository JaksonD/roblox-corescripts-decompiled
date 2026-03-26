local l_Parent_0 = script:FindFirstAncestor("GameJoinCard").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Sheet_0 = v2.Sheet;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local v7 = {
    0.5
};
return function(v8) --[[ Line: 21 ]] --[[ Name: MobileGameJoinCard ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Sheet_0 (copy), v7 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v9 = l_useTokens_0();
    return v1.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        onClose = v8.onClose, 
        snapPoints = v7
    }, {
        Header = v1.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = true
        }, {
            Title = v1.createElement(l_View_0, {
                tag = "size-full auto-xy align-x-center"
            }, {
                TitleText = v1.createElement(l_Text_0, {
                    tag = "auto-xy text-align-x-left", 
                    Text = "Join Game", 
                    fontStyle = v9.Typography.HeadingSmall, 
                    textStyle = v9.Color.Content.Emphasis
                })
            })
        }), 
        Content = v1.createElement(l_Sheet_0.Content, nil, {
            Placeholder = v1.createElement(l_View_0, {
                tag = "size-full auto-y padding-xlarge align-x-center align-y-center"
            })
        })
    });
end;