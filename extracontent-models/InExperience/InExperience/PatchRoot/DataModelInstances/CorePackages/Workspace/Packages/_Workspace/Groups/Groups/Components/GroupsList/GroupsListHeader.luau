local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v5 = require(l_Parent_0.Foundation);
local l_View_0 = v5.View;
local l_Text_0 = v5.Text;
local l_Button_0 = v5.Button;
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_InputSize_0 = v5.Enums.InputSize;
local v11 = require(l_Parent_0.AppHeaderBar);
local v12 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v13 = require(l_script_FirstAncestor_0.Contexts.useGroupsWrapperContext);
return function(v14) --[[ Line: 33 ]] --[[ Name: GroupsListHeader ]]
    -- upvalues: v13 (copy), l_useNavigation_0 (copy), l_useLocalization_0 (copy), v12 (copy), v2 (copy), v11 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v15 = v13();
    local v16 = l_useNavigation_0();
    local v17 = l_useLocalization_0({
        title = v12.HeadingGroups, 
        seeAll = v12.ActionSeeAll
    });
    local v18 = v2.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: v16 (copy)
        v16.goBack();
    end, {
        v16
    });
    local v19 = v2.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v11 (ref), v18 (copy)
        return v11.makeBackButton(v18);
    end, {
        v18
    });
    local v21 = v2.useMemo(function() --[[ Line: 50 ]]
        -- upvalues: v19 (copy), v2 (ref), l_View_0 (ref)
        local v20 = v19();
        return v2.createElement(l_View_0, {
            tag = "size-0 auto-xy align-x-left", 
            LayoutOrder = 1
        }, {
            button = v20
        });
    end, {
        v19
    });
    return v2.createElement("Frame", {
        LayoutOrder = v14.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        LeftSection = v2.createElement(l_View_0, {
            tag = "row auto-xy align-y-center gap-small"
        }, {
            BackButton = v21, 
            Title = v2.createElement(l_Text_0, {
                Text = v17.title, 
                tag = "text-align-x-left content-default text-heading-medium", 
                LayoutOrder = 2
            })
        }), 
        SeeAllButton = v2.createElement(l_Button_0, {
            text = v17.seeAll, 
            variant = l_ButtonVariant_0.Text, 
            size = l_InputSize_0.Medium, 
            onActivated = v15.navigateTo.seeAllGroups, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0)
        })
    });
end;