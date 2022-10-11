import pygame
class Ship():
    def __init__(self,a_settings,screen):
        self.screen = screen
        self.a_settings = a_settings
        
        self.image = pygame.image.load('images/ship.bmp')
        self.rect = self.image.get_rect()
        self.screen_rect = screen.get_rect()

        self.rect.centerx = self.screen_rect.centerx
        self.rect.bottom = self.screen_rect.bottom
        
        self.center = float(self.rect.centerx)
        
        self.moving_right = False
        self.moving_left = False

    def update(self):
        """Update the ship's position based on the movement flag."""
        if self.moving_right and self.rect.right < self.screen_rect.right:
            self.center += self.a_settings.ship_speed_factor 
        if self.moving_left and self.rect.left > 0:
            self.center -= self.a_settings.ship_speed_factor 

        self.rect.centerx = self.center

    def center_ship(self):
        self.center = self.screen_rect.centerx

        
    def blitme(self):
        """Draw the ship at its current location."""
        self.screen.blit(self.image, self.rect)
