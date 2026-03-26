local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v3 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v5 = {
    Intro = "intro", 
    Resolution = "resolution", 
    SecondChanceIntro = "second-chance-intro", 
    SecondChanceConclusion = "second-chance-conclusion", 
    Unknown = "unknown"
};
local v6 = {
    Rule = "policy-rule-", 
    Importance = "policy-importance-"
};
return {
    renderPageItemsFromList = function(v7, v8, v9, v10, v11, v12, v13, v14) --[[ Line: 72 ]] --[[ Name: renderPageItemsFromList ]]
        -- upvalues: v3 (copy), l_View_0 (copy)
        local v15 = {};
        for v16, v17 in ipairs(v7) do
            if v17.getIsVisible(v8, v10, v13, v14) then
                local v18 = v3.createElement(v17.renderComponent, {
                    moderationDetail = v8, 
                    layoutOrder = v16, 
                    dispatch = v9, 
                    hasEducationalPages = v11
                });
                if v12 == false then
                    table.insert(v15, v3.createElement(l_View_0, {
                        tag = "size-full-0 auto-y padding-bottom-large", 
                        LayoutOrder = v16
                    }, {
                        Content = v18
                    }));
                else
                    table.insert(v15, v18);
                end;
            end;
        end;
        return v15;
    end, 
    EDUCATIONAL_PAGE_PREFIXES = v6, 
    STATIC_PAGE_NAMES = v5
};