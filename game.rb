require 'gosu'
require 'chipmunk'
require 'pry'

# Game
require_relative 'boulder'

class GameWindow < Gosu::Window
  WIDTH = 800
  HEIGHT = 600
  DAMPING = 0.90
  GRAVITY = 400.0

  attr_reader :space

  def initialize
    super WIDTH, HEIGHT, false, 16
    @space = CP::Space.new
    @space.damping = DAMPING
    @space.gravity = CP::Vec2.new(0.0, GRAVITY)
    @x = 1
    @paused = false
    @background = Gosu::Image.new('images/background.png')
  end

  def needs_redraw?
    !@paused
  end

  def update
    if not @game_over
      10.times do
        @space.step(1.0/600)
      end
    end
  end

  def button_down id
    close if [Gosu::KbEscape, Gosu::KbQ].include?(id)
  end
end

window = GameWindow.new
window.show
