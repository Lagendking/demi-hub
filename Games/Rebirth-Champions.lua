------> Values <------
getgenv().autoTap = false
getgenv().autoHatch1 = false
getgenv().autoHatch3 = false
getgenv().autoCraft = false
getgenv().autoRebirth = false
getgenv().egg = "Basic"
getgenv().world = "Forest"
getgenv().Rebirth = 1


------> Auto update stuff <------
local List = {"K","M","B","T","Qd","Qn","Sx","Sp","O","N","De","Ud","DD","tdD","qdD","QnD","sxD","SpD","OcD","NvD","Vgn","UVg","DVg","TVg","qtV","QnV","SeV","SPG","OVG","NVG","TGN","UTG","DTG"}
function Suffix(Num)

	local listCount = 0

	while Num / 1000 >= 1 do

		listCount = listCount + 1

		Num = Num / 1000
	end

	if listCount == 0 then return Num end

	return math.floor(Num*10)/10 ..List[listCount]
end

local Mod = require(game:GetService("ReplicatedStorage").Modules.Rebirths)

local Rebirths = {}
for _, v in next, Mod do

    table.insert(Rebirths, {Option = {Amount = Suffix(v["R"]), Real = v["R"]}})
end

local ROptions = {}
for _, v in ipairs(Rebirths) do

    table.insert(ROptions, v["Option"]["Amount"])
end

local eggs = {}
for _, v in pairs(game:GetService("Workspace").Scripts.Eggs:GetChildren()) do

    table.insert(eggs, v.Name)
end

local worlds = {}
for _, v in pairs(game:GetService("Workspace").Scripts.TeleportTo:GetChildren()) do

    table.insert(worlds, v.Name)
end

------> Start <------
local getName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

print(getName.Name)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = getName.Name, HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest", IntroIcon = "https://www.roblox.com/library/10677758875/DH", IntroText = "Rebirth Champions"})

local Tab = Window:MakeTab({
	Name = "Auto",
	Icon = "rbxassetid://5012544693",
	PremiumOnly = false
})

local Tab1 = Window:MakeTab({
	Name = "Menus",
	Icon = "rbxassetid://5012544693",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://5012544693",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://6022668888",
	PremiumOnly = false
})

Tab3:AddParagraph("                                             Credits", string.format("\nRCX Script: Lagend#4320"))

------> TAB stuff <------
Tab:AddToggle({
    Name = "Click",
    Default = false,
    Callback = function(Value)
        autoTap = Value

        spawn(function()

            while autoTap do

               wait()
               game:GetService("ReplicatedStorage").Events.Click3:FireServer()
            end
        end)
    end
})


Tab:AddToggle({
    Name = "Craft",
    Default = false,
    Callback = function(Value)
        autoCraft = Value

        spawn(function()

            while autoCraft do

               wait(0.5)
               local args = {
                    [1] = "CraftAll",
                    [2] = {}
                }

                game:GetService("ReplicatedStorage").Functions.Request:InvokeServer(unpack(args))
            end
        end)
    end
})


Tab:AddToggle({
    Name = "Potion",
    Default = false,
    Callback = function(Value)
        autoPotion = Value

        spawn(function()

            while autoPotion do

                wait(0.25)
                local args = {[1] = "x2PetXP"}
                game:GetService("ReplicatedStorage").Events.Potion:FireServer(unpack(args))
                local args = {[1] = "x2Luck"}
                game:GetService("ReplicatedStorage").Events.Potion:FireServer(unpack(args))
                local args = {[1] = "x2Clicks"}
                game:GetService("ReplicatedStorage").Events.Potion:FireServer(unpack(args))
                local args = {[1] = "x2Rebirths"}
                game:GetService("ReplicatedStorage").Events.Potion:FireServer(unpack(args))
                local args = {[1] = "x2Gems"}
                game:GetService("ReplicatedStorage").Events.Potion:FireServer(unpack(args))
                local args = {[1] = "x2HatchSpeed"}
                game:GetService("ReplicatedStorage").Events.Potion:FireServer(unpack(args))
            end
        end)
    end
})


local Section = Tab:AddSection({
	Name = "Hatching"
})


Tab:AddToggle({
    Name = "Hatch x1",
    Default = false,
    Callback = function(Value)
        autoHatch1 = Value

        spawn(function()

            while autoHatch1 do

               wait()
                local args = {
                    [1] = egg,
                    [2] = "Single"
                }

                game:GetService("ReplicatedStorage").Functions.Unbox:InvokeServer(unpack(args))
            end
        end)
    end
})


Tab:AddToggle({
    Name = "Hatch x3",
    Default = false,
    Callback = function(Value)
        autoHatch3 = Value

        spawn(function()

            while autoHatch3 do

               wait()
                local args = {
                    [1] = egg,
                    [2] = "Triple"
                }

                game:GetService("ReplicatedStorage").Functions.Unbox:InvokeServer(unpack(args))
            end
        end)
    end
})


Tab:AddDropdown({
	Name = "Select Egg",
	Default = "Basic",
	Options = {unpack(eggs)},

	Callback = function(Value)

		egg = Value
	end    
})


local Section = Tab:AddSection({
	Name = "Rebirths"
})


Tab:AddToggle({
    Name = "Rebirth",
    Default = false,
    Callback = function(Value)
        autoRebirth = Value

        spawn(function()

            while autoRebirth do

               wait()
               local args = {
                    [1] = Rebirth
                }

                game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
            end
        end)
    end
})


Tab:AddDropdown({
	Name = "Select Rebirth",
	Default = 1,
	Options = {unpack(ROptions)},

	Callback = function(Value)

	    for i, v in ipairs(Rebirths) do

		    if tostring(v["Option"]["Amount"]) == tostring(Value) then

		        Rebirth = i
		    end
	    end
	end    
})

------> TAB 1 stuff <------
local Menu = "Index"
local indexTransparency = workspace.Scripts.Spawn[Menu].Touch.Transparency
local indexPos = workspace.Scripts.Spawn[Menu].Touch.Position

Tab1:AddButton({
	Name = "Index",
	Callback = function()

	    workspace.Scripts.Spawn[Menu].Touch.Transparency = 1
        workspace.Scripts.Spawn[Menu].Touch.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

        wait(0.1)

        workspace.Scripts.Spawn[Menu].Touch.Transparency = indexTransparency
        workspace.Scripts.Spawn[Menu].Touch.Position = indexPos
  	end    
})


local Menu = "Auras"
local auraTransparency = workspace.Scripts.Spawn[Menu].Touch.Transparency
local auraPos = workspace.Scripts.Spawn[Menu].Touch.Position

Tab1:AddButton({
	Name = "Auras",
	Callback = function()

	    workspace.Scripts.Spawn[Menu].Touch.Transparency = 1
        workspace.Scripts.Spawn[Menu].Touch.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

        wait(0.1)

        workspace.Scripts.Spawn[Menu].Touch.Transparency = auraTransparency
        workspace.Scripts.Spawn[Menu].Touch.Position = auraPos
  	end    
})


local Menu = "Upgrades"
local upgradesTransparency = workspace.Scripts.Spawn[Menu].Touch.Transparency
local upgradesPos = workspace.Scripts.Spawn[Menu].Touch.Position

Tab1:AddButton({
	Name = "Upgrades",
	Callback = function()

	    workspace.Scripts.Spawn[Menu].Touch.Transparency = 1
        workspace.Scripts.Spawn[Menu].Touch.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

        wait(0.1)

        workspace.Scripts.Spawn[Menu].Touch.Transparency = upgradesTransparency
        workspace.Scripts.Spawn[Menu].Touch.Position = upgradesPos
  	end    
})


local Menu = "TapSkins"
local tapSkinsTransparency = workspace.Scripts.Spawn[Menu].Touch.Transparency
local tapSkinsPos = workspace.Scripts.Spawn[Menu].Touch.Position

Tab1:AddButton({
	Name = "Tap Skins",
	Callback = function()

	    workspace.Scripts.Spawn[Menu].Touch.Transparency = 1
        workspace.Scripts.Spawn[Menu].Touch.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

        wait(0.1)

        workspace.Scripts.Spawn[Menu].Touch.Transparency = tapSkinsTransparency
        workspace.Scripts.Spawn[Menu].Touch.Position = tapSkinsPos
  	end    
})


local Menu = "PetMachine"
local petMachineTransparency = workspace.Scripts.Spawn[Menu].Touch.Transparency
local petMachinePos = workspace.Scripts.Spawn[Menu].Touch.Position

Tab1:AddButton({
	Name = "Pet Machine",
	Callback = function()

	    workspace.Scripts.Spawn[Menu].Touch.Transparency = 1
        workspace.Scripts.Spawn[Menu].Touch.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

        wait(0.1)

        workspace.Scripts.Spawn[Menu].Touch.Transparency = petMachineTransparency
        workspace.Scripts.Spawn[Menu].Touch.Position = petMachinePos
  	end    
})


local Menu = "Bank"
local bankTransparency = workspace.Scripts.Spawn[Menu].Touch.Transparency
local bankPos = workspace.Scripts.Spawn[Menu].Touch.Position

Tab1:AddButton({
	Name = "Bank",
	Callback = function()

	    workspace.Scripts.Spawn[Menu].Touch.Transparency = 1
        workspace.Scripts.Spawn[Menu].Touch.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

        wait(0.1)

        workspace.Scripts.Spawn[Menu].Touch.Transparency = bankTransparency
        workspace.Scripts.Spawn[Menu].Touch.Position = bankPos
  	end    
})


local Menu = "SpaceUpgrades"
local spaceUpgradesTransparency = workspace.Scripts.Spawn[Menu].Touch.Transparency
local spaceUpgradesPos = workspace.Scripts.Spawn[Menu].Touch.Position

Tab1:AddButton({
	Name = "Space Upgrades",
	Callback = function()

	    workspace.Scripts.Spawn[Menu].Touch.Transparency = 1
        workspace.Scripts.Spawn[Menu].Touch.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

        wait(0.1)

        workspace.Scripts.Spawn[Menu].Touch.Transparency = spaceUpgradesTransparency
        workspace.Scripts.Spawn[Menu].Touch.Position = spaceUpgradesPos
  	end    
})


local Menu = "DestructionMachine"
local destructionMachineTransparency = workspace.Scripts.Spawn[Menu].Touch.Transparency
local destructionMachinePos = workspace.Scripts.Spawn[Menu].Touch.Position

Tab1:AddButton({
	Name = "Destruction Machine",
	Callback = function()

	    workspace.Scripts.Spawn[Menu].Touch.Transparency = 1
        workspace.Scripts.Spawn[Menu].Touch.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

        wait(0.1)

        workspace.Scripts.Spawn[Menu].Touch.Transparency = destructionMachineTransparency
        workspace.Scripts.Spawn[Menu].Touch.Position = destructionMachinePos
  	end    
})

------> TAB 2 stuff <------
Tab2:AddToggle({
    Name = "Anti Afk",
    Default = false,
    Callback = function(Value)
        local vu = game:GetService("VirtualUser")
        antiafk = Value

        spawn(function()
            while antiafk do
                wait(60)
                if not antiafk then return end
                game:GetService("Players").LocalPlayer.Idled:connect(function()
                   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                   wait(0.5)
                   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                end)
            end
        end)
    end
})


local Section = Tab2:AddSection({
	Name = "Boost"
})


Tab2:AddDropdown({
	Name = "Select World",
	Default = "Spawn",
	Options = {unpack(worlds)},

	Callback = function(Value)

        world = Value
	end    
})


Tab2:AddButton({
	Name = "Give World Boost",
	Callback = function()
        local args = {[1] = world}
        game:GetService("ReplicatedStorage").Events.WorldBoost:FireServer(unpack(args))
  	end    
})
