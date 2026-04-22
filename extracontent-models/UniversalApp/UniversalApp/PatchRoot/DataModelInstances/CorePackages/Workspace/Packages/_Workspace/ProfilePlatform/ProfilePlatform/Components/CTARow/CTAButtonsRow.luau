local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local _ = require(l_script_FirstAncestor_0.Common.Enums);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.Components.CTARow.CTAButton);
local v6 = require(l_Parent_0.Foundation);
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
local l_PopoverAlign_0 = v6.Enums.PopoverAlign;
local l_useTokens_0 = v6.Hooks.useTokens;
local v11 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.useDisabledReasonText);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagEnableProfilePlatformDisabledReasonText);
return function(v13) --[[ Line: 26 ]] --[[ Name: CTAButtonsRow ]]
    -- upvalues: v12 (copy), l_useTokens_0 (copy), v4 (copy), v11 (copy), v5 (copy), l_PopoverAlign_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v14 = if v12 then l_useTokens_0() else nil;
    local v17 = if v12 then v4.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: v13 (copy)
        for _, v16 in v13.buttonList do
            if v16.disabledReason then
                return v16.disabledReason;
            end;
        end;
        return nil;
    end, {
        v13.buttonList
    }) else nil;
    local v18 = if v12 then v11(v17) else nil;
    local v22 = v4.useMemo(function() --[[ Line: 44 ]]
        -- upvalues: v13 (copy), v4 (ref), v5 (ref), l_PopoverAlign_0 (ref)
        local v19 = {};
        for v20, v21 in v13.buttonList do
            v19[("CTAButton_%*"):format(v20)] = v4.createElement(v5, {
                buttonItem = v21, 
                layoutOrder = v20, 
                align = if v20 <= #v13.buttonList / 2 then l_PopoverAlign_0.Start else l_PopoverAlign_0.End
            });
        end;
        return v19;
    end, {
        v13.buttonList
    });
    return v4.createElement(l_View_0, {
        tag = "col gap-small size-full-0 auto-y", 
        LayoutOrder = v13.layoutOrder
    }, {
        ButtonRow = v4.createElement(l_View_0, {
            tag = "row gap-small size-full-0 auto-y", 
            LayoutOrder = 0
        }, v22), 
        DisabledReasonText = if v12 and v18 and v14 then v4.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = v18, 
            TextWrapped = true, 
            fontStyle = v14.Typography.CaptionMedium, 
            colorStyle = v14.Color.Content.Emphasis, 
            tag = "size-full-0 auto-y text-align-x-left text-align-y-bottom"
        }) else nil
    });
end;