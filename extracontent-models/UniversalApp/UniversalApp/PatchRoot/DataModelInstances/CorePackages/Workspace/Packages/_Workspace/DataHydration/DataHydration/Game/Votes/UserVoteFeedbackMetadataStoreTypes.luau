local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v3 = require(l_Parent_0.t);
return {
    userVoteFeedbackMetadataResponseValidator = v3.interface({
        capabilities = v3.interface({
            can_submit_review = v3.boolean, 
            can_submit_category_options = v3.optional(v3.boolean), 
            can_submit_comment = v3.boolean
        }), 
        categories = v3.array(v3.interface({
            type = v3.string, 
            label = v3.string, 
            allows_multiple_selections = v3.boolean, 
            options = v3.array(v3.interface({
                id = v3.string, 
                label = v3.string
            }))
        })), 
        comment = v3.interface({
            label = v3.string, 
            placeholder_text = v3.string, 
            minimum_length = v3.number, 
            maximum_length = v3.number
        }), 
        metadata = v3.interface({
            disclaimer_label = v3.string, 
            submit_button_label = v3.string, 
            form_title_label = v3.string
        })
    })
};