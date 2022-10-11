import sys
import pygame
from bullet import Bullet
from alien import Alien
from time import sleep

def get_number_aliens_x(a_settings, alien_width):
    available_space_x = a_settings.screen_width -(2 * alien_width)
    number_aliens_x = int(available_space_x / (2 * alien_width))
    return number_aliens_x


def create_alien(a_settings, screen, aliens, alien_number):
 """Create an alien and place it in the row."""
 alien = Alien(a_settings, screen)
 alien_width = alien.rect.width
 alien.x = alien_width + 2 * alien_width * alien_number
 alien.rect.x = alien.x
 aliens.add(alien)


def create_fleet(a_settings, screen, aliens):
 """Create a full fleet of aliens."""
 # Create an alien and find the number of aliens in a row.
 # Spacing between each alien is equal to one alien width.
 alien = Alien(a_settings, screen)
 number_aliens_x = get_number_aliens_x(a_settings, alien.rect.width)

 
 
 # Create the first row of aliens.
 for alien_number in range(number_aliens_x):
        # Create an alien and place it in the row.
        create_alien(a_settings, screen, aliens, alien_number)


def check_fleet_edges(a_settings,aliens):
    for alien in aliens.sprites():
             if alien.check_edges():
                change_fleet_direction(a_settings, aliens)
                break

def change_fleet_direction(a_settings, aliens):
    for alien in aliens.sprites():
       alien.rect.y += a_settings.fleet_drop_speed
    a_settings.fleet_direction *= -1

    

def update_aliens(a_settings, ship, aliens, screen, bullets, stats):
    check_fleet_edges(a_settings, aliens)
    aliens.update()
    if pygame.sprite.spritecollideany(ship, aliens):
               print("Ship hit!!!")
               ship_hit(a_settings, stats, screen, ship, aliens, bullets)
    check_aliens_bottom(a_settings, stats, screen, ship, aliens, bullets)
  
def check_keydown_events(event,a_settings,screen,ship,bullets):
    if event.key == pygame.K_RIGHT:
                ship.moving_right=True
    elif event.key == pygame.K_LEFT:
                ship.moving_left=True
    elif event.key == pygame.K_SPACE:
        if len(bullets) < a_settings.bullets_allowed:
            new_bullet = Bullet(a_settings, screen, ship)
            bullets.add(new_bullet)
    elif event.key == pygame.K_q:
        sys.exit()
def check_keyup_events(event,ship):
    if event.key == pygame.K_RIGHT:
                ship.moving_right=False
    elif event.key ==pygame.K_LEFT:
                ship.moving_left=False


def check_events(a_settings,screen,ship,bullets):
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            sys.exit()
        elif event.type == pygame.KEYDOWN:
            check_keydown_events(event,a_settings,screen,ship,bullets)
        elif event.type == pygame.KEYUP:
            check_keyup_events(event,ship)


def update_bullets(a_settings, screen, aliens, bullets, sb, stats):
 bullets.update()
 for bullet in bullets.copy():
           if bullet.rect.bottom <= 0:
                    bullets.remove(bullet)
 check_bullet_alien_collisions(a_settings, screen, aliens, bullets, sb, stats)


def check_bullet_alien_collisions(a_settings, screen, aliens, bullets, sb, stats):
    collisions = pygame.sprite.groupcollide(bullets, aliens, True, True)
    if len(aliens) == 0:
       # Destroy existing bullets and create new fleet.
       bullets.empty()
       a_settings.increase_speed()
       create_fleet(a_settings, screen,aliens)
    if collisions:
        for aliens in collisions.values():
               stats.score += a_settings.alien_points
               sb.prep_score()

def ship_hit(a_settings, stats, screen, ship, aliens, bullets):
    if stats.ships_left > 0:
       stats.ships_left -= 1
       aliens.empty()
       bullets.empty()
       create_fleet(a_settings, screen, aliens)
       ship.center_ship()
       sleep(0.5)
    else:
       stats.game_active = False
       a_settings.initialize_dynamic_settings()


def check_aliens_bottom(a_settings, stats, screen, ship, aliens, bullets):
    screen_rect = screen.get_rect()
    for alien in aliens.sprites():
         if alien.rect.bottom >= screen_rect.bottom:
            # Treat this the same as if the ship got hit.
            ship_hit(a_settings, stats, screen, ship, aliens, bullets)
            break

def update_screen(a_settings, screen, ship, bullets, aliens, sb):
 """Update images on the screen and flip to the new screen."""
 # Redraw the screen during each pass through the loop.
 screen.fill(a_settings.bg_color)
 for bullet in bullets.sprites():
                bullet.draw_bullet()

 ship.blitme()
 aliens.draw(screen)
 sb.show_score()

     
 # Make the most recently drawn screen visible.
 pygame.display.flip()




 
