--Player--
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer
local Character = script.Parent
local Humanoid = Character.Humanoid
local Mouse = Player:GetMouse()
local Camera = game.Workspace.Camera
local Storage = ReplicatedStorage.Storage
local RunService = game:GetService("RunService")
local runs = Character:WaitForChild("Running")
--Crouch--
local CrouchAnimBackup = "rbxassetid://12474554475"
local SoundsFolder = Storage.Sounds
local CrouchSounds = SoundsFolder.Crouch
local GetUpSound = SoundsFolder.GetUp
local AnimationFolder = Storage.Animations
local CrouchAnimation = Humanoid:LoadAnimation(AnimationFolder.Crouch)


local function IsPlayerMoving()
 if Humanoid.MoveDirection.Magnitude == 0 then
 end
end

RunService.RenderStepped:Connect(IsPlayerMoving)

--Main Script--
Mouse.KeyDown:Connect(function(Key)
 if Key == "c" then
  CrouchAnimation:Play()
  Humanoid.WalkSpeed = Humanoid.WalkSpeed / 2
  Camera.CameraSubject = Character.Head;
  Camera.FieldOfView = 65
  local function IsPlayerMoving()
   if Humanoid.MoveDirection.Magnitude == 0 then
    CrouchAnimation:AdjustSpeed(0)
   else
    CrouchAnimation:AdjustSpeed(1)
   end
  end
  CrouchSounds:Play()
  RunService.RenderStepped:Connect(IsPlayerMoving)
  Player.CameraMinZoomDistance = 7
 end
end)

Mouse.KeyUp:Connect(function(Key)
 if Key == "c" then
  CrouchAnimation:Stop()
  Humanoid.WalkSpeed = Humanoid.WalkSpeed * 2
  Camera.FieldOfView = 70
  Camera.CameraSubject = Character.Humanoid
  Player.CameraMinZoomDistance = 0.5
  GetUpSound:Play()
 end
end)
