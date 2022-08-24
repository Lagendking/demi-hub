getgenv().autoOof = false
getgenv().autoDepo = false
getgenv().autoPrize = false
getgenv().autoBuy = false
getgenv().autoUpgrade = false
getgenv().antiafk = false
getgenv().autoTick = false


local getName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

print("Demi Hub | ".. getName.Name)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()


local Window = OrionLib:MakeWindow({Name = "Demi Hub | ".. getName.Name, HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "Demi Hub"})


local Tab = Window:MakeTab({
	Name = "Auto",
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

Tab2:AddParagraph("                                             Credits", string.format("\nOof Tycoon Script: Lagend#4320 \nDemi Hub: Streamy#1480, Lagend#4320"))

Tab:AddToggle({
    Name = "Collect",
    Default = false,
    Callback = function(Value)
        autoOof = Value
        local plot
        for _, v in pairs(game:GetService("Workspace").Plots:GetChildren()) do
            
            if v:FindFirstChild("OwnerId").Value == game.Players.LocalPlayer.UserId then
                
                plot = v
            end
        end
        
        spawn(function()
            while autoOof do
                wait()
                
                for _, v in pairs(plot.Oofs:GetChildren()) do
                    
                    v.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                end
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Deposit",
    Default = false,
    Callback = function(Value)
        autoDepo = Value
        local plot
        for _, v in pairs(game:GetService("Workspace").Plots:GetChildren()) do
            
            if v:FindFirstChild("OwnerId").Value == game.Players.LocalPlayer.UserId then
                
                plot = v
            end
        end
        
        spawn(function()
            while autoDepo do
                wait()
                
                fireclickdetector(plot.DepositClicker.ClickDetector)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Collect Prize",
    Default = false,
    Callback = function(Value)
        autoPrize = Value
        local plot
        for _, v in pairs(game:GetService("Workspace").Plots:GetChildren()) do
            
            if v:FindFirstChild("OwnerId").Value == game.Players.LocalPlayer.UserId then
                
                plot = v
            end
        end
        
        spawn(function()
            while autoPrize do
                wait(1)
                
                spawn(function()
                    if plot:FindFirstChild("SuperPrize"):FindFirstChild("TouchPart") then
                        
			firetouchinterest(plot.SuperPrize.TouchPart, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
			wait()
			firetouchinterest(plot.SuperPrize.TouchPart, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                    end
                end)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Buy Noobs",
    Default = false,
    Callback = function(Value)
        autoBuy = Value
        
        spawn(function()
            while autoBuy do
                wait()
                
                game:GetService("ReplicatedStorage").PurchaseNoob:FireServer()
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Upgrade Noobs",
    Default = false,
    Callback = function(Value)
        autoUpgrade = Value
        
        spawn(function()
            while autoUpgrade do
                wait(2.5)
                
                game:GetService("ReplicatedStorage").GoldenNoob:FireServer()
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Increase Tick x10",
    Default = false,
    Callback = function(Value)
        autoTick = Value
        
        spawn(function()
            while autoTick do
                wait()
                
                game:GetService("ReplicatedStorage").IncreaseTick:FireServer(10)
		game:GetService("Players").LocalPlayer.PlayerGui.PopupAlerts.Enabled = false
            end
        end)
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
