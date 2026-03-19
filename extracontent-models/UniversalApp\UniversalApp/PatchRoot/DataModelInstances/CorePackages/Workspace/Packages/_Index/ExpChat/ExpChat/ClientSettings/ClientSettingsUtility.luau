local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Colors_0 = require(l_Parent_0.UIBlox).App.Style.Colors;
local l_ChatWindowBackgroundColor3_0 = require(l_script_FirstAncestor_0.Config).ChatWindowBackgroundColor3;
return {
    getBackgroundColor = function(v4, v5) --[[ Line: 14 ]] --[[ Name: getBackgroundColor ]]
        -- upvalues: l_ChatWindowBackgroundColor3_0 (copy), l_Colors_0 (copy)
        if v4.BackgroundColor3 == l_ChatWindowBackgroundColor3_0 then
            return l_Colors_0.Flint:Lerp(v4.BackgroundColor3, v5.preferredTransparency);
        else
            return v4.BackgroundColor3;
        end;
    end, 
    getBackgroundTransparency = function(v6, v7) --[[ Line: 22 ]] --[[ Name: getBackgroundTransparency ]]
        return v6.BackgroundTransparency * v7.preferredTransparency;
    end
};