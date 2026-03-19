local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v3 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagEnableNapPageNavigationContext);
local v6 = {
    Intro = "intro", 
    Resolution = "resolution", 
    SecondChanceIntro = "second-chance-intro", 
    SecondChanceConclusion = "second-chance-conclusion", 
    Unknown = "unknown"
};
local v7 = {
    Rule = "policy-rule-", 
    Importance = "policy-importance-"
};
return {
    renderPageItemsFromList = function(v8, v9, v10, v11, v12, v13, v14, v15) --[[ Line: 73 ]] --[[ Name: renderPageItemsFromList ]]
        -- upvalues: v5 (copy), v3 (copy), l_View_0 (copy)
        local v16 = {};
        for v17, v18 in ipairs(v8) do
            if v5 then
                if v18.getIsVisible(v9, v11, v14, v15) then
                    local v19 = v3.createElement(v18.renderComponent, {
                        moderationDetail = v9, 
                        layoutOrder = v17, 
                        dispatch = v10, 
                        hasEducationalPages = v12
                    });
                    if v13 == false then
                        table.insert(v16, v3.createElement(l_View_0, {
                            tag = "size-full-0 auto-y padding-bottom-large", 
                            LayoutOrder = v17
                        }, {
                            Content = v19
                        }));
                    else
                        table.insert(v16, v19);
                    end;
                end;
            elseif v18.getIsVisible(v9, v11) then
                table.insert(v16, v3.createElement(v18.renderComponent, {
                    moderationDetail = v9, 
                    layoutOrder = v17, 
                    dispatch = v10, 
                    hasEducationalPages = v12
                }));
            end;
        end;
        return v16;
    end, 
    EDUCATIONAL_PAGE_PREFIXES = v7, 
    STATIC_PAGE_NAMES = v6
};