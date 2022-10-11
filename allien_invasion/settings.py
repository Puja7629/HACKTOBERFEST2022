class Settings():
    def __init__(self):
        self.screen_width = 1000
        self.screen_height = 700
        self.bg_color = (0,255,0)
        self.ship_speed_factor = 1.5
        self.bullet_speed_factor = 3
        self.bullet_width = 3
        self.bullet_height = 15
        self.bullet_color = (60,60,60)
        self.bullets_allowed = 3
        self.alien_speed_factor = 1
        self.fleet_drop_speed = 10
        self.fleet_direction = 1
        self.ship_limit = 3
        self.speedup_scale = 1.1

        self.initialize_dynamic_settings()

    def initialize_dynamic_settings(self):
      """Initialize settings that change throughout the game."""
      self.ship_speed_factor = 1.5
      self.bullet_speed_factor = 3
      self.alien_speed_factor = 1
      self.fleet_direction = 1
      self.alien_points = 50


      

    def increase_speed(self):
      """Increase speed settings."""
      self.ship_speed_factor *= self.speedup_scale
      self.bullet_speed_factor *= self.speedup_scale
      self.alien_speed_factor *= self.speedup_scale







      
