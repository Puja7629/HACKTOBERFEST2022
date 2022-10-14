class GameStats():
    def __init__(self, a_settings):
       """Initialize statistics."""
       self.a_settings = a_settings
       self.reset_stats()
       self.game_active = True
       self.score = 0

    def reset_stats(self):
       """Initialize statistics that can change during the game."""
       self.ships_left = self.a_settings.ship_limit
