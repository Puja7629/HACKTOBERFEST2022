import pygame.font

class Scoreboard():

    def __init__(self,a_settings,screen,stats):
        self.screen = screen
        self.screen_rect = screen.get_rect()
        self.a_settings = a_settings
        self.stats = stats

        # Font settings for scoring information.
        self.text_color = (30, 30, 30)
        self.font = pygame.font.SysFont(None, 48)
        # Prepare the initial score image.
        self.prep_score()


    def prep_score(self):
       rounded_score = int(round(self.stats.score, -1))
       score_str = "{:,}".format(rounded_score)
       """Turn the score into a rendered image."""
       score_str = str(self.stats.score)
       self.score_image = self.font.render(score_str, True, self.text_color,
       self.a_settings.bg_color)
 
       # Display the score at the top right of the screen.
       self.score_rect = self.score_image.get_rect()
       self.score_rect.right = self.screen_rect.right - 20
       self.score_rect.top = 20

      
    def show_score(self):
        """Draw score to the screen."""
        self.screen.blit(self.score_image, self.score_rect)




       





