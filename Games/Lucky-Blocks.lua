getgenv().antiafk = false


local getName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

print("Demi Hub | ".. getName.Name)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()


local Window = OrionLib:MakeWindow({Name = "Demi Hub | ".. getName.Name, HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest", IntroIcon = "https://www.roblox.com/library/10677758875/DH", IntroText = "Demi Hub"})


local Tab = Window:MakeTab({
	Name = "Blocks",
	Icon = "rbxassetid://5012544693",
	PremiumOnly = false
})

local Tab1 = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://5012544693",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://6022668888",
	PremiumOnly = false
})

Tab2:AddParagraph("                                             Credits", string.format("\nLucky Blocks Script: Lagend#4320 \nDemi Hub: Streamy#1480, Lagend#4320"))

Tab:AddButton({
	Name = "Open Normal Block",
	Callback = function()
      	game:GetService("ReplicatedStorage").SpawnLuckyBlock:FireServer()
  	end    
})

Tab:AddButton({
	Name = "Open Super Block",
	Callback = function()
      	game:GetService("ReplicatedStorage").SpawnSuperBlock:FireServer()
  	end    
})

Tab:AddButton({
	Name = "Open Diamond Block",
	Callback = function()
      	game:GetService("ReplicatedStorage").SpawnDiamondBlock:FireServer()
  	end    
})

Tab:AddButton({
	Name = "Open Rainbow Block",
	Callback = function()
      	game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
  	end    
})

Tab:AddButton({
	Name = "Open Galaxy Block",
	Callback = function()
      	game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
  	end    
})

Tab1:AddSlider({
	Name = "Speed",
	Min = 16,
	Max = 250,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

Tab1:AddSlider({
	Name = "Jump Power",
	Min = 50,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

Tab1:AddToggle({
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
