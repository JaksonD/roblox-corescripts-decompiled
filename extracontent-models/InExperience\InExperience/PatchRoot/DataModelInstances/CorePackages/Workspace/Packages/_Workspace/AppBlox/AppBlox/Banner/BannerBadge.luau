local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_Icon_0 = v2.Icon;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_withDefaults_0 = v2.Utility.withDefaults;
local l_withCommonProps_0 = v2.Utility.withCommonProps;
local l_IconSize_0 = v2.Enums.IconSize;
local l_IconPosition_0 = v2.Enums.IconPosition;
local v11 = {
    testId = "--badge"
};
return v1.memo(v1.forwardRef(function(v12, v13) --[[ Line: 54 ]] --[[ Name: BannerBadge ]]
    -- upvalues: l_withDefaults_0 (copy), v11 (copy), l_useTokens_0 (copy), l_IconSize_0 (copy), v1 (copy), l_IconPosition_0 (copy), l_Icon_0 (copy), l_View_0 (copy), l_withCommonProps_0 (copy), l_Text_0 (copy)
    local v14 = l_withDefaults_0(v12, v11);
    local v15 = l_useTokens_0();
    local l_XSmall_0 = l_IconSize_0.XSmall;
    local v17 = v1.useMemo(function() --[[ Line: 61 ]]
        -- upvalues: v14 (copy), l_IconPosition_0 (ref)
        if typeof(v14.icon) == "string" then
            return {
                name = v14.icon, 
                position = l_IconPosition_0.Left
            };
        else
            return v14.icon;
        end;
    end, {
        v14.icon
    });
    local v18 = false;
    if v14.text ~= nil then
        v18 = #v14.text > 0;
    end;
    local v19 = not v18;
    local v20 = {
        container = {
            tag = "radius-circle row align-y-center align-x-center gap-xsmall", 
            backgroundStyle = v15.Color.Shift.Shift_300, 
            stroke = nil
        }, 
        text = {
            tag = "auto-xy text-label-small"
        }, 
        content = {
            style = v15.Color.Content.Emphasis
        }
    };
    if v19 then
        v20.container.tag = v20.container.tag .. " size-600";
    else
        v20.container.tag = v20.container.tag .. " size-0-600 auto-x padding-x-small";
    end;
    local v21 = nil;
    if v17 ~= nil then
        v21 = v1.createElement(l_Icon_0, {
            name = v17.name, 
            variant = v17.variant, 
            size = l_XSmall_0, 
            style = v20.content.style, 
            LayoutOrder = v17.position == l_IconPosition_0.Left and 1 or 3, 
            testId = ("%*--icon"):format(v14.testId)
        });
    end;
    return v1.createElement(l_View_0, l_withCommonProps_0(v14, {
        backgroundStyle = v20.container.backgroundStyle, 
        tag = v20.container.tag, 
        ref = v13
    }), {
        Icon = v21, 
        Text = if v18 then v1.createElement(l_Text_0, {
            Text = v14.text, 
            textStyle = v20.content.style, 
            RichText = true, 
            LayoutOrder = 2, 
            tag = v20.text.tag, 
            testId = ("%*--text"):format(v14.testId)
        }) else nil
    });
end));