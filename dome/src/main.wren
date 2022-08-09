import "graphics" for Canvas, Color
import "input" for Keyboard
import "math" for Vector, Math

/// Game State
/// 0 = Title
/// 1 = Playing
/// 2 = Game Over
class State{
  index { _index }

  construct new() { _index = 0 }
  
  isTitle(){
    return _index == 0
  }

  isPlaying(){
    return _index == 1
  }

  isGameOver(){
    return _index == 2
  }

  play(){
    _index = 1
  }

  gameOver(){
    _index = 2
  }
}

class Main {
  construct new() {}

  init() {
      _paddle_pos = 120
      _ball_pos = Vector.new(100,200)
      _vel_y = -2
      _vel_x = 0
      // Colors
      _white = Color.rgb(255,255,255)
      _black = Color.rgb(0,0,0)
      _orange = Color.rgb(171, 82, 54)
      // Game State
      _state = State.new()
  }

  update() {
    // Control
    if (_state.isTitle()) {
      if (Keyboard.isKeyDown("space")) {
	_ball_pos = Vector.new(100,200)
	_state.play()
      }
    }
    if (_state.isPlaying()) {
      if (Keyboard.isKeyDown("H")) {
          _paddle_pos = _paddle_pos - 2
      }
      if (Keyboard.isKeyDown("L")) {
          _paddle_pos = _paddle_pos + 2
      }
    }
    if (_state.isGameOver()) {
      if (Keyboard.isKeyDown("space")) {
	_ball_pos = Vector.new(_paddle_pos + 20,200)
	_vel_y = -2
      	_vel_x = 0
	_state.play()
      }
    }

    // Ball Collision
    if (_ball_pos.y == 0){
      _vel_y = _vel_y * -1
    }
    if (_ball_pos.x <= 0 || _ball_pos.x >= 310){
      _vel_x = _vel_x * -1
    }
    if (_ball_pos.y >= 210 && _ball_pos.y <= 220 && (_ball_pos.x >= _paddle_pos - 10 && _ball_pos.x <= _paddle_pos + 50)) {
      _vel_y = _vel_y * -1
      if (_vel_x < 0){
	_vel_x = -Math.abs(Math.cos((_ball_pos.x + 10 - _paddle_pos) / 50 * 1.57)) * 2.5
      } else {
	_vel_x = Math.abs(Math.sin((_ball_pos.x + 10 - _paddle_pos) / 50 * 1.57)) * 2.5
      }
    }
    if (_ball_pos.y > 250){
      _state.gameOver()
    }

    // Ball Movement
    _ball_pos.y = _ball_pos.y + _vel_y
    _ball_pos.x = _ball_pos.x + _vel_x
  }

  draw(dt) {
    Canvas.cls(_white)

    if (_state.isTitle()){
      Canvas.print("Press space to play", 100, 100, _black)
    }
    if (_state.isPlaying()){
      Canvas.rectfill(_ball_pos.x, _ball_pos.y, 10, 10, _orange)
    }
    if (_state.isGameOver()){
      Canvas.print("Game Over", 100, 100, _black)
    }

    Canvas.rectfill(_paddle_pos, 220, 50, 10, _orange)
  }
}

var Game = Main.new()
