import pygame
from settings import Settings
from ship import Ship
import game_function as gf
from pygame.sprite import Group
from alien import Alien
from game_stats import GameStats
from scoreboard import Scoreboard
def run_game():
    pygame.init()
    a_settings = Settings()
    screen = pygame.display.set_mode((a_settings.screen_width,a_settings.screen_height))
    pygame.display.set_caption("Alien Invasion")
    ship = Ship(a_settings, screen)
    alien = Alien(a_settings,screen)
    stats = GameStats(a_settings)
    sb = Scoreboard(a_settings,screen,stats)
    bullets = Group()
    aliens = Group()
    gf.create_fleet(a_settings,screen,aliens)

    while True:
        gf.check_events(a_settings, screen, ship,  bullets)
        if stats.game_active:
          ship.update()
          gf.update_bullets(a_settings, screen, aliens, bullets, sb, stats)
          gf.update_aliens(a_settings, ship, aliens, screen, bullets, stats)
          gf.update_screen(a_settings, screen, ship, bullets, aliens, sb)
run_game()
