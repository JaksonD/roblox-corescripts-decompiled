local l_Parent_0 = script.Parent;
local v1 = ("rbxassetid://%*"):format((require(l_Parent_0.BuilderIconsFallback)));
return {
    Regular = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Regular), 
    Filled = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Bold), 
    Fallback = {
        Regular = Font.new(v1, Enum.FontWeight.Regular), 
        Filled = Font.new(v1, Enum.FontWeight.Bold)
    }
};