local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_script_FirstAncestor_0.Config);
local v4 = require(l_script_FirstAncestor_0.Flags.FStringExpChatSummaryPrefixText);
return {
    getSummaryIconPrefix = function() --[[ Line: 11 ]] --[[ Name: getSummaryIconPrefix ]]
        -- upvalues: v2 (copy), v4 (copy)
        return (("<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>%*</font>%*"):format(v2.Enums.IconName.Nebula, v4));
    end, 
    wrapInSummaryMutedStyle = function(v5, v6) --[[ Line: 15 ]] --[[ Name: wrapInSummaryMutedStyle ]]
        -- upvalues: v3 (copy)
        return (("<font color='#%*' size=\"%*\">%*</font>"):format(v6 or "BCBEC8", v3.ChatWindowTextSize - 2, v5));
    end
};