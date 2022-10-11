import pygame
from pygame.sprite import Sprite
class Alien(Sprite):

    def __init__(self,a_settings,screen):
        super(Alien,self).__init__()
        self.screen = screen
        self.a_settings = a_settings

        self.image = pygame.image.load('images/alien.bmp')
        self.rect = self.image.get_rect()

        self.rect.x = self.rect.width
        self.rect.y = self.rect.height

        self.x = float(self.rect.x)

    def check_edges(self):
       """Return True if alien is at edge of screen."""
       screen_rect = self.screen.get_rect()
       if self.rect.right >= screen_rect.right:
                return True
       elif self.rect.left <= 0:
                return True

    def update(self):
        self.x += (self.a_settings.alien_speed_factor*
                   self.a_settings.fleet_direction)
        self.rect.x = self.x

    def blitme(self):
        self.screen.blit(self.image,self.rect)
