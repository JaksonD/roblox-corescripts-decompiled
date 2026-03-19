local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Enums.HeadShape);
local v5 = require(l_script_FirstAncestor_0.Actions.SetAvailableHeadShapes);
local v6 = require(l_script_FirstAncestor_0.Actions.SetLastSelectedHeadShape);
local function _() --[[ Line: 25 ]] --[[ Name: getDefaultState ]]
    -- upvalues: v4 (copy)
    return {
        availableHeadShapes = {}, 
        lastSelectedHeadShape = v4.Default
    };
end;
return v2.createReducer({
    availableHeadShapes = {}, 
    lastSelectedHeadShape = v4.Default
}, {
    [v5.name] = function(v8, v9) --[[ Line: 38 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v8, {
            availableHeadShapes = v9.headShapes
        });
    end, 
    [v6.name] = function(v10, v11) --[[ Line: 44 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v10, {
            lastSelectedHeadShape = v11.headShape
        });
    end
});