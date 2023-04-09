-- DONT TOUCH (or do, no one is stoping you)
-- Where the sausage is made
getgenv().autoMoney = false;
getgenv().autoRebirth = false;
getgenv().autoBlocks = false;

local AsyncEgg = {}
for _,EggSync in pairs(game:GetService("Workspace").Core.Eggs:GetChildren()) do
    table.insert(AsyncEgg, EggSync.Name)
end

local SyncDelete = {
       Pet_1 = "",
       Pet_2 = "",
       Pet_3 = "",
       Pet_4 = "",
       Pet_5 = ""
}

-- Variables holding time to wait (These are the default time values)
local moneyWait = 0.1
local rebirthWait = 0.1
local eggWait = 2
local ZombieNumber = 0

-- Variables for money and agg amount (These are the default amount values)
local moneyAmt = -9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
local eggAmt = 1
local _SyncNumber = 0
-- Variable to hold egg name
local eggName

-- Give money function
function doMoney(time)
   spawn(function()
       while autoMoney do
           local args = {
               [1] = "Hacked Egg",
               [2] = moneyAmt, -- Holy Smokes!
               [3] = {}
           }

           game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Remotes"):WaitForChild(
           "ServerRemotes"):WaitForChild("GivePlayerRandomPet"):InvokeServer(unpack(args))
           wait(time)
       end
   end)
end

function FarmZombie(ZN)
local args = {
    [1] = "Zombie_" .. ZN
}

game:GetService("ReplicatedStorage").Events.Remotes.ServerRemotes.AttackBoss:InvokeServer(unpack(args))
end

-- Trigger rebirth function
function doRebirth(time)
   spawn(function()
       while autoRebirth do
           local args = {
               [1] = True
           }

           game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Remotes"):WaitForChild(
           "ServerRemotes"):WaitForChild("Rebirth"):InvokeServer(unpack(args))
           wait(time)
       end
   end)
end


-- Egg buy function
function buyEgg(time)
   spawn(function()
       while wait() do
           if not autoBuyEgg then break end
           ;
           local args = {
               [1] = eggName,
               [2] = eggAmt,
               [3] = {
                  [1] = SyncDelete.Pet_1,
                  [2] = SyncDelete.Pet_2,
                  [3] = SyncDelete.Pet_3,
                  [4] = SyncDelete.Pet_4,
                  [5] = SyncDelete.Pet_5
               }
           }

           game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Remotes"):WaitForChild(
           "ServerRemotes"):WaitForChild("GivePlayerRandomPet"):InvokeServer(unpack(args))
           wait(time)
       end
   end)
end


-- GUI for script
local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local F = Window:MakeTab({
Name = "Farming",
Icon = "rbxassetid://12972185540",
PremiumOnly = false
})

local E = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://12972185540",
PremiumOnly = false
})

local TP = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://12972185540",
PremiumOnly = false
})

local Cfg = Window:MakeTab({
Name = "Config",
Icon = "rbxassetid://13040495457",
PremiumOnly = false
})

local S1 = Cfg:AddSection({
Name = "Max Pet Equip"
})

local S2 = Cfg:AddSection({
Name = "Max Sword Equip"
})

local S3 = Cfg:AddSection({
Name = "Rebirth"
})

local S4 = Cfg:AddSection({
Name = "DPS | Damage Per Second"
})

local SyncConfigFunction = {
      Inf = 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999,
      Custom = 0
}

S1:AddButton({
Name = "Inf Pet Max Equip",
Callback = function()
      game.Players.LocalPlayer.Stats.MaxPetEquipped.Value = SyncConfigFunction.Inf
  end    
})

S2:AddButton({
Name = "Inf Sword Max Equip",
Callback = function()
      game.Players.LocalPlayer.Stats.MaxEquipSpace.Value = SyncConfigFunction.Inf
  end    
})

S3:AddButton({
Name = "Inf Rebirth",
Callback = function()
      game.Players.LocalPlayer.Stats.Rebirths.Value = SyncConfigFunction.Inf
  end    
})

S4:AddButton({
Name = "Inf DPS",
Callback = function()
      game.Players.LocalPlayer.Stats["⚔️DPS"].Value = SyncConfigFunction.Inf
  end    
})

function SyncNotify(SyncName, SyncContent)
OrionLib:MakeNotification({
Name = SyncName,
Content = SyncContent,
Image = "rbxassetid://4483345998",
Time = 5
})
end

TP:AddButton({
Name = "Anime World (REBIRTH REQUIRED: 2)",
Callback = function()
if game.Players.LocalPlayer.Stats.Rebirths < 2 then
SyncNotify("rebirth is not enough", "Your rebirth is below 2, hurry up for the rebirth!")
else
local args = {
      [1] = "Anime"
    }
game:GetService("ReplicatedStorage").Events.Remotes.ServerRemotes.TeleportZone:InvokeServer(unpack(args))
end
  end    
})

-- You have no enemies tho
-- Money input
F:AddTextbox({
Name = "Zombie Number",
Default = "0",
TextDisappear = true,
Callback = function(value)
    ZombieNumber = value
end
})

F:AddToggle({
Name = "Farm Zombie",
Default = false,
Callback = function(bool)
getgenv().autoBlocks = bool
    while wait() do
    if getgenv().autoBlocks == false then break end
    FarmZombie(ZombieNumber)
   end
end
})

F:AddTextbox({
Name = "money amount",
Default = "0",
TextDisappear = true,
Callback = function(value)
     moneyAmt = value
end
})

-- Wait slider for money

F:AddTextbox({
Name = "Seconds to wait (money)",
Default = "0",
TextDisappear = true,
Callback = function(value)
   moneyWait = value
end
})


-- Auto money toggle

F:AddToggle({
Name = "Auto Money",
Default = false,
Callback = function(bool)
   getgenv().autoMoney = bool
   print('Auto money is: ', bool)
   if bool then
       doMoney(moneyWait);
   end
end
})

-- Wait slider for rebirths
F:AddTextbox({
Name = "Seconds to wait (Rebirths)",
Default = "0",
TextDisappear = true,
Callback = function(value)
   rebirthWait = value
end
})

-- Auto rebirth togglea
F:AddToggle({
Name = "Auto Rebirth",
Default = false,
Callback = function(bool)
   getgenv().autoRebirth = bool
   print('Auto rebirth is: ', bool)
   if bool then
       doRebirth(rebirthWait);
   end
end
})

-- Egg input
E:AddTextbox({
Name = "Egg Hatch Amount",
Default = "0",
TextDisappear = true,
Callback = function(value)
   eggAmt = math.abs(value)
end
})

-- Wait slider for eggs
E:AddTextbox({
Name = "Seconds to wait (Egg)",
Default = "0",
TextDisappear = true,
Callback = function(value)
   eggWait = value
end
})

-- Egg dropdown

-- SyncDelete.Pet_1 2, 3, 4, 5

E:AddTextbox({
Name = "Auto Delete (1)",
Default = "?",
TextDisappear = false,
Callback = function(value)
   SyncDelete.Pet_1 = value
end
})

E:AddTextbox({
Name = "Auto Delete (2)",
Default = "?",
TextDisappear = false,
Callback = function(value)
   SyncDelete.Pet_2 = value
end
})

E:AddTextbox({
Name = "Auto Delete (3)",
Default = "?",
TextDisappear = false,
Callback = function(value)
   SyncDelete.Pet_3 = value
end
})

E:AddTextbox({
Name = "Auto Delete (4)",
Default = "?",
TextDisappear = false,
Callback = function(value)
   SyncDelete.Pet_4 = value
end
})

E:AddTextbox({
Name = "Auto Delete (5)",
Default = "?",
TextDisappear = false,
Callback = function(value)
   SyncDelete.Pet_5 = value
end
})

E:AddDropdown({
Name = "Select Egg",
Default = "Normal Egg",
Options = AsyncEgg,
Callback = function(mob)
   eggName = mob
end
})

-- Auto egg toggle
E:AddToggle({
Name = "Auto Buy Egg",
Default = false,
Callback = function(bool)
   getgenv().autoBuyEgg = bool
   print('Auto buy egg is: ', bool)
   if bool then
       buyEgg(eggWait);
   end
end
})
