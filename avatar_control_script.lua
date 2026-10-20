-- Avatar Control Script

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Control variables
local moveForward = false
local moveBackward = false
local moveLeft = false
local moveRight = false
local jump = false

-- Keybindings
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.W then
        moveForward = true
    elseif input.KeyCode == Enum.KeyCode.S then
        moveBackward = true
    elseif input.KeyCode == Enum.KeyCode.A then
        moveLeft = true
    elseif input.KeyCode == Enum.KeyCode.D then
        moveRight = true
    elseif input.KeyCode == Enum.KeyCode.Space then
        jump = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.W then
        moveForward = false
    elseif input.KeyCode == Enum.KeyCode.S then
        moveBackward = false
    elseif input.KeyCode == Enum.KeyCode.A then
        moveLeft = false
    elseif input.KeyCode == Enum.KeyCode.D then
        moveRight = false
    elseif input.KeyCode == Enum.KeyCode.Space then
        jump = false
    end
end)

-- Movement control
while true do
    local deltaTime = wait()
    
    if moveForward then
        Humanoid:Move(Vector3.new(0, 0, -1), true)
    end
    if moveBackward then
        Humanoid:Move(Vector3.new(0, 0, 1), true)
    end
    if moveLeft then
        Humanoid:Move(Vector3.new(-1, 0, 0), true)
    end
    if moveRight then
        Humanoid:Move(Vector3.new(1, 0, 0), true)
    end
    if jump then
        Humanoid:Jump()
    end
end